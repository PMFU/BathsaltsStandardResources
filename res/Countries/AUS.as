void loadForAUS(Country@ nation)
{
    print("Loaded for AUSTRIA nation!\n");

	nation.addMoney(10000.0f);

    nation.setCapitalProvince(619); //vienna

	nation.addAcceptedCulture(11);//south germ
    nation.addAcceptedCulture(32);//czech
    nation.addAcceptedCulture(33);//slovak

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