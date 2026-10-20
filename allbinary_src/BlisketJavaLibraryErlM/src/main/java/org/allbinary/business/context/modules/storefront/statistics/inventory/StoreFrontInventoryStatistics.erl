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
% package org.allbinary.business.context.modules.storefront.statistics.inventory
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.commerce.inventory.item.ItemInterface
% import org.allbinary.business.user.commerce.money.Money
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityInterface
% import org.allbinary.logic.StdUtil

-module('StoreFrontInventoryStatistics').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements StoreFrontInventoryStatisticsInterface

init_fields(This) ->
    put({This, totalNumberOfItems}, 0),
    put({This, totalInventorySaleValueMoney}, undefined),
    ok.


new(StoreFrontInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, StoreFrontInterface),
    This.

'$init'(This, StoreFrontInterface) ->
    init_fields(This),
        put({This, totalInventorySaleValueMoney}, 'Money':new()),
        InventoryEntityInterface = (fun(Target_N66041) -> (get({Target_N66041, '$class'})):getInventoryEntityInstance(Target_N66041) end)('InventoryEntityFactory':getInstance()),
        ItemVector = (get({InventoryEntityInterface, '$class'})):getItems(InventoryEntityInterface, StoreFrontInterface),
        Size = (get({ItemVector, '$class'})):size(ItemVector),
        lists:foreach(fun(Index) ->
            ItemInterface = (get({ItemVector, '$class'})):get(ItemVector, Index),
            NumberInStock = (fun(Target_N66266) -> (get({Target_N66266, '$class'})):intValue(Target_N66266) end)(allbinary_java:to_string((get({ItemInterface, '$class'})):getNumber(ItemInterface))),
            put({This, totalNumberOfItems}, (get({This, totalNumberOfItems}) + NumberInStock)),
            ItemPriceMoney = (get({ItemInterface, '$class'})):getPrice(ItemInterface),
            (get({ItemPriceMoney, '$class'})):multiply(ItemPriceMoney, NumberInStock),
            (get({get({This, totalInventorySaleValueMoney}), '$class'})):add(get({This, totalInventorySaleValueMoney}), (get({ItemPriceMoney, '$class'})):toString(ItemPriceMoney))
        end, lists:seq(0, Size - 1)).

getNumber(This) ->
        get({This, totalNumberOfItems}).

getTotal(This) ->
        get({This, totalInventorySaleValueMoney}).

toHashMap(This) ->
        HashMap = (fun(Target_N66716) -> (get({Target_N66716, '$class'})):createHashMap(Target_N66716) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'StoreFrontInventoryStatisticsData':getInstance(), 'NUMBEROFITEMS'}), (fun(Target_N66800) -> (get({Target_N66800, '$class'})):toString(Target_N66800) end)((get({This, '$class'})):getNumber(This))),
        (get({HashMap, '$class'})):put(HashMap, get({'StoreFrontInventoryStatisticsData':getInstance(), 'TOTALVALUE'}), (fun(Target_N66866) -> (get({Target_N66866, '$class'})):toString(Target_N66866) end)((get({This, '$class'})):getTotal(This))),
        HashMap.

toVector(This) ->
        undefined.

getKey(This) ->
        undefined.

