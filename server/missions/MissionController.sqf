if(!isServer) exitWith {};

private ["_mission","_selectedMission","_currTime","_startTime","_continue"];

diag_log format["WASTELAND SERVER - Started Mission State"];

//Mission Array
_Marray = ["mission_vehicle",
            "mission_airwreck",
            "mission_outpost",
            "mission_supplies",
            "mission_bomb"
];          

_selectedMission = floor(random (count _Marray - 1)); //default
MissionRunning = false; //global mission variable

//Don't let the mission start for at least 60 seconds after the server is booted up
_startTime = floor(time);
_currTime = floor(time);
_continue = 0;

waitUntil
{ 
    _currTime = floor(time);
    if(_currTime - _startTime >= 60) then {_continue = 1;};
    (_continue == 1)
};

while {true} do //keep it running constantly
{
    if (!MissionRunning) then { //if no mission is running
		diag_log format["WASTELAND SERVER - Starting Mission"];
		
		//Make sure the missions aren't piled on top of each other
		_continue = 0;
		_startTime = floor(time);
		_currTime = floor(time);
		waitUntil
		{ 
			_currTime = floor(time);
			if(_currTime - _startTime >= 60) then {_continue = 1;};
			(_continue == 1)
		};
		_continue = 0;
        _mission = _Marray select _selectedMission;
        execVM format ["server\missions\Missions\%1.sqf",_mission];
		MissionRunning = true;
		_selectedMission = _selectedMission + 1;
		if(_selectedMission > (count _Marray - 1)) then {
			_selectedMission = 0;
		};
        diag_log format["WASTELAND SERVER - Execute New Mission"];
    } else {
		_startTime = floor(time);
		_currTime = floor(time);
		_continue = 0;
		waitUntil
		{ 
			_currTime = floor(time);
			if(_currTime - _startTime >= 15) then {_continue = 1;};
			(_continue == 1)
		};
    };    
};