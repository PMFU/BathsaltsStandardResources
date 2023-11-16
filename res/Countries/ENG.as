//Loading OOB and default values for ENG

void loadForENG(Country@ nation)
{
	print("Loaded for ENGLISH nation!\n");

	nation.addMoney(100000.0f);
	nation.changePrestige(100);

	vector<string> brig_list;
	brig_list.push_back("artillery_1");
	brig_list.push_back("artillery_1");
	brig_list.push_back("infantry_1");
	brig_list.push_back("infantry_1");
	brig_list.push_back("infantry_1");
	brig_list.push_back("infantry_1");
	nation.addTemplate("English Template", brig_list);
	// nation.addDivision("English Template", 300);

	//65 = South East England
	addFactory(65, "machine_parts_factory");
	addFactory(65, "cement_factory");
	addFactory(65, "steel_factory");
}