// #include "helpers.as"

void form_NGF(Country@ nation)
{
	const array<culture_id> german_cultures = {10};	//North german = 10, south_german = 11
	const auto nationlist = getNationsControlled(nation);

	//Find the nations that are north/south german and add them to the annexation list
	vector<Country@> countries_to_annex;
	for(int i = 0; i < nationlist.size(); i++)
	{
		bool hasRequiredCultures = false;
		for(int j = 0; j < german_cultures.length(); j++)
		{
			if(nationlist[i].isCultureAccepted(german_cultures[j]))
			{
				hasRequiredCultures = true;
				break;
			}
		}
		countries_to_annex.append(nationlist[i]);
	}
	
	for(int i = 0; i < countries_to_annex.size(); i++)
	{
		Country@ transferring = countries_to_annex[i];

		//Transfer the stuff to the former
		vector<state_id>@ states = transferring.getStatesInCountry();
		for(int j = 0; j < states.size(); j++)
		{
			nation.transferState(transferring, states[j]);
		}
	}

	print("Formed NGF!");
}


void form_germany(Country@ nation)
{
	const array<culture_id> german_cultures = {10, 11};	//North german = 10, south_german = 11
	const auto nationlist = getNationsControlled(nation);

	//Find the nations that are north/south german and add them to the annexation list
	vector<Country@> countries_to_annex;
	for(int i = 0; i < nationlist.size(); i++)
	{
		bool hasRequiredCultures = false;
		for(int j = 0; j < german_cultures.length(); j++)
		{
			if(nationlist[i].isCultureAccepted(german_cultures[j]))
			{
				hasRequiredCultures = true;
				break;
			}
		}
		countries_to_annex.append(nationlist[i]);
	}
	
	for(int i = 0; i < countries_to_annex.size(); i++)
	{
		Country@ transferring = countries_to_annex[i];

		//Transfer the stuff to the former
		vector<state_id>@ states = transferring.getStatesInCountry();
		for(int j = 0; j < states.size(); j++)
		{
			nation.transferState(transferring, states[j]);
		}
	}

	print("Formed Germany!");
}

void form_italy(Country@ nation)
{
	const array<culture_id> italian_cultures = {20, 21};	//North italian = 20, italian = 21
	const auto nationlist = getNationsControlled(nation);

	//Find the nations that are north/south italian and add them to the annexation list
	vector<Country@> countries_to_annex;
	for(int i = 0; i < nationlist.size(); i++)
	{
		bool hasRequiredCultures = false;
		for(int j = 0; j < italian_cultures.length(); j++)
		{
			if(nationlist[i].isCultureAccepted(italian_cultures[j]))
			{
				hasRequiredCultures = true;
				break;
			}
		}
		countries_to_annex.append(nationlist[i]);
	}
	
	for(int i = 0; i < countries_to_annex.size(); i++)
	{
		Country@ transferring = countries_to_annex[i];

		//Transfer the stuff to the former
		vector<state_id>@ states = transferring.getStatesInCountry();
		for(int j = 0; j < states.size(); j++)
		{
			nation.transferState(transferring, states[j]);
		}
	}

	print("Formed Italy!");
}
