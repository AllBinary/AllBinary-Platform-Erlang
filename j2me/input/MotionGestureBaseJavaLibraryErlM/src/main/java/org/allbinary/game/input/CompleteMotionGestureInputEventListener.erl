% Generated Code Do Not Modify
% package org.allbinary.game.input
% import org.allbinary.logic.util.event.AllBinaryEventObject

-module('CompleteMotionGestureInputEventListener').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CompleteMotionGestureInputEventListenerInterface

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


onEvent(This, EventObject) ->
        ok.

onCompleteMotionGestureInputEvent(This, CompleteMotionGestureInputEvent) ->
        ok.

