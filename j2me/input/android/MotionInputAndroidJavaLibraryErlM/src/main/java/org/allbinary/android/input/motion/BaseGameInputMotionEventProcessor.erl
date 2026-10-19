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
% import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler
% import org.allbinary.input.motion.gesture.observer.GameMotionGestureListener
% import org.allbinary.input.motion.gesture.observer.MotionGestureReceiveInterfaceFactory
% import org.allbinary.string.CommonStrings

-module('BaseGameInputMotionEventProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('MotionEventProcessor', Function, Arguments).

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, gameMotionGestureListener}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'MotionEventProcessor':init(This),
    init_fields(This),
        put({This, gameMotionGestureListener}, 'GameMotionGestureListener':new('MotionGestureReceiveInterfaceFactory':getInstance())),
        (get({This, '$class'})):addListener(This).

process(This, MotionEvent) ->
        ok.

addListener(This) ->
        MotionGesturesHandler = 'BasicMotionGesturesHandler':getInstance(),
        (get({MotionGesturesHandler, '$class'})):addListenerInterface(MotionGesturesHandler, get({This, gameMotionGestureListener})).

