//Random weapons and items spawning script for wasteland missions.
//Author : Ed!
 
_odd1 = 100;                                            //The odds that a building is selected to place loot.
_odd2 = 20;                                                     //The odds that the selected building's spots will have loot(almost like odds per room).
_itemtoweaponratio = 30;                        //The chances of an item like food,money etc. will spawn instead of a weapon.
randomweaponspawnminmoney = 50;         //The minimum amount of money that can spawn.
randomweaponspawnmaxmoney = 500;        //The maximum amount of money that can spawn.
randomweapontestint = 0.01;                     //Sets the intervals in which weaponpositions are tested. (Lower = slower, but more accurate. Higher = faster, but less accurate.)
 
 
randomweapon_weaponlist = [
["huntingrifle","5x_22_LR_17_HMR"],
["colt1911","7Rnd_45ACP_1911"],
["m9","15Rnd_9x19_M9"],
["m9sd","15Rnd_9x19_M9SD"],
["makarov","8Rnd_9x18_Makarov"],
["makarovsd","8Rnd_9x18_MakarovSD"],
["aks_gold","30Rnd_762x39_AK47"],
["AK_74","30Rnd_545x39_AK"],
["AK_47_M","30Rnd_762x39_AK47"],
["FN_FAL","20Rnd_762x51_FNFAL"],
["AK_47_S","30Rnd_762x39_AK47"],
["AKS_74_U","30Rnd_545x39_AK"],
["LeeEnfield","10x_303"],
["m16a2","30Rnd_556x45_Stanag"],
["m1014","8Rnd_B_Beneli_Pellets"],
//["m24","5Rnd_762x51_M24"],
//["m40a3","5Rnd_762x51_M24"],
//["m107","10Rnd_127x99_M107"],
//["m4spr","20Rnd_556x45_Stanag"],
["glock17_EP1","17Rnd_9x19_glock17"],
//["DMR","20Rnd_762x51_DMR"],
["m8_carbineGL","30Rnd_556x45_Stanag"],
//["m8_SAW","30Rnd_556x45_Stanag"],
//["m8_sharpshooter","30Rnd_556x45_Stanag"],
["m8_compact","30Rnd_556x45_Stanag"],
//["BAF_L85A2_UGL_ACOG","30Rnd_556x45_Stanag"],
//["AA12_PMC","20Rnd_B_AA12_Pellets"],
//["m8_compact_pmc","30Rnd_556x45_Stanag"],
//["BAF_L85A2_UGL_Holo","30Rnd_556x45_Stanag"],
//["m8_holo_sd","30Rnd_556x45_Stanag"],
//["BAF_L86A2_ACOG","30Rnd_556x45_Stanag"],
["m16a2gl","30Rnd_556x45_Stanag","1Rnd_HE_M203"],
["m16a4","30Rnd_556x45_Stanag"],
["m16a4_gl","30Rnd_556x45_Stanag","1Rnd_HE_M203"],
//["m16a4_acg","30Rnd_556x45_Stanag"],
//["m16a4_acg_gl","30Rnd_556x45_Stanag"],
["m4a1","30Rnd_556x45_Stanag"],
//["m4a1_aim","30Rnd_556x45_Stanag"],
//["m4A1_AIM_camo","30Rnd_556x45_Stanag"],
//["SCAR_H_CQC_CCO_SD","20Rnd_762x51_SB_SCAR"],
//["SCAR_H_STD_EGLM_Spect","20Rnd_762x51_SB_SCAR"],
["Sa58P_EP1","30Rnd_762x39_SA58"],
["Sa58V_EP1","30Rnd_762x39_SA58"],
//["Sa58V_RCO_EP1","30Rnd_762x39_SA58"],
//["Sa58V_CCO_EP1","30Rnd_762x39_SA58"],
//["SCAR_L_STD_HOLO","20Rnd_762x51_SB_SCAR"],
//["M4A1_AIM_SD_camo","30Rnd_556x45_Stanag"],
//["M249_EP1","200Rnd_556x45_M249"],
["g36a","30Rnd_556x45_G36"],
//["g36k","30Rnd_556x45_G36"],
//["g36c","30Rnd_556x45_G36"],
//["g36_c_sd_eotech","30Rnd_556x45_G36"],
["mp5a5","30rnd_9x19_MP5"],
["mp5sd","30rnd_9x19_MP5SD"],
//["MG36_camo","100Rnd_556x45_BetaCMag"],
["m249","200Rnd_556x45_M249"],
["m240","100Rnd_762x51_M240"],
["mk_48","100Rnd_762x51_M240"],
["mg36","100Rnd_556x45_BetaCMag"],
//["vss_vintorez","20Rnd_9x39_SP5_VSS"],
//["svd","10Rnd_762x54_SVD"],
["pecheneg","100Rnd_762x54_PK"],
["UZI_SD_EP1","30Rnd_9x19_UZI_SD"],
["UZI_EP1","30Rnd_9x19_UZI"],
["revolver_gold_EP1","6Rnd_45ACP"],
["revolver_EP1","6Rnd_45ACP"],
["saiga12k","8Rnd_B_Saiga12_Pellets"],
["bizon","64Rnd_9x19_Bizon"],
["RPK_74","75Rnd_545x39_RPK"],
["NVGoggles"],
["Binocular"],
["Binocular_Vector"]
];
 
