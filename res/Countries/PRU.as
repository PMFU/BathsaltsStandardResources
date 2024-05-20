//Loading OOB and default values for PRU

void loadForPRU(Country@ nation)
{
	print("Loaded for PRUSSIA nation!\n");

	nation.setCapitalProvince(549); //berlin

	nation.addMoney(10000.0f);

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

	//ARMY OOB
	//the general structure of the german army basically did not change between 1818 and 1919, apparently
	//pulled straight from the reichsarchiv except where the archives are incomplete

	vector<string> brig_list_1;
	brig_list_1.push_back("infantry_regiment_1");
	brig_list_1.push_back("infantry_regiment_1");
	brig_list_1.push_back("infantry_regiment_1");
	brig_list_1.push_back("infantry_regiment_1");
	brig_list_1.push_back("light_infantry_battalion_1");
	brig_list_1.push_back("hussar_regiment_1");
	brig_list_1.push_back("artillery_regiment_1");
	brig_list_1.push_back("horse_logistics_battalion_1");
	nation.addTemplate("Garde-Infanterie-Division", brig_list_1);

	vector<string> brig_list_2;
	brig_list_2.push_back("cuirassier_regiment_1");
	brig_list_2.push_back("cuirassier_regiment_1");
	brig_list_2.push_back("dragoon_regiment_1");
	brig_list_2.push_back("dragoon_regiment_1");
	brig_list_2.push_back("hussar_regiment_1");
	brig_list_2.push_back("light_infantry_battalion_1");
	brig_list_2.push_back("artillery_regiment_1");
	brig_list_2.push_back("horse_logistics_battalion_1");
	nation.addTemplate("Garde-Kavallerie-Division", brig_list_2);

	vector<string> brig_list_3;
	brig_list_3.push_back("infantry_regiment_1");
	brig_list_3.push_back("infantry_regiment_1");
	brig_list_3.push_back("infantry_regiment_1");
	brig_list_3.push_back("infantry_regiment_1");
	brig_list_3.push_back("cuirassier_regiment_1");
	brig_list_3.push_back("dragoon_regiment_1");
	brig_list_3.push_back("artillery_regiment_1");
	brig_list_3.push_back("horse_logistics_battalion_1");
	nation.addTemplate("Infanterie-Division", brig_list_3);

	vector<string> culture_list_1; //must be the same length as the brigade list of the division
	culture_list_1.push_back("north_german");
	culture_list_1.push_back("north_german");
	culture_list_1.push_back("north_german");
	culture_list_1.push_back("north_german");
	culture_list_1.push_back("north_german");
	culture_list_1.push_back("north_german");
	culture_list_1.push_back("north_german");
	culture_list_1.push_back("north_german");

	nation.addLeader("Johann Friedrich Karl II. von Alvensleben", 3, 2, 2, 3, 0);
	nation.addDivision(culture_list_1, "Garde-Infanterie-Division", "1. Garde-Infanterie-Division", "Johann Friedrich Karl II. von Alvensleben", 549, false, 0.0f);	//berlin

	nation.addLeader("Carl von Preußen", 3, 4, 3, 2, 0);
	nation.addDivision(culture_list_1, "Garde-Infanterie-Division", "2. Garde-Infanterie-Division", "Carl von Preußen", 549, false, 0.0f);

	nation.addLeader("Friedrich Wilhelm von Brandenburg", 4, 2, 4, 1, 0);
	nation.addDivision(culture_list_1, "Garde-Kavallerie-Division", "Garde-Kavallerie-Division", "Friedrich Wilhelm von Brandenburg", 549, false, 0.0f);

	vector<string> division_list_1;
	division_list_1.push_back("1. Garde-Infanterie-Division");
	division_list_1.push_back("2. Garde-Infanterie-Division");
	division_list_1.push_back("Garde-Kavallerie-Division");
	nation.addLeader("Karl Friedrich August Herzog zu Mecklenburg", 3, 2, 4, 3, 1);
	nation.addArmy(division_list_1, "Gardekorps", "Karl Friedrich August Herzog zu Mecklenburg");


	nation.addLeader("Friedrich Wilhelm von Hessen", 3, 1, 1, 1, 0);
	nation.addDivision(culture_list_1, "Infanterie-Division", "1. Infanterie-Division", "Friedrich Wilhelm von Hessen", 695, false, 0.0f);

	nation.addLeader("Friedrich August von Rummel", 1, 2, 3, 1, 0);
	nation.addDivision(culture_list_1, "Infanterie-Division", "2.Infanterie-Division", "Friedrich August von Rummel", 695, false, 0.0f);

	vector<string> division_list_2;
	division_list_2.push_back("1. Infanterie-Division");
	division_list_2.push_back("2. Infanterie-Division");
	nation.addLeader("Oldwig von Natzmer", 1, 2, 4, 3, 1);
	nation.addArmy(division_list_2, "I. Armee-Korps", "Oldwig von Natzmer");

	nation.addLeader("Karl Christian von Weyrach", 3, 1, 1, 1, 0);
	nation.addDivision(culture_list_1, "Infanterie-Division", "3. Infanterie-Division", "Karl Christian von Weyrach", 546, false, 0.0f);

	nation.addLeader("Jakob Friedrich von Rüchel-Kleist", 1, 3, 3, 1, 0);
	nation.addDivision(culture_list_1, "Infanterie-Division", "4. Infanterie-Division", "Jakob Friedrich von Rüchel-Kleist", 546, false, 0.0f);

	vector<string> division_list_3;
	division_list_3.push_back("3. Infanterie-Division");
	division_list_3.push_back("4. Infanterie-Division");
	nation.addLeader("Friedrich Wilhelm (IV.), Kronprinz ", 4, 2, 1, 3, 1);
	nation.addArmy(division_list_3, "II. Armee-Korps", "Friedrich Wilhelm (IV.), Kronprinz ");

	nation.addLeader("Georg zu Hessen-Cassel", 3, 2, 1, 2, 0);
	nation.addDivision(culture_list_1, "Infanterie-Division", "5. Infanterie-Division", "Georg zu Hessen-Cassel", 578, false, 0.0f);

	nation.addLeader("Wilhelm von Radziwill", 4, 2, 1, 1, 0); 
	nation.addDivision(culture_list_1, "Infanterie-Division", "6. Infanterie-Division", "Wilhelm von Radziwill", 578, false, 0.0f);

	vector<string> division_list_4;
	division_list_4.push_back("5. Infanterie-Division");
	division_list_4.push_back("6. Infanterie-Division");
	nation.addLeader("Wilhelm von Preußen", 2, 3, 3, 3, 1);
	nation.addArmy(division_list_4, "III. Armee-Korps", "Wilhelm von Preußen");

	nation.addLeader("Georg zu Hessen-Cassel", 2, 2, 1, 2, 0);
	nation.addDivision(culture_list_1, "Infanterie-Division", "7. Infanterie-Division", "Georg zu Hessen-Cassel", 553, false, 0.0f);

	nation.addLeader("Ernst Ludwig von Tippelskirch", 1, 3, 2, 1, 0); 
	nation.addDivision(culture_list_1, "Infanterie-Division", "8. Infanterie-Division", "Ernst Ludwig von Tippelskirch", 553, false, 0.0f);

	vector<string> division_list_5;
	division_list_5.push_back("7. Infanterie-Division");
	division_list_5.push_back("8. Infanterie-Division");
	nation.addLeader("Friedrich Wilhelm von Jagow", 2, 1, 3, 1, 1); 
	nation.addArmy(division_list_5, "IV. Armee-Korps", "Friedrich Wilhelm von Jagow");

	nation.addLeader("Nikolaus Ludwig von Rudolphi", 2, 2, 1, 2, 0);
	nation.addDivision(culture_list_1, "Infanterie-Division", "9. Infanterie-Division", "Nikolaus Ludwig von Rudolphi", 699, false, 0.0f);

	nation.addLeader("August von Hedemann", 1, 3, 2, 1, 0); 
	nation.addDivision(culture_list_1, "Infanterie-Division", "10. Infanterie-Division", "August von Hedemann", 699, false, 0.0f);

	vector<string> division_list_6;
	division_list_6.push_back("9. Infanterie-Division");
	division_list_6.push_back("10. Infanterie-Division");
	nation.addLeader("Karl von Grolman", 2, 3, 3, 1, 1); 
	nation.addArmy(division_list_6, "V. Armee-Korps", "Karl von Grolman");

	nation.addLeader("Karl Heinrich Stephan von Block", 1, 2, 3, 2, 0);
	nation.addDivision(culture_list_1, "Infanterie-Division", "11. Infanterie-Division", "Karl Heinrich Stephan von Block", 682, false, 0.0f);

	nation.addLeader("Friedrich Heinrich Ludwig von Pfuel", 2, 2, 2, 1, 0); 
	nation.addDivision(culture_list_1, "Infanterie-Division", "12. Infanterie-Division", "Friedrich Heinrich Ludwig von Pfuel", 682, false, 0.0f);

	vector<string> division_list_7;
	division_list_7.push_back("11. Infanterie-Division");
	division_list_7.push_back("12. Infanterie-Division");
	nation.addLeader("Hans Ernst Karl von Zieten", 2, 2, 1, 4, 1); 
	nation.addArmy(division_list_7, "VI. Armee-Korps", "Hans Ernst Karl von Zieten");

	nation.addLeader("Friedrich von Wrangel", 2, 2, 3, 2, 0);
	nation.addDivision(culture_list_1, "Infanterie-Division", "13. Infanterie-Division", "Friedrich von Wrangel", 581, false, 0.0f);

	nation.addLeader("Friedrich von Preußen", 2, 2, 2, 1, 0); 
	nation.addDivision(culture_list_1, "Infanterie-Division", "14. Infanterie-Division", "Friedrich von Preußen", 581, false, 0.0f);

	vector<string> division_list_8;
	division_list_8.push_back("13. Infanterie-Division");
	division_list_8.push_back("14. Infanterie-Division");
	nation.addLeader("Karl von Müffling genannt Weiß", 2, 3, 1, 4, 1); 
	nation.addArmy(division_list_8, "VII. Armee-Korps", "Karl von Müffling genannt Weiß");

	nation.addLeader("Ernst von Pfuel", 2, 2, 3, 2, 0);
	nation.addDivision(culture_list_1, "Infanterie-Division", "15. Infanterie-Division", "Ernst von Pfuel", 572, false, 0.0f);

	nation.addLeader("Heinrich von Hüser", 2, 2, 2, 1, 0); 
	nation.addDivision(culture_list_1, "Infanterie-Division", "16. Infanterie-Division", "Heinrich von Hüser", 572, false, 0.0f);

	vector<string> division_list_9;
	division_list_9.push_back("15. Infanterie-Division");
	division_list_9.push_back("16. Infanterie-Division");
	nation.addLeader("Ludwig von Borstell", 3, 2, 1, 2, 1); 
	nation.addArmy(division_list_9, "VIII. Armee-Korps", "Ludwig von Borstell");


	//FACTORIES

	state_id berlin = 121;
	addFactory(berlin, "glass_factory");
	addFactory(berlin, "ammunition_factory");
	addFactory(berlin, "paper_factory");
	// addFactory(berlin, "small_arms_factory");

	state_id Schlesien = 150;
	// addFactory(Schlesien, "explosive_factory");
	// addFactory(Schlesien, "artilery_factory");

	state_id Nordrhein = 127;
	addFactory(Nordrhein, "fabric_factory");
}
