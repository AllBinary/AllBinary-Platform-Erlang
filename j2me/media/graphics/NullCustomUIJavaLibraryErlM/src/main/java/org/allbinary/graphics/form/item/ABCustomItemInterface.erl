% Generated Code Do Not Modify
% package org.allbinary.graphics.form.item
% import javax.microedition.lcdui.Graphics

-module('ABCustomItemInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getMinimumWidth(This) ->
    erlang:error({abstract_method, getMinimumWidth}).

getMinimumHeight(This) ->
    erlang:error({abstract_method, getMinimumHeight}).

getLabel(This) ->
    erlang:error({abstract_method, getLabel}).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
    erlang:error({abstract_method, paintXY}).

paintUnselected(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
    erlang:error({abstract_method, paintUnselected}).

