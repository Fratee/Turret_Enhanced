// slew the camera to the HMD LOS

if (Fat_Lurch_HmdSlew) then
{	
	0 spawn {
		_HMDLos = screenToWorld [0.5,0.5];
		turretPath = player call CBA_fnc_turretPath;
		_veh = vehicle player;
		_tmpPos = "Land_PenBlack_F" createVehicle _HMDLos; 
		systemChat format["Turret Slewed to %1", mapgridposition _tmpPos];
		sleep 0.1; 
		_veh lockCameraTo [visiblePositionASL _tmpPos, turretPath]; 
		_veh setPilotCameraTarget (visiblePositionASL _tmpPos); 
		sleep 0.1; 
		deleteVehicle _tmpPos;
	}
}