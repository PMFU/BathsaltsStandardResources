//This script is for common utilities and classes
//Avoid includes if possible, because the modules should avoid being shared
// This file is meant to be included from another script file

// We're allowed to include files in a circular manner, the
// application will include each file only once anyway

/** List of ALL custom registered types:

 *	Province@, State@, Country@, Pop@, Poptag
 *	Date@, 
 *
 *	UnitStats@, Brigade@, Division@, Battle@
 *
**/



/**
======================================================================
**/

//return a Date-seeded random number between low and high
int randomNumber(Date@ date, int low, int high) 
{
	int dif = high - low;
	if(dif <= 0)
	{
		return low;
	}
	int res = (14 % dif) + low;
	if(res >= high)
	{
		return high;
	}
	else if(res <= low)
	{
		return low;
	}
	else
	{
		return res;
	}
};

//Example functions for usage of language
void ex_function()
{
	//Strings
	// https://www.angelcode.com/angelscript/sdk/docs/manual/doc_script_stdlib_string.html
	string str = "cool";
	str += " beans";
	str += 3;
	if(str != "cool beans")
	{
		print("String isn't cool beans!\n");
	}
	uint8 byte_char = str[3];
	if(str.substr(3,1) == string("l"))
	{
		print("4th Character is 'l' in cool beans");
	}
	print(str);
	str.length();
	//There is also, isEmpty(), substring, and basic find functions
	//There are also parsing functions for converting to float, int, etc

	//Arrays
	// https://www.angelcode.com/angelscript/sdk/docs/manual/doc_datatypes_arrays.html
	array<int> arr = {1,2,3}; // 1,2,3
    arr.insertLast(0);        // 1,2,3,0
    arr.insertAt(2,4);        // 1,2,4,3,0
    arr.removeAt(1);          // 1,4,3,0
    arr.sortAsc();            // 0,1,3,4

    int sum = 0;
    for( uint n = 0; n < arr.length(); n++ )
	{
    	sum += arr[n];
	}
	arr.resize(10);
	arr.reverse();

	//Dictionary
	// https://www.angelcode.com/angelscript/sdk/docs/manual/doc_datatypes_dictionary.html
	dictionary dict = {{'one', 1}};
	int i = 0;
	if(dict.exists('one'))
	{
		bool isValid = dict.get('one', i);
		if(isValid)
		{
			// dict.delete('key');
			dict.set('one', 10);
		}
	}
	dict['one'] = 20;

	//Refs / Weak refs
	// https://www.angelcode.com/angelscript/sdk/docs/manual/doc_datatypes_ref.html
	// https://www.angelcode.com/angelscript/sdk/docs/manual/doc_datatypes_weakref.html


	//Any
	// https://www.angelcode.com/angelscript/sdk/docs/manual/doc_addon_any.html
	any any_obj;
	int foo = 0;
	float bar = 10.5f;
	any_obj.store(foo);
	any_obj.store(bar);

	if(any_obj.retrieve(bar))
	{
		print("Retrieving of float was successful!");
	}
}