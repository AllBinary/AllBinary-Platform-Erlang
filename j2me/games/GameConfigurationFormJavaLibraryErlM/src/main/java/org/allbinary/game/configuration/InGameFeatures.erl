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
% package org.allbinary.game.configuration
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.GameFeatureChoiceGroups
% import org.allbinary.game.configuration.feature.InGameFeatureChoiceGroups
% import org.allbinary.game.configuration.feature.SensorFeatureFactory
% import org.allbinary.game.configuration.feature.TouchFeatureFactory
% import org.allbinary.init.Init
% import org.allbinary.input.gyro.OrientationData
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('InGameFeatures').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Init', Function, Arguments).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'Init':'$init'(This),
    init_fields(This).


init(This) ->
        LABEL = "Screen Buttons",
        OrientationData = 'OrientationData':getInstance(),
        ExclusiveOrientationSensorVector = (fun(Target_N65991) -> (get({Target_N65991, '$class'})):get(Target_N65991, get({OrientationData, 'ORIENTATION_SENSOR_INPUT'})) end)((fun(Target_N65998) -> (get({Target_N65998, '$class'})):get(Target_N65998) end)('GameFeatureChoiceGroups':getExclusiveInstance())),
        InGameFeatureChoiceGroups = 'InGameFeatureChoiceGroups':getExclusiveInstance(),
        case (ExclusiveOrientationSensorVector =/= undefined) of
            true ->
            InGameExclusiveOrientationSensorVectorCanBeNull = (fun(Target_N66171) -> (get({Target_N66171, '$class'})):get(Target_N66171, get({OrientationData, 'ORIENTATION_SENSOR_INPUT'})) end)((get({InGameFeatureChoiceGroups, '$class'})):get(InGameFeatureChoiceGroups)),
            case (InGameExclusiveOrientationSensorVectorCanBeNull =:= undefined) of
                true ->
                (get({This, '$class'})):addToInGameMenu(This);
                false ->
                InGameExclusiveOrientationSensorVector = InGameExclusiveOrientationSensorVectorCanBeNull,
                case ((get({InGameExclusiveOrientationSensorVector, '$class'})):size(InGameExclusiveOrientationSensorVector) =:= 0) of
                    true ->
                    (get({This, '$class'})):addToInGameMenu(This);
                    false -> ok
                end
            end;
            false -> ok
        end,
        Features = 'Features':getInstance(),
        case (((get({Features, '$class'})):isFeature(Features, get({'TouchFeatureFactory':getInstance(), 'SHOW_SCREEN_BUTTONS'})) orelse (get({Features, '$class'})):isFeature(Features, get({'TouchFeatureFactory':getInstance(), 'AUTO_HIDE_SHOW_SCREEN_BUTTONS'}))) orelse (get({Features, '$class'})):isFeature(Features, get({'TouchFeatureFactory':getInstance(), 'HIDE_SCREEN_BUTTONS'}))) of
            true ->
            ExclusiveScreenButtonsVector = 'BasicArrayListD':new(),
            TouchFeatureFactory = 'TouchFeatureFactory':getInstance(),
            (get({ExclusiveScreenButtonsVector, '$class'})):add(ExclusiveScreenButtonsVector, get({TouchFeatureFactory, 'AUTO_HIDE_SHOW_SCREEN_BUTTONS'})),
            (get({ExclusiveScreenButtonsVector, '$class'})):add(ExclusiveScreenButtonsVector, get({TouchFeatureFactory, 'SHOW_SCREEN_BUTTONS'})),
            (get({ExclusiveScreenButtonsVector, '$class'})):add(ExclusiveScreenButtonsVector, get({TouchFeatureFactory, 'HIDE_SCREEN_BUTTONS'})),
            (get({InGameFeatureChoiceGroups, '$class'})):add(InGameFeatureChoiceGroups, LABEL, ExclusiveScreenButtonsVector);
            false -> ok
        end.

addToInGameMenu(This) ->
        OrientationData = 'OrientationData':getInstance(),
        InGameExclusiveOrientationSensorVector = 'BasicArrayListD':new(),
        (get({InGameExclusiveOrientationSensorVector, '$class'})):add(InGameExclusiveOrientationSensorVector, get({'SensorFeatureFactory':getInstance(), 'ORIENTATION_SENSORS'})),
        (get({InGameExclusiveOrientationSensorVector, '$class'})):add(InGameExclusiveOrientationSensorVector, get({'SensorFeatureFactory':getInstance(), 'NO_ORIENTATION'})),
        (fun(Target_N67080) -> (get({Target_N67080, '$class'})):add(Target_N67080, get({OrientationData, 'ORIENTATION_SENSOR_INPUT'}), InGameExclusiveOrientationSensorVector) end)('InGameFeatureChoiceGroups':getExclusiveInstance()).

isAny(This) ->
        try
        Features = 'Features':getInstance(),
        TouchFeatureFactory = 'TouchFeatureFactory':getInstance(),
        case (((get({Features, '$class'})):isFeature(Features, get({TouchFeatureFactory, 'SHOW_SCREEN_BUTTONS'})) orelse (get({Features, '$class'})):isFeature(Features, get({TouchFeatureFactory, 'AUTO_HIDE_SHOW_SCREEN_BUTTONS'}))) orelse (get({Features, '$class'})):isFeature(Features, get({TouchFeatureFactory, 'HIDE_SCREEN_BUTTONS'}))) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        ExclusiveOrientationSensorVector = (fun(Target_N67412) -> (get({Target_N67412, '$class'})):get(Target_N67412, get({'OrientationData':getInstance(), 'ORIENTATION_SENSOR_INPUT'})) end)((fun(Target_N67419) -> (get({Target_N67419, '$class'})):get(Target_N67419) end)('GameFeatureChoiceGroups':getExclusiveInstance())),
        case (ExclusiveOrientationSensorVector =/= undefined) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

