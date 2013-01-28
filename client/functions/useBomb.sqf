//	@file Version: 1.0
//	@file Name: UseBomb.sqf
//	@file Author: Kettlewell
//	@file Created: 28/11/2012 05:19
//	@file Args:

private["_currTime","_startTime","_boomTime","_Pos"];

_Pos = getPos (_this select 0);

//remove bomb options
(_this select 0) setVariable["R3F_LOG_disabled", true, true]; 
for "_i" from 0 to 10 do
{
	[nil, (_this select 0), "per", rREMOVEACTION, _i] call RE;
};

switch ((_this select 3) select 0) do {
	case "1" : {	
		hint "Bomb is armed - 15 seconds";
		[nil,(_this select 0),"per",rADDACTION,"<t color='#FF0000'>Bomb is armed for detonation</t>","",[],6] call RE;
		(_this select 0) allowDamage true;
		_currTime = floor(time);
		_startTime = floor(time);
		_boomTime = 15;
		while {(_currTime - _startTime) < _boomTime } do {
			_currTime = floor(time);
			sleep 1;
		};
		
		deleteVehicle (_this select 0);
		//This is the boom
		for[{_i=0}, {_i<6}, {_i=_i+1}] do {
			_failed = "HelicopterExploBig" createVehicle [(_Pos select 0)+(random 15), (_Pos select 1)+(random 15),0];
			_failed = "HelicopterExploBig" createVehicle [(_Pos select 0)-(random 15), (_Pos select 1)-(random 15),0];
		};
	}; 
	case "2" : {
		hint "Bomb is armed - 30 seconds";
		[nil,(_this select 0),"per",rADDACTION,"<t color='#FF0000'>Bomb is armed for detonation</t>","",[],6] call RE;
		(_this select 0) allowDamage true;
		_currTime = floor(time);
		_startTime = floor(time);
		_boomTime = 30;
		while {(_currTime - _startTime) < _boomTime } do {
			_currTime = floor(time);
			sleep 1;
		};
		
		deleteVehicle (_this select 0);
		//This is the boom
		for[{_i=0}, {_i<6}, {_i=_i+1}] do {
			_failed = "HelicopterExploBig" createVehicle [(_Pos select 0)+(random 15), (_Pos select 1)+(random 15),0];
			_failed = "HelicopterExploBig" createVehicle [(_Pos select 0)-(random 15), (_Pos select 1)-(random 15),0];
			sleep 0.1;
		};
	};
	case "3" : {  
		hint "Bomb is armed - 60 seconds";
		[nil,(_this select 0),"per",rADDACTION,"<t color='#FF0000'>Bomb is armed for detonation</t>","",[],6] call RE;
		(_this select 0) allowDamage true;
		_currTime = floor(time);
		_startTime = floor(time);
		_boomTime = 60;
		while {(_currTime - _startTime) < _boomTime } do {
			_currTime = floor(time);
			sleep 1;
		};
		
		deleteVehicle (_this select 0);
		//This is the boom
		for[{_i=0}, {_i<6}, {_i=_i+1}] do {
			_failed = "HelicopterExploBig" createVehicle [(_Pos select 0)+(random 15), (_Pos select 1)+(random 15),0];
			_failed = "HelicopterExploBig" createVehicle [(_Pos select 0)-(random 15), (_Pos select 1)-(random 15),0];
			sleep 0.1;
		};
	};
	case "4" : {  
		hint "Bomb is armed - 5 minutes";
		[nil,(_this select 0),"per",rADDACTION,"<t color='#FF0000'>Bomb is armed for detonation</t>","",[],6] call RE;
		(_this select 0) allowDamage true;
		_currTime = floor(time);
		_startTime = floor(time);
		_boomTime = 300;
		while {(_currTime - _startTime) < _boomTime } do {
			_currTime = floor(time);
			sleep 1;
		};
		
		deleteVehicle (_this select 0);
		//This is the boom
		for[{_i=0}, {_i<6}, {_i=_i+1}] do {
			_failed = "HelicopterExploBig" createVehicle [(_Pos select 0)+(random 15), (_Pos select 1)+(random 15),0];
			_failed = "HelicopterExploBig" createVehicle [(_Pos select 0)-(random 15), (_Pos select 1)-(random 15),0];
			sleep 0.1;
		};
	};
};