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
% import org.allbinary.business.user.address.StreetAddress
% import org.allbinary.business.user.commerce.money.Money
% import org.allbinary.business.user.commerce.money.payment.Payment

-module('OrderHistoryInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


setUserName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setUserName}).

setDefaultShippingAddress(This, ShippingAddress) ->
    erlang:error({abstract_method, setDefaultShippingAddress}).

setBillingAddress(This, BillingAddress) ->
    erlang:error({abstract_method, setBillingAddress}).

setPaymentInfo(This, Payment) ->
    erlang:error({abstract_method, setPaymentInfo}).

setShipDate(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setShipDate}).

setOrderDate(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setOrderDate}).

setTransDate(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setTransDate}).

setCancelDate(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setCancelDate}).

setStatus(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setStatus}).

setSubTotal(This, Value) ->
    erlang:error({abstract_method, setSubTotal}).

setShippingCost(This, Value) ->
    erlang:error({abstract_method, setShippingCost}).

setTaxes(This, Value) ->
    erlang:error({abstract_method, setTaxes}).

setTotal(This, Value) ->
    erlang:error({abstract_method, setTotal}).

getUserName(This) ->
    erlang:error({abstract_method, getUserName}).

getShippingAddress(This) ->
    erlang:error({abstract_method, getShippingAddress}).

getBillingAddress(This) ->
    erlang:error({abstract_method, getBillingAddress}).

getPaymentInfo(This) ->
    erlang:error({abstract_method, getPaymentInfo}).

getShipDate(This) ->
    erlang:error({abstract_method, getShipDate}).

getOrderDate(This) ->
    erlang:error({abstract_method, getOrderDate}).

getTransDate(This) ->
    erlang:error({abstract_method, getTransDate}).

getCancelDate(This) ->
    erlang:error({abstract_method, getCancelDate}).

getStatus(This) ->
    erlang:error({abstract_method, getStatus}).

getSubTotal(This) ->
    erlang:error({abstract_method, getSubTotal}).

getShippingCost(This) ->
    erlang:error({abstract_method, getShippingCost}).

getTaxes(This) ->
    erlang:error({abstract_method, getTaxes}).

getTotal(This) ->
    erlang:error({abstract_method, getTotal}).

getPaymentMethod(This) ->
    erlang:error({abstract_method, getPaymentMethod}).

