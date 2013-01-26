//	@file Version: 1.0
//	@file Name: largeGroup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 08/12/2012 21:58
//	@file Args:

if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5","_man6","_man7","_man8","_man9","_man10","_man10","_man11","_man12","_man13","_man14","_man15","_man16","_man17","_man18","_man19","_man20","_man21","_man22","_man23","_man24","_man25"];

_group = _this select 0;
_pos = _this select 1;

//Anti Air no weapon
_leader = _group createunit ["RU_Policeman", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
_leader addMagazine "Strela";
_leader addMagazine "Strela";
_leader addMagazine "Strela";
_leader addWeapon "Strela";

//Support
_man2 = _group createunit ["RU_Policeman", [(_pos select 0) - 10, _pos select 1, 0], [], 0.5, "Form"];
_man2 addMagazine "75Rnd_545x39_RPK";
_man2 addMagazine "75Rnd_545x39_RPK";
_man2 addMagazine "75Rnd_545x39_RPK";
_man2 addMagazine "75Rnd_545x39_RPK";
_man2 addWeapon "RPK_74";

//Rifle_man
_man3 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) + 10, 0], [], 0.5, "Form"];
_man3 addMagazine "30Rnd_762x39_AK47";
_man3 addMagazine "30Rnd_762x39_AK47";
_man3 addMagazine "30Rnd_762x39_AK47";
_man3 addMagazine "30Rnd_762x39_AK47";
_man3 addMagazine "30Rnd_762x39_AK47";
_man3 addWeapon "AK_47_M";

//Rifle_man
_man4 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) + 10, 0], [], 0.5, "Form"];
_man4 addMagazine "30Rnd_762x39_AK47";
_man4 addMagazine "30Rnd_762x39_AK47";
_man4 addMagazine "30Rnd_762x39_AK47";
_man4 addMagazine "30Rnd_762x39_AK47";
_man4 addMagazine "30Rnd_762x39_AK47";
_man4 addWeapon "AK_47_M";

//Sniper
_man5 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) - 10, 0], [], 0.5, "Form"];
_man5 addMagazine "10Rnd_762x54_SVD";
_man5 addMagazine "10Rnd_762x54_SVD";
_man5 addMagazine "10Rnd_762x54_SVD";
_man5 addMagazine "10Rnd_762x54_SVD";
_man5 addMagazine "10Rnd_762x54_SVD";
_man5 addWeapon "SVD";

//Grenadier
_man6 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) - 10, 0], [], 0.5, "Form"];
_man6 addMagazine "30Rnd_762x39_AK47";
_man6 addMagazine "30Rnd_762x39_AK47";
_man6 addMagazine "30Rnd_762x39_AK47";
_man6 addMagazine "30Rnd_762x39_AK47";
_man6 addMagazine "1Rnd_HE_GP25";
_man6 addMagazine "1Rnd_HE_GP25";
_man6 addMagazine "1Rnd_HE_GP25";
_man6 addWeapon "AK_74_GL";

//Support
_man7 = _group createunit ["RU_Policeman", [(_pos select 0) - 10, _pos select 1, 0], [], 0.5, "Form"];
_man7 addMagazine "75Rnd_545x39_RPK";
_man7 addMagazine "75Rnd_545x39_RPK";
_man7 addMagazine "75Rnd_545x39_RPK";
_man7 addMagazine "75Rnd_545x39_RPK";
_man7 addWeapon "RPK_74";

//Grenadier
_man8 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) + 10, 0], [], 0.5, "Form"];
_man8 addMagazine "30Rnd_762x39_AK47";
_man8 addMagazine "30Rnd_762x39_AK47";
_man8 addMagazine "30Rnd_762x39_AK47";
_man8 addMagazine "30Rnd_762x39_AK47";
_man8 addMagazine "1Rnd_HE_GP25";
_man8 addMagazine "1Rnd_HE_GP25";
_man8 addMagazine "1Rnd_HE_GP25";
_man8 addWeapon "AK_74_GL";

