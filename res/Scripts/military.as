//Include the basics things
#include "base.as"

/*
 *	In this file, implement all the scriptable military
 *	functions and whatnot.
*/

//@TODO: Add some basic shit to these example classes, and write the doBattleTick() function

//Also temporary
class Modifiers {}
//Also temporary
class CountryInfo {}

//Defines
class Defines  
{ 
	Defines() 
	{
		BASE_COORDINATED_SHARE = 0.35;
		MANEUVER_COORDINATED_SHARE_FACTOR = 0.05;
		BASE_DEPLOYMENT_CHANCE = 0.2;
		DIV_COMMANDER_MANEUVER_DEPLOYMENT_CHANCE_FACTOR = 0.05;
		MANEUVER_DEPLOYMENT_CHANCE_FACTOR = 0.05;
		ORG_DAMAGE_HITS_RATIO = 0.125;
		STRENGTH_DAMAGE_HITS_RATIO = 6.25;
		DEFENDED_SHOT_HIT_RATIO = 0.30;
		UNDEFENDED_SHOT_HIT_RATIO = 0.53;
		UNPIERCED_DAMAGE_REDUCTION_FACTOR = 2;
		ENGAGEMENT_WIDTH_FACTOR = 2;
	}
	float BASE_COORDINATED_SHARE;
	float MANEUVER_COORDINATED_SHARE_FACTOR;
	float BASE_DEPLOYMENT_CHANCE;
	float DIV_COMMANDER_MANEUVER_DEPLOYMENT_CHANCE_FACTOR;
	float MANEUVER_DEPLOYMENT_CHANCE_FACTOR;
	float ORG_DAMAGE_HITS_RATIO;
	float STRENGTH_DAMAGE_HITS_RATIO;
	float DEFENDED_SHOT_HIT_RATIO;
	float UNDEFENDED_SHOT_HIT_RATIO;
	float UNPIERCED_DAMAGE_REDUCTION_FACTOR;
	float ENGAGEMENT_WIDTH_FACTOR;
}

Defines defines;

//helper function for finding combat width
int getCombatWidth(uint provinceid) 
{
	Province@ province = getProvince(provinceid);

	uint8 t_id = province.getTerrain();
	return 540;
}

//helper function for finding filled width for the attacker
float getFilledAttackerWidth(Battle@ &in battle) 
{
	float filled_width = 0;
	for (uint i = 0; i < battle.get_attacker_line_size(); i++) 
	{
		filled_width += battle.get_attacker_line(i).getMaxStats().combat_width;
	}
	return filled_width;
}

//helper function for finding filled width for the defenders
float getFilledDefenderWidth(Battle@ &in battle) 
{
	float filled_width = 0;
	for (uint i = 0; i < battle.get_defender_line_size(); i++) 
	{
		filled_width += battle.get_defender_line(i).getMaxStats().combat_width;
	}
	return filled_width;
}

//does a round of deployment attempts for both sides
void doDeployment(Battle@ battle) 
{
	Date@ d = null; //Current date
	for (uint i = 0; i < battle.get_defender_reserves_size(); i++) 
	{
		float deployment_chance = 0;
		if ((getCombatWidth(battle.getProvince()) - getFilledDefenderWidth(battle)) < battle.get_defender_reserves(i).getMaxStats().combat_width) {
			deployment_chance = (battle.get_defender_reserves(i).getCurrentStats().maneuver * defines.MANEUVER_DEPLOYMENT_CHANCE_FACTOR) + defines.BASE_DEPLOYMENT_CHANCE
									  + (battle.get_defender_reserves(i).getDivisionCommander().maneuver * defines.DIV_COMMANDER_MANEUVER_DEPLOYMENT_CHANCE_FACTOR);

			if (deployment_chance > (randomNumber(d, 1, 100))/100.0f) 
			{
				battle.add_defender_line(battle.get_defender_reserves(i));
				battle.remove_defender_reserves_at(i);
			}
		}
	}

	for (uint i = 0; i < battle.get_attacker_reserves_size(); i++) 
	{
		float deployment_chance = 0;
		if ((getCombatWidth(battle.getProvince()) - getFilledAttackerWidth(battle)) < battle.get_attacker_reserves(i).getMaxStats().combat_width) {
			deployment_chance = (battle.get_attacker_reserves(i).getCurrentStats().maneuver * defines.MANEUVER_DEPLOYMENT_CHANCE_FACTOR) + defines.BASE_DEPLOYMENT_CHANCE
									  + (battle.get_attacker_reserves(i).getDivisionCommander().maneuver * defines.DIV_COMMANDER_MANEUVER_DEPLOYMENT_CHANCE_FACTOR);

			if (deployment_chance > (randomNumber(d, 1, 100))/100.0f ) 
			{
				battle.add_attacker_line(battle.get_attacker_reserves(i));
				battle.remove_attacker_reserves_at(i);
			}
		}
	}
}

