%
% AllBinary Open License Version 1
% Copyright (c) 2011 AllBinary
% 
% By agreeing to this license you and any business entity you represent are
% legally bound to the AllBinary Open License Version 1 legal agreement.
% 
% You may obtain the AllBinary Open License Version 1 legal agreement from
% AllBinary or the root directory of AllBinary's AllBinary Platform repository.
% 
% Created By: Travis Berthelot
%  
% Generated Code Do Not Modify
% package org.allbinary.game.configuration.feature

-module('SensorFeatureFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'SensorFeatureFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'NO_ORIENTATION'}, 'SensorFeature':new("No Orientation")),
    put({This, 'ORIENTATION_SENSORS'}, 'SensorFeature':new("Orientation Sensors")),
    put({This, 'SIMULATED_ORIENTATION_SENSORS'}, 'SensorFeature':new("Simulated Orientation Sensors")),
    put({This, 'YAW'}, 'SensorFeature':new("Yaw")),
    put({This, 'YAW_MINUS_RIGHT_PLUS_LEFT'}, 'SensorFeature':new("Yaw -Right +Left")),
    put({This, 'YAW_MINUS_LEFT_PLUS_RIGHT'}, 'SensorFeature':new("Yaw -Left +Right ")),
    put({This, 'PITCH'}, 'SensorFeature':new("Pitch")),
    put({This, 'ROLL'}, 'SensorFeature':new("Roll")),
    ok.


getInstance() ->
        get({'SensorFeatureFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

