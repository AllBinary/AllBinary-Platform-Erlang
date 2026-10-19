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
% import javax.microedition.lcdui.Canvas
% import org.allbinary.ai.ArtificialIntelligence
% import org.allbinary.ai.ArtificialIntelligenceTransitionInterface
% import org.allbinary.animation.IndexedAnimation
% import org.allbinary.animation.RotationAnimationInterface
% import org.allbinary.animation.RotationAnimationInterfaceCompositeInterface
% import org.allbinary.game.ai.BasicAI
% import org.allbinary.game.input.GameInput
% import org.allbinary.game.physics.velocity.BasicVelocityProperties
% import org.allbinary.game.physics.velocity.VelocityInterface
% import org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.math.AngleIncrementInfo
% import org.allbinary.util.CircularIndexUtil

-module('HorizontaRotationManeuverAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ArtificialIntelligenceTransitionInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicAI', Function, Arguments).

init_fields(This) ->
    put({This, circularIndexUtil}, 'CircularIndexUtil':createInstanceAt(10, get({'Integer', 'MAX_VALUE'}))),
    put({This, currentSpeedDivisor}, 5),
    put({This, rotationAnimationInterface}, undefined),
    put({This, baseVelocityInterface}, undefined),
    put({This, velocityInterface}, undefined),
    ok.


new(OwnerLayerInterface, GameInput) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, OwnerLayerInterface, GameInput),
    This.

init(This, OwnerLayerInterface, GameInput) ->
        'BasicAI':init(This, OwnerLayerInterface, GameInput),
        init_fields(This),
        RotationAnimationInterfaceCompositeInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
        put({This, rotationAnimationInterface}, (get({RotationAnimationInterfaceCompositeInterface, '$class'})):getRotationAnimationInterface(RotationAnimationInterfaceCompositeInterface)),
        VelocityInterfaceCompositeInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
        put({This, baseVelocityInterface}, (get({VelocityInterfaceCompositeInterface, '$class'})):getVelocityProperties(VelocityInterfaceCompositeInterface)),
        put({This, velocityInterface}, get({This, baseVelocityInterface})),
        RotationAnimationInterface = get({This, rotationAnimationInterface}),
        AngleIncrementInfo = (fun(Target_N66609) -> (get({Target_N66609, '$class'})):getAngleIncrementInfo(Target_N66609) end)((get({RotationAnimationInterface, '$class'})):getAngleInfoP(RotationAnimationInterface)),
        (get({RotationAnimationInterfaceCompositeInterface, '$class'})):setFrame(RotationAnimationInterfaceCompositeInterface, (get({get({AngleIncrementInfo, 'RIGHT_FRAME'}), '$class'})):intValue(get({AngleIncrementInfo, 'RIGHT_FRAME'}))).

transition(This) ->
        RotationAnimationInterface = get({This, rotationAnimationInterface}),
        AngleIncrementInfo = (fun(Target_N66834) -> (get({Target_N66834, '$class'})):getAngleIncrementInfo(Target_N66834) end)((get({RotationAnimationInterface, '$class'})):getAngleInfoP(RotationAnimationInterface)),
        RotationAnimationInterfaceCompositeInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
        (get({RotationAnimationInterfaceCompositeInterface, '$class'})):setFrame(RotationAnimationInterfaceCompositeInterface, (get({get({AngleIncrementInfo, 'RIGHT_FRAME'}), '$class'})):intValue(get({AngleIncrementInfo, 'RIGHT_FRAME'}))),
        AllbinaryLayer = (get({This, '$class'})):getOwnerLayerInterface(This),
        (get({AllbinaryLayer, '$class'})):setPosition(AllbinaryLayer, (get({AllbinaryLayer, '$class'})):getXP(AllbinaryLayer), 1, (get({AllbinaryLayer, '$class'})):getZP(AllbinaryLayer)).

