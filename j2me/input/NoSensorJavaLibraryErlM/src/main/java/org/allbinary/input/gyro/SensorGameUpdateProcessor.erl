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
% import org.allbinary.input.AllBinarySensor
% import org.allbinary.input.NoAllBinarySensor

-module('SensorGameUpdateProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, inputSensor}, 'NoAllBinarySensor':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


setInputSensor(This, InputSensor) ->
        put({This, inputSensor}, InputSensor).

getInputSensor(This) ->
        get({This, inputSensor}).

% throws Exception
process(This, AnyType) ->
        ok.

% throws Exception
sendNotifications(This, AnyType) ->
        ok.

isAnySensor(This) ->
        try
        case (get({This, inputSensor}) =:= 'NoAllBinarySensor':getInstance()) of
            true ->
            throw({'$return', false});
            false ->
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setNoSensors(This) ->
        (get({This, '$class'})):setInputSensor(This, 'NoAllBinarySensor':getInstance()).

