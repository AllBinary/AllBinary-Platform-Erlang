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
% package org.allbinary.game.ag.ai
% import org.allbinary.bounds.BoundsVisitorInterface
% import org.allbinary.game.physics.velocity.VelocityInterface
% import org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface
% import org.allbinary.layer.LayerInterface
% import org.allbinary.logic.communication.log.LogUtil

-module('ReverseVelocityBoundsVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements BoundsVisitorInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, velocityInterface}, undefined),
    put({This, layerInterface}, undefined),
    ok.


new(LayerInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, LayerInterface),
    This.

'$init'(This, LayerInterface) ->
    init_fields(This),
        put({This, layerInterface}, LayerInterface),
        VelocityInterfaceCompositeInterface = LayerInterface,
        put({This, velocityInterface}, (get({VelocityInterfaceCompositeInterface, '$class'})):getVelocityProperties(VelocityInterfaceCompositeInterface)).

getX(This) ->
        (get({get({This, layerInterface}), '$class'})):getXP(get({This, layerInterface})).

getY(This) ->
        (get({get({This, layerInterface}), '$class'})):getYP(get({This, layerInterface})).

minX(This) ->
        case ((fun(Target_N66180) -> (get({Target_N66180, '$class'})):getUnscaled(Target_N66180) end)((get({get({This, velocityInterface}), '$class'})):getVelocityXBasicDecimalP(get({This, velocityInterface}))) < 0) of
            true ->
            (fun(Target_N66215) -> (get({Target_N66215, '$class'})):multiplyint(Target_N66215, (-1)) end)((get({get({This, velocityInterface}), '$class'})):getVelocityXBasicDecimalP(get({This, velocityInterface})));
            false -> ok
        end.

maxX(This) ->
        case ((fun(Target_N66303) -> (get({Target_N66303, '$class'})):getUnscaled(Target_N66303) end)((get({get({This, velocityInterface}), '$class'})):getVelocityXBasicDecimalP(get({This, velocityInterface}))) > 0) of
            true ->
            (fun(Target_N66338) -> (get({Target_N66338, '$class'})):multiplyint(Target_N66338, (-1)) end)((get({get({This, velocityInterface}), '$class'})):getVelocityXBasicDecimalP(get({This, velocityInterface})));
            false -> ok
        end.

minY(This) ->
        case ((fun(Target_N66426) -> (get({Target_N66426, '$class'})):getUnscaled(Target_N66426) end)((get({get({This, velocityInterface}), '$class'})):getVelocityYBasicDecimalP(get({This, velocityInterface}))) < 0) of
            true ->
            (fun(Target_N66461) -> (get({Target_N66461, '$class'})):multiplyint(Target_N66461, (-1)) end)((get({get({This, velocityInterface}), '$class'})):getVelocityYBasicDecimalP(get({This, velocityInterface})));
            false -> ok
        end.

maxY(This) ->
        case ((fun(Target_N66549) -> (get({Target_N66549, '$class'})):getUnscaled(Target_N66549) end)((get({get({This, velocityInterface}), '$class'})):getVelocityYBasicDecimalP(get({This, velocityInterface}))) > 0) of
            true ->
            (fun(Target_N66584) -> (get({Target_N66584, '$class'})):multiplyint(Target_N66584, (-1)) end)((get({get({This, velocityInterface}), '$class'})):getVelocityYBasicDecimalP(get({This, velocityInterface})));
            false -> ok
        end.

