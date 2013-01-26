//	@file Version: 1.0
//	@file Name: mission_WepCache.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 08/12/2012 15:19
//	@file Args:

if(!isServer) exitwith {};
diag_log format["WASTELAND SERVER - Mission Started"];
private ["_unitsAlive","_playerPresent","_subTextColour","_missionTimeOut","_missionDelayTime","_missionPlayerRadius","_hint","_startTime","_currTime","_result","_box","_box2","_randomIndex","_selectedMarker","_indexAmount","_GotLoc","_randomPos","_choice","_HeadColor"];

//Mission Initialization.
_result = 0;
_subTextColour = "#FFFFFF";
_HeadColor = "#17FF41";
_missionTimeOut = 600;
_missionDelayTime = [60,120,180,240,300] call BIS_fnc_selectRandom;
_missionPlayerRadius = 150;

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
_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Cache Mission</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>Weapons cache missed its drop zone, Standby for GPS coords, ETA %1 Minutes</t>", _missionDelayTime / 60, _HeadColor, _subTextColour];
[nil,nil,rHINT,_hint] call RE;

//Wait till the mission is ready to be ran.
diag_log format["WASTELAND SERVER - Mission Waiting to run"];
_startTime = floor(time);
waitUntil
{ 
    _currTime = floor(time);
    if(_currTime - _startTime >= _missionDelayTime) then {_result = 1;};
    sleep 1;
    (_result == 1)
};
diag_log format["WASTELAND SERVER - Mission Resumed"];
_result = 0;

//Add marker to client marker array.
clientMissionMarkers set [count clientMissionMarkers,["WeaponCache_Marker",_randomPos,"Search the area for the cache"]];
publicVariable "clientMissionMarkers";

_box = createVehicle ["RULaunchersBox",[(_randomPos select 0), (_randomPos select 1),0],[], 0, "NONE"];
[_box] execVM "server\missions\Crates\makeBasicLaunchers.sqf";

_box2 = createVehicle ["RUSpecialWeaponsBox",[(_randomPos select 0), (_randomPos select 1) - 10,0],[], 0, "NONE"];
[_box2] execVM "server\missions\Crates\makeBasicWeapons.sqf";

_hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Cache Mission</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'>We believe we have found the location of the cache that missed their drop zone, sending GPS coords</t>", _HeadColor, _subTextColour];
[nil,nil,rHINT,_hint] call RE;

_choice = ["server\missions\Units\smallGroup.sqf","server\missions\Units\midGroup.sqf","server\missions\Units\largeGroup.sqf","server\missions\Units\hugeGroup.sqf"] call BIS_fnc_selectRandom;
CivGrpS = createGroup civilian;
[CivGrpS,_randomPos]execVM _choice;

diag_log format["WASTELAND SERVER - Mission Waiting to be Finished"];
_startTime = floor(time);
waitUntil
{
    sleep 1; 
	_playerPresent = false;
    _currTime = floor(time);
    if(_currTime - _startTime >= _missionTimeOut) then {_result = 1;};
    {if((isPlayer _x) AND (_x distance _box <= _missionPlayerRadius)) then {_playerPresent = true};}forEach playableUnits;
    _unitsAlive = ({alive _x} count units CivGrpS);
    (_result == 1) OR ((_playerPresent) AND (_unitsAlive < 1)) OR ((damage _box) == 1)
};

if(_result == 1) then
{
	//Mission Failed.
    deleteVehicle _box;
    deleteVehicle _box2;
    {deleteVehicle _x;}forEach units CivGrps;
    deleteGroup CivGrpS;
    _hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Cache Lost</t><br/><t align='center' color='%1'>------------------------------</t><br/><t align='center' color='%2'>An unknown unit has retrieved the cache</t>", _HeadColor, _subTextColour];
	[nil,nil,rHINT,_hint] call RE;
	MissionSpawnMarkers select _randomIndex set[1, false]; //Reset the mission spawn bool
    diag_log format["WASTELAND SERVER - Mission Failed"];
} else {
	//Mission Complete.
    deleteGroup CivGrpS;
    _hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%1'>------------------------------</t><br/><t align='center' color='%2'>A side has retrieved the cache</t>", _HeadColor, _subTextColour];
	[nil,nil,rHINT,_hint] call RE;
	MissionSpawnMarkers select _randomIndex set[1, false]; //Reset the mission spawn bool
    diag_log format["WASTELAND SERVER - Mission Finished"];
};

//Remove marker from client marker array.
{
    if(_x select 0 == "WeaponCache_Marker") then
    {
    	clientMissionMarkers set [_forEachIndex, "REMOVETHISCRAP"];
		clientMissionMarkers = clientMissionMarkers - ["REMOVETHISCRAP"];
        publicVariable "clientMissionMarkers";    
    };
}forEach clientMissionMarkers;