% throws Exception
processAI(This, AllBinaryLayerManager) ->
        RotationAnimationInterface = (get({This, rotationAnimationInterface})),
        AngleIncrementInfo = (fun(Target_N67206) -> (get({Target_N67206, '$class'})):getAngleIncrementInfo(Target_N67206) end)((get({RotationAnimationInterface, '$class'})):getAngleInfoP(RotationAnimationInterface)),
        Frame = (get({get({This, rotationAnimationInterface}), '$class'})):getFrame(get({This, rotationAnimationInterface})),
        OwnerLayerInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
        case ((((get({OwnerLayerInterface, '$class'})):getXP(OwnerLayerInterface) - (get({OwnerLayerInterface, '$class'})):getWidth(OwnerLayerInterface)) =< 0) andalso (Frame =:= (get({get({AngleIncrementInfo, 'LEFT_FRAME'}), '$class'})):intValue(get({AngleIncrementInfo, 'LEFT_FRAME'})))) of
            true ->
            (get({This, '$class'})):reverse(This),
            (get({This, '$class'})):drop(This);
            false -> ok
        end,
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        case ((((get({OwnerLayerInterface, '$class'})):getX2(OwnerLayerInterface) + (get({OwnerLayerInterface, '$class'})):getWidth(OwnerLayerInterface)) > (get({DisplayInfo, '$class'})):getLastWidth(DisplayInfo)) andalso (Frame =:= (get({get({AngleIncrementInfo, 'RIGHT_FRAME'}), '$class'})):intValue(get({AngleIncrementInfo, 'RIGHT_FRAME'})))) of
            true ->
            (get({This, '$class'})):reverse(This),
            (get({This, '$class'})):accelerate(This),
            (get({This, '$class'})):drop(This);
            false -> ok
        end,
        Index = (get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})),
        case (((Index rem get({This, currentSpeedDivisor})) =:= 0) andalso ((Index rem 2) =:= 0)) of
            true ->
            'BasicAI':processKeyAI(This, get({'Canvas', 'UP'})),
            (get({get({This, velocityInterface}), '$class'})):limitMaxXYVelocity(get({This, velocityInterface}), ((get({get({This, velocityInterface}), '$class'})):getMaxForwardVelocity(get({This, velocityInterface})) / get({This, currentSpeedDivisor})));
            false -> ok
        end,
        (get({get({This, circularIndexUtil}), '$class'})):next(get({This, circularIndexUtil})),
        case (Frame =:= (get({get({AngleIncrementInfo, 'LEFT_FRAME'}), '$class'})):intValue(get({AngleIncrementInfo, 'LEFT_FRAME'}))) of
            true ->
            'BasicAI':processKeyAI(This, get({'Canvas', 'KEY_NUM0'}));
            false ->
            case (Frame =:= (get({get({AngleIncrementInfo, 'RIGHT_FRAME'}), '$class'})):intValue(get({AngleIncrementInfo, 'RIGHT_FRAME'}))) of
            true ->
            'BasicAI':processKeyAI(This, get({'Canvas', 'KEY_POUND'}));
            false -> ok
        end
        end.

reverse(This) ->
        RotationAnimationInterface = get({This, rotationAnimationInterface}),
        AngleIncrementInfo = (fun(Target_N68234) -> (get({Target_N68234, '$class'})):getAngleIncrementInfo(Target_N68234) end)((get({RotationAnimationInterface, '$class'})):getAngleInfoP(RotationAnimationInterface)),
        Frame = (get({get({This, rotationAnimationInterface}), '$class'})):getFrame(get({This, rotationAnimationInterface})),
        case (Frame =:= (get({get({AngleIncrementInfo, 'LEFT_FRAME'}), '$class'})):intValue(get({AngleIncrementInfo, 'LEFT_FRAME'}))) of
            true ->
            put({local, rotationAnimationInterfaceCompositeInterface}, (get({This, '$class'})):getOwnerLayerInterface(This)),
            (get({get({local, rotationAnimationInterfaceCompositeInterface}), '$class'})):setFrame(get({local, rotationAnimationInterfaceCompositeInterface}), (get({get({AngleIncrementInfo, 'RIGHT_FRAME'}), '$class'})):intValue(get({AngleIncrementInfo, 'RIGHT_FRAME'}))),
            (get({get({This, baseVelocityInterface}), '$class'})):zero(get({This, baseVelocityInterface}));
            false ->
            case (Frame =:= (get({get({AngleIncrementInfo, 'RIGHT_FRAME'}), '$class'})):intValue(get({AngleIncrementInfo, 'RIGHT_FRAME'}))) of
            true ->
            put({local, rotationAnimationInterfaceCompositeInterface}, (get({This, '$class'})):getOwnerLayerInterface(This)),
            (get({get({local, rotationAnimationInterfaceCompositeInterface}), '$class'})):setFrame(get({local, rotationAnimationInterfaceCompositeInterface}), (get({get({AngleIncrementInfo, 'LEFT_FRAME'}), '$class'})):intValue(get({AngleIncrementInfo, 'LEFT_FRAME'}))),
            (get({get({This, baseVelocityInterface}), '$class'})):zero(get({This, baseVelocityInterface}));
            false -> ok
        end
        end.

accelerate(This) ->
        case (get({This, currentSpeedDivisor}) > 1) of
            true ->
            put({This, currentSpeedDivisor}, get({This, currentSpeedDivisor}) - 1);
            false -> ok
        end.

drop(This) ->
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        OwnerLayerInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
        put({local, y}, (get({OwnerLayerInterface, '$class'})):getYP(OwnerLayerInterface)),
        case (((get({OwnerLayerInterface, '$class'})):getY2(OwnerLayerInterface) + (get({OwnerLayerInterface, '$class'})):getHeight(OwnerLayerInterface)) > (get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo)) of
            true ->
            put({local, y}, 0);
            false ->
            put({local, y}, (get({local, y}) + ((get({OwnerLayerInterface, '$class'})):getHeight(OwnerLayerInterface) + 1)))
        end,
        (get({OwnerLayerInterface, '$class'})):setPosition(OwnerLayerInterface, (get({OwnerLayerInterface, '$class'})):getXP(OwnerLayerInterface), get({local, y}), (get({OwnerLayerInterface, '$class'})):getZP(OwnerLayerInterface)).

getId(This) ->
        get({'ArtificialIntelligence', 'AI_ID'}).

