//Loading OOB and default values for JAP

void loadForJAP(Country@ nation)
{
	print("Loaded for JAPANESE nation!\n");

	nation.addMoney(50000.0f);
	nation.changePrestige(45);

	nation.setUncivilized();

	nation.addAcceptedCulture(115); //japanese 115

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
