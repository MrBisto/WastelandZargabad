//	@file Version: 1.0
//	@file Name: mainMissionController.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 15:19

#include "sideMissions\sideMissionDefines.sqf";

if(!isServer) exitWith {};

diag_log format["WASTELAND SERVER - Started Mission State"];

//Main Mission Array
_MMarray = ["mission_WepCache",
            "mission_ReconVeh",
            "mission_AirWreck",
            "mission_Truck"
			];

while {true} do
{
	_mission = _MMarray select (random (count _MMarray - 1));
	_missionRunning = [] ExecVM format ["server\missions\sideMissions\%1.sqf",_mission];
    diag_log format["WASTELAND SERVER - Execute New Side Mission"];
    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Side Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>Starting in %1 Minutes</t>", sideMissionDelayTime / 60, sideMissionColor, subTextColor];
	[nil,nil,rHINT,_hint] call RE;
	waitUntil{sleep 0.1; scriptDone _missionRunning};
};