#include "base.as"

// #include "scripted_effects.as"

#include "examples/example_decision.as"
#include "examples/example_event.as"

#include "../Content/india.as"
#include "../Content/mexico.as"

#include "casus_belis.as"

void on_startup()
{
	ExampleDecision d; d.register();
	ExampleEvent e1; e1.register();

	Indiamove_capital a1; a1.register();
	restore_mexican_empire r1; r1.register();
	treaty_of_guadalupe_hidalgo m1; m1.register();


	registerCBs();
}

void on_daily()
{
	//Trigger some stuff
	// print("Daily tick!\n");
}

void on_monthly()
{
	//Trigger Event


	print("Monthly tick!\n");
}

void on_yearly()
{
	print("Yearly tick!\n");
}
