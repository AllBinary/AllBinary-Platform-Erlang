% Generated Code Do Not Modify
% package org.osgi.framework
% import java.util.Dictionary

-module('BundleContext').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getBundles(This) ->
    erlang:error({abstract_method, getBundles}).

% throws BundleException
installBundle(This, Location) when (is_list(Location) orelse Location =:= undefined) ->
    erlang:error({abstract_method, installBundle}).

registerService(This, Clazz, Service, Properties) when (is_list(Clazz) orelse Clazz =:= undefined) ->
    erlang:error({abstract_method, registerService}).

getService(This, Reference) ->
    erlang:error({abstract_method, getService}).

% throws InvalidSyntaxException
getServiceReferences(This, Clazz, Filter) when (is_list(Clazz) orelse Clazz =:= undefined), (is_list(Filter) orelse Filter =:= undefined) ->
    erlang:error({abstract_method, getServiceReferences}).

getServiceReference(This, Clazz) when (is_list(Clazz) orelse Clazz =:= undefined) ->
    erlang:error({abstract_method, getServiceReference}).

