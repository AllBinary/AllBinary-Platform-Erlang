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
% import java.util.ListIterator
% import java.util.Set
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.init.db.HistoryDbInitInfo
% import org.allbinary.logic.StdUtil
% import org.allbinary.business.user.UserData
% import org.allbinary.business.user.address.ShippingAddressData
% import org.allbinary.business.user.commerce.inventory.basket.BasketInterface
% import org.allbinary.business.user.commerce.inventory.basket.BasketReview
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.business.user.commerce.inventory.item.Item
% import org.allbinary.business.user.commerce.inventory.item.ItemInterface
% import org.allbinary.business.user.commerce.inventory.order.OrderData
% import org.allbinary.business.user.commerce.inventory.order.OrderHistoryData
% import org.allbinary.business.user.commerce.inventory.order.OrderInterface
% import org.allbinary.business.user.commerce.shipping.ShippingMethodData
% import org.allbinary.data.generator.OrderItemIdGenerator
% import org.allbinary.data.tables.TableDataFactory
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('OrderItemsEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements OrderItemsEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    put({This, tableName}, "orderitems"),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'AbSqlBean':init(This, 'HistoryDbInitInfo':new()),
        init_fields(This),
        (get({This, '$class'})):setTableName(This, get({This, tableName})).

insert(This, UserName, Order) when (is_list(UserName) orelse UserName =:= undefined) ->
        put({local, vector}, 'BasicArrayListD':new()),
        try
            Basket = (get({Order, '$class'})):getBasket(Order),
            Items = (get({Basket, '$class'})):getIds(Basket),
            ZERO_STRING = get({'TableDataFactory':getInstance(), 'ZERO_STRING'}),
            EMPTY_STRING = get({'StringUtil':getInstance(), 'EMPTY_STRING'}),
            InventoryEntity = (fun(Target_N67101) -> (get({Target_N67101, '$class'})):getInventoryEntityInstance(Target_N67101) end)('InventoryEntityFactory':getInstance()),
            ItemsArray = (get({Items, '$class'})):toArray(Items),
            ItemsSize = array:size(ItemsArray),
            lists:foreach(fun(I) ->
                Item = array:get(I, ItemsArray),
                ItemInterface = (get({InventoryEntity, '$class'})):getItem(InventoryEntity, Item),
                put({local, vector}, 'BasicArrayListD':new()),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (fun(Target_N67402) -> (get({Target_N67402, '$class'})):getNext(Target_N67402) end)('OrderItemIdGenerator':new())),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (get({Order, '$class'})):getId(Order)),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), get({'TableDataFactory':getInstance(), 'INTEGER_MAX_VALUE_STRING'})),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), UserName),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (get({Order, '$class'})):getStoreName(Order)),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (get({ItemInterface, '$class'})):getId(ItemInterface)),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (fun(Target_N67644) -> (get({Target_N67644, '$class'})):toString(Target_N67644) end)((get({Basket, '$class'})):getNumberOf(Basket, Item))),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (get({ItemInterface, '$class'})):getNewOrUsed(ItemInterface)),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (get({ItemInterface, '$class'})):getSummary(ItemInterface)),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (get({ItemInterface, '$class'})):getDistributor(ItemInterface)),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (get({ItemInterface, '$class'})):getIdUsedByDistributor(ItemInterface)),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (get({ItemInterface, '$class'})):getProducedBy(ItemInterface)),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (get({ItemInterface, '$class'})):getProductionDate(ItemInterface)),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (get({ItemInterface, '$class'})):getStartProductionDate(ItemInterface)),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (get({ItemInterface, '$class'})):getDescription(ItemInterface)),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (get({ItemInterface, '$class'})):getKeywords(ItemInterface)),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (get({ItemInterface, '$class'})):getCategory(ItemInterface)),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (get({ItemInterface, '$class'})):getType(ItemInterface)),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (get({ItemInterface, '$class'})):getSmallImage(ItemInterface)),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (get({ItemInterface, '$class'})):getMediumImage(ItemInterface)),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (get({ItemInterface, '$class'})):getLargeImage(ItemInterface)),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (get({ItemInterface, '$class'})):getWeight(ItemInterface)),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (fun(Target_N68287) -> (get({Target_N68287, '$class'})):toString(Target_N68287) end)((get({ItemInterface, '$class'})):getPrice(ItemInterface))),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (get({ItemInterface, '$class'})):getComment(ItemInterface)),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (get({ItemInterface, '$class'})):getCustoms(ItemInterface)),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), (get({ItemInterface, '$class'})):getDownloads(ItemInterface)),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), EMPTY_STRING),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), EMPTY_STRING),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), EMPTY_STRING),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), EMPTY_STRING),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), EMPTY_STRING),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), EMPTY_STRING),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), EMPTY_STRING),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), EMPTY_STRING),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), EMPTY_STRING),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), EMPTY_STRING),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), EMPTY_STRING),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), EMPTY_STRING),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), EMPTY_STRING),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), ZERO_STRING),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), ZERO_STRING),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), ZERO_STRING),
                (get({get({local, vector}), '$class'})):add(get({local, vector}), ZERO_STRING),
                (get({This, '$class'})):insert(This, get({local, vector}))
            end, lists:seq(0, ItemsSize - 1)),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Command Success Added: ", (get({Items, '$class'})):size(Items)]), This, get({'OrderItemsEntity', 'INSERT'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat(["Command Failed: ", (get({get({local, vector}), '$class'})):toString(get({local, vector}))]), This, get({'OrderItemsEntity', 'INSERT'}), E);
                false -> ok
            end
        end.

