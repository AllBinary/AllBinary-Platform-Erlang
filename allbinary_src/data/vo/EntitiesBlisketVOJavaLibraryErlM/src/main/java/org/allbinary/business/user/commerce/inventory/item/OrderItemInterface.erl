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
% package org.allbinary.business.user.commerce.inventory.item
% import org.allbinary.business.user.address.StreetAddress

-module('OrderItemInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('ItemInterface', Function, Arguments).


setGroup(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setGroup}).

setTax(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setTax}).

setShippingType(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setShippingType}).

setShippingCost(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setShippingCost}).

setShippingAddress(This, Value) ->
    erlang:error({abstract_method, setShippingAddress}).

setSpecial(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setSpecial}).

getGroup(This) ->
    erlang:error({abstract_method, getGroup}).

getTax(This) ->
    erlang:error({abstract_method, getTax}).

getShippingType(This) ->
    erlang:error({abstract_method, getShippingType}).

getShippingCost(This) ->
    erlang:error({abstract_method, getShippingCost}).

getShippingAddress(This) ->
    erlang:error({abstract_method, getShippingAddress}).

getSpecial(This) ->
    erlang:error({abstract_method, getSpecial}).

