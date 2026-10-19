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
% package org.allbinary.input
% import org.allbinary.input.motion.AllMotionRecognizer
% import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler
% import org.allbinary.input.motion.gesture.observer.GameMotionGestureListener
% import org.allbinary.input.motion.gesture.observer.MotionGestureReceiveInterfaceFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('TouchJ2ME').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'DEVICE_ID'}, 0),
    put({This, motionRecognizer}, 'AllMotionRecognizer':new()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        MotionGesturesHandler = (fun(Target_N65937) -> (get({Target_N65937, '$class'})):getMotionGesturesHandler(Target_N65937) end)((get({get({This, motionRecognizer}), '$class'})):getMotionGestureRecognizer(get({This, motionRecognizer}))),
        (get({MotionGesturesHandler, '$class'})):addListenerInterface(MotionGesturesHandler, 'GameMotionGestureListener':new('MotionGestureReceiveInterfaceFactory':getInstance())).

pointerDragged(This, X, Y) when is_integer(X), is_integer(Y) ->
        try
            (get({get({This, motionRecognizer}), '$class'})):processDraggedMotionEvent(get({This, motionRecognizer}), X, Y, get({This, 'DEVICE_ID'}), 0)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "pointerDragged", E)
        end.

pointerPressed(This, X, Y) when is_integer(X), is_integer(Y) ->
        try
            (get({get({This, motionRecognizer}), '$class'})):processStartMotionEvent(get({This, motionRecognizer}), X, Y, get({This, 'DEVICE_ID'}), 0)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "pointerPressed", E)
        end.

pointerReleased(This, X, Y) when is_integer(X), is_integer(Y) ->
        try
            (get({get({This, motionRecognizer}), '$class'})):processEndMotionEvent(get({This, motionRecognizer}), X, Y, get({This, 'DEVICE_ID'}), 0)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "pointerReleased", E)
        end.

