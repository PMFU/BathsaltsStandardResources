/**
 *  This is the example for an event
 *
 *
 */

#include "../../ScriptLibrary/Event.as"

//EXAMPLE Event
class ExampleEvent : Event
{
	// private int vector<int> dl;
	ExampleEvent()
	{
		m_name = "Example Event";
		m_description = "This is an example for making Events, copy it to use for yourself!";
		m_picture = "example_image.png";
	}

	bool isTriggered(const Country@ nation)
	{
		return true;
	}

	int getMeanTimeToHappen(const Country@ nation)
	{
		return 0;
	}
	
	uint getOptionsCount() const
	{
		return 4;
	}

	string getOptionName(uint idx) const
	{
		uint num_prestige =  ((idx + 1)*10) ;
		string s = "Add " + num_prestige + " prestige.";
		return s;
	}
	string getOptionTooltip(uint idx) const
	{
		string s = "Grant " + ((idx + 1)*10) + " prestige to nation.";
		return s;
	}

	void executeOption(Country@ nation, uint idx)
	{
		print("Executing option: " + idx + " for" + m_name + "\n");
		nation.changePrestige(10 * (idx + 1));
		// switch(idx)
		// {
		// 	case 0:
		// 		nation.changePrestige(10);
		// 	case 1:
		// 		nation.changePrestige(10);
		// 	case 2:
		// 		nation.changePrestige(10);
		// 	case 3:
		// 		nation.changePrestige(10);
		// 	default:
		// 		break;

		// }
	}

}
