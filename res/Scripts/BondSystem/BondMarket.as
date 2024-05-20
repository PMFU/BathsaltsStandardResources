#include "../base.as"


class Bond
{
	Bond(money_t amount, float rate)
	{
		principal = amount;
		interest_rate = rate;
	}

	void payDown(money_t amount_paid)
	{
		principal -= amount_paid;
	}

	money_t getTotal()
	{
		return principal;
	}

	money_t getInterest() const
	{
		return principal * interest_rate; 
	}

	money_t principal;
	float interest_rate;
}

class BondMarket
{
	BondMarket()
	{
		interest_rate = 0.15f;
	}

	void dailytick()
	{
		// for(Country@ country : countries)
		// {
		// 	if(country.getMoney() < 0)
		// 	{	//The country is in debt, give them money to keep them afloat through debt at current interest rate
		// 		money_t amount_to_loan = 1000;
		// 		issueBonds(country, amount_to_loan);
		// 	}
		// 	else
		// 	{
		// 		//Dont do anything lmao
		// 	}
		// }
	}


	void monthlytick()
	{
		// for(Country@ country : countries)
		// {
		// 	if(bonds.contains(country.getTag()))
		// 	{
		// 		for(Bond@ b : bonds.find(country.getTag()))
		// 		{	//Pay out the bond stuff, or increase the principal
		// 			b.
		// 		}
		// 	}
		// 	else
		// 	{
		// 		//No bond market!
		// 	}
		// }

		//Adjust the interest rate for the bond market
	}

	void issueBonds(Country@ nation, money_t amount)
	{
		auto@ bond_list_for_nation = bonds[nation.getTag()];
		bond_list_for_nation.push_back(Bond(amount, getCurrentInterestRate()));
	}

	float getCurrentInterestRate()
	{
		return interest_rate;
	}

	//The list of bonds for each country
	private unordered_map<string, vector<Bond>> bonds;
	
	//Current interest rate
	private float interest_rate;
}
