//Loading OOB and default values for FRA

void loadForFRA(Country@ nation)
{
	print("Loaded for FRENCH nation!\n");

	nation.addMoney(10000.0f);

	nation.setCapitalProvince(425); //paris

	nation.addAcceptedCulture(19); //french
	nation.addAcceptedCulture(144); //french-can

	//For each state
	vector<state_id>@ states = nation.getStatesInCountry();
	// print("Got States!\n");
	for(int i = 0; i < states.size(); i += 1)
	{
		state_id s_id = states[i];
		State@ s = getState(s_id);
		
		//For each province
		auto provs = s.getProvincesInState();
		// print("Got Provinces!\n");
		for(int j = 0; j < provs.size(); j += 1)
		{
			Province@ prov = getProvince(provs[j]);
		}
	}

	nation.changePrestige(90);

	//Initialization lists cannot be used
	vector<string> brig_list_1; //16
	brig_list_1.push_back("infantry_regiment_1");
	brig_list_1.push_back("infantry_regiment_1");
	brig_list_1.push_back("infantry_regiment_1");
	brig_list_1.push_back("infantry_regiment_1");
	brig_list_1.push_back("artillery_regiment_1");
	brig_list_1.push_back("light_infantry_battalion_1");
	brig_list_1.push_back("horse_logistics_battalion_1");
	nation.addTemplate("Division d'Infanterie", brig_list_1);

	vector<string> brig_list_2; //5
	brig_list_2.push_back("light_infantry_regiment_1");
	brig_list_2.push_back("light_infantry_regiment_1");
	brig_list_2.push_back("light_infantry_regiment_1");
	brig_list_2.push_back("light_infantry_regiment_1");
	brig_list_2.push_back("dragoon_regiment_1");
	brig_list_2.push_back("artillery_regiment_1");
	brig_list_2.push_back("horse_logistics_battalion_1");
	nation.addTemplate("Division d'Infanterie Légère", brig_list_2);

	vector<string> brig_list_3; //6
	brig_list_3.push_back("dragoon_regiment_1");
	brig_list_3.push_back("dragoon_regiment_1");
	brig_list_3.push_back("dragoon_regiment_1");
	brig_list_3.push_back("dragoon_regiment_1");
	brig_list_3.push_back("cuirassier_regiment_1");
	brig_list_3.push_back("cuirassier_regiment_1");
	brig_list_3.push_back("hussar_regiment_1");
	brig_list_3.push_back("artillery_regiment_1");
	brig_list_3.push_back("horse_logistics_battalion_1");
	nation.addTemplate("Division d'Cavalerie", brig_list_3);

	//these templates are different to use up the rest of the historical regiments after making the above divisions

	vector<string> brig_list_4; //1
	brig_list_4.push_back("dragoon_regiment_1");
	brig_list_4.push_back("dragoon_regiment_1");
	brig_list_4.push_back("hussar_regiment_1");
	brig_list_4.push_back("hussar_regiment_1");
	brig_list_4.push_back("artillery_regiment_1");
	brig_list_4.push_back("horse_logistics_battalion_1");
	nation.addTemplate("Division d'Cavalerie de l'armée d'Afrique", brig_list_4);

	vector<string> brig_list_5; //1
	brig_list_5.push_back("infantry_regiment_1");
	brig_list_5.push_back("infantry_regiment_1");
	brig_list_5.push_back("infantry_regiment_1");
	brig_list_5.push_back("light_infantry_regiment_1");
	brig_list_5.push_back("artillery_regiment_1");
	brig_list_5.push_back("horse_logistics_battalion_1");
	nation.addTemplate("Division d'Infanterie de l'armée d'Afrique", brig_list_5);

	vector<string> culture_list_1;
	culture_list_1.push_back("french");
	culture_list_1.push_back("french");
	culture_list_1.push_back("french");
	culture_list_1.push_back("french");
	culture_list_1.push_back("french");
	culture_list_1.push_back("french");
	culture_list_1.push_back("french");
	culture_list_1.push_back("french");

	vector<string> culture_list_2;
	culture_list_2.push_back("french");
	culture_list_2.push_back("french");
	culture_list_2.push_back("french");
	culture_list_2.push_back("french");
	culture_list_2.push_back("french");
	culture_list_2.push_back("french");
	culture_list_2.push_back("french");
	culture_list_2.push_back("french");
	culture_list_2.push_back("french");

	vector<string> culture_list_3;
	culture_list_3.push_back("french");
	culture_list_3.push_back("french");
	culture_list_3.push_back("french");
	culture_list_3.push_back("french");
	culture_list_3.push_back("french");
	culture_list_3.push_back("french");

	nation.addLeader("Antoine Semideo Louis François comte de Buttafoco", 3, 2, 1, 3, 0);
	nation.addDivision(culture_list_3, "Division d'Infanterie de l'armée d'Afrique", "Division d'Infanterie de l'armée d'Afrique", "Antoine Semideo Louis François comte de Buttafoco", 1700, false, 0.0f);
	nation.addLeader("Charles-Marie Denys de Damrémont", 3, 3, 4, 2, 0);
	nation.addDivision(culture_list_3, "Division d'Cavalerie de l'armée d'Afrique", "Division d'Cavalerie de l'armée d'Afrique", "Charles-Marie Denys de Damrémont", 1700, false, 0.0f);
	nation.addLeader("Sylvain Charles Valée", 1, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Division d'Infanterie", "1e Division d'Infanterie", "Sylvain Charles Valée", 1700, false, 0.0f);
	
	vector<string> division_list_1;
	division_list_1.push_back("Division d'Infanterie de l'armée d'Afrique");
	division_list_1.push_back("Division d'Cavalerie de l'armée d'Afrique");
	division_list_1.push_back("1e Division d'Infanterie");
	nation.addLeader("Louis Auguste Victor de Ghaisne de Bourmont", 2, 3, 1, 4, 1); 
	nation.addArmy(division_list_1, "l'Corps Expéditionnaire ", "Louis Auguste Victor de Ghaisne de Bourmont");
	
	nation.addLeader("Guy-Victor Duperré", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Division d'Infanterie", "2e Division d'Infanterie", "Guy-Victor Duperré", 425, false, 0.0f);
	nation.addLeader("Edmond Pellissier de Reynaud", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Division d'Infanterie", "3e Division d'Infanterie", "Edmond Pellissier de Reynaud", 425, false, 0.0f);
	nation.addLeader("Aimable Pélissier", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Division d'Infanterie", "4e Division d'Infanterie", "Aimable Pélissier", 425, false, 0.0f);
	nation.addLeader("Louis Juchault de Lamoricière", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Division d'Infanterie Légère", "1e Division d'Infanterie Légère", "Louis Juchault de Lamoricière", 425, false, 0.0f);
	nation.addLeader("Pierre Berthezène", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_2, "Division d'Cavalerie", "1e Division d'Cavalerie", "Pierre Berthezène", 425, false, 0.0f);

	vector<string> division_list_2;
	division_list_2.push_back("2e Division d'Infanterie");
	division_list_2.push_back("3e Division d'Infanterie");
	division_list_2.push_back("4e Division d'Infanterie");
	division_list_2.push_back("1e Division d'Infanterie Légère");
	division_list_2.push_back("1e Division d'Cavalerie");
	nation.addLeader("Guillaume Stanislas Marey-Monge", 2, 3, 1, 4, 1); 
	nation.addArmy(division_list_2, "1e Corps d'Armée", "Guillaume Stanislas Marey-Monge");

	nation.addLeader("Henri d'Orléans", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Division d'Infanterie", "5e Division d'Infanterie", "Henri d'Orléans", 413, false, 0.0f);
	nation.addLeader("Lucien de Montagnac", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Division d'Infanterie", "6e Division d'Infanterie", "Lucien de Montagnac", 413, false, 0.0f);
	nation.addLeader("Bertrand Clauzel", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Division d'Infanterie", "7e Division d'Infanterie", "Bertrand Clauzel", 413, false, 0.0f);
	nation.addLeader("Louis Alexis Desmichels", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Division d'Infanterie Légère", "2e Division d'Infanterie Légère", "Louis Alexis Desmichels", 413, false, 0.0f);
	nation.addLeader("François Louis Alfred Durrieu", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_2, "Division d'Cavalerie", "2e Division d'Cavalerie", "François Louis Alfred Durrieu", 413, false, 0.0f);

	vector<string> division_list_3;
	division_list_3.push_back("5e Division d'Infanterie");
	division_list_3.push_back("6e Division d'Infanterie");
	division_list_3.push_back("7e Division d'Infanterie");
	division_list_3.push_back("2e Division d'Infanterie Légère");
	division_list_3.push_back("2e Division d'Cavalerie");
	nation.addLeader("Louis Auguste Victor de Ghaisne de Bourmont", 2, 3, 1, 4, 1); 
	nation.addArmy(division_list_3, "2e Corps d'Armée", "Louis Auguste Victor de Ghaisne de Bourmont");

	nation.addLeader("Anne Jean Marie René Savary", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Division d'Infanterie", "8e Division d'Infanterie", "Anne Jean Marie René Savary", 467, false, 0.0f);
	nation.addLeader("Patrice de Mac Mahon", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Division d'Infanterie", "9e Division d'Infanterie", "Patrice de Mac Mahon", 467, false, 0.0f);
	nation.addLeader("Hilaire Étienne Lelièvre", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Division d'Infanterie", "10e Division d'Infanterie", "Hilaire Étienne Lelièvre", 467, false, 0.0f);
	nation.addLeader("Armand Jacques Leroy de Saint-Arnaud", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Division d'Infanterie Légère", "3e Division d'Infanterie Légère", "Armand Jacques Leroy de Saint-Arnaud", 467, false, 0.0f);
	nation.addLeader("Orphis Léon Lallemand", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_2, "Division d'Cavalerie", "3e Division d'Cavalerie", "Orphis Léon Lallemand", 467, false, 0.0f);

	vector<string> division_list_4;
	division_list_4.push_back("8e Division d'Infanterie");
	division_list_4.push_back("9e Division d'Infanterie");
	division_list_4.push_back("10e Division d'Infanterie");
	division_list_4.push_back("3e Division d'Infanterie Légère");
	division_list_4.push_back("3e Division d'Cavalerie");
	nation.addLeader("Michel Combes", 2, 3, 1, 4, 1); 
	nation.addArmy(division_list_4, "3e Corps d'Armée", "Michel Combes");

	nation.addLeader("Ferdinand-Philippe d'Orléans", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Division d'Infanterie", "11e Division d'Infanterie", "Ferdinand-Philippe d'Orléans", 458, false, 0.0f);
	nation.addLeader("Gaston-Ernest Cottenest", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Division d'Infanterie", "12e Division d'Infanterie", "Gaston-Ernest Cottenest", 458, false, 0.0f);
	nation.addLeader("Louis Henri de Gueydon", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Division d'Infanterie", "13e Division d'Infanterie", "Louis Henri de Gueydon", 458, false, 0.0f);
	nation.addLeader("Alexandre Charles Perrégaux", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Division d'Infanterie Légère", "4e Division d'Infanterie Légère", "Alexandre Charles Perrégaux", 458, false, 0.0f);
	nation.addLeader("Théophile Voirol", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_2, "Division d'Cavalerie", "4e Division d'Cavalerie", "Théophile Voirol", 458, false, 0.0f);

	vector<string> division_list_5;
	division_list_5.push_back("11e Division d'Infanterie");
	division_list_5.push_back("12e Division d'Infanterie");
	division_list_5.push_back("13e Division d'Infanterie");
	division_list_5.push_back("4e Division d'Infanterie Légère");
	division_list_5.push_back("4e Division d'Cavalerie");
	nation.addLeader("Alexandre d'Alton", 2, 3, 1, 4, 1); 
	nation.addArmy(division_list_5, "4e Corps d'Armée", "Alexandre d'Alton");

	nation.addLeader("Charles Joseph François Wolff", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Division d'Infanterie", "14e Division d'Infanterie", "Charles Joseph François Wolff", 441, false, 0.0f);
	nation.addLeader("Jean-Baptiste Drouet d'Erlon", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Division d'Infanterie", "15e Division d'Infanterie", "Jean-Baptiste Drouet d'Erlon", 441, false, 0.0f);
	nation.addLeader("Maximilien Joseph Schauenburg", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Division d'Infanterie", "16e Division d'Infanterie", "Maximilien Joseph Schauenburg", 441, false, 0.0f);
	nation.addLeader("Viala Charon", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_1, "Division d'Infanterie Légère", "5e Division d'Infanterie Légère", "Viala Charon", 441, false, 0.0f);
	nation.addLeader("Eugène Cavaignac", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_2, "Division d'Cavalerie", "5e Division d'Cavalerie", "Eugène Cavaignac", 441, false, 0.0f);
	nation.addLeader("Émile Herbillon", 3, 2, 4, 3, 0);
	nation.addDivision(culture_list_2, "Division d'Cavalerie", "6e Division d'Cavalerie", "Émile Herbillon", 441, false, 0.0f);

	vector<string> division_list_6;
	division_list_6.push_back("14e Division d'Infanterie");
	division_list_6.push_back("15e Division d'Infanterie");
	division_list_6.push_back("16e Division d'Infanterie");
	division_list_6.push_back("5e Division d'Infanterie Légère");
	division_list_6.push_back("5e Division d'Cavalerie");
	division_list_6.push_back("6e Division d'Cavalerie");
	nation.addLeader("Jacques Louis Randon", 2, 3, 1, 4, 1); 
	nation.addArmy(division_list_6, "5e Corps d'Armée", "Jacques Louis Randon");


	//FACTORIES
	state_id ile_de_france = 91;
	addFactory(ile_de_france, "luxury_furniture_factory");
	addFactory(ile_de_france, "ammunition_factory");
	addFactory(ile_de_france, "paper_factory");
	
	state_id rhone = 98;
	addFactory(rhone, "wine_factory");

	//Modifiers:
	Modifier m("french_modifier_example", "factory_cost", 0.9f);
	nation.addModifier(m);


	///Laws
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
}
