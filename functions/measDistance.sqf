/*
Written by Erik Kofahl (Fat_Lurch) for TSOG
*/

params ["_veh"];

_p1 = screenToWorld [0.5,0.5];
p2 = [0,0,0];

hint "First location set. Slew to new position and select Measure";

_actionID = _veh addAction ["Measure", "p2 = screenToWorld [0.5,0.5]",nil, 0.9,false, true, "","([_this, _target] call fatlurch_fnc_isViewISR)"];

waitUntil {!(p2 isEqualTo [0,0,0])};

_veh removeAction _actionID;

_dist = round(_p1 distance2D p2);

_dir = round(_p1 getDir p2);

hint format["Distance: %1 meters (2D)\nHeading: %2°", _dist, _dir];

