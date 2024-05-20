#include "../Scripts/base.as"

shared abstract class Event
{
	// Allow scripts to create instances
	Event()
	{
		// Create the C++ side of the proxy
		@m_obj = Event_t();
	}

	// The copy constructor performs a deep copy
	Event(const Event &o)
	{
		// Create a new C++ instance and copy content
		@m_obj = Event_t();
		m_obj.m_name = o.m_obj.m_name;
		m_obj.m_description = o.m_obj.m_description;
		m_obj.m_picture = o.m_obj.m_picture;
	}

	// Do a deep a copy of the C++ object
	Event &opAssign(const Event &o)
	{
		// copy content of C++ instance
		m_obj.m_name = o.m_obj.m_name;
		m_obj.m_description = o.m_obj.m_description;
		m_obj.m_picture = o.m_obj.m_picture;
		return this;
	}

	void register() final
	{
		registerEvent(this);
	}

	// The script side forwards the call to the C++ side
	bool isTriggered(const Country@ nation) { return m_obj.isTriggered(nation); }
	int getMeanTimeToHappen(const Country@ nation) { return m_obj.getMeanTimeToHappen(nation); }
	uint getOptionsCount() const { return m_obj.getOptionsCount(); }
	string getOptionName(uint idx) const { return m_obj.getOptionName(idx); }
	string getOptionTooltip(uint idx) const { return m_obj.getOptionTooltip(idx); }
	void executeOption(Country@ nation, uint idx) { m_obj.executeOption(nation, idx); }

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

	string m_picture
	{
		get { return m_obj.m_picture; }
		set { m_obj.m_picture = value; }
	}

	// The script class can be implicitly cast to the C++ type through the opImplCast method
	Event_t@ opImplCast() { return m_obj; }

	// Hold a reference to the C++ side of the proxy
	private Event_t@ m_obj;
}

