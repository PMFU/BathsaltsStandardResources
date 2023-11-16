//Loading OOB and default values for FRA

void loadForFRA(Country@ nation)
{
	print("Loaded for FRENCH nation!\n");

	nation.addMoney(10000.0f);

	//For each state
	vector<int16>@ states = nation.getStatesInCountry();
	// print("Got States!\n");
	for(int i = 0; i < states.size(); i += 1)
	{
		int16 state_idx = states[i];
		State@ s = getState(state_idx);

		
		//For each province
		auto provs = s.getProvincesInState();
		// print("Got Provinces!\n");
		for(int j = 0; j < provs.size(); j += 1)
		{
			Province@ prov = getProvince(provs[j]);
		}
	}

	nation.changePrestige(90);

	//Initialization lists cannot be used
	vector<string> brig_list;
	brig_list.push_back("artillery_1");
	brig_list.push_back("artillery_1");
	brig_list.push_back("infantry_1");
	brig_list.push_back("infantry_1");
	brig_list.push_back("infantry_1");
	brig_list.push_back("infantry_1");
	nation.addTemplate("French Template", brig_list);
	// nation.addDivision("Basic Template", 425);
}