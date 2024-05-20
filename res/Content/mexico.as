#include "../ScriptLibrary/helpers.as"
#include "../ScriptLibrary/Decision.as"

//EXAMPLE DECISION
class restore_mexican_empire : Decision
{
	restore_mexican_empire()
	{
		m_name = "restore_mexican_empire";
		m_description = "Move the capital to Delhi! restore_mexican_empire_desc";
		m_tooltip = "There are no requirements to view or take this decision mmm.";
	}

	bool canView(const Country@ nation)
	{
		const Country@ FRA = getCountry("FRA");

		return (nation.getTag() == "MEX") &&
				//has government : democracy
				!(nation.getFlag("we_have_tried_this_once").getValue() == 1) &&
				//(FRA.hasGovernment("absolute_monarchy") || FRA.hasGovernment("prussian_constitutionalism"))
				true;
	}
	bool fitsRequirements(const Country@ nation)
	{
		return nation.getCapitalProvince() != 1236 &&
				nation.getCountrywideMilitancy() > 3.0f &&
				// nation.isInWar() &&
				// (nation.hasGovernmentIdeology("conservative") || nation.hasGovernmentIdeology("reactionary")) &&
				true;
	}
	string listRequirements() const
	{
		string reqs = "Militancy above 3, and capital not 1236!";
		return reqs;
	}
	void execute(Country@ nation)
	{
		//For all pops that are liberal, increase radicalism by 8x
		//Set the government to be HMS gov

		//Add relation & influence between nation and FRA
		Country@ FRA = getCountry("FRA");
		// FRA.addInfluence(nation.getTag(), 100);
		// nation.addRelation("FRA", 100);
		
		//Set the tried this already flag
		nation.getFlag("we_have_tried_this_once").setValue(1);
	}
}


class treaty_of_guadalupe_hidalgo : Decision
{
	treaty_of_guadalupe_hidalgo()
	{
		m_name = "treaty_of_guadalupe_hidalgo";
		m_description = "treaty_of_guadalupe_hidalgo_desc";
		m_tooltip = "There are no requirements to view or take this decision mmm.";
	}

	bool canView(const Country@ nation)
	{
		/*potential = {
			tag = USA
			has_country_flag = hasmanifestdestiny
			NOT = { has_country_flag = treaty_of_guadalupe_hidalgo }
			MEX = { is_greater_power = no }
			NOT = { has_country_flag = USA1861Start }
		}*/
		const Country@ MEX = getCountry("MEX");

		return (nation.getTag() == "USA") &&
				nation.getFlag("USA1861Start").getValue() == 0 &&
				!(nation.getFlag("treaty_of_guadalupe_hidalgo").getValue() == 1) &&
				(nation.getFlag("hasmanifestdestiny").getValue() == 1) &&
				!MEX.isGreatPower() && 
				true;
	}
	bool fitsRequirements(const Country@ nation)
	{
		/*
		OR =
				2172 = { controlled_by = USA }
				MEX = {
					all_core = {
						OR = {
							owned_by = USA
							controlled_by = USA
							NOT = { is_core = USA }
						}
					}
				}
			}
			NOT = {
				any_owned_province = { controlled_by = MEX }
				any_owned_province = {
					controller = { alliance_with = MEX }
				}
			}
		*/
		// getProvince(2172).getController() == "USA" ||
		return nation.getCapitalProvince() != 1236 &&
				nation.getCountrywideMilitancy() > 3.0f &&
				// nation.isInWar() &&
				// (nation.hasGovernmentIdeology("conservative") || nation.hasGovernmentIdeology("reactionary")) &&
				true;
	}
	string listRequirements() const
	{
		string reqs = "Militancy above 3, and capital not 1236!";
		return reqs;
	}
	void execute(Country@ nation)
	{
		//For all pops that are liberal, increase radicalism by 8x
		//Set the government to be HMS gov

		//Add relation & influence between nation and FRA
		Country@ FRA = getCountry("FRA");
		// FRA.addInfluence(nation.getTag(), 100);
		// nation.addRelation("FRA", 100);
		
		//Set the tried this already flag
		nation.getFlag("we_have_tried_this_once").setValue(1);
	}
}
/**
political_decisions = {

	treaty_of_guadalupe_hidalgo = {
		potential = {
			tag = USA
			has_country_flag = hasmanifestdestiny
			NOT = { has_country_flag = treaty_of_guadalupe_hidalgo }
			MEX = { is_greater_power = no }
			NOT = { has_country_flag = USA1861Start }
		}

		allow = {
			OR = {
				2172 = { controlled_by = USA }
				MEX = {
					all_core = {
						OR = {
							owned_by = USA
							controlled_by = USA
							NOT = { is_core = USA }
						}
					}
				}
			}
			NOT = {
				any_owned_province = { controlled_by = MEX }
				any_owned_province = {
					controller = { alliance_with = MEX }
				}
			}
		}

		effect = {
			set_country_flag = treaty_of_guadalupe_hidalgo
			MEX = { country_event = 44825 }
		}

		ai_will_do = {
			factor = 1
		}
	}
	
	refute_manifest_destiny = {
		picture = manifest_destiny
		potential = {
			tag = MEX
			USA = { has_country_flag = hasmanifestdestiny }
			NOT = {
				has_country_flag = treaty_of_guadalupe_hidalgo
				has_country_flag = manifest_destiny_refuted
			}
		}
		
		allow = {
			war = no
			is_greater_power = yes
			invention = manifest_destiny
			all_core = { owned_by = THIS }
		}
		
		effect = {
			set_country_flag = manifest_destiny_refuted
			prestige = 20
			USA = {
				prestige = -20
				relation = { who = THIS value = -200 }
			}
			any_owned = {
				limit = {
					is_core = USA
					is_core = MEX
				}
				remove_core = USA
			}
			USA_129 = { add_core = MEX }
			USA_106 = { add_core = MEX }
		}
	}
#RENO ADDITION
	enact_the_homestead_act_mexico = {
		picture = enact_the_homestead_act
		potential = {
			tag = MEX
			NOT = {
				has_country_modifier = the_homestead_act_mexico
			}
			year = 1862
		}
		
		allow = {
			year = 1862
		}
		
		effect = {
			add_country_modifier = {
				name = the_homestead_act_mexico
				duration = -1
			}
		}
	}	
}
*/