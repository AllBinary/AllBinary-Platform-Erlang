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
% package org.allbinary.android.input.api3
% import android.app.Activity
% import org.allbinary.android.input.VirtualKeyboard
% import org.allbinary.input.event.VirtualKeyboardEvent
% import org.allbinary.input.event.VirtualKeyboardEventHandler
% import org.allbinary.input.event.VirtualKeyboardEventListenerInterface
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings

-module('VirtualKeyboardAPI3').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements VirtualKeyboardEventListenerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('VirtualKeyboard', Function, Arguments).

static_init() ->
    put({?MODULE, 'MAX_API'}, get({'Integer', 'MAX_VALUE'})),
    put({?MODULE, 'MIN_API'}, 3),
    ok.

init_fields(This) ->
    put({This, virtualKeyboard}, false),
    put({This, activity}, undefined),
    put({This, showVirtualKeyboardRunnable}, undefined),
    put({This, hideVirtualKeyboardRunnable}, undefined),
    ok.


new(Activity) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Activity),
    This.

'$init'(This, Activity) ->
        'VirtualKeyboard':'$init'(This),
        init_fields(This),
        put({This, activity}, Activity),
        put({This, showVirtualKeyboardRunnable}, 'ShowVirtualKeyboardRunnable':new(get({This, activity}))),
        put({This, hideVirtualKeyboardRunnable}, 'HideVirtualKeyboardRunnable':new(get({This, activity}))),
        VirtualKeyboardEventHandler = 'VirtualKeyboardEventHandler':getInstance(),
        (get({VirtualKeyboardEventHandler, '$class'})):removeAllListeners(VirtualKeyboardEventHandler),
        (get({VirtualKeyboardEventHandler, '$class'})):addListenerInterface(VirtualKeyboardEventHandler, This).

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

onVirtualKeyboardEvent(This, VirtualKeyboardEvent) ->
        IsShow = (get({VirtualKeyboardEvent, '$class'})):getSource(VirtualKeyboardEvent),
        case (get({IsShow, '$class'})):booleanValue(IsShow) of
            true ->
            (get({This, '$class'})):showVirtualKeyboard(This);
            false ->
            (get({This, '$class'})):hideVirtualKeyboard(This)
        end.

forceHide(This) ->
        (get({This, '$class'})):hideVirtualKeyboard(This).

hide(This) ->
        case get({This, virtualKeyboard}) of
            true ->
            (get({This, '$class'})):forceHide(This);
            false -> ok
        end.

showVirtualKeyboard(This) ->
        (get({get({This, activity}), '$class'})):runOnUiThread(get({This, activity}), get({This, showVirtualKeyboardRunnable})),
        put({This, virtualKeyboard}, true).

hideVirtualKeyboard(This) ->
        (get({get({This, activity}), '$class'})):runOnUiThread(get({This, activity}), get({This, hideVirtualKeyboardRunnable})),
        put({This, virtualKeyboard}, false).

