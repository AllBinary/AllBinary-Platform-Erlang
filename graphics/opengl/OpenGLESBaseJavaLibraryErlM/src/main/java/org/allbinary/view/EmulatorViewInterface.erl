% Generated Code Do Not Modify
% package org.allbinary.view
% import javax.microedition.lcdui.Displayable
% import javax.microedition.midlet.MIDlet

-module('EmulatorViewInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


setMidlet(This, Midlet) ->
    erlang:error({abstract_method, setMidlet}).

onEmulatorInitComplete(This, MidletActivity) ->
    erlang:error({abstract_method, onEmulatorInitComplete}).

onSetDisplayable(This, Displayable) ->
    erlang:error({abstract_method, onSetDisplayable}).

