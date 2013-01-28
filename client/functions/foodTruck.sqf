//	@file Version: 1.0
//	@file Name: foodTruck.sqf
//	@file Author: 
//	@file Created: 
//	@file Args:

private ["_distance"];

_player = _this select 1;
_truck = _this select 0;

switch ((_this select 3) select 0) do {
	case "1" : {  
		_distance = _truck distance _player;
		if (_distance > 5) then { 
			hint "You need to be closer";
		} else {
			if((_player getVariable "water") > 4) then {
				hint "You cannot carry anymore water";
			} else {
				_player playmove "AinvPknlMstpSlayWrflDnon";
				_truck setVariable["water",(_truck getVariable "water")-1,true];
				_player setVariable["water",(_player getVariable "water")+1,true];
				if(_truck getVariable "water" < 1) then {
					sleep 1;
					for "_i" from 0 to 2 do {[nil, _truck, "per", rREMOVEACTION, _i] call RE;};
					hint "The truck is empty of water";
				} else {
					sleep 1;
					hint format ["You have taken 1 water. (Water left: %1)",_truck getVariable "water"];
				};
			};
		};
	};
	case "2" : {  
		_distance = _truck distance _player;
		if (_distance > 5) then { 
			hint "You need to be closer";
		} else {
			if((_player getVariable "canfood") > 4) then {
				hint "You cannot carry anymore food";
			} else {
				_player playmove "AinvPknlMstpSlayWrflDnon";
				_truck setVariable["canfood",(_truck getVariable "canfood")-1,true];
				_player setVariable["canfood",(_player getVariable "canfood")+1,true];
				if(_truck getVariable "canfood" < 1) then {
					sleep 1;
					for "_i" from 0 to 2 do {[nil, _truck, "per", rREMOVEACTION, _i] call RE;};
					hint "The truck is empty of food";
				} else {
					sleep 1;
					hint format ["You have taken 1 canned food. (Food left: %1)",_truck getVariable "canfood"];
				};
			};
		};
	};
};