void loadForBAV(Country@ nation)
{
    print("Loaded for BAVARIA nation!\n");

	nation.addMoney(10000.0f);

    nation.setCapitalProvince(595); //munich

	nation.addAcceptedCulture(10);//north germ
	nation.addAcceptedCulture(11);//south germ

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
	nation.addTemplate("Infanterie-Division", brig_list_1);

	vector<string> culture_list_1; //must be the same length as the brigade list of the division
	culture_list_1.push_back("south_german");
	culture_list_1.push_back("south_german");
	culture_list_1.push_back("south_german");
	culture_list_1.push_back("south_german");
	culture_list_1.push_back("south_german");
	culture_list_1.push_back("south_german");
	culture_list_1.push_back("south_german");

    nation.addLeader("Ludwig I", 2, 2, 3, 3, 0);
	nation.addDivision(culture_list_1, "Infanterie-Division", "1. Infanterie-Division", "Ludwig I", 595, false, 0.0f); //munich
    
    nation.addLeader("Karl Wilhelm von Heideck", 3, 3, 2, 3, 0);
	nation.addDivision(culture_list_1, "Infanterie-Division", "2. Infanterie-Division", "Karl Wilhelm von Heideck", 595, false, 0.0f);

	nation.addDivision(culture_list_1, "Infanterie-Division", "3. Infanterie-Division", "No Commander", 599, false, 0.0f); //nuremberg
	nation.addDivision(culture_list_1, "Infanterie-Division", "4. Infanterie-Division", "No Commander", 599, false, 0.0f);

}