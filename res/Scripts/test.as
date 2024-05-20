// Let's include another script file
#include "pop_changing.as"
#include "military.as"
#include "on_actions.as"
#include "base.as"

void main()
{
	print("I'm now in main() from a script, test.as!\n");

	const Province@ p = getProvince(425);
	const State@ s = getState(99);
	const Country@ c = getCountry("FRA");
	print("Province 425 pop count is: ");
	print("" + p.getPopCount() + "\n"); //https://www.angelcode.com/angelscript/sdk/docs/manual/doc_script_stdlib_string.html

}
