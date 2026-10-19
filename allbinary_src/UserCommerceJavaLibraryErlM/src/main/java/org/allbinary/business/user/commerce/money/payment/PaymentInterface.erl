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
% package org.allbinary.business.user.commerce.money.payment

-module('PaymentInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


setName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setName}).

setType(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setType}).

setExpiration(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setExpiration}).

setNumber(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setNumber}).

getId(This) ->
    erlang:error({abstract_method, getId}).

getName(This) ->
    erlang:error({abstract_method, getName}).

getType(This) ->
    erlang:error({abstract_method, getType}).

getExpiration(This) ->
    erlang:error({abstract_method, getExpiration}).

getEncryption(This) ->
    erlang:error({abstract_method, getEncryption}).

getNumber(This) ->
    erlang:error({abstract_method, getNumber}).

getLastFour(This) ->
    erlang:error({abstract_method, getLastFour}).

isDefault(This) ->
    erlang:error({abstract_method, isDefault}).

