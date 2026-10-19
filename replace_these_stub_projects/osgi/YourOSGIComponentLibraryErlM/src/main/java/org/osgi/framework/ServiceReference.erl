% Generated Code Do Not Modify
% package org.osgi.framework

-module('ServiceReference').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Comparable', Function, Arguments).


getProperty(This, Key) when (is_list(Key) orelse Key =:= undefined) ->
    erlang:error({abstract_method, getProperty}).

getPropertyKeys(This) ->
    erlang:error({abstract_method, getPropertyKeys}).

