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
% package org.allbinary.physics.movement
% import org.allbinary.game.layer.AllBinaryGameLayer
% import org.allbinary.game.physics.velocity.VelocityProperties
% import org.allbinary.logic.math.BasicDecimal

-module('OscillateVelocityMovement').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicConstantVelocityMovement', Function, Arguments).

init_fields(This) ->
    put({This, oscillateMin}, 0),
    put({This, oscillateMax}, 0),
    put({This, oscillate}, 0),
    put({This, oscillatePositive}, false),
    ok.


new(SpeedBasicDecimal, OscillateMin, OscillateMax) when is_integer(OscillateMin), is_integer(OscillateMax) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, SpeedBasicDecimal, OscillateMin, OscillateMax),
    This.

init(This, SpeedBasicDecimal, OscillateMin, OscillateMax) when is_integer(OscillateMin), is_integer(OscillateMax) ->
        'BasicConstantVelocityMovement':init(This, SpeedBasicDecimal, 'VelocityProperties':new(trunc((get({SpeedBasicDecimal, '$class'})):getUnscaled(SpeedBasicDecimal)), trunc((get({SpeedBasicDecimal, '$class'})):getUnscaled(SpeedBasicDecimal)))),
        init_fields(This),
        put({This, oscillateMin}, OscillateMin),
        put({This, oscillateMax}, OscillateMax).

% throws Exception
process(This, Layer) ->
        'BasicConstantVelocityMovement':process(This, Layer),
        case (get({This, oscillate}) < get({This, oscillateMin})) of
            true ->
            put({This, oscillatePositive}, true);
            false ->
            case (get({This, oscillate}) > get({This, oscillateMax})) of
            true ->
            put({This, oscillatePositive}, false);
            false -> ok
        end
        end,
        case get({This, oscillatePositive}) of
            true ->
            put({This, oscillate}, get({This, oscillate}) + 1),
            (fun(Target_N66261) -> (get({Target_N66261, '$class'})):addint(Target_N66261, 2000) end)((fun(Target_N66268) -> (get({Target_N66268, '$class'})):getVelocityXBasicDecimalP(Target_N66268) end)((get({This, '$class'})):getVelocityProperties(This)));
            false ->
            put({This, oscillate}, get({This, oscillate}) - 1),
            (fun(Target_N66196) -> (get({Target_N66196, '$class'})):subtractint(Target_N66196, 2000) end)((fun(Target_N66203) -> (get({Target_N66203, '$class'})):getVelocityXBasicDecimalP(Target_N66203) end)((get({This, '$class'})):getVelocityProperties(This)))
        end.

