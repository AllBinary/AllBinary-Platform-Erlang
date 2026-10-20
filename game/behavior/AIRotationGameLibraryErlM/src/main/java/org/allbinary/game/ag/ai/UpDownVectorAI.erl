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
% import org.allbinary.game.ai.BasicAI
% import org.allbinary.game.input.GameInput
% import org.allbinary.game.physics.velocity.BasicVelocityProperties
% import org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.math.BasicDecimal

-module('UpDownVectorAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicAI', Function, Arguments).

init_fields(This) ->
    put({This, velocityInterface}, undefined),
    put({This, index}, 0),
    ok.


new(OwnerLayerInterface, GameInput) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, OwnerLayerInterface, GameInput),
    This.

'$init'(This, OwnerLayerInterface, GameInput) ->
        'BasicAI':'$init'(This, OwnerLayerInterface, GameInput),
        init_fields(This),
        VelocityInterfaceCompositeInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
        put({This, velocityInterface}, (get({VelocityInterfaceCompositeInterface, '$class'})):getVelocityProperties(VelocityInterfaceCompositeInterface)),
        (fun(Target_N66005) -> (get({Target_N66005, '$class'})):setint(Target_N66005, 0) end)((get({get({This, velocityInterface}), '$class'})):getVelocityYBasicDecimalP(get({This, velocityInterface}))).

% throws Exception
processAI(This, AllBinaryLayerManager) ->
        Y = ((fun(Target_N66146) -> (get({Target_N66146, '$class'})):getHeight(Target_N66146) end)((get({This, '$class'})):getOwnerLayerInterface(This)) * 270),
        case (get({This, index}) < 5) of
            true ->
            put({local, basicDecimal}, (get({get({This, velocityInterface}), '$class'})):getVelocityYBasicDecimalP(get({This, velocityInterface}))),
            (get({get({local, basicDecimal}), '$class'})):setint(get({local, basicDecimal}), 0),
            (get({get({local, basicDecimal}), '$class'})):addint(get({local, basicDecimal}), Y),
            put({This, index}, get({This, index}) + 1);
            false ->
            case (get({This, index}) < 10) of
            true ->
            put({local, basicDecimal}, (get({get({This, velocityInterface}), '$class'})):getVelocityYBasicDecimalP(get({This, velocityInterface}))),
            (get({get({local, basicDecimal}), '$class'})):setint(get({local, basicDecimal}), 0),
            (get({get({local, basicDecimal}), '$class'})):subtractint(get({local, basicDecimal}), Y),
            put({This, index}, get({This, index}) + 1);
            false ->
            put({This, index}, 0),
            (get({This, '$class'})):processAI(This, AllBinaryLayerManager)
        end
        end.

