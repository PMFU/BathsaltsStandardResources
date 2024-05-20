/**
 *  This is the example for a decision
 *
 *
 */

#include "../../ScriptLibrary/Decision.as"

//EXAMPLE DECISION
class ExampleDecision : Decision
{
	ExampleDecision()
	{
		m_name = "Example Decision";
		m_description = "This is an example for making decisions, copy it to use for yourself!";
		m_tooltip = "There are no requirements to view or take this decision.";
	}

	bool canView(const Country@ nation)
	{
		return true;
	}
	bool fitsRequirements(const Country@ nation)
	{
		return true;
	}
	string listRequirements() const
	{
		string reqs = "None!";
		return reqs;
	}
	void execute(Country@ nation)
	{
		print("Executed the example decision!\n");
	}
}
