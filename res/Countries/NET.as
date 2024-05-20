void loadForNET(Country@ nation)
{
    print("Loaded for NETHERLANDS nation!\n");

	nation.addMoney(10000.0f);

    nation.setCapitalProvince(375); //amsterdam

	nation.addAcceptedCulture(7);//dutch
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
    brig_list_1.push_back("infantry_regiment_1");
	brig_list_1.push_back("infantry_regiment_1");
	brig_list_1.push_back("hussar_regiment_1");
	brig_list_1.push_back("artillery_regiment_1");
	brig_list_1.push_back("horse_logistics_battalion_1");
	nation.addTemplate("Infanteriedivisie", brig_list_1);

    vector<string> brig_list_2;
	brig_list_2.push_back("cuirassier_regiment_1");
	brig_list_2.push_back("cuirassier_regiment_1");
	brig_list_2.push_back("dragoon_regiment_1");
	brig_list_2.push_back("dragoon_regiment_1");
	brig_list_2.push_back("hussar_regiment_1");
	brig_list_2.push_back("artillery_regiment_1");
	brig_list_2.push_back("horse_logistics_battalion_1");
	nation.addTemplate("Cavaleriedivisie", brig_list_2);

	vector<string> culture_list_1; //must be the same length as the brigade list of the division
	culture_list_1.push_back("dutch");
	culture_list_1.push_back("dutch");
    culture_list_1.push_back("dutch");
	culture_list_1.push_back("dutch");
	culture_list_1.push_back("dutch");
	culture_list_1.push_back("dutch");
	culture_list_1.push_back("dutch");
	culture_list_1.push_back("dutch");
	culture_list_1.push_back("dutch");

    nation.addLeader("Josephus Jacobus van Geen", 2, 2, 3, 3, 0);
	nation.addDivision(culture_list_1, "Infanteriedivisie", "1e Divisie", "Josephus Jacobus van Geen", 380, false, 0.0f); //breda
    nation.addLeader("Karel Bernhard van Saxen-Weimar", 3, 3, 2, 3, 0);
	nation.addDivision(culture_list_1, "Infanteriedivisie", "2e Divisie", "Karel Bernhard van Saxen-Weimar", 380, false, 0.0f);
    nation.addLeader("Adriaan Frans Meijer", 2, 2, 3, 3, 0);
	nation.addDivision(culture_list_1, "Infanteriedivisie", "3e Divisie", "Adriaan Frans Meijer", 380, false, 0.0f); 
    nation.addLeader("Gijsbertus Martinus Cort Heyligers", 2, 2, 3, 3, 0);
	nation.addDivision(culture_list_1, "Infanteriedivisie", "Reserve Divisie", "Gijsbertus Martinus Cort Heyligers", 380, false, 0.0f);

	vector<string> division_list_1;
	division_list_1.push_back("1e Divisie");
	division_list_1.push_back("2e Divisie");
	division_list_1.push_back("3e Divisie");
	division_list_1.push_back("Reserve Divisie");
	nation.addLeader("William I", 4, 2, 1, 4, 1); 
	nation.addArmy(division_list_1, "Koninklijke Landmacht", "William I");
}