setStatus(This, OrderId, GroupId, Status) when (is_list(OrderId) orelse OrderId =:= undefined), (is_list(GroupId) orelse GroupId =:= undefined), (is_list(Status) orelse Status =:= undefined) ->
        try
            WhereHashMap = (fun(Target_N69645) -> (get({Target_N69645, '$class'})):createHashMap(Target_N69645) end)('StdUtil':getInstance()),
            UpdateHashMap = (fun(Target_N69696) -> (get({Target_N69696, '$class'})):createHashMap(Target_N69696) end)('StdUtil':getInstance()),
            (get({WhereHashMap, '$class'})):put(WhereHashMap, get({'OrderData', 'ID'}), OrderId),
            (get({WhereHashMap, '$class'})):put(WhereHashMap, get({'ShippingMethodData', 'GROUP'}), GroupId),
            (get({UpdateHashMap, '$class'})):put(UpdateHashMap, get({'OrderHistoryData', 'STATUS'}), Status),
            'AbSqlBean':updateWhere(This, WhereHashMap, UpdateHashMap)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "setStatus", E);
                false -> ok
            end
        end.

isEverythingShipped(This, OrderId) when (is_list(OrderId) orelse OrderId =:= undefined) ->
        try
        try
            ItemStatusVector = 'AbSqlBean':getColumnWhere(This, get({'OrderHistoryData', 'STATUS'}), get({'OrderData', 'ID'}), OrderId),
            Size = (get({ItemStatusVector, '$class'})):size(ItemStatusVector),
            lists:foreach(fun(Index) ->
                Status = (get({ItemStatusVector, '$class'})):get(ItemStatusVector, Index),
                case ((get({Status, '$class'})):compareTo(Status, get({'OrderHistoryData', 'SHIPPED'})) =/= 0) of
                    true ->
                    throw({'$return', false});
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "isEverythingShipped", E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getBasketReview(This, OrderId) when (is_list(OrderId) orelse OrderId =:= undefined) ->
        try
        try
            BasketReview = 'BasketReview':new(),
            KeyValues = (fun(Target_N70995) -> (get({Target_N70995, '$class'})):createHashMap(Target_N70995) end)('StdUtil':getInstance()),
            (get({KeyValues, '$class'})):put(KeyValues, get({'OrderData', 'ID'}), OrderId),
            Items = 'AbSqlBean':getRows(This, KeyValues),
            EntryData = 'EntryData':getInstance(),
            case ((Items =/= undefined) andalso ((get({Items, '$class'})):size(Items) > 0)) of
                true ->
                EMPTY_STRING = get({'StringUtil':getInstance(), 'EMPTY_STRING'}),
                ItemsArray = (get({Items, '$class'})):toArray(Items),
                ItemsSize = array:size(ItemsArray),
                lists:foreach(fun(I) ->
                    ItemHashMap = array:get(I, ItemsArray),
                    (get({ItemHashMap, '$class'})):put(ItemHashMap, get({get({This, basicItemData}), 'INBASKETS'}), EMPTY_STRING),
                    (get({ItemHashMap, '$class'})):put(ItemHashMap, get({EntryData, 'ENABLE'}), EMPTY_STRING),
                    (get({ItemHashMap, '$class'})):put(ItemHashMap, get({EntryData, 'TIMECREATED'}), EMPTY_STRING),
                    (get({ItemHashMap, '$class'})):put(ItemHashMap, get({EntryData, 'LASTMODIFIED'}), EMPTY_STRING),
                    (get({ItemHashMap, '$class'})):put(ItemHashMap, get({get({This, basicItemData}), 'GROUPS'}), EMPTY_STRING),
                    (get({ItemHashMap, '$class'})):put(ItemHashMap, get({get({This, basicItemData}), 'OPTIONS'}), EMPTY_STRING),
                    (get({ItemHashMap, '$class'})):put(ItemHashMap, get({get({This, basicItemData}), 'PERMISSIONS'}), EMPTY_STRING),
                    (get({ItemHashMap, '$class'})):put(ItemHashMap, get({get({This, basicItemData}), 'SPECIALS'}), EMPTY_STRING),
                    Item = 'Item':new(ItemHashMap),
                    (get({BasketReview, '$class'})):addItem(BasketReview, Item)
                end, lists:seq(0, ItemsSize - 1)),
                throw({'$return', BasketReview});
                false ->
                throw({'$return', undefined})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "getBasketReview", E);
                false -> ok
            end,
            undefined
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

