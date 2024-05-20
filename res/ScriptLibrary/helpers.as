

//Helper Function to apply the passed lambda to every province
funcdef void prov_func(Province@ prov);
void forEveryProvince(Country@ nation, prov_func@ fn)
{
	vector<state_id>@ states = nation.getStatesInCountry();
	for(int i = 0; i < states.size(); i++)
	{
		State@ state = getState(states[i]);
		vector<province_id>@ provinces = state.getProvincesInState();
		for(int j = 0; j < provinces.size(); j++)
		{
			Province@ prov = getProvince(provinces[j]);
			fn(prov);
		}
	}
}

//Helper Function to apply the passed lambda to every state
funcdef void state_func(State@ state);
void forEveryState(Country@ nation, state_func@ fn)
{
	vector<state_id>@ states = nation.getStatesInCountry();
	for(int i = 0; i < states.size(); i++)
	{
		State@ state = getState(states[i]);
		fn(state);
	}
}

bool doesCountryOwnProvince(const Country@ nation, province_id provid)
{
	vector<state_id>@ states = nation.getStatesInCountry();
	for(int i = 0; i < states.size(); i++)
	{
		const State@ state = getState(states[i]);
		vector<province_id>@ provinces = state.getProvincesInState();
		for(int j = 0; j < provinces.size(); j++)
		{
			if(j == provid)
			{
				return true;
			}
		}
	}
	return false;
}

//Returns a vector of unique nations that are puppeted or in the sphere of ``nation``
void getNationsControlled(const Country@ nation, vector<Country@> &out controlled_nations)
{
	/*vector<string> puppets = nation.getPuppets();
	vector<string> spherelings;
	if(nation.isGreatPower())
	{
		spherelings = nation.getSpherelings();
	}*/

	/*for(int i = 0; i < puppets.size(); i++)
	{
		controlled_nations.append(getCountry(puppets[i]));
	}

	for(int i = 0; i < spherelings.size(); i++)
	{
		bool isInPuppets = false;
		for(int j = 0; j < puppets.size(); j++)
		{
			if(spherelings[i] == puppets[i])
			{
				isInPuppets = true;
			}
		}
		if(!isInPuppets)
		{
			controlled_nations.append(getCountry(spherelings[i]));
		}
	}*/
}

bool countryHasModifier(const Country@ nation, const string &in modifier_name)
{
	vector<Modifier>@ modifiers = nation.getModifiers();
	for(int i = 0; i < modifiers.size(); i++)
	{
		if(modifiers[i].getName() == modifier_name)
		{
			return true;
		}
	}
	return false;
}
