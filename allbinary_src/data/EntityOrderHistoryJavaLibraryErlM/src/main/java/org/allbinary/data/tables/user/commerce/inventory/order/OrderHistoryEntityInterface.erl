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
% package org.allbinary.data.tables.user.commerce.inventory.order
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.commerce.inventory.order.Order
% import org.allbinary.business.user.commerce.inventory.order.OrderHistory
% import org.allbinary.data.tables.BasicDataTableInterface

-module('OrderHistoryEntityInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicDataTableInterface', Function, Arguments).


insert(This, UserName, Order) when (is_list(UserName) orelse UserName =:= undefined) ->
    erlang:error({abstract_method, insert}).

setStatus(This, OrderId, Status) when (is_list(OrderId) orelse OrderId =:= undefined), (is_list(Status) orelse Status =:= undefined) ->
    erlang:error({abstract_method, setStatus}).

setPaymentMethod(This, OrderId, Status) when (is_list(OrderId) orelse OrderId =:= undefined), (is_list(Status) orelse Status =:= undefined) ->
    erlang:error({abstract_method, setPaymentMethod}).

% throws Exception
getStoreOrders(This, StoreFrontInterface) ->
    erlang:error({abstract_method, getStoreOrders}).

% throws Exception
getOrders(This, UserName) when (is_list(UserName) orelse UserName =:= undefined) ->
    erlang:error({abstract_method, getOrders}).

% throws Exception
getOrders(This, Status, FromDate, ToDate) when (is_list(Status) orelse Status =:= undefined), (is_list(FromDate) orelse FromDate =:= undefined), (is_list(ToDate) orelse ToDate =:= undefined) ->
    erlang:error({abstract_method, getOrders}).

% throws Exception
getOrder(This, Id) when (is_list(Id) orelse Id =:= undefined) ->
    erlang:error({abstract_method, getOrder}).

% throws Exception
update(This, WhereHashMap, OrderHashMap) ->
    erlang:error({abstract_method, update}).

