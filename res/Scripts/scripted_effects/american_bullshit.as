// #include "helpers.as"


void wipe_csa_cores(Country@ nation)
{
	forEveryProvince(nation, function(Province@ prov)
	{
		prov.removeCore("CSA");
	});
}

void acw_effect1(Country@ nation)
{

}

void apply_for_statehood(Country@ nation)
{
	//Set flag "usstatehood_we_have_applied"
	Flag@ flag = nation.getFlag("usstatehood_we_have_applied");
	flag.setValue(1);


	//Apply event to the USA
	Country@ USA = getCountry("USA");
	const content_id event_id = 0; //@TODO ????
	USA.triggerEvent(event_id);
}

void trail_of_tears(Country@ nation)
{
	//Set flag "marching_on_the_trail_of_tears"
	Flag@ flag = nation.getFlag("marching_on_the_trail_of_tears");
	flag.setValue(1);


	//Apply cores for cherokee nation and add cherokee accepted culture (130, 131, 129, 145, 143)
	//for all cherokee pop in provinces (129, 130, 131)
	//		reduce pop 0.8
	//		consciousness 2
	///		radicalism -1,
	// move pop 130
	
	//Apply cherokee cores
	const array<province_id> p = {130, 131, 129, 145, 143};
	for(int i = 0; i < p.size(); i++)
	{
		getProvince(p[i]).addCore("CHE");
	}
	//Move cherokee pop
	const array<province_id> p2 = {130, 131, 129};
	for(int i = 0; i < p.size(); i++)
	{
		// getProvince(p[i]).addCore("CHE");
	}
}


