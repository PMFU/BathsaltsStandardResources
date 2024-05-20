#version 450

#extension GL_ARB_separate_shader_objects : enable

struct vertexOutputData
{
	vec3 fragPos;
	vec3 normal;
	vec2 textureCoordinates;
};

//Per-Vertex inputs
layout(location = 0) in vec3 aPos;
layout(location = 1) in vec3 aNormal;
layout(location = 2) in vec2 aTexCoord;

//Output to fragment shader
layout (location = 0) out vertexOutputData vertexData;

//Descriptor Set Buffers

//Frame Data
layout ( set = 0, binding = 0 ) uniform FrameData
{
	mat4 proj;
	mat4 view;
} CameraData;

//Object/Instance Data
const int model_array_size = 16 * 1024;
struct ObjInstData
{
	mat4 model;
};
layout ( set = 0, binding = 2) readonly buffer ObjectInstanceData
{
	ObjInstData object[/*model_array_size*/];
} objectData;

//Map Color & Province Data
struct ProvinceRenderInfo
{
	ivec4 IDs; //Province ID, State ID, Country ID, [0 if land, 1 if naval, other vals are UNDEFINED]
	vec3 color; //Color of the province to use
	int numPixels;

	//For Location Data / Quad Info
	vec2 upperLeft;
	vec2 center;
	vec2 extent;

	//Other Info
	int terrain_tex_id;
	int overlay_tex_id;
};

layout ( set = 0, binding = 1, std430 ) readonly buffer MapRenderInfo
{
	int selected_province;
	int map_width;
	int map_height;

	float camera_height;

	ProvinceRenderInfo provinces[];
} mapData;

//Constants
layout ( push_constant ) uniform constants
{
	vec4 textureid;
} PushConstants;

void main()
{
	//The quad is centered at 0, 0, and each corner is +-(0.5, 0.5) away
	const float max_width_from_center_unscaled = (mapData.map_width);
	const float scale = 1.0 / 128.0;
	float map_width = scale * max_width_from_center_unscaled;

	const int index = int(PushConstants.textureid.a);
	const mat4 model_mat = objectData.object[index % model_array_size].model;
	

	vertexData.fragPos = vec3(model_mat * vec4(aPos, 1.0));
	vertexData.textureCoordinates = aTexCoord;
	vertexData.normal = vec3(model_mat * vec4(aNormal, 0.0));

	vec4 world_space_coord = model_mat * vec4(aPos, 1.0);
	world_space_coord.x += map_width * gl_InstanceIndex;
	
	gl_Position = CameraData.proj * CameraData.view * world_space_coord;

	//TBN Matrix Starting BS
	
	gl_Position.y = -gl_Position.y;	//HACK
}