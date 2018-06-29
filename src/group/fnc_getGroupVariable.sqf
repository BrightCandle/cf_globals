/* ----------------------------------------------------------------------------
Function: CF_globals_fnc_getGroupVariable
Description:
    Gets a variable based on a particular group that has been set with the
	setGroupVariable function.

	Waits for up to 60 seconds in a scheduled environment for the variable,
	returns nil if no such variable appears within that time period.

Parameters:
    _name  - The variable name, such as magazines or AR_weapon
    _defaultValue - set to get this value back if none was set
    _groupId  - The groupId to use, defaults to groupid (group player)
Returns:
    The value set or nil
Example:
    (begin example)
        ["magazine","DEFAULT"] call CF_globals_fnc_getGroupVariable;
    (end)
Author:
    BrightCandle
---------------------------------------------------------------------------- */
#include "script_component.hpp"
#define MAX_WAIT 10

params ["_name",["_defaultValue",nil],["_groupId",(groupId (group player))]];

private _groupName = (_groupId splitString " ") joinString "_";
_variableName = "CF_BAI_globals_AR_magazine"+_groupName;

_startTime = diag_tickTime;

while {
    _elapsedTime = diag_tickTime - _startTime;
    isNil _variableName && {_elapsedTime < MAX_WAIT};
} do {
    if (canSuspend) then {
        sleep 0.1;
    };
};

missionNamespace getVariable [_variableName,_defaultValue];