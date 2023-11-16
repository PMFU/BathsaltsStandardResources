//Loading OOB and default values for JAP

void loadForJAP(Country@ nation)
{
	print("Loaded for JAPANESE nation!\n");

	nation.addMoney(50000.0f);
	nation.changePrestige(45);

	nation.setUncivilized();

	vector<string> brig_list;
	brig_list.push_back("reconcavbattalion_1");
	brig_list.push_back("reconcavbattalion_1");
	brig_list.push_back("irregular_1");
	brig_list.push_back("irregular_1");
	brig_list.push_back("infantry_1");
	brig_list.push_back("infantry_1");
	nation.addTemplate("Japan Template", brig_list);
}