#include "base.as"
/*
uint getPopCountConverting(Pop@ p)
{
	return 0;
}

uint getPopCountMigrating(Pop@ p)
{
	/*
	If pop group is 70%/80%/90%/99% literacy, is not primary culture, and is in a colony then 2.5% chance 
		to migrate to another state for each threshold. (Chance for colonial pops to migrate to home states 
		once they reach some literacy thresholds)	(10% total)
	#If pop group meets at least 10%/20%/30%/40%/50%/60%/70%/80%/90%/99% of its luxury needs, then -0.05% chance to migrate to another state per threshold.	(-0.5% total)

	#If pop group meets at least 99% of its everyday needs, then -1% chance to migrate to another state.

	#If pop group meets at least 99% of its life needs, then -1% chance to migrate to another state.

	#If pop group doesn't obtain 10%/20%/30%/40%/50%/60%/70%/80%/90%/99% of their life needs, then 0.05% chance to migrate to another state for each threshold. (0.5% total)

	#If pop group doesn't obtain 10%/20%/30%/40%/50%/60%/70%/80%/90%/99% of their everyday needs, then 0.025% chance to migrate to another state for each threshold. (0.125% total)

	#If pop group has 99%/90%/80%/70%/60%/50%/40%/30%/20%/10% unemployment, then 0.05% chance to migrate to another state for each threshold unless they are 99% unemployed, then its 10% chance. (0.20% total) (10% if unemployed 99% or more)
	
	#If pop group is in a state that has a factory, then -0.3% chance to migrate to another state.
	
	#Special Factors
	#If pop group is not an accepted culture or a primary culture, then -10% chance to migrate to another state. DO NOT DELETE.

	#If pop group is in a colony, then -2.5% chance to migrate to a state.	DO NOT DELETE.

	#If pop group is in a location not controlled by the owner, then -100% chance to migrate to a state. DO NOT DELETE.

	(Did not include colonial migration insofar)
	*//*

	return 0;
}

uint getPopCountAssimilating(Pop@ p)
{
	return 0;
}


void on_pop_move(Pop@ moving_pop)
{

}

float getMigrationWeightFromTerrain(uint8 terrainID)
{
	return 1.0f;
}

// const static auto POPULATION_DENSITY_FACTOR = 0;

void getProvinceMigrationPriorityList(const Country@ from_nation, array<province_id> &out province_targets, array<float> &out province_weights)
{


	int MAX_PROV = 1;
	for(int i = 0; i < MAX_PROV; i++)
	{
		const Province@ province = getProvince(i);

		float province_weight = 0.0f;


		//Base the weight on:

		province_weight += getMigrationWeightFromTerrain(province.getTerrainType());
		float(province.getPopCount()) / float(province.getProvinceSize());
		province.getUnemploymentPercentage();
		/*	Terrain
		 *	Population
		 *	Unemployment
		 *	
		*//*
	}
}
*/