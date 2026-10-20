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
% package org.allbinary.input.motion.button
% import org.allbinary.game.input.CompleteMotionGestureInputEvent
% import org.allbinary.game.input.CompleteMotionGestureInputEventHandler
% import org.allbinary.game.input.CompleteMotionGestureInputEventListenerInterface
% import org.allbinary.game.input.GameKey
% import org.allbinary.game.input.mapping.InputMappingInterface
% import org.allbinary.game.input.motion.action.GameKeyCompleteMotionGestureInputEvent
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.paint.ProcessPaintable
% import org.allbinary.input.motion.gesture.MotionGestureInput
% import org.allbinary.input.motion.gesture.TouchMotionGestureFactory
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.string.CommonStrings
% import org.allbinary.time.TimeDelayHelper

-module('TouchButtonsPaintableComposite').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CompleteMotionGestureInputEventListenerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('ProcessPaintable', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, inputMappingInterface}, undefined),
    put({This, touchButtonsPaintable}, undefined),
    put({This, timeHelper}, 'TimeDelayHelper':new(250)),
    put({This, released}, true),
    put({This, 'METHOD_NAME'}, "onCompleteMotionGestureInputEvent"),
    put({This, 'RELEASE'}, "Ignoring: MotionGestureInput Release"),
    put({This, 'FAST_REPEAT'}, "Ignoring: MotionGestureInput Repeated To Quickly"),
    put({This, 'IGNORE'}, "Ignoring: Until Released"),
    ok.


new(InputMappingInterface, BasicColor) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, InputMappingInterface, BasicColor),
    This.

'$init'(This, InputMappingInterface, BasicColor) ->
    'ProcessPaintable':'$init'(This),
    init_fields(This),
        put({This, inputMappingInterface}, InputMappingInterface),
        (fun(Target_N66467) -> (get({Target_N66467, '$class'})):addListenerInterface(Target_N66467, This) end)('CompleteMotionGestureInputEventHandler':getInstance()),
        put({This, touchButtonsPaintable}, 'TouchButtonsMappingPaintable':new(BasicColor)).

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

onCompleteMotionGestureInputEvent(This, CompleteMotionGestureInputEvent) ->
        try
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "onCompleteMotionGestureInputEvent"),
            TouchMotionGestureFactory = 'TouchMotionGestureFactory':getInstance(),
            GameKeyCompleteMotionGestureInputEvent = CompleteMotionGestureInputEvent,
            GameKey = (get({GameKeyCompleteMotionGestureInputEvent, '$class'})):getGameKey(GameKeyCompleteMotionGestureInputEvent),
            MotionGestureInput = (get({CompleteMotionGestureInputEvent, '$class'})):getMotionGestureInput(CompleteMotionGestureInputEvent),
            case (MotionGestureInput =:= get({TouchMotionGestureFactory, 'RELEASED'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({This, 'RELEASE'}), This, get({This, 'METHOD_NAME'})),
                put({This, released}, true),
                throw({'$return', ok});
                false -> ok
            end,
            case ((MotionGestureInput =:= get({'TouchMotionGestureFactory':getInstance(), 'NO_MOTION'})) andalso (not (get({get({This, timeHelper}), '$class'})):isTimeTNT(get({This, timeHelper})))) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({This, 'FAST_REPEAT'}), This, get({This, 'METHOD_NAME'})),
                throw({'$return', ok});
                false -> ok
            end,
            case (not get({This, released})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({This, 'IGNORE'}), This, get({This, 'METHOD_NAME'})),
                throw({'$return', ok});
                false -> ok
            end,
            put({This, released}, false),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67532) -> (get({Target_N67532, '$class'})):toString(Target_N67532) end)((fun(Target_N67539) -> (get({Target_N67539, '$class'})):append(Target_N67539, (fun(Target_N67636) -> (get({Target_N67636, '$class'})):toString(Target_N67636, MotionGestureInput) end)('StringUtil':getInstance())) end)((fun(Target_N67546) -> (get({Target_N67546, '$class'})):append(Target_N67546, " MotionGestureInput: ") end)((fun(Target_N67553) -> (get({Target_N67553, '$class'})):append(Target_N67553, (fun(Target_N67589) -> (get({Target_N67589, '$class'})):toString(Target_N67589, GameKey) end)('StringUtil':getInstance())) end)((fun(Target_N67560) -> (get({Target_N67560, '$class'})):append(Target_N67560, "GameKey: ") end)('StringMaker':new()))))), This, get({This, 'METHOD_NAME'})),
            (get({get({This, inputMappingInterface}), '$class'})):processInputMapping(get({This, inputMappingInterface}), GameKey, MotionGestureInput)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({This, 'METHOD_NAME'}), E)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

process(This) ->
        (fun(Target_N67900) -> (get({Target_N67900, '$class'})):removeListener(Target_N67900, This) end)('CompleteMotionGestureInputEventHandler':getInstance()).