//battle object constructed by troop movement handler, all divisions assigned to reserves for this function
void startBattle(Battle@ battle) 
{
	//initial deployment
	//selects the highest maneuver division and immediately places it on the battle line
	//if multiple divisions have the same maneuver rating, selects the first highest
	int highest_manuever_division = 0;
	for (uint i = 0; i < battle.get_attacker_reserves_size(); i++) 
	{
		if(battle.get_attacker_reserves(i).getCurrentStats().maneuver < battle.get_attacker_reserves(highest_manuever_division).getCurrentStats().maneuver) 
		{
			highest_manuever_division = i;
		}
	}
	battle.add_attacker_line(battle.get_attacker_reserves(highest_manuever_division));
	battle.remove_attacker_reserves_at(highest_manuever_division);
	highest_manuever_division = 0;
	for (uint i = 0; i < battle.get_defender_reserves_size(); i++) 
	{
		if(battle.get_defender_reserves(i).getCurrentStats().maneuver < battle.get_defender_reserves(highest_manuever_division).getCurrentStats().maneuver) 
		{
			highest_manuever_division = i;
		}
	}
	battle.add_defender_line(battle.get_defender_reserves(highest_manuever_division));
	battle.remove_defender_reserves_at(highest_manuever_division);

	//initial deployment phase
	//once the first division is deployed, all other reserve divisions have the opportunity to deploy
	//before any damage is done
	doDeployment(battle);
	//initial damage phase (this is done in engine, don't duplicate (unless intended))
	// doDamageTick(battle);
}

void joinBattle(array<Division@>& joining_divisions, uint from_prov_id, Battle@ battle) 
{
	/*for(joining_divisions) 
	{
		joining_divisions.getcountry
		if(defender) 
		{
			battle.defender_reserves.insertLast(joining_division);
		}
		if(attacker)
		{
			battle.attacker_divisions.insertLast(joining_division);
			if(rivercrossing) 
			{

			}
		}
	}*/
}

