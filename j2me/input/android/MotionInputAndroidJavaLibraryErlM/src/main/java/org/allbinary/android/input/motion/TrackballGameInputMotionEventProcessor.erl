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
% package org.allbinary.android.input.motion
% import android.view.MotionEvent
% import org.allbinary.game.input.motion.action.SingleKeyPressGameKeyFromMotionGestureEventListener
% import org.allbinary.input.motion.trackball.action.DownTrackballInputToGameKeyEventAction
% import org.allbinary.input.motion.trackball.action.LeftTrackballInputToGameKeyEventAction
% import org.allbinary.input.motion.trackball.action.RightTrackballInputToGameKeyEventAction
% import org.allbinary.input.motion.trackball.action.UpTrackballInputToGameKeyEventAction
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('TrackballGameInputMotionEventProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('MotionEventProcessor', Function, Arguments).

static_init() ->
    put({?MODULE, 'PROCESSOR'}, 'TrackballGameInputMotionEventProcessor':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, listener}, 'SingleKeyPressGameKeyFromMotionGestureEventListener':new()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.


getInstance() ->
        get({'TrackballGameInputMotionEventProcessor', 'PROCESSOR'}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'MotionEventProcessor':'$init'(This),
    init_fields(This),
        ok.

process(This, MotionEvent) ->
        try
            X = (get({MotionEvent, '$class'})):getX(MotionEvent),
            Y = (get({MotionEvent, '$class'})):getY(MotionEvent),
            case (X < 0.0) of
                true ->
                (get({get({This, listener}), '$class'})):onCompleteMotionGestureInputEvent(get({This, listener}), 'LeftTrackballInputToGameKeyEventAction':getInstance());
                false ->
                case (X > 0.0) of
                true ->
                (get({get({This, listener}), '$class'})):onCompleteMotionGestureInputEvent(get({This, listener}), 'RightTrackballInputToGameKeyEventAction':getInstance());
                false -> ok
            end
            end,
            case (Y < 0.0) of
                true ->
                (get({get({This, listener}), '$class'})):onCompleteMotionGestureInputEvent(get({This, listener}), 'UpTrackballInputToGameKeyEventAction':getInstance());
                false ->
                case (Y > 0.0) of
                true ->
                (get({get({This, listener}), '$class'})):onCompleteMotionGestureInputEvent(get({This, listener}), 'DownTrackballInputToGameKeyEventAction':getInstance());
                false -> ok
            end
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'PROCESS'}), E)
        end.

