#version 450

#extension GL_ARB_separate_shader_objects : enable
#extension GL_EXT_nonuniform_qualifier : require

const int mapTextureBindingSlot = 6;
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

//Map indexing
layout ( set = 0, binding = mapTextureBindingSlot ) uniform isampler2D provIDMapBinding[];

//Textures
layout ( set = 0, binding = textureBindingSlot ) uniform sampler2D textures[];

//Constants, but meh
layout ( push_constant ) uniform constants
{
	vec4 textureid;	//x is provid index, y is normal map, z is ..., a is ....
} PushConstants;

#define provIDMap provIDMapBinding[0]
#define world_normal_map textures[int(PushConstants.textureid.y)]


vec2 getCurMapCoords(vec2 coords)
{
	return coords * vec2(mapData.map_width, mapData.map_height);
}

vec3 getAssignedProvinceColor(int prov_id)
{
	return mapData.provinces[prov_id].color.xyz;
}

int getProvID_DstFromCur(vec2 dist_away)
{
	const vec2 texelsize = vec2(1.0 / mapData.map_width, 1.0 / mapData.map_height);
	int provID = texture(provIDMap, outVertShader.textureCoordinates + dist_away * texelsize).x;


	return provID;
}

vec2 getUVForProvinceTexture(int prov_id, vec2 cur_uv)
{
	vec2 UL = mapData.provinces[prov_id].upperLeft;
	vec2 center = mapData.provinces[prov_id].center;
	vec2 size = mapData.provinces[prov_id].extent;

	//Linearly interpolate between these
	vec2 map_space = getCurMapCoords(cur_uv);
	vec2 output_NDC = (map_space - UL) / size;

	return output_NDC;
}

const vec3 GREYIFY = vec3( 0.212671, 0.715160, 0.072169 );
const vec3 WHITE = vec3(1, 1, 1);

vec3 applyFOWColor( vec3 c, float FOW ) 
{
	float grey = dot( c.rgb, GREYIFY );
	return mix( vec3(grey) * 0.4, c.rgb, FOW > 0.8 ? 1.0 : 0.3 );
}


vec4 getColorAt(vec2 uv, int borders, int show_terrain, int show_good)
{
	const vec2 cur_map_coord = getCurMapCoords(uv);
	const vec4 land_prov_border_color = vec4(0.5, 0.5, 0.5, 0.7);
	const int provID = texture(provIDMap, uv).x;

	vec3 prov_color = getAssignedProvinceColor(provID);

	if(borders == 1)
	{
		const float fine_grain_border_AA = 0.25f;
		vec3 neighbors = prov_color; int count = 1;
		
		int right = getProvID_DstFromCur(fine_grain_border_AA * vec2(1, 0));
		int left = getProvID_DstFromCur(fine_grain_border_AA * vec2(-1, 0));
		int up = getProvID_DstFromCur(fine_grain_border_AA * vec2(0, -1));
		int down = getProvID_DstFromCur(fine_grain_border_AA * vec2(0, 1));

		if(provID != left || provID != right || provID != up || provID != down)
		{
			neighbors += getAssignedProvinceColor(right); count = count + 1;
			neighbors += getAssignedProvinceColor(left); count = count + 1;
			neighbors += getAssignedProvinceColor(up); count = count + 1;
			neighbors += getAssignedProvinceColor(down); count = count + 1;

			prov_color = vec4(land_prov_border_color * vec4(neighbors, 0.5) / float(count)).xyz;
		}
	}

	// Land province
	if(mapData.provinces[provID].IDs.w == 0)
	{
		const vec2 prov_uv = getUVForProvinceTexture(provID, uv);
		if(show_terrain == 1 && mapData.provinces[provID].terrain_tex_id != 0)	//TERRAIN
		{
			vec3 texture_color = texture(textures[mapData.provinces[provID].terrain_tex_id], prov_uv).xyz;
			
			//Make the texture grey
			float greyness = dot(texture_color.rgb, GREYIFY);
			texture_color.rgb = vec3(greyness);
			texture_color.rgb *= WHITE;

			const float LERP_AMOUNT_FOR_PROV_TEXTURE = 0.5;

			prov_color = mix(texture_color.rgb, prov_color.rgb, LERP_AMOUNT_FOR_PROV_TEXTURE);
			// prov_color *= texture_color * 1.5f;
		}

		if(show_good == 1 && mapData.provinces[provID].overlay_tex_id != 0)	// OVERLAY ICON
		{
			vec3 texture_color = texture(textures[mapData.provinces[provID].overlay_tex_id], prov_uv).xyz;
			prov_color *= texture_color;
		}
	}
	else if(mapData.provinces[provID].IDs.w == 1)	//sea tile
	{

	}

	return vec4(prov_color, 1);
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
		provColor = getColorAt(outVertShader.textureCoordinates, 0, 0, 0); // provColor = getFinalProvinceColor();
	}
	else
	{
		provColor = getColorAt(outVertShader.textureCoordinates, 1, 1, 0); //getFinalProvinceColorWithLines();
	}

	// provColor = getColorAt(outVertShader.textureCoordinates, 1, 1, 0);

	const float BORDER_DIST = 3.5f;
	const float TERRAIN_DIST = 3.0f;


	vec4 result = finalLightingResult();
	//const vec4 result = texture(world_normal_map, outVertShader.textureCoordinates);

	FragColor = provColor * result;
}
