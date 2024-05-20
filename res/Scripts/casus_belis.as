#include "../ScriptLibrary/CasusBelis.as"

class AcquireState : CasusBelis
{
	private state_id targeted_state;

	AcquireState()
	{
		m_name = "Acquire State";
		m_desc = "Take land from your enemy";

		m_infamy = 5;
		m_prestige = 5;
		m_months_valid = 12;
		m_ws_cost = 30;
		m_time_to_justify = 150;

		target = TargetType::state;
		targeted_state = 0;
	}

	bool canAddCB(const Country@ from, const Country@ to) const
	{
		return to.getStatesInCountry().size() >= 2 &&
			// !(from.hasPuppet(to)) &&
			// from.isIndependent() &&
			!(from.isCivilized() xor to.isCivilized()) &&
			true;
	}

	void onAddCB(const Country@ from, const Country@ to)
	{
		print("Added AcquireState CB");
		//Move issues from jingo to pro military
	}

	bool isAllowedCountry(const Country@ nation) const
	{
		return false;
	}

	bool isAllowedState(const State@ state) const
	{
		province_id capital = 0;
		return true;
		//state.getWesternizationStatus() > WesternizationStatus::non_core &&	//@TODO change this when fixing interface
			// !state.getProvincesInState().contains(capital) &&
			// true;
	}
	
	void execute(Country@ from, Country@ to) const
	{
		to.transferState(from, targeted_state);
	}
}

class Humiliate : CasusBelis
{
	Humiliate()
	{
		m_name = "Humiliate";
		m_desc = "Insult your opponent on the world stage!";

		m_infamy = 2;
		m_prestige = 25;
		m_months_valid = 12;
		m_ws_cost = 10;
		m_time_to_justify = 90;

		target = TargetType::none;
	}

	bool canAddCB(const Country@ from, const Country@ to) const
	{
		//They are not our vassal/puppet
		//They haven't lost war recently
		return true;
	}

	void onAddCB(const Country@ from, const Country@ to) const
	{
		print("Added Humiliate CB");
		//Move issues from jingo to pro military
	}

	bool isAllowedCountry(const Country@ nation) const
	{
		return false;
	}

	bool isAllowedState(const State@ state) const
	{
		return false;
	}
	
	void execute(Country@ from, Country@ to)
	{
		from.changePrestige(m_prestige);
		from.changePrestige(-m_prestige);
	}
}

class PuppetNation : CasusBelis
{
	PuppetNation()
	{
		m_name = "PuppetNation";
		m_desc = "Puppet your opponent on the world stage!";

		m_infamy = 2;
		m_prestige = 25;
		m_months_valid = 12;
		m_ws_cost = 10;
		m_time_to_justify = 90;

		target = TargetType::country;
	}

	bool canAddCB(const Country@ from, const Country@ to) const
	{
		//They are not our vassal/puppet
		//They haven't lost war recently
		// return !to.isPuppet();
		return true;
	}

	void onAddCB(const Country@ from, const Country@ to) const
	{
		print("Added PuppetNation CB");
		//Move issues from jingo to pro military
	}

	bool isAllowedCountry(const Country@ nation) const
	{
		// return !to.isPuppet();
		return false;
	}

	bool isAllowedState(const State@ state) const
	{
		return false;
	}
	
	void execute(Country@ from, Country@ to)
	{
		// from.makePuppet(to);
		from.changePrestige(m_prestige);
		to.changePrestige(-m_prestige);
	}
}

void registerCBs()
{
	Humiliate h; h.register();
	AcquireState h1; h1.register();
	PuppetNation h2; h2.register();
}