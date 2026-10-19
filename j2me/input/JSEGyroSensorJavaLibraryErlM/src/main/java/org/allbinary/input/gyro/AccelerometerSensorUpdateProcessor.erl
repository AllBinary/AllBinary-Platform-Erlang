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
% package org.allbinary.input.gyro
% import org.allbinary.canvas.Processor
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.SensorFeatureFactory
% import org.allbinary.game.input.motion.action.NoCompleteMotionGestureInputEventListener
% import org.allbinary.game.input.motion.action.SingleKeyPressGameKeyFromMotionGestureEventListener
% import org.allbinary.input.accelerometer.AccelerometerSensorFactory

-module('AccelerometerSensorUpdateProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Processor', Function, Arguments).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'Processor':init(This),
    init_fields(This).


% throws Exception
process(This) ->
        SensorFeatureFactory = 'SensorFeatureFactory':getInstance(),
        case (fun(Target_N65853) -> (get({Target_N65853, '$class'})):isFeature(Target_N65853, get({SensorFeatureFactory, 'ORIENTATION_SENSORS'})) end)('Features':getInstance()) of
            true ->
            (fun(Target_N66132) -> (get({Target_N66132, '$class'})):setCompleteMotionGestureInputEventListener(Target_N66132, 'SingleKeyPressGameKeyFromMotionGestureEventListener':new()) end)('AccelerometerSensorFactory':getInstance());
            false ->
            case (fun(Target_N65899) -> (get({Target_N65899, '$class'})):isFeature(Target_N65899, get({SensorFeatureFactory, 'SIMULATED_ORIENTATION_SENSORS'})) end)('Features':getInstance()) of
            true ->
            (fun(Target_N66081) -> (get({Target_N66081, '$class'})):setCompleteMotionGestureInputEventListener(Target_N66081, 'SingleKeyPressGameKeyFromMotionGestureEventListener':new()) end)('AccelerometerSensorFactory':getInstance());
            false ->
            case (fun(Target_N65945) -> (get({Target_N65945, '$class'})):isFeature(Target_N65945, get({SensorFeatureFactory, 'NO_ORIENTATION'})) end)('Features':getInstance()) of
            true ->
            (fun(Target_N66026) -> (get({Target_N66026, '$class'})):setCompleteMotionGestureInputEventListener(Target_N66026, 'NoCompleteMotionGestureInputEventListener':getInstance()) end)('AccelerometerSensorFactory':getInstance());
            false ->
            erlang:error({'Exception', "Sensor Feature Not Set"})
        end
        end
        end.

