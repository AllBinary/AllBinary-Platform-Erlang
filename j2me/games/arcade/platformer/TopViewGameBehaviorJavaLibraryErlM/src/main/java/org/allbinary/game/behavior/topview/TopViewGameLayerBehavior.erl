% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package org.allbinary.game.behavior.topview
% import org.allbinary.game.layer.behavior.GameLayerBehavior
% import org.allbinary.game.physics.acceleration.BasicAccelerationProperties
% import org.allbinary.game.physics.velocity.VelocityProperties

-module('TopViewGameLayerBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GameLayerBehavior', Function, Arguments).

init_fields(This) ->
    put({This, maxGravityActionIndex}, 0),
    put({This, isJumpAction}, true),
    put({This, isJumpOver}, false),
    put({This, isFallingWithoutJumpAttempt}, false),
    put({This, gravityActionIndex}, 0),
    ok.


new(MaxGravityActionIndex) when is_integer(MaxGravityActionIndex) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, MaxGravityActionIndex),
    This.

'$init'(This, MaxGravityActionIndex) when is_integer(MaxGravityActionIndex) ->
    'GameLayerBehavior':'$init'(This),
    init_fields(This),
        put({This, maxGravityActionIndex}, MaxGravityActionIndex).

gravity(This) ->
        case (get({This, gravityActionIndex}) =:= 0) of
            true ->
            put({This, gravityActionIndex}, get({This, gravityActionIndex}) + 1),
            put({This, isFallingWithoutJumpAttempt}, true);
            false -> ok
        end.

land(This, VelocityProperties) ->
        (fun(Target_N66050) -> (get({Target_N66050, '$class'})):setint(Target_N66050, 0) end)((get({VelocityProperties, '$class'})):getVelocityYBasicDecimalP(VelocityProperties)),
        (get({This, '$class'})):landReset(This).

landReset(This) ->
        put({This, gravityActionIndex}, 0),
        put({This, isFallingWithoutJumpAttempt}, false),
        put({This, isJumpAction}, true),
        put({This, isJumpOver}, false).

up(This, VelocityProperties, Acceleration, JumpBehavior, AccelerationMultiplier) when is_integer(AccelerationMultiplier) ->
        case (not get({This, isJumpOver})) of
            true ->
            case (get({This, gravityActionIndex}) < get({This, maxGravityActionIndex})) of
                true ->
                Acceleration2 = ((-(get({Acceleration, '$class'})):getForward(Acceleration)) * AccelerationMultiplier),
                (fun(Target_N66406) -> (get({Target_N66406, '$class'})):addint(Target_N66406, Acceleration2) end)((get({VelocityProperties, '$class'})):getVelocityYBasicDecimalP(VelocityProperties)),
                (get({VelocityProperties, '$class'})):limitXYToForwardAndReverseMaxVelocity(VelocityProperties),
                put({This, gravityActionIndex}, get({This, gravityActionIndex}) + 1);
                false ->
                ok
            end;
            false ->
            ok
        end,
        case get({This, isJumpAction}) of
            true ->
            (get({JumpBehavior, '$class'})):process(JumpBehavior),
            put({This, isJumpAction}, false);
            false -> ok
        end.

inputFrames(This, VelocityProperties) ->
        case ((get({This, gravityActionIndex}) > 0) andalso ((fun(Target_N66721) -> (get({Target_N66721, '$class'})):getUnscaled(Target_N66721) end)((get({VelocityProperties, '$class'})):getVelocityYBasicDecimalP(VelocityProperties)) > 0)) of
            true ->
            put({This, isJumpOver}, true);
            false -> ok
        end.

