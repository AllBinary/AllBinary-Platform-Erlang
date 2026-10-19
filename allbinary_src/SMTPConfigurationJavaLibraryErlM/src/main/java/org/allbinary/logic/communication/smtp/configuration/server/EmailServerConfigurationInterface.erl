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
% package org.allbinary.logic.communication.smtp.configuration.server

-module('EmailServerConfigurationInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


setSmtpServer(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setSmtpServer}).

getSmtpServer(This) ->
    erlang:error({abstract_method, getSmtpServer}).

getAccountName(This) ->
    erlang:error({abstract_method, getAccountName}).

setAccountName(This, AccountName) when (is_list(AccountName) orelse AccountName =:= undefined) ->
    erlang:error({abstract_method, setAccountName}).

getPassword(This) ->
    erlang:error({abstract_method, getPassword}).

setPassword(This, Password) when (is_list(Password) orelse Password =:= undefined) ->
    erlang:error({abstract_method, setPassword}).

log(This) ->
    erlang:error({abstract_method, log}).

toString(This) ->
    erlang:error({abstract_method, toString}).