randomweapon_itemlist = [
"EvMoney",                                              //Money
"Land_Teapot_EP1",                              //Water
"Land_Bag_EP1",                                 //Food
"Fuel_can",                                             //Fuel
"Suitcase",                                             //Repair kit
"CZ_VestPouch_EP1"                              //Medic kit
];
 
 
randomweaponspawnweapon = {
        _position = _this;
        _selectedgroup = (floor(random(count randomweapon_weaponlist)));
        _weapon = randomweapon_weaponlist select _selectedgroup select 0;
        _weaponholder = createVehicle ["WeaponHolder", _position, [], 0, "CAN_COLLIDE"];
        _weaponholder addWeaponCargoGlobal [_weapon, 1];
        if((count((randomweapon_weaponlist) select _selectedgroup)) > 1) then {
        for[{_rm = 0}, {_rm < floor(random(5))}, {_rm = _rm + 1}] do {
        _mag = randomweapon_weaponlist select _selectedgroup select ((floor(random((count(randomweapon_weaponlist select _selectedgroup) - 1)))) + 1);
        _weaponholder addMagazineCargoGlobal [_mag, 1];  
        };
        };
        _weaponholder setPos _position;
};
 
randomweaponspawnitem = {
        _position = _this;
        _selectedgroup = (floor(random(count randomweapon_itemlist)));
        _class = randomweapon_itemlist select _selectedgroup;
        _item = createVehicle [_class, _position, [], 0, "CAN_COLLIDE"];
        if(_class == "EvMoney") then {
                _amountmoney = floor(random(randomweaponspawnmaxmoney - randomweaponspawnminmoney)) + randomweaponspawnminmoney;
                _item setVariable ["money", _amountmoney, true];
                _item setVariable ["owner", "world", true];
        };
        if(_class == "Land_Teapot_EP1") then {
                //nothing to do here
        };
        if(_class == "Land_Bag_EP1") then {
                //nothing to do here
        };
        if(_class == "Fuel_can") then {
                _item setVariable["fuel", true, true];
        };
        if(_class == "Suitcase") then {
                //nothing to do here
        };
        if(_class == "CZ_VestPouch_EP1") then {
                //nothing to do here
        };
        _item setPos _position;
};
 
 
_pos = [0,0];
randomweapon_buildings = nearestObjects [_pos, ["house"], 60000];
sleep 30;
{
        _building = _x;
        _buildingpos = [];
        _endloop = false;
        _poscount = 0;
        while {!_endloop} do {
                if(((_building buildingPos _poscount) select 0) != 0 && ((_building buildingPos _poscount) select 1) != 0) then {
                        _buildingpos = _buildingpos + [_building buildingPos _poscount];
                        _poscount = _poscount + 1;
                } else {
                        _endloop = true;
                };
        };
        _num = (random 100);
        if (_num < _odd1) then {
                if (count _buildingpos > 0) then
                {  
                        for[{_r = 0}, {_r < count _buildingpos}, {_r = _r + 1}] do
                        {
                                _num2 = (random 100);
                                if (_num2 < _odd2) then
                                {
                                        _pos = _buildingpos select _r;
                                        _posnew = _pos;
                                        if(_pos select 2 < 0) then
                                        {
                                                _pos = [_pos select 0, _pos select 1, 1];
                                        };
                                        _z = 0;
                                        _testpos = true;
                                        while {_testpos} do {
                                                if((!lineIntersects[ATLtoASL(_pos), ATLtoASL([_pos select 0, _pos select 1, (_pos select 2) - (randomweapontestint * _z)])]) && (!terrainIntersect[(_pos), ([_pos select 0, _pos select 1, (_pos select 2) - (randomweapontestint * _z)])]) && (_pos select 2 > 0)) then {
                                                        _posnew = [_pos select 0, _pos select 1, (_pos select 2) - (randomweapontestint * _z)];
                                                        _z = _z + 1;
                                                } else {
                                                        _testpos = false;
                                                };
                                        };
                                        _posnew = [_posnew select 0,_posnew select 1,(_posnew select 2) + 0.05];
                                        _woi = floor(random(100));
                                        if(_woi < _itemtoweaponratio) then {
                                                _posnew call randomweaponspawnitem;
                                        } else {
                                                _posnew call randomweaponspawnweapon;
                                        };
                                };
                        };
                };                             
        };
}foreach randomweapon_buildings;