void addAmericanFlavor()
{
	Country@ USA = getCountry("USA");

	//Register all the events and decisions
	Decision d(0, "test_dec", "desc_0");
	d.setVisibilityCondition(Conditional("Tooltip ex field", function(const Country@ nation)
		{
			return ex_condition(nation);
		})
	);
	d.setRequirementCondition(Conditional("Tooltip ex field", function(const Country@ nation)
		{
			return ex_condition(nation);
		})
	);
	d.setEffect(Effect("effect_name_0", "effect_desc_0", function(Country@ nation)
		{
			ex_effect(nation);
		}));
	registerDecision(d);


	Event2 e(1, "test_event", "desc_1");
	e.addOption(Effect("effect_name_0", "effect_desc_0", function(Country@ nation)
		{
			ex_effect(nation);
		}), 
		"option_0", "tooltip_0", 
		Conditional("Tooltip ex field", function(const Country@ nation)
		{
			return ex_condition(nation);
		})
	);
	registerEvent(e);

	//custers_expedition
	Decision custers_expedition(0, "custers_expedition", "custers_expedition_desc");
	custers_expedition.setVisibilityCondition(Conditional("Tooltip ex field", function(const Country@ nation)
		{
			return (nation.getTag() == "USA") && 
				!(nation.getFlag("custers_expedition_sent").getValue() == 1) &&
				// nation.		// owns province 122
				//currentDate.getYear() >= 1874)
				true;
		})
	);
	custers_expedition.setRequirementCondition(Conditional("Have an army on Province 122"/*getProvince(122)*/, function(const Country@ nation)
		{
			return true &&
				// getProvince(122).ge
				true;
		})
	);
	custers_expedition.setEffect(Effect("custers_expedition_eff", "custers_expedition_desc_0", function(Country@ nation)
		{
			nation.changePrestige(1.0f);
			nation.getFlag("custers_expedition_sent").setValue(1);
		}));
	registerDecision(custers_expedition);

	//enact_the_homestead_act 
	Decision enact_the_homestead_act (0, "enact_the_homestead_act ", "enact_the_homestead_act_desc");
	enact_the_homestead_act.setVisibilityCondition(Conditional("Tooltip ex field", function(const Country@ nation)
		{
			return (nation.getTag() == "USA") && 
				!(nation.getFlag("the_homestead_act").getValue() == 1) &&
				// nation.		// owns province 122
				//currentDate.getYear() >= 1862)
				true;
		})
	);
	enact_the_homestead_act.setRequirementCondition(Conditional("???", function(const Country@ nation)
		{
			return (changePrestige(0.0f) > 40.0f);
		})
	);
	enact_the_homestead_act.setEffect(Effect("enact_the_homestead_act_eff", "enact_the_homestead_act_desc_0", function(Country@ nation)
		{
			nation.changePrestige(20.0f);

			Modifier m("the_homestead_act", "immigration_attraction", 300);
			nation.addModifier(m);

			nation.getFlag("the_homestead_act").setValue(1);
		}));
	registerDecision(enact_the_homestead_act);


	//bixby_letter 
	Decision bixby_letter (0, "bixby_letter ", "bixby_letter_desc");
	bixby_letter.setVisibilityCondition(Conditional("Tooltip ex field", function(const Country@ nation)
		{
			return (nation.getTag() == "USA") && 
				!(nation.getFlag("bixby_letter_sent").getValue() == 1) &&
				// at war with CSA
				true;
		})
	);
	bixby_letter.setRequirementCondition(Conditional("???", function(const Country@ nation)
		{
			return true; //&&
			//nation.getWarExhausion() >= 6;
		})
	);
	bixby_letter.setEffect(Effect("bixby_letter_eff", "bixby_letter_desc_0", function(Country@ nation)
		{
			// reduce war exhaustion by 2
			nation.getFlag("bixby_letter_sent").setValue(1);
		}));
	registerDecision(bixby_letter);


	//enact_anaconda_plan 
	Decision enact_anaconda_plan (0, "enact_anaconda_plan ", "enact_anaconda_plan_desc");
	enact_anaconda_plan.setVisibilityCondition(Conditional("Tooltip ex field", function(const Country@ nation)
		{
			return (nation.getTag() == "USA") && 
				!(nation.getFlag("anaconda_plan_active").getValue() == 1) &&
				// at war with CSA
				true;
		})
	);
	enact_anaconda_plan.setRequirementCondition(Conditional("Blockade the CSA to 0.8", function(const Country@ nation)
		{
			return false;//getCountry("CSA").getBlockade() > 0.8;
		})
	);
	enact_anaconda_plan.setEffect(Effect("enact_anaconda_plan_eff", "enact_anaconda_plan_desc_0", function(Country@ nation)
		{
			nation.getFlag("anaconda_plan_active").setValue(1);

			getCountry("CSA").getFlag("anaconda_plan").setValue(1);	//In OG this is an empty modifier?
		}));
	registerDecision(enact_anaconda_plan);

	//shermans_march_to_the_sea 
	Decision shermans_march_to_the_sea (0, "shermans_march_to_the_sea ", "shermans_march_to_the_sea_desc");
	shermans_march_to_the_sea.setVisibilityCondition(Conditional("Tooltip ex field", function(const Country@ nation)
		{
			return (nation.getTag() == "USA") && 
				!(nation.getFlag("sherman_marched_to_the_sea").getValue() == 1) &&
				// at war with CSA
				true;
		})
	);
	shermans_march_to_the_sea.setRequirementCondition(Conditional("Blockade the CSA to 0.8", function(const Country@ nation)
		{
			return true; //controls 201 2555 204
		})
	);
	shermans_march_to_the_sea.setEffect(Effect("shermans_march_to_the_sea_eff", "shermans_march_to_the_sea_desc_0", function(Country@ nation)
		{
			nation.getFlag("sherman_marched_to_the_sea").setValue(1);

			getCountry("CSA");//war exhaustion +4

			/*
			201 = {
				any_pop = {
					reduce_pop = 0.70
				}
			}
			2555 = {
				any_pop = {
					reduce_pop = 0.90
				}
			}
			204 = {
				any_pop = {
					reduce_pop = 0.90
				}
			}*/
		}));
	registerDecision(shermans_march_to_the_sea);
}
