void loadForDEN(Country@ nation)
{
    print("Loaded for DENMARK nation!\n");

	nation.addMoney(10000.0f);

    nation.setCapitalProvince(372); //copenhagen

	nation.addAcceptedCulture(4);//danish
	nation.addAcceptedCulture(5);//norwegian

	nation.passLaw("one_year_conscription");
	nation.passLaw("two_year_reservists");
	nation.passLaw("income_tax_1");
	nation.passLaw("estate_tax_1");
	nation.passLaw("poll_tax_1");
	nation.passLaw("excise_tax_1");
	nation.passLaw("landed_voting");
	nation.passLaw("no_meetings");
	nation.passLaw("opposition_parties_outlawed");
	nation.passLaw("state_press");
	nation.passLaw("citizenship_residency");
	nation.passLaw("religious_education");
	nation.passLaw("slavery_outlawed");

    vector<string> brig_list_1;
	brig_list_1.push_back("infantry_regiment_1");
	brig_list_1.push_back("infantry_regiment_1");
	brig_list_1.push_back("infantry_regiment_1");
	brig_list_1.push_back("infantry_regiment_1");
	brig_list_1.push_back("dragoon_regiment_1");
	brig_list_1.push_back("artillery_regiment_1");
	brig_list_1.push_back("horse_logistics_battalion_1");
	nation.addTemplate("Infanteridivision", brig_list_1);

	vector<string> culture_list_1; //must be the same length as the brigade list of the division
	culture_list_1.push_back("danish");
	culture_list_1.push_back("danish");
	culture_list_1.push_back("danish");
	culture_list_1.push_back("danish");
	culture_list_1.push_back("danish");
	culture_list_1.push_back("danish");
	culture_list_1.push_back("danish");

    nation.addLeader("Gerhard Christoph von Krogh", 2, 2, 3, 3, 0);
	nation.addDivision(culture_list_1, "Infanteridivision", "1. Infanteridivision", "Ludwig I", 372, false, 0.0f); //copenhagen
    nation.addLeader("Friderich Adolph Schleppegrell", 3, 3, 2, 3, 0);
	nation.addDivision(culture_list_1, "Infanteridivision", "2. Infanteridivision", "Karl Wilhelm von Heideck", 372, false, 0.0f);
	nation.addDivision(culture_list_1, "Infanteridivision", "3. Infanteridivision", "No Commander", 372, false, 0.0f); 
	nation.addDivision(culture_list_1, "Infanteridivision", "4. Infanteridivision", "No Commander", 372, false, 0.0f);

	vector<string> division_list_1;
	division_list_1.push_back("1. Infanteridivision");
	division_list_1.push_back("2. Infanteridivision");
	division_list_1.push_back("3. Infanteridivision");
	division_list_1.push_back("4. Infanteridivision");
	nation.addLeader("Frederick VI", 2, 3, 1, 4, 1); 
	nation.addArmy(division_list_1, "Hæren", "Frederick VI");

}