//Sniper
_man9 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) - 10, 0], [], 0.5, "Form"];
_man9 addMagazine "10Rnd_762x54_SVD";
_man9 addMagazine "10Rnd_762x54_SVD";
_man9 addMagazine "10Rnd_762x54_SVD";
_man9 addMagazine "10Rnd_762x54_SVD";
_man9 addMagazine "10Rnd_762x54_SVD";
_man9 addWeapon "SVD";

//Rifle_man
_man10 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) + 10, 0], [], 0.5, "Form"];
_man10 addMagazine "30Rnd_762x39_AK47";
_man10 addMagazine "30Rnd_762x39_AK47";
_man10 addMagazine "30Rnd_762x39_AK47";
_man10 addMagazine "30Rnd_762x39_AK47";
_man10 addMagazine "30Rnd_762x39_AK47";
_man10 addWeapon "AK_47_M";

//edit these later
_man11 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) + 10, 0], [], 0.5, "Form"];
_man11 addMagazine "30Rnd_762x39_AK47";
_man11 addMagazine "30Rnd_762x39_AK47";
_man11 addMagazine "30Rnd_762x39_AK47";
_man11 addMagazine "30Rnd_762x39_AK47";
_man11 addMagazine "30Rnd_762x39_AK47";
_man11 addWeapon "AK_47_M";

//edit these later
_man12 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) + 10, 0], [], 0.5, "Form"];
_man12 addMagazine "30Rnd_762x39_AK47";
_man12 addMagazine "30Rnd_762x39_AK47";
_man12 addMagazine "30Rnd_762x39_AK47";
_man12 addMagazine "30Rnd_762x39_AK47";
_man12 addMagazine "30Rnd_762x39_AK47";
_man12 addWeapon "AK_47_M";

//edit these later
_man13 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) + 10, 0], [], 0.5, "Form"];
_man13 addMagazine "30Rnd_762x39_AK47";
_man13 addMagazine "30Rnd_762x39_AK47";
_man13 addMagazine "30Rnd_762x39_AK47";
_man13 addMagazine "30Rnd_762x39_AK47";
_man13 addMagazine "30Rnd_762x39_AK47";
_man13 addWeapon "AK_47_M";

//edit these later
_man14 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) + 10, 0], [], 0.5, "Form"];
_man14 addMagazine "30Rnd_762x39_AK47";
_man14 addMagazine "30Rnd_762x39_AK47";
_man14 addMagazine "30Rnd_762x39_AK47";
_man14 addMagazine "30Rnd_762x39_AK47";
_man14 addMagazine "30Rnd_762x39_AK47";
_man14 addWeapon "AK_47_M";

//edit these later
_man15 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) + 10, 0], [], 0.5, "Form"];
_man15 addMagazine "30Rnd_762x39_AK47";
_man15 addMagazine "30Rnd_762x39_AK47";
_man15 addMagazine "30Rnd_762x39_AK47";
_man15 addMagazine "30Rnd_762x39_AK47";
_man15 addMagazine "30Rnd_762x39_AK47";
_man15 addWeapon "AK_47_M";

//edit these later
_man16 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) + 10, 0], [], 0.5, "Form"];
_man16 addMagazine "30Rnd_762x39_AK47";
_man16 addMagazine "30Rnd_762x39_AK47";
_man16 addMagazine "30Rnd_762x39_AK47";
_man16 addMagazine "30Rnd_762x39_AK47";
_man16 addMagazine "30Rnd_762x39_AK47";
_man16 addWeapon "AK_47_M";

//edit these later
_man17 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) + 10, 0], [], 0.5, "Form"];
_man17 addMagazine "30Rnd_762x39_AK47";
_man17 addMagazine "30Rnd_762x39_AK47";
_man17 addMagazine "30Rnd_762x39_AK47";
_man17 addMagazine "30Rnd_762x39_AK47";
_man17 addMagazine "30Rnd_762x39_AK47";
_man17 addWeapon "AK_47_M";

