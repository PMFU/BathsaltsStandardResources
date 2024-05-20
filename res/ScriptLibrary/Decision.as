#include "../Scripts/base.as"

shared abstract class Decision
{
	// Allow scripts to create instances
	Decision()
	{
		// Create the C++ side of the proxy
		@m_obj = IDecision();
	}

	// The copy constructor performs a deep copy
	Decision(const Decision &o)
	{
		// Create a new C++ instance and copy content
		@m_obj = IDecision();

		m_obj.m_name = o.m_obj.m_name;
		m_obj.m_description = o.m_obj.m_description;
		m_obj.m_tooltip = o.m_obj.m_tooltip;
	}

	// Do a deep a copy of the C++ object
	Decision@ opAssign(const Decision &o)
	{
		// copy content of C++ instance
		m_obj.m_name = o.m_obj.m_name;
		m_obj.m_description = o.m_obj.m_description;
		m_obj.m_tooltip = o.m_obj.m_tooltip;
		return this;
	}

	void register() final
	{
		registerDecision(this);
	}

	// The script side forwards the call to the C++ side
	bool canView(const Country@ nation) { return m_obj.canView(nation); }
	bool fitsRequirements(const Country@ nation) { return m_obj.fitsRequirements(nation); }
	string listRequirements() const { return m_obj.listRequirements(); }
	void execute(Country@ nation) { m_obj.execute(nation); }

	// The C++ side property is exposed to the script through accessors
	string m_name
	{
		get { return m_obj.m_name; }
		set { m_obj.m_name = value; }
	}
	string m_description
	{
		get { return m_obj.m_description; }
		set { m_obj.m_description = value; }
	}
	string m_tooltip
	{
		get { return m_obj.m_tooltip; }
		set { m_obj.m_tooltip = value; }
	}

	// The script class can be implicitly cast to the C++ type through the opImplCast method
	IDecision@ opImplCast() { return m_obj; }

	// Hold a reference to the C++ side of the proxy
	private IDecision@ m_obj;
}
