//This is used for any country that doesn't have a dedicated OOB

/**
 * Restrictions:
 *		Must only access the country given, and the states/provinces it owns
 *		
 *
*/

//Include all the not default-files so the module can be easily built
#include "ENG.as"
#include "FRA.as"
#include "PRU.as"
#include "JAP.as"
#include "CHI.as"
#include "BAD.as"
#include "BAV.as"
#include "HAN.as"
#include "HEK.as"
#include "HES.as"	
#include "HOL.as"
#include "MEC.as"
#include "NAS.as"
#include "SAX.as"
#include "WUR.as"
#include "ALD.as"
#include "AUS.as"
#include "DEN.as"
#include "SWE.as"
#include "CON.as"
#include "FRM.as"
#include "HAM.as"
#include "BRA.as"
#include "BRE.as"
#include "ANH.as"
#include "DET.as"
#include "LUB.as"
#include "MEI.as"
#include "OLD.as"
#include "WEI.as"
#include "NET.as"
#include "BEL.as"
#include "LUX.as"
#include "SWI.as"

void loadFor(Country@ nation)
{
	// print("Loaded for default nation!\n");

	nation.addAcceptedCulture(13);//ashkenazi 13	
	nation.addAcceptedCulture(41);//albanian

	vector<string> brig_list_1;
	brig_list_1.push_back("infantry_regiment_1");
	brig_list_1.push_back("infantry_regiment_1");
	brig_list_1.push_back("infantry_regiment_1");
	brig_list_1.push_back("infantry_regiment_1");
	brig_list_1.push_back("light_infantry_battalion_1");
	brig_list_1.push_back("hussar_regiment_1");
	brig_list_1.push_back("artillery_regiment_1");
	nation.addTemplate("Basic Template", brig_list_1);

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
	
	// nation.addDivision("Basic Template", 425);
}