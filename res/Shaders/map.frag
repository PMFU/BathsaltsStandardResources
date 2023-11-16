#version 450

#extension GL_ARB_separate_shader_objects : enable
#extension GL_EXT_nonuniform_qualifier : require

const int textureBindingSlot = 7;

struct vertexOutputData
{
	vec3 fragPos;
	vec3 normal;
	vec2 textureCoordinates;
};

//Fragment output
layout (location = 0) out vec4 FragColor;

//Input from vertex shader
layout (location = 0) in vertexOutputData outVertShader;

//Descriptor set buffers

//Render and Frame data
layout ( set = 0, binding = 0 ) uniform FrameData
{
	mat4 proj;
	mat4 view;
} CameraData;

const int model_array_size = 16 * 1024;
struct ObjInstData
{
	mat4 model;
};
layout ( set = 0, binding = 2 ) readonly buffer ObjectInstanceData
{
	ObjInstData object[/*model_array_size*/];
} objectData;

//Map Color & Province Data
struct ProvinceRenderInfo
{
	ivec4 IDs; //Province ID, State ID, Country ID, [0 if land, 1 if naval, other vals are UNDEFINED]
	vec4 color; //Color of the province to use

	//For Location Data / Quad Info
	vec2 upperLeft;
	vec2 center;
	vec2 extent;

	//Other Info
	int terrainTexId;
	int goodTexid;
	int numPixels;
	int filler;

	vec2 other;
	// vec3 cultureColor;
	//Any other things
};

layout ( set = 0, binding = 1, std430 ) readonly buffer MapRenderInfo
{
	int province_count;
	int selected_province;

	float camera_height;
	float other;

	ProvinceRenderInfo provinces[];
} mapData;

//Textures
layout ( set = 0, binding = textureBindingSlot ) uniform sampler2D textures[];

//Constants, but meh
layout ( push_constant ) uniform constants
{
	vec4 textureid;	//x is provid index, y is normal map, z is ..., a is ....
} PushConstants;

layout ( set = 0, binding = textureBindingSlot ) uniform isampler2D provIDMapBinding[];
#define provIDMap provIDMapBinding[int(PushConstants.textureid.x)]
#define world_normal_map textures[int(PushConstants.textureid.y)]

vec4 getFinalProvinceColor()
{
	int provID = texture(provIDMap, outVertShader.textureCoordinates).x;
	provID = (provID <= mapData.province_count) ? provID : 0;

	vec3 color = mapData.provinces[provID].color.xyz;

	/*const vec2 texelsize = vec2(1.0 / 5616, 1.0 / 2160);
	const int prevColor = provID;
	for(int i = -1; i <= 1; i++)
	{
		for(int j = -1; j <= 1; j++)
		{
			provID = texture(provIDMap, outVertShader.textureCoordinates + vec2(i, j) * texelsize).x;
			color = mapData.provinceColor[provID.x].xyz;
		}
	}*/

	int selectedProv = mapData.selected_province;//mapData.info.z;
	if(provID == selectedProv)
	{
		const float light_factor = 1.4f;
		color = color * light_factor;
	}
	
	return vec4(color, 1.0);
}

vec4 getFinalProvinceColorWithLines()
{
	ivec4 provID = texture(provIDMap, outVertShader.textureCoordinates);
	vec3 color = mapData.provinces[provID.x].color.xyz;
	int prevColor = provID.x;

	const vec2 texelsize = vec2(1.0 / 5616, 1.0 / 2160);
	for(int i = -1; i <= 1; i++)
	{
		for(int j = -1; j <= 1; j++)
		{
			if(! ((i == -1 || i == 1) && (j == -1 || j == 1)))
			{	//When NOT the corners
				provID = texture(provIDMap, outVertShader.textureCoordinates + vec2(i, j) * texelsize);
				color = mapData.provinces[provID.x].color.xyz;
				if(provID.x != prevColor)
				{
					return vec4(0.5, 0.5, 0.5, 1.0) * vec4(color, 1.0);
				}			
			}
		}
	}
	
	ivec4 selectedProv = ivec4(mapData.selected_province, 0, 0, 0);
	ivec4 id = ivec4(prevColor, 0, 0, 0);
	if(id == selectedProv)
	{
		const float light_factor = 1.4f;
		color = color * light_factor;
	}

	return vec4(color, 1.0);
}

vec4 finalLightingResult()
{
	//Lighting Calculations
	const vec3 lightColor = vec3(0.7, 0.7, 0.7);
	const float ambientStrength = 0.3;
	const vec3 ambient = ambientStrength * lightColor;
	const vec3 lightsrc = vec3(0.0, 20.0, 0.0);	//pos

	vec3 lightDir = normalize(lightsrc - outVertShader.fragPos);
	
	//Normal Map
	vec3 normal = vec3(0, 1.0, 0);//normalize(texture(world_normal_map, outVertShader.textureCoordinates).xzy);
	//vec3 normal2 = 2 * normalize(outVertShader.normal);
	//normal = normalize(normal + normal2);

	const float diff = max(dot(normal, lightDir), 0.0);
	const vec3 diffuse = diff * lightColor;
	const vec4 result = vec4(ambient + diffuse, 1.0);

	return result;
}

void main()
{
	vec4 provColor;
	if(mapData.camera_height >= 3.5)
	{
		provColor = getFinalProvinceColor();
	}
	else
	{
		provColor = getFinalProvinceColorWithLines();
	}
	
	vec4 result = finalLightingResult();
	//const vec4 result = texture(world_normal_map, outVertShader.textureCoordinates);
	
	FragColor = provColor * result;
} 
