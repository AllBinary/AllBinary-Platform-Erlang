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
% package org.allbinary.business.context.modules.storefront.statistics.orders.history
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.commerce.inventory.order.OrderHistoryInterface
% import org.allbinary.business.user.commerce.money.Money
% import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory
% import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityInterface
% import org.allbinary.logic.StdUtil

-module('StoreFrontOrdersHistoryStatistics').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements StoreFrontOrdersHistoryStatisticsInterface

init_fields(This) ->
    put({This, numberOfOrdersLong}, undefined),
    put({This, subTotalMoney}, undefined),
    put({This, shippingCostMoney}, undefined),
    put({This, taxesMoney}, undefined),
    put({This, totalMoney}, undefined),
    ok.


new(StoreFrontInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, StoreFrontInterface),
    This.

'$init'(This, StoreFrontInterface) ->
    init_fields(This),
        put({This, subTotalMoney}, 'Money':new()),
        put({This, shippingCostMoney}, 'Money':new()),
        put({This, taxesMoney}, 'Money':new()),
        put({This, totalMoney}, 'Money':new()),
        OrderHistoryEntityInterface = 'OrderHistoryEntityFactory':getInstance(),
        OrderHistoryInterfaceVector = (get({OrderHistoryEntityInterface, '$class'})):getStoreOrders(OrderHistoryEntityInterface, StoreFrontInterface),
        put({local, numberOfOrders}, 0),
        put({local, orderHistoryInterface}, undefined),
        Size = (get({OrderHistoryInterfaceVector, '$class'})):size(OrderHistoryInterfaceVector),
        lists:foreach(fun(Index) ->
            put({local, orderHistoryInterface}, (get({OrderHistoryInterfaceVector, '$class'})):get(OrderHistoryInterfaceVector, Index)),
            put({local, numberOfOrders}, (get({local, numberOfOrders}) + 1)),
            (get({get({This, subTotalMoney}), '$class'})):add(get({This, subTotalMoney}), (get({get({local, orderHistoryInterface}), '$class'})):getSubTotal(get({local, orderHistoryInterface}))),
            (get({get({This, shippingCostMoney}), '$class'})):add(get({This, shippingCostMoney}), (get({get({local, orderHistoryInterface}), '$class'})):getShippingCost(get({local, orderHistoryInterface}))),
            (get({get({This, taxesMoney}), '$class'})):add(get({This, taxesMoney}), (get({get({local, orderHistoryInterface}), '$class'})):getTaxes(get({local, orderHistoryInterface}))),
            (get({get({This, totalMoney}), '$class'})):add(get({This, totalMoney}), (get({get({local, orderHistoryInterface}), '$class'})):getTotal(get({local, orderHistoryInterface})))
        end, lists:seq(0, Size - 1)),
        put({This, numberOfOrdersLong}, get({local, numberOfOrders})).

getNumberOfOrders(This) ->
        get({This, numberOfOrdersLong}).

getSubTotal(This) ->
        get({This, subTotalMoney}).

getShippingCost(This) ->
        get({This, shippingCostMoney}).

getTaxes(This) ->
        get({This, taxesMoney}).

getTotal(This) ->
        get({This, totalMoney}).

toHashMap(This) ->
        HashMap = (fun(Target_N67104) -> (get({Target_N67104, '$class'})):createHashMap(Target_N67104) end)('StdUtil':getInstance()),
        StoreFrontOrdersHistoryStatisticsData = 'StoreFrontOrdersHistoryStatisticsData':getInstance(),
        (get({HashMap, '$class'})):put(HashMap, get({StoreFrontOrdersHistoryStatisticsData, 'NUMBEROFORDERS'}), (fun(Target_N67223) -> (get({Target_N67223, '$class'})):toString(Target_N67223) end)((get({This, '$class'})):getNumberOfOrders(This))),
        (get({HashMap, '$class'})):put(HashMap, get({StoreFrontOrdersHistoryStatisticsData, 'SUBTOTAL'}), (fun(Target_N67281) -> (get({Target_N67281, '$class'})):toString(Target_N67281) end)((get({This, '$class'})):getSubTotal(This))),
        (get({HashMap, '$class'})):put(HashMap, get({StoreFrontOrdersHistoryStatisticsData, 'SHIPPINGCOST'}), (fun(Target_N67339) -> (get({Target_N67339, '$class'})):toString(Target_N67339) end)((get({This, '$class'})):getShippingCost(This))),
        (get({HashMap, '$class'})):put(HashMap, get({StoreFrontOrdersHistoryStatisticsData, 'TAXES'}), (fun(Target_N67397) -> (get({Target_N67397, '$class'})):toString(Target_N67397) end)((get({This, '$class'})):getTaxes(This))),
        (get({HashMap, '$class'})):put(HashMap, get({StoreFrontOrdersHistoryStatisticsData, 'TOTAL'}), (fun(Target_N67455) -> (get({Target_N67455, '$class'})):toString(Target_N67455) end)((get({This, '$class'})):getTotal(This))),
        HashMap.

toVector(This) ->
        undefined.

getKey(This) ->
        undefined.

