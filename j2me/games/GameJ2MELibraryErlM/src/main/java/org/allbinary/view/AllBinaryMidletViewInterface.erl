% Generated Code Do Not Modify
% package org.allbinary.view
% import org.allbinary.game.configuration.event.GameInitializedListenerInterface
% import org.allbinary.game.midlet.DemoGameMidletEventListener
% import org.allbinary.midlet.MidletCompositeInterface

-module('AllBinaryMidletViewInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('MidletCompositeInterface', Function, Arguments).


onResume(This) ->
    erlang:error({abstract_method, onResume}).

onPause(This) ->
    erlang:error({abstract_method, onPause}).

onDestroy(This) ->
    erlang:error({abstract_method, onDestroy}).

