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
% import org.allbinary.animation.IndexedAnimation
% import org.allbinary.animation.RotationAnimationInterface
% import org.allbinary.animation.RotationAnimationInterfaceCompositeInterface
% import org.allbinary.game.ag.ai.tactical.LurchAI
% import org.allbinary.game.input.GameInput
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.math.AngleIncrementInfo

-module('LurchRotationAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('LurchAI', Function, Arguments).

init_fields(This) ->
    put({This, rotationAnimationInterface}, undefined),
    ok.


new(OwnerLayerInterface, GameInput) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, OwnerLayerInterface, GameInput),
    This.

init(This, OwnerLayerInterface, GameInput) ->
        'LurchAI':init(This, OwnerLayerInterface, GameInput),
        init_fields(This),
        RotationAnimationInterfaceCompositeInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
        put({This, rotationAnimationInterface}, (get({RotationAnimationInterfaceCompositeInterface, '$class'})):getRotationAnimationInterface(RotationAnimationInterfaceCompositeInterface)),
        (get({This, '$class'})):update(This).

reverse(This) ->
        'LurchAI':reverse(This),
        (get({This, '$class'})):update(This).

update(This) ->
        case (get({This, currentRelativeAngle}) =:= 0) of
            true ->
            put({local, rotationAnimationInterface}, get({This, rotationAnimationInterface})),
            put({local, angleIncrementInfo}, (fun(Target_N66442) -> (get({Target_N66442, '$class'})):getAngleIncrementInfo(Target_N66442) end)((get({get({local, rotationAnimationInterface}), '$class'})):getAngleInfoP(get({local, rotationAnimationInterface})))),
            put({local, rotationAnimationInterfaceCompositeInterface}, (get({This, '$class'})):getOwnerLayerInterface(This)),
            (get({get({local, rotationAnimationInterfaceCompositeInterface}), '$class'})):setFrame(get({local, rotationAnimationInterfaceCompositeInterface}), (get({get({get({local, angleIncrementInfo}), 'RIGHT_FRAME'}), '$class'})):intValue(get({get({local, angleIncrementInfo}), 'RIGHT_FRAME'})));
            false ->
            case (get({This, currentRelativeAngle}) =:= 180) of
            true ->
            put({local, rotationAnimationInterface}, get({This, rotationAnimationInterface})),
            put({local, angleIncrementInfo}, (fun(Target_N66215) -> (get({Target_N66215, '$class'})):getAngleIncrementInfo(Target_N66215) end)((get({get({local, rotationAnimationInterface}), '$class'})):getAngleInfoP(get({local, rotationAnimationInterface})))),
            put({local, rotationAnimationInterfaceCompositeInterface}, (get({This, '$class'})):getOwnerLayerInterface(This)),
            (get({get({local, rotationAnimationInterfaceCompositeInterface}), '$class'})):setFrame(get({local, rotationAnimationInterfaceCompositeInterface}), (get({get({get({local, angleIncrementInfo}), 'LEFT_FRAME'}), '$class'})):intValue(get({get({local, angleIncrementInfo}), 'LEFT_FRAME'})));
            false -> ok
        end
        end.

