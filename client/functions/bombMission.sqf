//	@file Version: 1.0
//	@file Name: bombMission.sqf
//	@file Author: Kettlewell
//	@file Created: 28/11/2012 05:19
//	@file Args:

switch ((_this select 3) select 0) do {
	case "1" : {  
		//disarm bomb
		if ((_this select 1) getVariable "Codes") then {
			(_this select 1) setVariable["Codes", false, false];
			[nil, (_this select 0), "per", rREMOVEACTION, 0] call RE;
			(_this select 0) setVariable["active", false, true]; 
			hint "You have disarmed the bomb";
		} else {
			hint "You do not have the deactivation codes";
		};
	};
	case "2" : {
		//Codes
		(_this select 1) setVariable["Codes", true, false];
		hint "You have found deactivation codes for the bomb";
	};
};