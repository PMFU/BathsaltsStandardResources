#include "../Scripts/base.as"

shared abstract class CasusBelis
{
	// Allow scripts to create instances
	CasusBelis()
	{
		// Create the C++ side of the proxy
		@m_obj = CasusBelis_t();
	}

	// The copy constructor performs a deep copy
	CasusBelis(const CasusBelis &o)
	{
		// Create a new C++ instance and copy content
		@m_obj = CasusBelis_t();

		m_obj.m_name = o.m_obj.m_name;
		m_obj.m_desc = o.m_obj.m_desc;
		m_obj.m_infamy = o.m_obj.m_infamy;
		m_obj.m_prestige = o.m_obj.m_prestige;
		m_obj.m_months_valid = o.m_obj.m_months_valid;
		m_obj.m_ws_cost = o.m_obj.m_ws_cost;
		m_obj.m_time_to_justify = o.m_obj.m_time_to_justify;
		
		m_obj.target = o.m_obj.target;
	}

	// Do a deep a copy of the C++ object
	CasusBelis@ opAssign(const CasusBelis &o)
	{
		// copy content of C++ instance
		m_obj.m_name = o.m_obj.m_name;
		m_obj.m_desc = o.m_obj.m_desc;
		m_obj.m_infamy = o.m_obj.m_infamy;
		m_obj.m_prestige = o.m_obj.m_prestige;
		m_obj.m_months_valid = o.m_obj.m_months_valid;
		m_obj.m_ws_cost = o.m_obj.m_ws_cost;
		m_obj.m_time_to_justify = o.m_obj.m_time_to_justify;

		m_obj.target = o.m_obj.target;
		return this;
	}

	void register() final
	{
		registerCasusBelis(this);
	}

	// The script side forwards the call to the C++ side
	bool canAddCB(const Country@ from, const Country@ to) const { return m_obj.canAddCB(from, to); }
	void onAddCB(const Country@ from, const Country@ to) { m_obj.onAddCB(from, to); }
	
	bool isAllowedCountry(const Country@ nation) const { return isAllowedCountry(nation); }
	bool isAllowedState(const State@ state) const { return isAllowedState(state); }

	void execute(Country@ from, Country@ to) { m_obj.execute(from, to); }

	// The C++ side property is exposed to the script through accessors
	string m_name
	{
		get { return m_obj.m_name; }
		set { m_obj.m_name = value; }
	}
	string m_desc
	{
		get { return m_obj.m_desc; }
		set { m_obj.m_desc = value; }
	}
	int m_infamy
	{
		get { return m_obj.m_infamy; }
		set { m_obj.m_infamy = value; }
	}
	int m_prestige
	{
		get { return m_obj.m_prestige; }
		set { m_obj.m_prestige = value; }
	}
	int m_months_valid
	{
		get { return m_obj.m_months_valid; }
		set { m_obj.m_months_valid = value; }
	}
	int m_ws_cost
	{
		get { return m_obj.m_ws_cost; }
		set { m_obj.m_ws_cost = value; }
	}
	int m_time_to_justify
	{
		get { return m_obj.m_time_to_justify; }
		set { m_obj.m_time_to_justify = value; }
	}

	TargetType target
	{
		get { return m_obj.target; }
		set { m_obj.target = value; }
	}


	// The script class can be implicitly cast to the C++ type through the opImplCast method
	CasusBelis_t@ opImplCast() { return m_obj; }

	// Hold a reference to the C++ side of the proxy
	private CasusBelis_t@ m_obj;
}
