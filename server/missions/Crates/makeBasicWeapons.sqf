//	@file Version: 1.0
//	@file Name: makeBasicWeapons.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 08/12/2012 15:19
//	@file Args:

if(!X_Server) exitWith {};

private ["_crate"];

_crate = _this select 0;

clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;

_crate addWeaponCargoGlobal ["BAF_L110A1_Aim",4];
_crate addWeaponCargoGlobal ["BAF_L86A2_ACOG",4];
_crate addWeaponCargoGlobal ["BAF_L85A2_UGL_Holo",4];
_crate addWeaponCargoGlobal ["BAF_L7A2_GPMG",4];
_crate addWeaponCargoGlobal ["BAF_L85A2_RIS_ACOG",4];	
_crate addBackpackCargo ["DE_Backpack_Specops_EP1",5];		
        
// Add ammunition
_crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag",50];
_crate addMagazineCargoGlobal ["100Rnd_762x51_M240",50];
_crate addMagazineCargoGlobal ["200Rnd_556x45_L110A1",50];
_crate addMagazineCargoGlobal ["BAF_L109A1_HE",50];
_crate addMagazineCargoGlobal ["1Rnd_HE_M203",50];
_crate addMagazineCargoGlobal ["1Rnd_Smoke_M203",50];

_crate addWeaponCargoGlobal ["Binocular_Vector",1];
_crate addWeaponCargoGlobal ["NVGoggles",5];
_crate addWeaponCargoGlobal ["Binocular",5];