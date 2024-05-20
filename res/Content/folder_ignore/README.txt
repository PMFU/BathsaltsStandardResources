EVENTS AND DECISIONS CONTENT FOLDER

In this folder, any number of jsons may be placed. They will all be loaded for content.

-----------------------------------------------------------
DECISIONS:

- Has a restriction for what nations is it available for.
- Has an effect that is triggered

- Has a field for showing when decision can be taken
- Has a field for showing when decision would be viewable

The "OR" section is anything in a list, while an AND is everything inside a block of the list

There are simple decisions, defined in JSON, that is
	acceptable for most cases, with constant triggers and
	are a simple click with an effect that occurs, or checking
	against a constant state or flag.

Flags ALWAYS must end in "_flag" for their name

=================================
EVENTS:

- Has a mtth (mean time to happen)
- Can have various triggers
- Has choice based pop-up

There are simple and scripted events. The simple events are defined
	in JSON, and possess a list of options with effects.


================================

How effects work:
ALL EFFECTS ARE APPLIED ONCE PER TRIGGERING. They do not continuously execute. The modifiers added to the nation,
state or province is set into a permanent table, and it present until removed. The modifiers and flags are stored
in the save game to be reloaded, but not reset or reapplied.

================================

Triggers:
"ai" - bool
"is_great_power" - bool
"prestige" - int
"war" - bool
"NOT" - array which operates OR on containing values
"AND" - self explanitory
"OR" - self explanitory
"all_culture_in_sphere" - "culture string", a boolean checker
"primary_culture" - "culture string"
"owns_state" - int state id
"owns_province" - int province id
"tag" - "str" with str being the TAG,
"is_flag_set" - "str" with str being the key for the flag | OR USE THE OTHER FLAG FORMAT
"has_technology" - "str" with str being the key_name for the researched tech
"has_invention" - "str" with str being the key_name for the invention

Effects:
FILL THIS LIST
"research_point_gain"
"education_efficiency"
"navy_tech_modifier"
"army_tech_modifier"
"industry_tech_modifier"
"commerce_tech_modifier"
"culture_tech_modifier"
"administrative_efficiency"
"tax_efficiency"
"colonial_migration_rate"
"factory_input_efficiency"
"factory_output_efficiency"
"factory_throughput_efficiency"
"rgo_output_efficiency"
"rgo_throughput_efficiency"
"mining_output"
"farming_output"
"mine_size"
"farm_size"
"pop_growth"
"prestige"
"run_scripted_effect" - str for effect function name
"set_flag" -> str for the name of the flag, &AND a SEPARATE value field after with ANY valuetype for the state of the value

"militancy"
"consciousness"
"monthly_militancy"
"monthly_consciousness"



