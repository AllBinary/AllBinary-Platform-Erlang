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
% package org.allbinary.logic.communication.http.request.session
% import org.allbinary.business.user.commerce.inventory.order.OrderInterface
% import org.allbinary.business.user.role.UserRole

-module('WeblisketSessionInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


clear(This) ->
    erlang:error({abstract_method, clear}).

getAttempts(This) ->
    erlang:error({abstract_method, getAttempts}).

getAuthentication(This) ->
    erlang:error({abstract_method, getAuthentication}).

getCreationTime(This) ->
    erlang:error({abstract_method, getCreationTime}).

getId(This) ->
    erlang:error({abstract_method, getId}).

getLastAccessedTime(This) ->
    erlang:error({abstract_method, getLastAccessedTime}).

% throws Exception
getOrder(This) ->
    erlang:error({abstract_method, getOrder}).

getPassword(This) ->
    erlang:error({abstract_method, getPassword}).

getPaymentMethod(This) ->
    erlang:error({abstract_method, getPaymentMethod}).

% throws Exception
getRole(This) ->
    erlang:error({abstract_method, getRole}).

getStoreName(This) ->
    erlang:error({abstract_method, getStoreName}).

getTimeout(This) ->
    erlang:error({abstract_method, getTimeout}).

getUserName(This) ->
    erlang:error({abstract_method, getUserName}).

getWebAppPath(This) ->
    erlang:error({abstract_method, getWebAppPath}).

removeBasket(This) ->
    erlang:error({abstract_method, removeBasket}).

setAttempts(This, Value) ->
    erlang:error({abstract_method, setAttempts}).

setAuthenticated(This) ->
    erlang:error({abstract_method, setAuthenticated}).

setAuthenticated(This, Value) when is_boolean(Value) ->
    erlang:error({abstract_method, setAuthenticated}).

setPassword(This, Password) when (is_list(Password) orelse Password =:= undefined) ->
    erlang:error({abstract_method, setPassword}).

setPaymentMethod(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setPaymentMethod}).

setRole(This, ARole) ->
    erlang:error({abstract_method, setRole}).

setStoreName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setStoreName}).

setTimeout(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setTimeout}).

setUserName(This, UserName) when (is_list(UserName) orelse UserName =:= undefined) ->
    erlang:error({abstract_method, setUserName}).