createTableStatement(This) ->
        EntryData = 'EntryData':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "CREATE TABLE "),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, tableName})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " ("),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({EntryData, 'ID'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderData', 'ID'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'ShippingMethodData', 'GROUP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'UserData', 'USERNAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'StoreFrontData':getInstance(), 'NAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, basicItemData}), 'ID'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, basicItemData}), 'NUMBER'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, basicItemData}), 'NEWORUSED'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, basicItemData}), 'SUMMARY'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, basicItemData}), 'DISTRIBUTOR'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, basicItemData}), 'IDUSEDBYDISTRIBUTOR'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, basicItemData}), 'PRODUCEDBY'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, basicItemData}), 'PRODUCTIONDATE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, basicItemData}), 'STARTPRODUCTIONDATE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, basicItemData}), 'DESCRIPTION'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, basicItemData}), 'KEYWORDS'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, basicItemData}), 'CATEGORY'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, basicItemData}), 'TYPE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, basicItemData}), 'SMALLIMAGE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, basicItemData}), 'MEDIUMIMAGE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, basicItemData}), 'LARGEIMAGE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, basicItemData}), 'WEIGHT'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, basicItemData}), 'PRICE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " VARCHAR(20) NOT NULL,"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, basicItemData}), 'COMMENT'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, basicItemData}), 'CUSTOMS'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, basicItemData}), 'DOWNLOADS'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'ShippingMethodData', 'COST'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderHistoryData', 'TAX'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'ShippingAddressData', 'NAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'ShippingAddressData', 'STREET'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'ShippingAddressData', 'CITY'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'ShippingAddressData', 'STATE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'ShippingAddressData', 'CODE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'ShippingAddressData', 'COUNTRY'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'ShippingMethodData', 'NAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({EntryData, 'SPECIAL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " VARCHAR(255) ,"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderHistoryData', 'STATUS'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderHistoryData', 'CANCELINFO'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderHistoryData', 'CANCELTYPE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderHistoryData', 'SHIPPEDDATE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " BIGINT(19) UNSIGNED ,"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderHistoryData', 'ORDERDATE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderHistoryData', 'TRANSDATE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " BIGINT(19) UNSIGNED ,"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderHistoryData', 'CANCELDATE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " BIGINT(19) UNSIGNED ,"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "PRIMARY KEY("),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({EntryData, 'ID'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, ") )"),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)).

dropTable(This) ->
        'AbSqlBean':dropTable(This).