//edit these later
_man18 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) + 10, 0], [], 0.5, "Form"];
_man18 addMagazine "30Rnd_762x39_AK47";
_man18 addMagazine "30Rnd_762x39_AK47";
_man18 addMagazine "30Rnd_762x39_AK47";
_man18 addMagazine "30Rnd_762x39_AK47";
_man18 addMagazine "30Rnd_762x39_AK47";
_man18 addWeapon "AK_47_M";

//edit these later
_man19 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) + 10, 0], [], 0.5, "Form"];
_man19 addMagazine "30Rnd_762x39_AK47";
_man19 addMagazine "30Rnd_762x39_AK47";
_man19 addMagazine "30Rnd_762x39_AK47";
_man19 addMagazine "30Rnd_762x39_AK47";
_man19 addMagazine "30Rnd_762x39_AK47";
_man19 addWeapon "AK_47_M";

//edit these later
_man20 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) + 10, 0], [], 0.5, "Form"];
_man20 addMagazine "30Rnd_762x39_AK47";
_man20 addMagazine "30Rnd_762x39_AK47";
_man20 addMagazine "30Rnd_762x39_AK47";
_man20 addMagazine "30Rnd_762x39_AK47";
_man20 addMagazine "30Rnd_762x39_AK47";
_man20 addWeapon "AK_47_M";

//edit these later
_man21 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) + 10, 0], [], 0.5, "Form"];
_man21 addMagazine "30Rnd_762x39_AK47";
_man21 addMagazine "30Rnd_762x39_AK47";
_man21 addMagazine "30Rnd_762x39_AK47";
_man21 addMagazine "30Rnd_762x39_AK47";
_man21 addMagazine "30Rnd_762x39_AK47";
_man21 addWeapon "AK_47_M";

//edit these later
_man22 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) + 10, 0], [], 0.5, "Form"];
_man22 addMagazine "30Rnd_762x39_AK47";
_man22 addMagazine "30Rnd_762x39_AK47";
_man22 addMagazine "30Rnd_762x39_AK47";
_man22 addMagazine "30Rnd_762x39_AK47";
_man22 addMagazine "30Rnd_762x39_AK47";
_man22 addWeapon "AK_47_M";

//edit these later
_man23 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) + 10, 0], [], 0.5, "Form"];
_man23 addMagazine "30Rnd_762x39_AK47";
_man23 addMagazine "30Rnd_762x39_AK47";
_man23 addMagazine "30Rnd_762x39_AK47";
_man23 addMagazine "30Rnd_762x39_AK47";
_man23 addMagazine "30Rnd_762x39_AK47";
_man23 addWeapon "AK_47_M";

//edit these later
_man24 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) + 10, 0], [], 0.5, "Form"];
_man24 addMagazine "30Rnd_762x39_AK47";
_man24 addMagazine "30Rnd_762x39_AK47";
_man24 addMagazine "30Rnd_762x39_AK47";
_man24 addMagazine "30Rnd_762x39_AK47";
_man24 addMagazine "30Rnd_762x39_AK47";
_man24 addWeapon "AK_47_M";

//edit these later
_man25 = _group createunit ["RU_Policeman", [_pos select 0, (_pos select 1) + 10, 0], [], 0.5, "Form"];
_man25 addMagazine "30Rnd_762x39_AK47";
_man25 addMagazine "30Rnd_762x39_AK47";
_man25 addMagazine "30Rnd_762x39_AK47";
_man25 addMagazine "30Rnd_762x39_AK47";
_man25 addMagazine "30Rnd_762x39_AK47";
_man25 addWeapon "AK_47_M";

_leader = leader _group;
_leader setVehicleInit "null = [group this,(getPos this)] execVM 'server\functions\defendArea.sqf'";
processInitCommands;