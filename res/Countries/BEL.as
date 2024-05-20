void loadForBEL(Country@ nation)
{
    print("Loaded for BELGIUM nation!\n");

	nation.addMoney(10000.0f);

    nation.setCapitalProvince(387); //brussels

	nation.addAcceptedCulture(9);//walloon
	nation.addAcceptedCulture(8);//flemish

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
	brig_list_1.push_back("hussar_regiment_1");
	brig_list_1.push_back("artillery_regiment_1");
	brig_list_1.push_back("horse_logistics_battalion_1");
	nation.addTemplate("Infanteriedivisie", brig_list_1);

	vector<string> brig_list_2;
	brig_list_2.push_back("infantry_regiment_1");
	brig_list_2.push_back("infantry_regiment_1");
	brig_list_2.push_back("infantry_regiment_1");
	brig_list_2.push_back("infantry_regiment_1");
	brig_list_2.push_back("dragoon_regiment_1");
	brig_list_2.push_back("artillery_regiment_1");
	brig_list_2.push_back("horse_logistics_battalion_1");
	nation.addTemplate("Division d'Infanterie", brig_list_2);

	vector<string> culture_list_1; //must be the same length as the brigade list of the division
	culture_list_1.push_back("flemish");
	culture_list_1.push_back("flemish");
	culture_list_1.push_back("flemish");
	culture_list_1.push_back("flemish");
	culture_list_1.push_back("flemish");
	culture_list_1.push_back("flemish");
	culture_list_1.push_back("flemish");

	vector<string> culture_list_2; //must be the same length as the brigade list of the division
	culture_list_2.push_back("wallonian");
	culture_list_2.push_back("wallonian");
	culture_list_2.push_back("wallonian");
	culture_list_2.push_back("wallonian");
	culture_list_2.push_back("wallonian");
	culture_list_2.push_back("wallonian");
	culture_list_2.push_back("wallonian");

    nation.addLeader("Genmaj Niëllon", 2, 2, 3, 3, 0);
	nation.addDivision(culture_list_1, "Infanteriedivisie", "1. Infanteriedivisie", "Genmaj Niëllon", 381, false, 0.0f); //limbourg
    nation.addLeader("Van Lieshout", 3, 3, 2, 3, 0);
	nation.addDivision(culture_list_1, "Infanteriedivisie", "2. Infanteriedivisie", "Van Lieshout", 381, false, 0.0f);

	nation.addLeader("Amédée de Failly", 2, 2, 3, 3, 0);
	nation.addDivision(culture_list_2, "Division d'Infanterie", "1e Division d'Infanterie", "Amédée de Failly", 390, false, 0.0f); //antwerp
	nation.addLeader("Charles Niellon", 2, 2, 3, 3, 0);
	nation.addDivision(culture_list_2, "Division d'Infanterie", "2e Division d'Infanterie", "No Commander", 390, false, 0.0f);
	nation.addLeader("Nicolas Daine", 2, 2, 3, 3, 0);
	nation.addDivision(culture_list_2, "Division d'Infanterie", "3e Division d'Infanterie", "Nicolas Daine", 390, false, 0.0f);

	vector<string> division_list_1;
	division_list_1.push_back("1. Infanteriedivisie");
	division_list_1.push_back("2. Infanteriedivisie");
	nation.addLeader("Amédée de Failly", 3, 3, 1, 4, 1); 
	nation.addArmy(division_list_1, "Army of the Meuse", "Amédée de Failly");

	vector<string> division_list_2;
	division_list_2.push_back("1e Division d'Infanterie");
	division_list_2.push_back("2e Division d'Infanterie");
	division_list_2.push_back("3e Division d'Infanterie");
	nation.addLeader("Leopold I", 2, 3, 1, 4, 1); 
	nation.addArmy(division_list_2, "Army of the Scheldt", "Leopold I");
}