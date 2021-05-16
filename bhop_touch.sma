#include <amxmodx>
#include <hamsandwich>

#pragma semicolon 1

new bool:gBlocks = false;

public plugin_init()
{
	register_plugin("Bhop Blocks", "1.0", "Lovsky");

	RegisterHam(Ham_Touch, "func_door", "TouchBlocks", 0);
	RegisterHam(Ham_Touch, "func_door_rotating", "TouchBlocks", 0);
	RegisterHam(Ham_Touch, "trigger_multiple", "TouchBlocks", 0);

	register_clcmd("kicked_on_off", "OnOffBlocks");
}

public OnOffBlocks(id)
{
	new Flags = read_flags("o");  //флаг админа
	if (get_user_flags(id) & Flags) gBlocks = !gBlocks;
}

public TouchBlocks(door, id)
{
	if (!gBlocks)
	{
		return HAM_SUPERCEDE;
	}
	return HAM_IGNORED;
}
