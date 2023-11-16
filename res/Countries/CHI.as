//Loading OOB and default values for CHI

void loadForCHI(Country@ nation)
{
	print("Loaded for Chinese nation!\n");

	nation.addMoney(500000.0f);
	nation.changePrestige(30);

	nation.setUncivilized();

	vector<string> brig_list;
	brig_list.push_back("reconcavbattalion_1");
	brig_list.push_back("reconcavbattalion_1");
	brig_list.push_back("irregular_1");
	brig_list.push_back("irregular_1");
	brig_list.push_back("infantry_1");
	brig_list.push_back("infantry_1");
	nation.addTemplate("Chinese Template", brig_list);
}