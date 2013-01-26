if(!isServer) exitWith {};

private ["_mission","_selectedMission"];

diag_log format["WASTELAND SERVER - Started Mission State"];

//Mission Array
_Marray = ["mission_vehicle",
			"mission_airwreck",
			"mission_outpost",
			"mission_wepcache",
			"mission_supplies",
			"mission_bomb"
];          

_selectedMission = floor(random (count _Marray - 1)); //default
MissionRunning = false; //global mission variable
sleep 60; //Don't let missions begin the second the server launches

while {true} do //keep it running constantly
{
    if (!MissionRunning) then { //if no mission is running
		diag_log format["WASTELAND SERVER - Starting Mission"];
		sleep 60; //Make sure the missions aren't piled on top of each other
        _mission = _Marray select _selectedMission;
        execVM format ["server\missions\Missions\%1.sqf",_mission];
		MissionRunning = true;
		_selectedMission = _selectedMission + 1;
		if(_selectedMission > (count _Marray - 1)) then {
			_selectedMission = 0;
		};
        diag_log format["WASTELAND SERVER - Execute New Mission"];
    } else {
    	sleep 15; //Use this so the while loop isn't spamming this shit out 
    };    
};