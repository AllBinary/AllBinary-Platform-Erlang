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
% package org.allbinary.input.motion.gesture.observer
% import org.allbinary.input.motion.gesture.MotionGestureInput
% import org.allbinary.input.motion.gesture.TouchMotionGestureFactory
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('GameMotionGestureListener').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements MotionGestureEventListener

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, motionGestureCollection}, 'BasicArrayListD':new()),
    put({This, touchGestureCollection}, 'BasicArrayListD':new()),
    put({This, signed}, undefined),
    ok.


new(Signed) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Signed),
    This.

init(This, Signed) ->
    init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        put({This, signed}, Signed).

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({get({This, commonStrings}), 'NOT_IMPLEMENTED'}), This).

onUpMotionGestureEvent(This, Ev) ->
        (get({This, '$class'})):onMotionGestureEvent(This, Ev).

onDownMotionGestureEvent(This, Ev) ->
        (get({This, '$class'})):onMotionGestureEvent(This, Ev).

onLeftMotionGestureEvent(This, Ev) ->
        (get({This, '$class'})):onMotionGestureEvent(This, Ev).

onRightMotionGestureEvent(This, Ev) ->
        (get({This, '$class'})):onMotionGestureEvent(This, Ev).

onDiagonalDownRightMotionGestureEvent(This, Ev) ->
        (get({This, '$class'})):onMotionGestureEvent(This, Ev).

onDiagonalDownLeftMotionGestureEvent(This, Ev) ->
        (get({This, '$class'})):onMotionGestureEvent(This, Ev).

onDiagonalUpRightMotionGestureEvent(This, Ev) ->
        (get({This, '$class'})):onMotionGestureEvent(This, Ev).

onDiagonalUpLeftMotionGestureEvent(This, Ev) ->
        (get({This, '$class'})):onMotionGestureEvent(This, Ev).

onPressedMotionGestureEvent(This, Ev) ->
        (get({get({This, touchGestureCollection}), '$class'})):add(get({This, touchGestureCollection}), (get({Ev, '$class'})):getMotionGesture(Ev)).

released(This, Ev) ->
        try
            (get({get({This, touchGestureCollection}), '$class'})):add(get({This, touchGestureCollection}), (get({Ev, '$class'})):getMotionGesture(Ev)),
            (get({get({This, signed}), '$class'})):onMotionGestureCompleted(get({This, signed}), get({This, touchGestureCollection})),
            (get({get({This, touchGestureCollection}), '$class'})):clear(get({This, touchGestureCollection}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonStrings}), 'EXCEPTION_LABEL'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N67366) -> (get({Target_N67366, '$class'})):toString(Target_N67366, (get({Ev, '$class'})):getMotionGesture(Ev)) end)('StringUtil':getInstance())),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "release", E)
        end.

onScrolledMotionGestureEvent(This, MotionGestureEvent) ->
        ok.

onMotionGestureEvent(This, Ev) ->
        try
            MotionGestureInput = (get({Ev, '$class'})):getMotionGesture(Ev),
            case (MotionGestureInput =:= get({'TouchMotionGestureFactory':getInstance(), 'PRESSED'})) of
                true ->
                (get({This, '$class'})):onPressedMotionGestureEvent(This, Ev);
                false ->
                case (MotionGestureInput =:= get({'TouchMotionGestureFactory':getInstance(), 'RELEASED'})) of
                true ->
                (get({This, '$class'})):released(This, Ev);
                false ->
                (get({get({This, motionGestureCollection}), '$class'})):add(get({This, motionGestureCollection}), MotionGestureInput),
                (get({get({This, signed}), '$class'})):onMotionGestureCompleted(get({This, signed}), get({This, motionGestureCollection})),
                (get({get({This, motionGestureCollection}), '$class'})):clear(get({This, motionGestureCollection})),
                (get({get({This, touchGestureCollection}), '$class'})):clear(get({This, touchGestureCollection}))
            end
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonStrings}), 'EXCEPTION_LABEL'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N68035) -> (get({Target_N68035, '$class'})):toString(Target_N68035, (get({Ev, '$class'})):getMotionGesture(Ev)) end)('StringUtil':getInstance())),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "onMotionGestureEvent", E)
        end.

