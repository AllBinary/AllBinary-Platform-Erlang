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
% import org.allbinary.data.generator.OrderIdGenerator
% import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntity
% import org.allbinary.data.tables.user.commerce.inventory.order.OrderItemsEntity

-module('OrderProcessorUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OrderProcessorUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'ORDER_PROCESSED'}, "Order Processed"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'OrderProcessorUtil', instance}).

% throws Exception
process(This, UserName, Order) when (is_list(UserName) orelse UserName =:= undefined) ->
        OrderItems = 'OrderItemsEntity':new(),
        OrderHistory = 'OrderHistoryEntity':new(),
        (get({Order, '$class'})):setId(Order, (fun(Target_N65980) -> (get({Target_N65980, '$class'})):getNext(Target_N65980) end)('OrderIdGenerator':new())),
        (get({OrderItems, '$class'})):insert(OrderItems, UserName, Order),
        (get({OrderHistory, '$class'})):insert(OrderHistory, UserName, Order),
        get({This, 'ORDER_PROCESSED'}).

