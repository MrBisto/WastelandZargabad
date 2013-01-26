//	@file Version: 1.0
//	@file Name: mission_supplies.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 08/12/2012 15:19
//	@file Args:

if(!isServer) exitwith {};
diag_log format["WASTELAND SERVER - Mission Started"];
private ["_unitsAlive","_playerPresent","_subTextColour","_picture","_missionTimeOut","_missionDelayTime","_missionPlayerRadius","_hint","_startTime","_currTime","_result","_vehicle","_randomIndex","_selectedMarker","_indexAmount","_GotLoc","_randomPos","_choice","_HeadColor","_name","_missionRewardRadius","_reward","_InArea"];

//Mission Initialization.
_result = 0;
_subTextColour = "#FFFFFF";
_HeadColor = "#17FF41";
_missionTimeOut = 600;
_missionDelayTime = [60,120,180,240,300] call BIS_fnc_selectRandom;
_missionPlayerRadius = 150;
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
_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Supply Mission</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>We have a location of necessary supply vehicles, Standby for GPS coords, ETA %1 Minutes</t>", _missionDelayTime / 60, _HeadColor, _subTextColour];
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

_veh = ["Ural_TK_CIV_EP1","UralCivil"] call BIS_fnc_selectRandom;

//Add marker to client marker array.
clientMissionMarkers set [count clientMissionMarkers,["Mission_Marker",_randomPos,"Possible vehicle supply truck"]];
publicVariable "clientMissionMarkers";

_vehicle = createVehicle [_veh,[(_randomPos select 0), _randomPos select 1,0],[], 0, "NONE"];
_vehicle setFuel (random 1);
_vehicle setVehicleAmmo (random 1);
_vehicle setdamage (random 0.5);

if(_veh == "Ural_TK_CIV_EP1") then {
	_vehicle setVariable["water",floor(random 400),true];
	_name = "Water supply truck";
};
if(_veh == "UralCivil") then {
	_vehicle setVariable["food",floor(random 400),true];
	_name = "Food supply truck";
};

_vehicle setVehicleLock "LOCKED";
_vehicle setVariable["original",1,true];
_vehicle setVariable ["R3F_LOG_disabled", true, true];

_picture = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "picture");
_hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Supply Mission</t><br/><t align='center' color='%1'>------------------------------</t><br/><t align='center'><img size='5' image='%3'/></t><br/><t color='%2' size='1.0'>The %4 position has been located, proceed to the location and secure that vehicle, we need this to assist us with our failing supplies, do not fail this mission</t>", _HeadColor, _subTextColour, _picture, _name];
[nil,nil,rHINT,_hint] call RE;

_choice = ["server\missions\Units\smallGroup.sqf","server\missions\Units\midGroup.sqf","server\missions\Units\largeGroup.sqf","server\missions\Units\hugeGroup.sqf"] call BIS_fnc_selectRandom;
CivGrpM = createGroup civilian;
[CivGrpM,_randomPos]execVM _choice;

diag_log format["WASTELAND SERVER - Mission Waiting to be Finished"];
_startTime = floor(time);
waitUntil
{
    sleep 1; 
	_playerPresent = false;
    _currTime = floor(time);
    if(_currTime - _startTime >= _missionTimeOut) then {_result = 1;};
    {if((isPlayer _x) AND (_x distance _vehicle <= _missionPlayerRadius)) then {_playerPresent = true};}forEach playableUnits;
    _unitsAlive = ({alive _x} count units CivGrpM);
    (_result == 1) OR ((_playerPresent) AND (_unitsAlive < 1)) OR ((damage _vehicle) == 1)
};

_vehicle setVehicleLock "UNLOCKED";
_vehicle setVariable ["R3F_LOG_disabled", false, true];

if(_result == 1) then
{
	//Mission Failed.
    deleteVehicle _vehicle;
    {deleteVehicle _x;}forEach units CivGrpM;
    deleteGroup CivGrpM;
    _hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Supply Mission</t><br/><t align='center' color='%1'>------------------------------</t><br/><t align='center'><img size='5' image='%3'/></t><br/><t align='center' color='%2'>The %4 has fell off the grid, return to base</t>", _HeadColor, _subTextColour, _picture,_name];
	[nil,nil,rHINT,_hint] call RE;
	MissionSpawnMarkers select _randomIndex set[1, false]; //Reset the mission spawn bool
    diag_log format["WASTELAND SERVER - Mission Failed"];
} else {
	//Mission Complete.
    deleteGroup CivGrpM;

	_InArea = _randomPos nearEntities _missionRewardRadius;
	{
		if (isPlayer _x) then {
			player setVariable["cmoney", (player getVariable "cmoney")+_reward,true];
		};
	} forEach _InArea;
	
    _hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Supply Mission</t><br/><t align='center' color='%1'>------------------------------</t><br/><t align='center'><img size='5' image='%3'/></t><br/><t align='center' color='%2'>The %4 was retrieved by a side giving them the tactical advantage in the supply line battle</t><br/><t align='center' color='%2'>Reward Money: %5</t>", _HeadColor, _subTextColour, _picture,_name,_reward];
	[nil,nil,rHINT,_hint] call RE;
	MissionSpawnMarkers select _randomIndex set[1, false]; //Reset the mission spawn bool
    diag_log format["WASTELAND SERVER - Mission Finished"];
};

//Remove marker from client marker array.
{
    if(_x select 0 == "Mission_Marker") then
    {
    	clientMissionMarkers set [_forEachIndex, "REMOVETHISCRAP"];
		clientMissionMarkers = clientMissionMarkers - ["REMOVETHISCRAP"];
        publicVariable "clientMissionMarkers";    
    };
}forEach clientMissionMarkers;
MissionRunning = false;