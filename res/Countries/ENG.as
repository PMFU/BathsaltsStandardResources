//Loading OOB and default values for ENG

void loadForENG(Country@ nation)
{
	print("Loaded for ENGLISH nation!\n");

	nation.addMoney(100000.0f);
	nation.changePrestige(100);

	nation.addAcceptedCulture(1); //British
	nation.addAcceptedCulture(227); //australian 227
	nation.addAcceptedCulture(145); //anglo_canadian

	//65 = South East England
	const state_id london_state = 65;
	addFactory(london_state, "furniture_factory");
	addFactory(london_state, "paper_factory");
	addFactory(london_state, "ammunition_factory");
	// addFactory(london_state, "small_arms_factory");
	// addFactory(london_state, "clipper_factory"); //lvl 2

	addFactory(london_state, "machine_parts_factory");
	addFactory(london_state, "cement_factory");
	addFactory(london_state, "steel_factory");

	//62 = north west england
	const state_id north_west = 62;
	addFactory(north_west, "steel_factory");
	addFactory(north_west, "clothes_factory");
	addFactory(north_west, "fabric_factory");

	//66 = south west england
	const state_id south_west = 66;
	addFactory(south_west, "luxury_furniture_factory"); //lux cloths
	// addFactory(south_west, "luxury_furniture_factory"); //canned food

	//63 = Midlands
	const state_id Midlands = 63;
	// addFactory(Midlands, "luxury_furniture_factory");	//explosive
	// addFactory(Midlands, "luxury_furniture_factory");	//artilery

	//60 = Highlands
	const state_id Highlands = 60;
	addFactory(Highlands, "steel_factory");
	// addFactory(Highlands, "steamer_factory");

	//61 = wales
	const state_id wales = 61;
	addFactory(wales, "steel_factory");

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
