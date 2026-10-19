%
% AllBinary Open License Version 1
% Copyright (c) 2009 AllBinary
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
% package org.allbinary.android.input.motion.api5
% import android.view.MotionEvent
% import org.allbinary.android.input.motion.BaseGameInputMotionEventProcessor
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.displayable.ScalableListener
% import org.allbinary.input.motion.AllMotionRecognizer
% import org.allbinary.input.motion.MotionRecognizer
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.LogUtil

-module('GameInputMotionEventProcessorAPI5').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseGameInputMotionEventProcessor', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, displayInfo}, 'DisplayInfoSingleton':getInstance()),
    put({This, motionRecognizerArray}, undefined),
    put({This, 'TOTAL_MINUS_ONE'}, 0),
    ok.


getInstance() ->
        case (get({'GameInputMotionEventProcessorAPI5', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'GameInputMotionEventProcessorAPI5', instance}, 'GameInputMotionEventProcessorAPI5':new());
            false -> ok
        end,
        get({'GameInputMotionEventProcessorAPI5', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'BaseGameInputMotionEventProcessor':init(This),
    init_fields(This),
        Size = get({'GameInputMotionInfoAPI5':getInstance(), 'MAX_POINTERS'}),
        put({This, motionRecognizerArray}, array:new(Size, {default, undefined})),
        put({This, 'TOTAL_MINUS_ONE'}, Size),
        lists:foreach(fun(Index) ->
            put({This, motionRecognizerArray}, array:set(Index, 'AllMotionRecognizer':new(), get({This, motionRecognizerArray})))
        end, lists:seq(0, Size - 1)).

isValid(This, PointerId) when is_integer(PointerId) ->
        try
        case (PointerId > get({This, 'TOTAL_MINUS_ONE'})) of
            true ->
            Message = "Log that the pointer Ids are not what would be expected or Android has more than what I set my stuff to support pointerId: ",
            'ForcedLogUtil':log(lists:concat([Message, PointerId]), This),
            throw({'$return', false});
            false ->
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

process(This, MotionEvent) ->
        try
            Action = (get({MotionEvent, '$class'})):getAction(MotionEvent),
            put({local, total}, array:size(get({This, motionRecognizerArray}))),
            case (get({local, total}) > (get({MotionEvent, '$class'})):getPointerCount(MotionEvent)) of
                true ->
                put({local, total}, (get({MotionEvent, '$class'})):getPointerCount(MotionEvent));
                false ->
                Message = "Log that Android has more pointers than I have expected so increase it motionEvent.getPointerCount(): ",
                'ForcedLogUtil':log(lists:concat([Message, (get({MotionEvent, '$class'})):getPointerCount(MotionEvent)]), This)
            end,
            TotalMinusOne = (get({local, total}) - 1),
            case (Action =:= get({'MotionEvent', 'ACTION_DOWN'})) of
                true ->
                lists:foreach(fun(PointerIndex) ->
                    put({local, pointerId}, (get({MotionEvent, '$class'})):getPointerId(MotionEvent, PointerIndex)),
                    case (get({This, '$class'})):isValid(This, get({local, pointerId})) of
                        true ->
                        put({local, scalableListener}, (get({get({This, displayInfo}), '$class'})):getScalableListener(get({This, displayInfo}))),
                        put({local, x}, trunc((((((get({MotionEvent, '$class'})):getX(MotionEvent, PointerIndex) - (get({get({This, displayInfo}), '$class'})):getLeft(get({This, displayInfo})))) / (get({get({local, scalableListener}), '$class'})):getRatio(get({local, scalableListener}), (get({get({This, displayInfo}), '$class'})):getRatio(get({This, displayInfo}))))))),
                        put({local, y}, trunc((((((get({MotionEvent, '$class'})):getY(MotionEvent, PointerIndex) - (get({get({This, displayInfo}), '$class'})):getTop(get({This, displayInfo})))) / (get({get({local, scalableListener}), '$class'})):getRatio(get({local, scalableListener}), (get({get({This, displayInfo}), '$class'})):getRatio(get({This, displayInfo}))))))),
                        (fun(Target_N68779) -> (get({Target_N68779, '$class'})):processStartMotionEvent(Target_N68779, get({local, x}), get({local, y}), (get({MotionEvent, '$class'})):getDeviceId(MotionEvent), 0) end)(array:get(get({local, pointerId}), get({This, motionRecognizerArray})));
                        false -> ok
                    end
                end, lists:seq(TotalMinusOne, 0, -1));
                false ->
                case ((Action =:= get({'MotionEvent', 'ACTION_UP'})) orelse (Action =:= get({'MotionEvent', 'ACTION_CANCEL'}))) of
                true ->
                lists:foreach(fun(PointerIndex) ->
                    put({local, pointerId}, (get({MotionEvent, '$class'})):getPointerId(MotionEvent, PointerIndex)),
                    case (get({This, '$class'})):isValid(This, get({local, pointerId})) of
                        true ->
                        put({local, scalableListener}, (get({get({This, displayInfo}), '$class'})):getScalableListener(get({This, displayInfo}))),
                        put({local, x}, trunc((((((get({MotionEvent, '$class'})):getX(MotionEvent, PointerIndex) - (get({get({This, displayInfo}), '$class'})):getLeft(get({This, displayInfo})))) / (get({get({local, scalableListener}), '$class'})):getRatio(get({local, scalableListener}), (get({get({This, displayInfo}), '$class'})):getRatio(get({This, displayInfo}))))))),
                        put({local, y}, trunc((((((get({MotionEvent, '$class'})):getY(MotionEvent, PointerIndex) - (get({get({This, displayInfo}), '$class'})):getTop(get({This, displayInfo})))) / (get({get({local, scalableListener}), '$class'})):getRatio(get({local, scalableListener}), (get({get({This, displayInfo}), '$class'})):getRatio(get({This, displayInfo}))))))),
                        (fun(Target_N68192) -> (get({Target_N68192, '$class'})):processEndMotionEvent(Target_N68192, get({local, x}), get({local, y}), (get({MotionEvent, '$class'})):getDeviceId(MotionEvent), 0) end)(array:get(get({local, pointerId}), get({This, motionRecognizerArray})));
                        false -> ok
                    end
                end, lists:seq(TotalMinusOne, 0, -1));
                false ->
                case (Action =:= get({'MotionEvent', 'ACTION_MOVE'})) of
                true ->
                lists:foreach(fun(PointerIndex) ->
                    put({local, pointerId}, (get({MotionEvent, '$class'})):getPointerId(MotionEvent, PointerIndex)),
                    case (get({This, '$class'})):isValid(This, get({local, pointerId})) of
                        true ->
                        put({local, scalableListener}, (get({get({This, displayInfo}), '$class'})):getScalableListener(get({This, displayInfo}))),
                        put({local, x}, trunc((((((get({MotionEvent, '$class'})):getX(MotionEvent, PointerIndex) - (get({get({This, displayInfo}), '$class'})):getLeft(get({This, displayInfo})))) / (get({get({local, scalableListener}), '$class'})):getRatio(get({local, scalableListener}), (get({get({This, displayInfo}), '$class'})):getRatio(get({This, displayInfo}))))))),
                        put({local, y}, trunc((((((get({MotionEvent, '$class'})):getY(MotionEvent, PointerIndex) - (get({get({This, displayInfo}), '$class'})):getTop(get({This, displayInfo})))) / (get({get({local, scalableListener}), '$class'})):getRatio(get({local, scalableListener}), (get({get({This, displayInfo}), '$class'})):getRatio(get({This, displayInfo}))))))),
                        (fun(Target_N67609) -> (get({Target_N67609, '$class'})):processDraggedMotionEvent(Target_N67609, get({local, x}), get({local, y}), (get({MotionEvent, '$class'})):getDeviceId(MotionEvent), 0) end)(array:get(get({local, pointerId}), get({This, motionRecognizerArray})));
                        false -> ok
                    end
                end, lists:seq(TotalMinusOne, 0, -1));
                false -> ok
            end
            end
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'PROCESS'}), E)
        end.

