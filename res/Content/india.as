#include "../ScriptLibrary/helpers.as"
#include "../ScriptLibrary/Decision.as"

//EXAMPLE DECISION
class Indiamove_capital : Decision
{
	Indiamove_capital()
	{
		m_name = "move_capital_to_delhi";
		m_description = "Move the capital to Delhi! move_capital_to_delhi_desc";
		m_tooltip = "Must not have set the capital to delhi currently, and own the province of Delhi!";
	}

	bool canView(const Country@ nation)
	{
		return (nation.getTag() == "HND") &&
				doesCountryOwnProvince(nation, 1236) &&
				nation.getCapitalProvince() != 1236;
	}
	bool fitsRequirements(const Country@ nation)
	{
		return nation.getCapitalProvince() != 1236;
	}
	string listRequirements() const
	{
		string reqs = "Must own Delhi!";
		return reqs;
	}
	void execute(Country@ nation)
	{
		nation.setCapitalProvince(1236);
		nation.changePrestige(5.0f);
	}
}
