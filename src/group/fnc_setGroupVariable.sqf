/* ----------------------------------------------------------------------------
Function: CF_globals_fnc_setGroupVariable
Description:
    Creates variable with a particular name within the context of a particular group.
	The variable is available globally on all machines in the game.

Parameters:
    _name  - The variable name, such as magazines or AR_weapon
	_value - The value to set
    _groupId  - The groupId to use, defaults to groupid (group player)
Returns:
    true if the variable was set, false otherwise
Example:
    (begin example)
        ["magazine","556_30rnd_green"] call CF_globals_fnc_setGroupVariable;
    (end)
Author:
    BrightCandle
---------------------------------------------------------------------------- */

#include "script_component.hpp"

params ["_name","_value",["_groupId",(groupId (group player))]];

private _groupName = (_groupId splitString " ") joinString "_";
private _variableName = "CF_BAI_globals_AR_magazine"+_groupName;

[_variableName,_value] call CBA_fnc_publicVariable;