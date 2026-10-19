% Generated Code Do Not Modify
% package org.osgi.framework

-module('Bundle').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getSymbolicName(This) ->
    erlang:error({abstract_method, getSymbolicName}).

% throws BundleException
start(This) ->
    erlang:error({abstract_method, start}).

% throws BundleException
start(This, Options) when is_integer(Options) ->
    erlang:error({abstract_method, start}).

