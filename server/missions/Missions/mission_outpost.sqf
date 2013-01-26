//	@file Version: 1.0
//	@file Name: mission_Outpost.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 08/12/2012 03:25
//	@file Args:

if(!isServer) exitwith {};
diag_log format["WASTELAND SERVER - Mission Started"];
private ["_unitsAlive","_playerPresent","_subTextColour","_comp","_outpost","_missionTimeOut","_missionDelayTime","_missionRewardRadius","_hint","_startTime","_currTime","_result","_randomIndex","_selectedMarker","_indexAmount","_GotLoc","_randomPos","_choice","_HeadColor","_InArea","_reward"];

//Mission Initialization.
_result = 0;
_subTextColour = "#FFFFFF";
_HeadColor = "#17FF41";
_missionTimeOut = 600;
_missionDelayTime = [60,120,180,240,300] call BIS_fnc_selectRandom;
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
_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Outpost Mission</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>Our snipers have been observing a hostile outpost, we'll have their position on the next comms relay estimated to occur in %1 Minutes</t>", _missionDelayTime / 60, _HeadColor, _subTextColour];
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
clientMissionMarkers set [count clientMissionMarkers,["Outpost_Marker",_randomPos,"Location of hostile outpost"]];
publicVariable "clientMissionMarkers";

_comp = ["MediumTentCamp_napa","citybase01","guardpost2_us","fuelDepot_us","mediumtentcamp3_ru","smallbase"] call BIS_fnc_selectRandom;
_outpost = [_randomPos, (random 360), _comp] call (compile (preprocessFileLineNumbers "ca\modules\dyno\data\scripts\objectMapper.sqf"));
{_x setVariable["R3F_LOG_disabled", true];} foreach _outpost;

_hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Outpost Mission</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'>The snipers observing the outpost have relayed the position of the outpost, proceed to the GPS coords and secure the outpost</t>", _HeadColor, _subTextColour];
[nil,nil,rHINT,_hint] call RE;

_choice = ["server\missions\Units\smallGroup.sqf","server\missions\Units\midGroup.sqf","server\missions\Units\largeGroup.sqf","server\missions\Units\hugeGroup.sqf"] call BIS_fnc_selectRandom;
CivGrpM = createGroup civilian;
[CivGrpM,_randomPos]execVM _choice;
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
    (_result == 1) OR (_unitsAlive < 1)
};

if(_result == 1) then
{
	//Mission Failed.
    {deleteVehicle _x;}forEach units CivGrpM;
    deleteGroup CivGrpM;
	{deleteVehicle _x} foreach _outpost;
    _hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Outpost Evaced</t><br/><t align='center' color='%1'>------------------------------</t><br/><t align='center' color='%2'>Snipers have relayed information that the outpost has been evaced by the occupants, stand down and return to base.</t>", _HeadColor, _subTextColour];
	[nil,nil,rHINT,_hint] call RE;
	MissionSpawnMarkers select _randomIndex set[1, false]; //Reset the mission spawn bool
    diag_log format["WASTELAND SERVER - Mission Failed"];
} else {
	//Mission Complete.
    deleteGroup CivGrpM; 
	{deleteVehicle _x} foreach _outpost;
	
	_InArea = _randomPos nearEntities _missionRewardRadius;
	{
		if (isPlayer _x) then {
			player setVariable["cmoney", (player getVariable "cmoney")+_reward,true];
		};
	} forEach _InArea;
	
    _hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Outpost Secured</t><br/><t align='center' color='%1'>------------------------------</t><br/><t align='center' color='%2'>The outpost has been secured by a side, the original force occupying the outpost has been eliminated</t><br/><t align='center' color='%2'>Reward Money: %3</t>", _HeadColor, _subTextColour,_reward];
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