//phase 2: calculate damage to line divisions
void doDamageTick(Battle@ battle)
{
	//recalculate line stats
	for(uint i = 0; i < battle.get_attacker_line_size(); i++) 
	{
		battle.get_attacker_line(i).recalculateCurrentStats();
	}
	for(uint i = 0; i < battle.get_defender_line_size(); i++) 
	{
		battle.get_defender_line(i).recalculateCurrentStats();
	}

	array<float> attacker_hits(battle.get_attacker_line_size());
	array<float> defender_hits(battle.get_defender_line_size());

	//@TODO
	Date@ date = null;

	//calculate both side's hits before applying any damage
	for(uint i = 0; i < battle.get_attacker_line_size(); i++)
	{
		float soft_attacks = battle.get_attacker_line(i).getCurrentStats().soft_attack;
		float hard_attacks = battle.get_attacker_line(i).getCurrentStats().hard_attack;

		//get engagement width
		float engagement_width = battle.get_attacker_line(i).getCurrentStats().combat_width * defines.ENGAGEMENT_WIDTH_FACTOR;

		//get targets
		array<int> attacker_targets();
		uint totalpossibletargets = battle.get_attacker_line_size();
		for(float total_target_width = 0; total_target_width <= engagement_width;) 
		{
			int random_target = randomNumber(date, 0, battle.get_defender_line_size()-1);
			attacker_targets.insertLast(random_target);
			total_target_width = total_target_width + battle.get_defender_line(random_target).getCurrentStats().combat_width;
			if(totalpossibletargets == attacker_targets.length())
			{
				break;
			}
		}

		//select primary target
		int primary_target = 0;
		int lowest_org_division = 0;
		for(uint j = 0; j < attacker_targets.length(); j++) 
		{
			if(battle.get_attacker_line(i).getCurrentStats().piercing >= battle.get_defender_line(attacker_targets[j]).getCurrentStats().armor) 
			{
				if(battle.get_defender_line(attacker_targets[j]).getCurrentStats().organization > battle.get_defender_line(attacker_targets[lowest_org_division]).getCurrentStats().organization) 
				{
					lowest_org_division = j;
				}
			}
		}
		primary_target = attacker_targets[lowest_org_division];

		//get coordinated share
		float coordinated_share = 0;
		if(battle.get_attacker_line(i).getDivisionCommander() !is null) 
		{
			coordinated_share = defines.BASE_COORDINATED_SHARE + ((battle.get_attacker_line(i).getCurrentStats().maneuver + battle.get_attacker_line(i).getDivisionCommander().maneuver)
								 * defines.MANEUVER_COORDINATED_SHARE_FACTOR);
		}
		else 
		{
			coordinated_share = defines.BASE_COORDINATED_SHARE + ((battle.get_attacker_line(i).getCurrentStats().maneuver)
								 * defines.MANEUVER_COORDINATED_SHARE_FACTOR);
		}
		//apply uncoordinated hits
		for(uint j = 0; j < attacker_targets.length(); j++) 
		{
			float uncoordinated_hits = (((soft_attacks*(1-coordinated_share))*(1-battle.get_defender_line(attacker_targets[j]).getCurrentStats().hardness))
								    + ((hard_attacks*(1-coordinated_share))*(battle.get_defender_line(attacker_targets[j]).getCurrentStats().hardness))) 
									/ attacker_targets.length();
			if(battle.get_attacker_line(i).getCurrentStats().piercing >= battle.get_defender_line(attacker_targets[j]).getCurrentStats().armor) 
			{
				defender_hits[attacker_targets[j]] = defender_hits[attacker_targets[j]] + uncoordinated_hits; 
			}
			else 
			{
				defender_hits[attacker_targets[j]] = defender_hits[attacker_targets[j]] + (uncoordinated_hits/2); 
			}
		}
		//calculate coordinated hits
		float coordinated_hits = ((soft_attacks*coordinated_share)*(1-battle.get_defender_line(primary_target).getCurrentStats().hardness))
								+ ((hard_attacks*coordinated_share)*(battle.get_defender_line(primary_target).getCurrentStats().hardness));
		//apply coordinated hits
		if(battle.get_attacker_line(i).getCurrentStats().piercing > battle.get_defender_line(primary_target).getCurrentStats().armor)
		{
			defender_hits[primary_target] = defender_hits[primary_target] + coordinated_hits;
		}
		else 
		{
			defender_hits[primary_target] = defender_hits[primary_target] + (coordinated_hits/2);
		}
	}

	for(uint i = 0; i < battle.get_defender_line_size(); i++)
	{
		float soft_attacks = battle.get_defender_line(i).getCurrentStats().soft_attack;
		float hard_attacks = battle.get_defender_line(i).getCurrentStats().hard_attack;

		//get engagement width
		float engagement_width = battle.get_defender_line(i).getCurrentStats().combat_width * defines.ENGAGEMENT_WIDTH_FACTOR;

		//get targets
		array<int> defender_targets();
		uint totalpossibletargets = battle.get_attacker_line_size();
		for(float total_target_width = 0; total_target_width < engagement_width;) 
		{
			//TODO RANDOM
			int random_target = randomNumber(date, 0, battle.get_attacker_line_size()-1);
			defender_targets.insertLast(random_target);
			total_target_width = total_target_width + battle.get_attacker_line(random_target).getCurrentStats().combat_width;
			if(totalpossibletargets == defender_targets.length())
			{
				break;
			}
		}

		//select primary target
		int primary_target = 0;
		int lowest_org_division = 0;
		for(uint j = 0; j < defender_targets.length(); j++) 
		{
			if(battle.get_defender_line(i).getCurrentStats().piercing > battle.get_attacker_line(defender_targets[j]).getCurrentStats().armor) 
			{
				if(battle.get_attacker_line(defender_targets[j]).getCurrentStats().organization > battle.get_attacker_line(defender_targets[lowest_org_division]).getCurrentStats().organization) 
				{
					lowest_org_division = j;
				}
			}
		}
		primary_target = defender_targets[lowest_org_division];

		//get coordinated share
		float coordinated_share = 0;
		if(battle.get_attacker_line(i).getDivisionCommander() !is null)
		{
			coordinated_share = defines.BASE_COORDINATED_SHARE + ((battle.get_defender_line(i).getCurrentStats().maneuver + battle.get_defender_line(i).getDivisionCommander().maneuver)
								 * defines.MANEUVER_COORDINATED_SHARE_FACTOR);
		}
		else
		{
			coordinated_share = defines.BASE_COORDINATED_SHARE + ((battle.get_defender_line(i).getCurrentStats().maneuver)
								 * defines.MANEUVER_COORDINATED_SHARE_FACTOR);
		}
		//apply uncoordinated hits
		for(uint j = 0; j < defender_targets.length(); j++) 
		{
			float uncoordinated_hits = (((soft_attacks*(1-coordinated_share))*(1-battle.get_attacker_line(defender_targets[j]).getCurrentStats().hardness))
								    + ((hard_attacks*(1-coordinated_share))*(battle.get_attacker_line(defender_targets[j]).getCurrentStats().hardness))) 
									/ defender_targets.length();
			if(battle.get_defender_line(i).getCurrentStats().piercing > battle.get_attacker_line(defender_targets[j]).getCurrentStats().armor) 
			{
				attacker_hits[defender_targets[j]] = attacker_hits[defender_targets[j]] + uncoordinated_hits; 
			}
			else 
			{
				attacker_hits[defender_targets[j]] = attacker_hits[defender_targets[j]] + (uncoordinated_hits/defines.UNPIERCED_DAMAGE_REDUCTION_FACTOR); 
			}
		}
		//calculate coordinated hits
		float coordinated_hits = ((soft_attacks*coordinated_share)*(1-battle.get_attacker_line(primary_target).getCurrentStats().hardness))
								+ ((hard_attacks*coordinated_share)*(battle.get_attacker_line(primary_target).getCurrentStats().hardness));
		//apply coordinated hits
		if(battle.get_defender_line(i).getCurrentStats().piercing > battle.get_attacker_line(primary_target).getCurrentStats().armor)
		{
			attacker_hits[primary_target] = attacker_hits[primary_target] + coordinated_hits;
		}
		else 
		{
			attacker_hits[primary_target] = attacker_hits[primary_target] + (coordinated_hits/defines.UNPIERCED_DAMAGE_REDUCTION_FACTOR);
		}
	}

	//calculate battle-wide combat factors (entrenchment, terrain, tactics, etc)
	//combat factors decrease attack only
	float attacker_attack_factor = 1;
	float defender_attack_factor = 1;

	float attacker_breakthrough_factor = 1;
	float defender_defense_factor = 1;


	//calculate damage recieved
	for(uint i = 0; i < battle.get_defender_line_size(); i++)
	{
		float damage = 0;
		
		//apply combat factors
		float shots = defender_hits[i]*attacker_attack_factor;
		float defense = battle.get_defender_line(i).getCurrentStats().defense*defender_defense_factor;

		//factor in defense
		float undefended_shots = shots - defense;
		if (undefended_shots > 0)
		{
			damage = (undefended_shots*defines.UNDEFENDED_SHOT_HIT_RATIO) + (defense*defines.DEFENDED_SHOT_HIT_RATIO);
		}
		else 
		{
			damage = (shots*defines.DEFENDED_SHOT_HIT_RATIO);
		}
		uint casualties = (damage * defines.STRENGTH_DAMAGE_HITS_RATIO);
		float org_damage = damage * defines.ORG_DAMAGE_HITS_RATIO;	

		//apply final damage
		battle.get_defender_line(i).distributeDamage(casualties);
		if (battle.get_defender_line(i).getOrg() - org_damage > 0.0f) 
		{
			battle.get_defender_line(i).setOrg(battle.get_defender_line(i).getOrg() - org_damage);
		}
		else 
		{
			battle.get_defender_line(i).setOrg(0);
		}
	}

	for(uint i = 0; i < battle.get_attacker_line_size(); i++)
	{
		float damage = 0;
		
		//apply combat factors
		float shots = attacker_hits[i]*defender_attack_factor;
		float defense = battle.get_attacker_line(i).getCurrentStats().breakthrough*attacker_breakthrough_factor;

		//factor in defense
		float undefended_shots = shots - defense;
		if (undefended_shots > 0)
		{
			damage = (undefended_shots*defines.UNDEFENDED_SHOT_HIT_RATIO) + (defense*defines.DEFENDED_SHOT_HIT_RATIO);
		}
		else 
		{
			damage = (shots*defines.DEFENDED_SHOT_HIT_RATIO);
		}
		uint casualties = (damage * defines.STRENGTH_DAMAGE_HITS_RATIO);
		float org_damage = damage * defines.ORG_DAMAGE_HITS_RATIO;	
		//apply final damage
		battle.get_attacker_line(i).distributeDamage(casualties);
		if(battle.get_attacker_line(i).getOrg() - org_damage > 0.0f) 
		{
			battle.get_attacker_line(i).setOrg(battle.get_attacker_line(i).getOrg() - org_damage);
		}
		else
		{
			battle.get_attacker_line(i).setOrg(0);
		}
	}

	//retreat any division that goes under 1 org
}

