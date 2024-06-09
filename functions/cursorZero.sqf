// Perform "Cursor Zero": untrack the TGP and center camera to boresight.

// untrack
turretPath = player call CBA_fnc_turretPath; 
_veh = vehicle player; 
_veh lockCameraTo [objNull, turretPath];  
_veh setPilotCameraTarget objNull;

// center camera
_veh setPilotCameraDirection [0,1,0];
true
