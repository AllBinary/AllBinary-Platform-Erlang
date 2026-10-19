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
% package org.allbinary.logic.communication.ftp.configuration

-module('FtpConfigurationInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getServer(This) ->
    erlang:error({abstract_method, getServer}).

getPath(This) ->
    erlang:error({abstract_method, getPath}).

getUserName(This) ->
    erlang:error({abstract_method, getUserName}).

getPassword(This) ->
    erlang:error({abstract_method, getPassword}).

setServer(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setServer}).

setPath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setPath}).

setUserName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setUserName}).

setPassword(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setPassword}).

