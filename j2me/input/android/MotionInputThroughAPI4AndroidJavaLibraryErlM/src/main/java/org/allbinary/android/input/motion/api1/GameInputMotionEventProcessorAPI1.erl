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
% package org.allbinary.android.input.motion.api1
% import android.view.MotionEvent
% import org.allbinary.android.input.motion.BaseGameInputMotionEventProcessor
% import org.allbinary.input.motion.AllMotionRecognizer
% import org.allbinary.input.motion.MotionRecognizer
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil

-module('GameInputMotionEventProcessorAPI1').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseGameInputMotionEventProcessor', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, motionRecognizer}, 'AllMotionRecognizer':new()),
    ok.


getInstance() ->
        case (get({'GameInputMotionEventProcessorAPI1', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'GameInputMotionEventProcessorAPI1', instance}, 'GameInputMotionEventProcessorAPI1':new());
            false -> ok
        end,
        get({'GameInputMotionEventProcessorAPI1', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'BaseGameInputMotionEventProcessor':init(This),
    init_fields(This),
        ok.

process(This, MotionEvent) ->
        try
            X = trunc((get({MotionEvent, '$class'})):getX(MotionEvent)),
            Y = trunc((get({MotionEvent, '$class'})):getY(MotionEvent)),
            Action = (get({MotionEvent, '$class'})):getAction(MotionEvent),
            case (Action =:= get({'MotionEvent', 'ACTION_DOWN'})) of
                true ->
                (get({get({This, motionRecognizer}), '$class'})):processStartMotionEvent(get({This, motionRecognizer}), X, Y, (get({MotionEvent, '$class'})):getDeviceId(MotionEvent), 0);
                false ->
                case ((Action =:= get({'MotionEvent', 'ACTION_UP'})) orelse (Action =:= get({'MotionEvent', 'ACTION_CANCEL'}))) of
                true ->
                (get({get({This, motionRecognizer}), '$class'})):processEndMotionEvent(get({This, motionRecognizer}), X, Y, (get({MotionEvent, '$class'})):getDeviceId(MotionEvent), 0);
                false ->
                case (Action =:= get({'MotionEvent', 'ACTION_MOVE'})) of
                true ->
                (get({get({This, motionRecognizer}), '$class'})):processDraggedMotionEvent(get({This, motionRecognizer}), X, Y, (get({MotionEvent, '$class'})):getDeviceId(MotionEvent), 0);
                false -> ok
            end
            end
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'PROCESS'}), E)
        end.

