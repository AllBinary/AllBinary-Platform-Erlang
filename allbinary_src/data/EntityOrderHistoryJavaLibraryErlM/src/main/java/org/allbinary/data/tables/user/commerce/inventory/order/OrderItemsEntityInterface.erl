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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.user.commerce.inventory.basket.BasketReview
% import org.allbinary.business.user.commerce.inventory.order.OrderInterface
% import org.allbinary.data.tables.BasicDataTableInterface

-module('OrderItemsEntityInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicDataTableInterface', Function, Arguments).


setStatus(This, OrderId, GroupId, Status) when (is_list(OrderId) orelse OrderId =:= undefined), (is_list(GroupId) orelse GroupId =:= undefined), (is_list(Status) orelse Status =:= undefined) ->
    erlang:error({abstract_method, setStatus}).

isEverythingShipped(This, OrderId) when (is_list(OrderId) orelse OrderId =:= undefined) ->
    erlang:error({abstract_method, isEverythingShipped}).

getBasketReview(This, OrderId) when (is_list(OrderId) orelse OrderId =:= undefined) ->
    erlang:error({abstract_method, getBasketReview}).

insert(This, UserName, Order) when (is_list(UserName) orelse UserName =:= undefined) ->
    erlang:error({abstract_method, insert}).

insert(This, Values) ->
    erlang:error({abstract_method, insert}).

