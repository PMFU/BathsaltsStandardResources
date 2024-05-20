

/*
if France wins a battle against prussia where there are at least 100k casualties, give france a flag that unlocks a decision called "Victoria"
*/

bool contains(const vector<string> &in vec, const string& in val)
{
    for(int i = 0; i < vec.size(); i++)
    {
        if(vec[i] == val)
        {
            return true;
        }
    }
    return false;
}

void test()
{
    const vector<War@> wars = getOngoingWars();
    for(int i = 0; i < wars.size(); i++)
    {
        const War@ w = wars[i];
        if((contains(w.attackers, "FRA") && contains(w.defenders, "PRU")) || (contains(w.attackers, "PRU") && contains(w.defenders, "FRA")))
        {
            const vector<Battle@> battles = w.getBattles();
            for(int j = 0; j < battles.size(); j++)
            {
                Battle@ battle = battles[j];
                if(battle.hasFinished())
                {
                    //Now check if France has won the battle
                    // THIS IS PSUEDO CODE NOW
                    if(contains(battle.getWinners(), "FRA") && contains(battle.getLosers(), "PRU") && battle.getCasualties() >= 100000)
                    {
                        getCountry("FRA").getFlag("unlock_victoria").setValue(1);
                    }
                }
            }
        }
    }
}