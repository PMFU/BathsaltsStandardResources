void loadForALD(Country@ nation)
{
	print("Loaded for Algerian nation!\n");

    nation.setCapitalProvince(1707); //moscara

	nation.addMoney(10000.0f);

	nation.setUncivilized();

	nation.addAcceptedCulture(51);//maghrebi
	nation.addAcceptedCulture(55);//berber

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
	brig_list_1.push_back("cavalry_regiment_1");
	brig_list_1.push_back("cavalry_regiment_1");
	brig_list_1.push_back("cavalry_regiment_1");
	brig_list_1.push_back("cavalry_regiment_1");
	brig_list_1.push_back("irregular_regiment_1");
    brig_list_1.push_back("irregular_regiment_1");
	brig_list_1.push_back("light_infantry_battalion_1");
	brig_list_1.push_back("artillery_regiment_1");
	nation.addTemplate("Algerian Division", brig_list_1);

    vector<string> culture_list_1; //must be the same length as the brigade list of the division
	culture_list_1.push_back("maghrebi");
    culture_list_1.push_back("maghrebi");
    culture_list_1.push_back("maghrebi");
    culture_list_1.push_back("maghrebi");
    culture_list_1.push_back("berber");
    culture_list_1.push_back("berber");
	culture_list_1.push_back("berber");
	culture_list_1.push_back("berber");

    nation.addLeader("Mustapha ibn Muhieddine", 3, 2, 1, 3, 0);
	nation.addDivision(culture_list_1, "Algerian Division", "1st Algerian Division", "Mustapha ibn Muhieddine", 1707, false, 0.0f);
	nation.addLeader("Zawiyet Sidi Brahim Boushaki", 3, 3, 4, 2, 0);
	nation.addDivision(culture_list_1, "Algerian Division", "2nd Algerian Division", "Zawiyet Sidi Brahim Boushaki", 1707, false, 0.0f);
	nation.addLeader("Mohamed ben Zamoum", 1, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Algerian Division", "3rd Algerian Division", "Mohamed ben Zamoum", 1707, false, 0.0f);
	
	vector<string> division_list_1;
	division_list_1.push_back("1st Algerian Division");
	division_list_1.push_back("2nd Algerian Division");
	division_list_1.push_back("3rd Algerian Division");
	nation.addLeader("Abd al-Qadir ibn Muhyi al-Din", 4, 6, 3, 3, 1);
	nation.addArmy(division_list_1, "Jaish Al-Mohammadi", "Abd al-Qadir ibn Muhyi al-Din");
}