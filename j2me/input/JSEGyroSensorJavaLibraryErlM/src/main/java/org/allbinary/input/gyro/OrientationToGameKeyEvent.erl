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
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.SensorFeatureFactory
% import org.allbinary.logic.math.Orientation

-module('OrientationToGameKeyEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, allBinaryGyroSensor}, undefined),
    put({This, 'MIN'}, 15),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        case (fun(Target_N65758) -> (get({Target_N65758, '$class'})):isFeature(Target_N65758, get({'SensorFeatureFactory':getInstance(), 'NO_ORIENTATION'})) end)('Features':getInstance()) of
            true ->
            put({This, allBinaryGyroSensor}, 'NoGyroSensor':new());
            false ->
            erlang:error({'Exception', "Not Such Feature"})
        end.

setAllBinaryGyroSensor(This, AllBinaryGyroSensor) ->
        put({This, allBinaryGyroSensor}, AllBinaryGyroSensor).

getAllBinaryGyroSensor(This) ->
        get({This, allBinaryGyroSensor}).

% throws Exception
process(This) ->
        ok.

% throws Exception
updateGameKeyEvents(This, Orientation, Yaw, Pitch, Roll) when is_integer(Yaw), is_integer(Pitch), is_integer(Roll) ->
        ok.

