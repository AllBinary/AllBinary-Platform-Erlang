% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.allbinary.android.activity
% import android.app.Activity
% import android.view.MotionEvent
% import android.view.View
% import org.allbinary.android.GenericMotionEventVerifyInterface
% import org.allbinary.game.configuration.event.GameFeatureEvent
% import org.allbinary.game.configuration.event.GameFeatureListenerInterface
% import org.allbinary.game.configuration.event.GameInitializedEvent
% import org.allbinary.game.configuration.event.GameInitializedListenerInterface
% import org.allbinary.logic.util.event.AllBinaryEventObject

-module('MidletActivityBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements GameFeatureListenerInterface
% implements GameInitializedListenerInterface
% implements SimpleProgressActivityInterface
% implements KeyInputViewCompositeInterface
% implements GenericMotionEventVerifyInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Activity', Function, Arguments).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'Activity':'$init'(This),
    init_fields(This).


onGameFeatureChange(This, GameFeatureEvent) ->
        ok.

onEvent(This, EventObject) ->
        ok.

onGameInitialized(This, GameInitializedEvent) ->
        ok.

% throws Exception
onSetProgress(This, Value, Text) when is_integer(Value), (is_list(Text) orelse Text =:= undefined) ->
        ok.

% throws Exception
onDismissProgress(This, AnimationSequence) when (is_tuple(AnimationSequence) orelse AnimationSequence =:= undefined) ->
        ok.

% throws Exception
onShowProgress(This, Indeterminate, AnimationSequence) when is_boolean(Indeterminate), (is_tuple(AnimationSequence) orelse AnimationSequence =:= undefined) ->
        ok.

getRootView(This) ->
        erlang:error({'RuntimeException'}).

getView(This) ->
        erlang:error({'RuntimeException'}).

setKeyInputView(This, KeyInputView) ->
        ok.

onGenericMotionEvent(This, Event) ->
        erlang:error({'RuntimeException'}).

