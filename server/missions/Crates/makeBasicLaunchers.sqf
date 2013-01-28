//	@file Version: 1.0
//	@file Name: makeBasicLaunchers.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 08/12/2012 15:19
//	@file Args:

if(!X_Server) exitWith {};

private ["_crate"];

_crate = _this select 0;

clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;

_crate addWeaponCargoGlobal ["RPG7V",2];
_crate addWeaponCargoGlobal ["SMAW",2];
_crate addWeaponCargoGlobal ["M79_EP1",2];

_crate addMagazineCargoGlobal ["1Rnd_HE_M203",50];
_crate addMagazineCargoGlobal ["PG7V",50];
_crate addMagazineCargoGlobal ["SMAW_HEAA",50];
_crate addMagazineCargoGlobal ["HandGrenade",50];
_crate addMagazineCargoGlobal ["Mine",50];