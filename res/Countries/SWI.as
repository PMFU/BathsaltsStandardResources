void loadForSWI(Country@ nation)
{
    print("Loaded for SWITZERLAND nation!\n");

	nation.addMoney(10000.0f);

    nation.setCapitalProvince(605); //bern

	nation.addAcceptedCulture(12);//swiss

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
	nation.addTemplate("Infanterie-division", brig_list_1);

    vector<string> culture_list_1; //must be the same length as the brigade list of the division
	culture_list_1.push_back("swiss");
	culture_list_1.push_back("swiss");
	culture_list_1.push_back("swiss");
	culture_list_1.push_back("swiss");
	culture_list_1.push_back("swiss");
	culture_list_1.push_back("swiss");
	culture_list_1.push_back("swiss");

	nation.addDivision(culture_list_1, "Infanterie-division", "1. Infanterie-division", "No Commander", 605, false, 0.0f); //bern
	nation.addDivision(culture_list_1, "Infanterie-division", "2. Infanterie-division", "No Commander", 605, false, 0.0f);
	nation.addDivision(culture_list_1, "Infanterie-division", "3. Infanterie-division", "No Commander", 605, false, 0.0f); 
}