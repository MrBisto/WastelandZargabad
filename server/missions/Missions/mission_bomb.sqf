//	@file Version: 1.0
//	@file Name: mission_Outpost.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 08/12/2012 03:25
//	@file Args:

if(!isServer) exitwith {};
diag_log format["WASTELAND SERVER - Mission Started"];
private ["_unitsAlive","_playerPresent","_subTextColour","_comp","_outpost","_missionTimeOut","_missionDelayTime","_missionRewardRadius","_hint","_startTime","_currTime","_result","_randomIndex","_selectedMarker","_indexAmount","_GotLoc","_randomPos","_choice","_HeadColor","_InArea","_reward","_bomb","_failed","_bombPos","_undercover","_underGroup"];

//Mission Initialization.
_result = 0;
_subTextColour = "#FFFFFF";
_HeadColor = "#17FF41";
_missionTimeOut = 600;
_missionDelayTime = 1;//[60,120,180,240,300] call BIS_fnc_selectRandom;
_missionRewardRadius = 250;
_reward = floor(random 500);

_GotLoc = false; //Make sure this is false at first
while {!_GotLoc} do { //Loop until it's true 

	//Count how many markers exist (Array is in config.sql)
	_indexAmount = count MissionSpawnMarkers; 
	//remove 1 index so we don't use an invalid index
	_indexAmount = _indexAmount - 1; 
	//Select a random number out of the number of indexes and floor it to avoid floats
	_randomIndex = floor(random _indexAmount); 
	
	//If the index of the mission markers array is false then break the loop and finish up doing the mission
	if (!(MissionSpawnMarkers select _randomIndex select 1)) then {
		//Select random mission spawn marker
		_selectedMarker = MissionSpawnMarkers select _randomIndex select 0;
		//set RandomPos as the selected markers position
		_randomPos = getMarkerPos _selectedMarker; 
		//Finally set the MissionPos as the position of the marker
		MissionPos = str(_randomPos);
		//Set the marker bool as true to ensure we don't spawn multiple missions on it
		MissionSpawnMarkers select _randomIndex set[1, true];
		_GotLoc = true;
	};
	
};
waitUntil {_GotLoc}; //ensure the rest of the script doesn't continue until we are done

//Tell everyone their will be a mission soon.
_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Bomb Mission</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>We have incomming intel from our undercover operative on the ground of a bomb because armed and to be used against us, waiting on GPS coords, eta %1 Minutes</t>", _missionDelayTime / 60, _HeadColor, _subTextColour];
[nil,nil,rHINT,_hint] call RE;

//Wait till the mission is ready to be ran.
diag_log format["WASTELAND SERVER - Mission Waiting to run"];
_startTime = floor(time);
waitUntil
{ 
    _currTime = floor(time);
    if(_currTime - _startTime >= _missionDelayTime) then {_result = 1;};
    (_result == 1)
};
diag_log format["WASTELAND SERVER - Mission Resumed"];
_result = 0;

//Add marker to client marker array.
clientMissionMarkers set [count clientMissionMarkers,["Outpost_Marker",_randomPos,"Location of armed bomb"]];
publicVariable "clientMissionMarkers";

_comp = ["smallbase"] call BIS_fnc_selectRandom;
_outpost = [_randomPos, (random 360), _comp] call (compile (preprocessFileLineNumbers "ca\modules\dyno\data\scripts\objectMapper.sqf"));
{_x setVariable["R3F_LOG_disabled", true];} foreach _outpost;
_bomb = "PowGen_Big" createVehicle _randomPos;
_bombPos = getPos _bomb;
_bomb setVariable["R3F_LOG_disabled", true]; 
_bomb allowDamage false;
_bomb addAction ['<t color="#FF0000">' + "Disarm Bomb" + '</t>', "server\functions\bombMission.sqf",["1"],6];
_bomb setVariable["active", true]; 

_underGroup = Creategroup civilian; //need to make him seem like the dead hostage
_undercover = _underGroup createUnit ["RU_Policeman",[(_randomPos select 0)+(random 3), (_randomPos select 1)-(random 3), 0], [], 0, "NONE"]; //position near the bomb
_undercover switchmove "i0_seargentDeath"; //death action
_undercover setDammage 1; //kill him
_undercover addAction ['<t color="#FF0000">' + "Search Body" + '</t>', "server\functions\bombMission.sqf",["2"],6];

_hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Bomb Mission</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'>Position has come through but our agent has blown his cover, get to the location, Check if the agent is still alive, disarm the bomb then evac with the bomb, you have 10 minutes.</t>", _HeadColor, _subTextColour];
[nil,nil,rHINT,_hint] call RE;

_choice = ["server\missions\Units\largeGroup.sqf","server\missions\Units\hugeGroup.sqf","server\missions\Units\platoonGroup.sqf"] call BIS_fnc_selectRandom;
CivGrpM = createGroup civilian;
[CivGrpM, _randomPos] execVM _choice;
[CivGrpM, _randomPos] call BIS_fnc_taskDefend;

diag_log format["WASTELAND SERVER - Mission Waiting to be Finished"];
_startTime = floor(time);
waitUntil
{
    sleep 1; 
	_playerPresent = false;
    _currTime = floor(time);
    if(_currTime - _startTime >= _missionTimeOut) then {_result = 1;};
    _unitsAlive = ({alive _x} count units CivGrpM);
    (_result == 1) OR (!(_bomb getVariable "active"))
};

if(_result == 1) then
{

	//Mission Failed.
    _hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Bomb Exploded</t><br/><t align='center' color='%1'>------------------------------</t><br/><t align='center' color='%2'>Time is up, I repeat time is up, evac immediately soldier, the bomb is going to blow!</t>", _HeadColor, _subTextColour];
	[nil,nil,rHINT,_hint] call RE;
	MissionSpawnMarkers select _randomIndex set[1, false]; //Reset the mission spawn bool
    diag_log format["WASTELAND SERVER - Mission Failed"];
	sleep 5;
	deleteVehicle _bomb;
	deleteVehicle _undercover;
	for[{_i=0}, {_i<5}, {_i=_i+1}] do {
		_failed = "HelicopterExploBig" createVehicle [(_bombPos select 0)+(random 20), (_bombPos select 1)+(random 20),0];
		_failed = "HelicopterExploBig" createVehicle [(_bombPos select 0)-(random 20), (_bombPos select 1)-(random 20),0];
		sleep 0.1;
	};
	{_x setDammage 1}foreach _outpost;
	sleep 20;
	deleteVehicle _undercover;
	deleteGroup _underGroup;
    {deleteVehicle _x;}forEach units CivGrpM;
    deleteGroup CivGrpM;
	{deleteVehicle _x} foreach _outpost;
} else {
	//Mission Complete.
	_bomb setVariable["R3F_LOG_disabled", false]; 
	_bomb addAction ['<t color="#FF0000">' + "Activate Bomb - 15 seconds" + '</t>', "server\functions\useBomb.sqf",["1"]];
	_bomb addAction ['<t color="#FF0000">' + "Activate Bomb - 30 seconds" + '</t>', "server\functions\useBomb.sqf",["2"]];
	_bomb addAction ['<t color="#FF0000">' + "Activate Bomb - 1 minute" + '</t>', "server\functions\useBomb.sqf",["3"]];
	_bomb addAction ['<t color="#FF0000">' + "Activate Bomb - 5 minute" + '</t>', "server\functions\useBomb.sqf",["4"]];
    deleteGroup CivGrpM; 
	deleteVehicle _undercover;
	deleteGroup _underGroup;
	{deleteVehicle _x} foreach _outpost;
	
	_InArea = _randomPos nearEntities _missionRewardRadius;
	{
		if (isPlayer _x) then {
			player setVariable["cmoney", (player getVariable "cmoney")+_reward,true];
		};
	} forEach _InArea;
	
    _hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Bomb Secured</t><br/><t align='center' color='%1'>------------------------------</t><br/><t align='center' color='%2'>Congratulations to a side, you have made a difference in the war against the independent terrorists, rtb</t><br/><t align='center' color='%2'>Reward Money: %3</t>", _HeadColor, _subTextColour,_reward];
	[nil,nil,rHINT,_hint] call RE;
	MissionSpawnMarkers select _randomIndex set[1, false]; //Reset the mission spawn bool
    diag_log format["WASTELAND SERVER - Mission Finished"];
};

//Remove marker from client marker array.
{
    if(_x select 0 == "Outpost_Marker") then
    {
    	clientMissionMarkers set [_forEachIndex, "REMOVETHISCRAP"];
		clientMissionMarkers = clientMissionMarkers - ["REMOVETHISCRAP"];
        publicVariable "clientMissionMarkers";    
    };
}forEach clientMissionMarkers;
MissionRunning = false;