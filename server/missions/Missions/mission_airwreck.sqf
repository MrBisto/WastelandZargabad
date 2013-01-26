//	@file Version: 1.0
//	@file Name: mission_AirWreck.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 08/12/2012 15:19
//	@file Args:

if(!isServer) exitwith {};
diag_log format["WASTELAND SERVER - Mission Started"];
private ["_unitsAlive","_playerPresent","_subTextColour","_vehicleName","_missionTimeOut","_missionDelayTime","_missionPlayerRadius","_hint","_startTime","_currTime","_result","_wreck","_box","_box2","_randomIndex","_selectedMarker","_indexAmount","_GotLoc","_randomPos","_choice","_HeadColor","_missionRewardRadius","_reward","_InArea"];

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
_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Wreck Mission</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>Intelligence has reported that unknown military air has been shot down in the area, we will forward GPS coords once our scouts have relayed the position of the crash, ETA %1 Minutes</t>", _missionDelayTime / 60, _HeadColor, _subTextColour];
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
clientMissionMarkers set [count clientMissionMarkers,["AirWreck_Marker",_randomPos,"Position from scouts"]];
publicVariable "clientMissionMarkers"; 

_vehicleName = ["C130J_wreck_EP1"] call BIS_fnc_selectRandom;
_wreck = createVehicle [_vehicleName,[(_randomPos select 0) + 10, (_randomPos select 1) + 10,0],[], 0, "NONE"];
_wreck setVariable["original",1,true];

_box = createVehicle ["USLaunchersBox",[(_randomPos select 0), (_randomPos select 1),0],[], 0, "NONE"];
[_box] execVM "server\missions\Crates\makeBasicLaunchers.sqf";
_box2 = createVehicle ["USSpecialWeaponsBox",[(_randomPos select 0), (_randomPos select 1) - 5,0],[], 0, "NONE"];
[_box2] execVM "server\missions\Crates\makeBasicWeapons.sqf";

_hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Wreck Mission</t><br/><t align='center' color='%1'>------------------------------</t><br/><t align='center' color='%2'>Our scouts have relayed position of crashed air vehicle, be aware that enemy combatants may still be alive and may be aggressive.</t>", _HeadColor, _subTextColour];
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
    {if((isPlayer _x) AND (_x distance _box <= _missionPlayerRadius)) then {_playerPresent = true};}forEach playableUnits;
    _unitsAlive = ({alive _x} count units CivGrpM);
    (_result == 1) OR ((_playerPresent) AND (_unitsAlive < 1)) OR ((damage _box) == 1)
};

if(_result == 1) then
{
	//Mission Failed.
    deleteVehicle _box;
    deleteVehicle _box2;
    deleteVehicle _wreck;
    {deleteVehicle _x;}forEach units CivGrpM;
    deleteGroup CivGrpM;
    _hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Wreck Abandoned</t><br/><t align='center' color='%1'>------------------------------</t><br/><t align='center' color='%2'>Our scouts have relayed that the wreck has been abandoned by the unit that survived</t>",_HeadColor, _subTextColour];
	[nil,nil,rHINT,_hint] call RE;
	MissionSpawnMarkers select _randomIndex set[1, false]; //Reset the mission spawn bool
    diag_log format["WASTELAND SERVER - Mission Failed"];
} else {
	//Mission Complete.
    deleteVehicle _wreck;
    deleteGroup CivGrpM;

	_InArea = _randomPos nearEntities _missionRewardRadius;
	{
		if (isPlayer _x) then {
			player setVariable["cmoney", (player getVariable "cmoney")+_reward,true];
		};
	} forEach _InArea;
	
    _hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Wreck Secured</t><br/><t align='center' color='%1'>------------------------------</t><br/><t align='center' color='%2'>A side has secured the wreck and the unit that survived has been eliminated</t><br/><t align='center' color='%2'>Reward Money: %3</t>",_HeadColor, _subTextColour,_reward];
	[nil,nil,rHINT,_hint] call RE;
	MissionSpawnMarkers select _randomIndex set[1, false]; //Reset the mission spawn bool
    diag_log format["WASTELAND SERVER - Mission Finished"];
};

//Remove marker from client marker array.
{
    if(_x select 0 == "AirWreck_Marker") then
    {
    	clientMissionMarkers set [_forEachIndex, "REMOVETHISCRAP"];
		clientMissionMarkers = clientMissionMarkers - ["REMOVETHISCRAP"];
        publicVariable "clientMissionMarkers";    
    };
}forEach clientMissionMarkers;