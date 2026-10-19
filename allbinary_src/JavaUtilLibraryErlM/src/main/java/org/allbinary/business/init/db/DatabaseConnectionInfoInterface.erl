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
% package org.allbinary.business.init.db

-module('DatabaseConnectionInfoInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getUrl(This) ->
    erlang:error({abstract_method, getUrl}).

getJdbcDriver(This) ->
    erlang:error({abstract_method, getJdbcDriver}).

getName(This) ->
    erlang:error({abstract_method, getName}).

getUserName(This) ->
    erlang:error({abstract_method, getUserName}).

getPassword(This) ->
    erlang:error({abstract_method, getPassword}).

getHost(This) ->
    erlang:error({abstract_method, getHost}).

getSchema(This) ->
    erlang:error({abstract_method, getSchema}).

getServer(This) ->
    erlang:error({abstract_method, getServer}).

getPort(This) ->
    erlang:error({abstract_method, getPort}).

setJdbcDriver(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setJdbcDriver}).

setName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setName}).

setUserName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setUserName}).

setPassword(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setPassword}).

setSchema(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setSchema}).

setServer(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setServer}).

setPort(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setPort}).

getUserNameKey(This) ->
    erlang:error({abstract_method, getUserNameKey}).

getPasswordKey(This) ->
    erlang:error({abstract_method, getPasswordKey}).

