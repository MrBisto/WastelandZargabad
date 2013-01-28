
//	@file Version: 1.0
//	@file Name: gatherWater.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 23/11/2012 13:51
//	@file Args:

private["_totalDuration","_lockDuration","_iteration"];

player switchMove "AinvPknlMstpSlayWrflDnon_medic"; // Begin the full medic animation...

_totalDuration = 5; // This will NOT be easy >:)
_lockDuration = _totalDuration;
mutexScriptInProgress = true;
	 
for "_iteration" from 1 to _lockDuration do {
			
    if(vehicle player != player) exitWith { // A little inspiration from R3F
		player globalChat localize "STR_WL_Errors_BeaconInVehicle";
        player action ["eject", vehicle player];
		sleep 1;
		mutexScriptInProgress = false;
	};   
		    
	if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then { // Keep the player locked in medic animation for the full duration of the steal.
	    player switchMove "AinvPknlMstpSlayWrflDnon_medic";
	};
		    
	_lockDuration = _lockDuration - 1;
	sleep 1;
	
	if((player distance (nearestobjects [player, ["Land_Misc_Well_L_EP1"],  3] select 0) > 3) && 
	  (player distance (nearestobjects [player, ["Land_Misc_Well_C_EP1"],  3] select 0) > 3) &&
	  (player distance (nearestobjects [player, ["Land_pumpa"],  3] select 0) > 3))  exitWith { // If the player dies, revert state.
		2 cutText ["Filling bottles interrupted...", "PLAIN DOWN", 1];
	    mutexScriptInProgress = false;
	};
		
	if (_iteration >= _totalDuration) exitWith { // Sleep a little extra to show that steal has completed.
		sleep 1;
	    2 cutText ["", "PLAIN DOWN", 1];
		mutexScriptInProgress = false;
		player setVariable["water",(player getVariable "water")+1,true];
		hint "You gathered some water";               
	};
};

player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon"; // Redundant reset of animation state to avoid getting locked in animation. 