/*
Written by Erik Kofahl (Fat_Lurch) for TSOG
*/

if ((isNull getConnectedUAV player) && (player == vehicle player)) exitwith {};
if (isNull getConnectedUAV player) then
{
	target = vehicle player;
}
else
{
	target = getconnectedUAV player;
};

if(!([player, target] call fatlurch_fnc_isViewISR)) exitwith {};

0 spawn {
	scopeName "main";

	if (!(isNil "distanceMeasurementInProgress")) then
	{
		p2 = screenToWorld [0.5,0.5];
		breakOut "main";
	};

	distanceMeasurementInProgress = true;

	_p1 = screenToWorld [0.5,0.5];
	p2 = [0,0,0];

	systemChat "First location set. Slew to new position and select Measure";

	_actionID = target addAction ["Measure", "p2 = screenToWorld [0.5,0.5];",nil,-1000 - 8,false, true, "","([_this, _target] call fatlurch_fnc_isViewISR)"];

	waitUntil {!(p2 isEqualTo [0,0,0])};

	distanceMeasurementInProgress = Nil;

	target removeAction _actionID;

	_dist = round(_p1 distance2D p2);

	_dir = round(_p1 getDir p2);

	systemChat format["Distance: %1 meters (2D) - Heading: %2°", _dist, _dir];
}


