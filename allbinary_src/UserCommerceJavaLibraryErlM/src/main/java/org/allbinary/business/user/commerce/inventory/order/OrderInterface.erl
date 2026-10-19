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
% package org.allbinary.business.user.commerce.inventory.order
% import org.allbinary.business.user.commerce.inventory.basket.BasketInterface

-module('OrderInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


setShippingMethod(This, ShippingType) when (is_list(ShippingType) orelse ShippingType =:= undefined) ->
    erlang:error({abstract_method, setShippingMethod}).

setPaymentMethod(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setPaymentMethod}).

setSpecial(This, Special) when (is_list(Special) orelse Special =:= undefined) ->
    erlang:error({abstract_method, setSpecial}).

setStoreName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setStoreName}).

setUserComments(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setUserComments}).

setUserCancelComments(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setUserCancelComments}).

setStoreComments(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setStoreComments}).

setStoreCancelComments(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setStoreCancelComments}).

getBasket(This) ->
    erlang:error({abstract_method, getBasket}).

getShippingMethod(This) ->
    erlang:error({abstract_method, getShippingMethod}).

getPaymentMethod(This) ->
    erlang:error({abstract_method, getPaymentMethod}).

getSpecial(This) ->
    erlang:error({abstract_method, getSpecial}).

getId(This) ->
    erlang:error({abstract_method, getId}).

getStoreName(This) ->
    erlang:error({abstract_method, getStoreName}).

getUserComments(This) ->
    erlang:error({abstract_method, getUserComments}).

getUserCancelComments(This) ->
    erlang:error({abstract_method, getUserCancelComments}).

getStoreComments(This) ->
    erlang:error({abstract_method, getStoreComments}).

getStoreCancelComments(This) ->
    erlang:error({abstract_method, getStoreCancelComments}).

