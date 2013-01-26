//////////////////////////////////BUILDING LOOT//////////////////////////////////////

_weapons = ["m24","DMR","colt1911","m16a2","Sa58V_CCO_EP1","m8_compact","mp5a5","M14_EP1","M4A1_AIM_SD_camo"];

_items = ["Binocular","ItemGPS","Binocular_Vector","NVGoggles","BAF_ied_v1"];

_magazines = ["5Rnd_762x51_M24","20Rnd_762x51_DMR","7Rnd_45ACP_1911","30Rnd_556x45_Stanag","30Rnd_762x39_SA58","30Rnd_556x45_G36","30Rnd_9x19_MP5","30Rnd_556x45_StanagSD"];


_buildings = nearestobjects [getmarkerPos "weapons", ["house"], 3500];
_markernum = 0;
{
_building = _x;
//hint "placing loot.";
// search more positions
_positions = 0;
_i = 0;
_loop = 1;
while {_loop == 1} do
{
_next = _building buildingPos _i;
if (((_next select 0) == 0) && ((_next select 1) == 0) && ((_next select 2) == 0)) then
{
_loop = 0;
} else {
_positions = _positions + 1;
_i = _i + 1;
};
};
_posnumber = floor (random _positions);
_position = _building buildingpos _posnumber;
//hint "placing loot..2";
if (random 100 > 75) then {
_weapon = _weapons call BIS_fnc_SelectRandom;
_mag=(getArray (configFile/"Cfgweapons"/_weapon/"magazines")) select 0;
                 _weap = "weaponHolder" createVehicle [0,0];
                 _weap addMagazineCargo [_mag,(round (random 3))];
                 _weap addWeaponCargo [_weapon,1];
                 _weap setPos [(_position select 0),(_position select 1),((_position select 2)-.14)];
};

_posnumber = floor (random _positions);
_position = _building buildingpos _posnumber;


//hint "placing loot...3";
if (random 100 > 60) then {
_weapon = _items call BIS_fnc_SelectRandom;
                 _weap = "weaponHolder" createVehicle [0,0];
                 _weap addMagazineCargo [_mag,(round (random 2))];
                 _weap addWeaponCargo [_weapon,1];
                 _weap setPos [(_position select 0),(_position select 1),((_position select 2)-.14)];;
};

_posnumber = floor (random _positions);
_position = _building buildingpos _posnumber;


//hint "placing loot..4";
if (random 100 > 40) then {
_weapon = _items call BIS_fnc_SelectRandom;
                 _weap = "weaponHolder" createVehicle [0,0];
                 _weap addMagazineCargo [_mag,(round (random 2))];
                 _weap addWeaponCargo [_weapon,1];
                 _weap setPos [(_position select 0),(_position select 1),((_position select 2)-.14)];;
};

_posnumber = floor (random _positions);
_position = _building buildingpos _posnumber;

//hint "placing loot..5";
if (random 100 > 30) then {
_weapon = _items call BIS_fnc_SelectRandom;
                 _weap = "weaponHolder" createVehicle [0,0];
                 _weap addMagazineCargo [_mag,(round (random 2))];
                 _weap addWeaponCargo [_weapon,1];
                 _weap setPos [(_position select 0),(_position select 1),((_position select 2)-.14)];;
};

_posnumber = floor (random _positions);
_position = _building buildingpos _posnumber;

//hint "placing loot....";
} foreach _buildings; //hint "Finished! Loot Spawn Scirpt...";