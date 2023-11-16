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

void loadFor(Country@ nation)
{
	// print("Loaded for default nation!\n");

	vector<string> brig_list;
	brig_list.push_back("artillery_1");
	brig_list.push_back("artillery_1");
	brig_list.push_back("infantry_1");
	brig_list.push_back("infantry_1");
	brig_list.push_back("infantry_1");
	nation.addTemplate("Basic Template", brig_list);
	
	// nation.addDivision("Basic Template", 425);
}