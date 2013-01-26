//	@file Version: 1.0
//	@file Name: smallGroup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 08/12/2012 21:58
//	@file Args:

if(!X_Server) exitWith {};

private ["_group","_pos","_leader"];

_group = _this select 0;
_pos = _this select 1;

//Anti Vehicle
_leader = _group createunit ["RU_Policeman", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];

_leader = leader _group;
_leader setVehicleInit "null = [group this,(getPos this)] execVM 'server\functions\defendArea.sqf'";
processInitCommands;