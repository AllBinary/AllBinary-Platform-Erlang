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
% package org.allbinary.input.accelerometer
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.SensorFeatureFactory
% import org.allbinary.input.gyro.AllBinaryOrientationSensor

-module('AccelerometerSensorFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, allBinaryAccelerometerSensor}, get({'AllBinaryOrientationSensor', 'NULL_ALLBINARY_ORIENTATION_SENSOR'})),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


% throws Exception
init() ->
        Features = 'Features':getInstance(),
        SensorFeatureFactory = 'SensorFeatureFactory':getInstance(),
        case (get({Features, '$class'})):isFeature(Features, get({SensorFeatureFactory, 'ORIENTATION_SENSORS'})) of
            true ->
            erlang:error({'Exception', "No Orientation Sensors"});
            false ->
            case (get({Features, '$class'})):isFeature(Features, get({SensorFeatureFactory, 'SIMULATED_ORIENTATION_SENSORS'})) of
            true ->
            erlang:error({'Exception', "No Simulation Sensors"});
            false ->
            case (get({Features, '$class'})):isFeature(Features, get({SensorFeatureFactory, 'NO_ORIENTATION'})) of
            true ->
            put({'AccelerometerSensorFactory', allBinaryAccelerometerSensor}, 'NoAccelerometerSensor':new());
            false ->
            erlang:error({'Exception', "Not Such SensorFeature"})
        end
        end
        end.

getInstance() ->
        get({'AccelerometerSensorFactory', allBinaryAccelerometerSensor}).

