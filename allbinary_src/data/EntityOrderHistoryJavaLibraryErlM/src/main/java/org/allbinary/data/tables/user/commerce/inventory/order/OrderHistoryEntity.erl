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
% import java.util.Calendar
% import java.util.HashMap
% import java.util.Random
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.init.db.HistoryDbInitInfo
% import org.allbinary.business.user.UserData
% import org.allbinary.business.user.address.BillingAddressData
% import org.allbinary.business.user.address.ShippingAddressData
% import org.allbinary.business.user.address.StreetAddress
% import org.allbinary.business.user.commerce.inventory.basket.Basket
% import org.allbinary.business.user.commerce.inventory.basket.BasketInterface
% import org.allbinary.business.user.commerce.inventory.order.Order
% import org.allbinary.business.user.commerce.inventory.order.OrderData
% import org.allbinary.business.user.commerce.inventory.order.OrderHistory
% import org.allbinary.business.user.commerce.inventory.order.OrderHistoryData
% import org.allbinary.business.user.commerce.money.Money
% import org.allbinary.business.user.commerce.money.payment.PaymentData
% import org.allbinary.business.user.commerce.money.payment.PaymentInterface
% import org.allbinary.business.user.commerce.money.tax.TaxFactory
% import org.allbinary.business.user.commerce.shipping.ShippingMethodData
% import org.allbinary.business.user.commerce.shipping.ShippingMethods
% import org.allbinary.business.user.commerce.shipping.modules.ShippingInterface
% import org.allbinary.data.generator.OrderHistoryIdGenerator
% import org.allbinary.data.tables.TableDataFactory
% import org.allbinary.data.tables.user.address.billing.BillingAddressesEntity
% import org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntity
% import org.allbinary.data.tables.user.commerce.money.payment.PaymentEntity
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.control.crypt.SuperCrypt
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory

-module('OrderHistoryEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements OrderHistoryEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, tableName}, "orderhistory"),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'AbSqlBean':'$init'(This, 'HistoryDbInitInfo':new()),
        init_fields(This),
        (get({This, '$class'})):setTableName(This, get({This, tableName})).

insert(This, UserName, Order) when (is_list(UserName) orelse UserName =:= undefined) ->
        Vector = 'BasicArrayListD':new(),
        try
            PaymentInterface = (fun(Target_N67334) -> (get({Target_N67334, '$class'})):getDefault(Target_N67334, UserName) end)('PaymentEntity':new()),
            BillingAddress = (fun(Target_N67399) -> (get({Target_N67399, '$class'})):getDefault(Target_N67399) end)('BillingAddressesEntity':new(UserName)),
            ShippingAddress = (fun(Target_N67464) -> (get({Target_N67464, '$class'})):getDefault(Target_N67464) end)('ShippingAddressesEntity':new(UserName)),
            AbeClientInformation = 'ServiceClientInformationInterfaceFactory':getInstance(),
            StoreFrontInterface = 'StoreFrontFactory':getInstance((get({Order, '$class'})):getStoreName(Order)),
            ShippingInterface = (fun(Target_N67648) -> (get({Target_N67648, '$class'})):getShippingInterface(Target_N67648, (get({Order, '$class'})):getShippingMethod(Order)) end)('ShippingMethods':new(AbeClientInformation, StoreFrontInterface)),
            ShippingCost = (get({ShippingInterface, '$class'})):getCost(ShippingInterface, Order),
            BasketInterface = (get({Order, '$class'})):getBasket(Order),
            SubTotal = (get({BasketInterface, '$class'})):getSubTotal(BasketInterface),
            TaxRate = (fun(Target_N67901) -> (get({Target_N67901, '$class'})):getTaxRate(Target_N67901, ShippingAddress, StoreFrontInterface) end)((fun(Target_N67908) -> (get({Target_N67908, '$class'})):getInstance(Target_N67908, AbeClientInformation, StoreFrontInterface) end)('TaxFactory':getInstance())),
            Tax = 'Money':new(),
            Total = 'Money':new(),
            (get({Total, '$class'})):add(Total, (get({ShippingCost, '$class'})):toString(ShippingCost)),
            (get({Total, '$class'})):add(Total, (get({SubTotal, '$class'})):toString(SubTotal)),
            (get({Tax, '$class'})):add(Tax, (get({Total, '$class'})):toString(Total)),
            (get({Tax, '$class'})):multiply(Tax, TaxRate),
            (get({Total, '$class'})):add(Total, (get({Tax, '$class'})):toString(Tax)),
            Empty = get({'StringUtil':getInstance(), 'EMPTY_STRING'}),
            (get({Vector, '$class'})):add(Vector, (fun(Target_N68344) -> (get({Target_N68344, '$class'})):getNext(Target_N68344) end)('OrderHistoryIdGenerator':new())),
            ZERO = get({'TableDataFactory':getInstance(), 'ZERO_STRING'}),
            (get({Vector, '$class'})):add(Vector, (get({Order, '$class'})):getId(Order)),
            (get({Vector, '$class'})):add(Vector, UserName),
            (get({Vector, '$class'})):add(Vector, (get({Order, '$class'})):getStoreName(Order)),
            Calendar = 'Calendar':getInstance(),
            Time = allbinary_java:to_string((fun(Target_N68605) -> (get({Target_N68605, '$class'})):toString(Target_N68605) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
            (get({Vector, '$class'})):add(Vector, ZERO),
            (get({Vector, '$class'})):add(Vector, Time),
            (get({Vector, '$class'})):add(Vector, ZERO),
            (get({Vector, '$class'})):add(Vector, ZERO),
            (get({Vector, '$class'})):add(Vector, get({'OrderHistoryData', 'PREPROCESSING'})),
            (get({Vector, '$class'})):add(Vector, (get({Order, '$class'})):getPaymentMethod(Order)),
            case (PaymentInterface =/= undefined) of
                true ->
                (get({Vector, '$class'})):add(Vector, (get({PaymentInterface, '$class'})):getName(PaymentInterface)),
                (get({Vector, '$class'})):add(Vector, (get({PaymentInterface, '$class'})):getType(PaymentInterface)),
                (get({Vector, '$class'})):add(Vector, (get({PaymentInterface, '$class'})):getExpiration(PaymentInterface)),
                Random = (fun(Target_N69178) -> (get({Target_N69178, '$class'})):nextInt(Target_N69178, get({'SuperCrypt', 'KEYMAX'})) end)('Random':new()),
                (get({Vector, '$class'})):add(Vector, (fun(Target_N69249) -> (get({Target_N69249, '$class'})):encrypt(Target_N69249, (get({PaymentInterface, '$class'})):getNumber(PaymentInterface)) end)('SuperCrypt':new(Random))),
                (get({Vector, '$class'})):add(Vector, (get({Random, '$class'})):toString(Random));
                false ->
                (get({Vector, '$class'})):add(Vector, Empty),
                (get({Vector, '$class'})):add(Vector, Empty),
                (get({Vector, '$class'})):add(Vector, Empty),
                (get({Vector, '$class'})):add(Vector, Empty),
                (get({Vector, '$class'})):add(Vector, ZERO)
            end,
            case (BillingAddress =/= undefined) of
                true ->
                (get({Vector, '$class'})):add(Vector, (get({BillingAddress, '$class'})):getName(BillingAddress)),
                (get({Vector, '$class'})):add(Vector, (get({BillingAddress, '$class'})):getStreet(BillingAddress)),
                (get({Vector, '$class'})):add(Vector, (get({BillingAddress, '$class'})):getCity(BillingAddress)),
                (get({Vector, '$class'})):add(Vector, (get({BillingAddress, '$class'})):getState(BillingAddress)),
                (get({Vector, '$class'})):add(Vector, (get({BillingAddress, '$class'})):getCode(BillingAddress)),
                (get({Vector, '$class'})):add(Vector, (get({BillingAddress, '$class'})):getCountry(BillingAddress));
                false ->
                (get({Vector, '$class'})):add(Vector, Empty),
                (get({Vector, '$class'})):add(Vector, Empty),
                (get({Vector, '$class'})):add(Vector, Empty),
                (get({Vector, '$class'})):add(Vector, Empty),
                (get({Vector, '$class'})):add(Vector, Empty),
                (get({Vector, '$class'})):add(Vector, Empty)
            end,
            case (ShippingAddress =/= undefined) of
                true ->
                (get({Vector, '$class'})):add(Vector, (get({ShippingAddress, '$class'})):getName(ShippingAddress)),
                (get({Vector, '$class'})):add(Vector, (get({ShippingAddress, '$class'})):getStreet(ShippingAddress)),
                (get({Vector, '$class'})):add(Vector, (get({ShippingAddress, '$class'})):getCity(ShippingAddress)),
                (get({Vector, '$class'})):add(Vector, (get({ShippingAddress, '$class'})):getState(ShippingAddress)),
                (get({Vector, '$class'})):add(Vector, (get({ShippingAddress, '$class'})):getCode(ShippingAddress)),
                (get({Vector, '$class'})):add(Vector, (get({ShippingAddress, '$class'})):getCountry(ShippingAddress));
                false ->
                (get({Vector, '$class'})):add(Vector, Empty),
                (get({Vector, '$class'})):add(Vector, Empty),
                (get({Vector, '$class'})):add(Vector, Empty),
                (get({Vector, '$class'})):add(Vector, Empty),
                (get({Vector, '$class'})):add(Vector, Empty),
                (get({Vector, '$class'})):add(Vector, Empty)
            end,
            (get({Vector, '$class'})):add(Vector, (get({Order, '$class'})):getShippingMethod(Order)),
            (get({Vector, '$class'})):add(Vector, (get({SubTotal, '$class'})):toString(SubTotal)),
            (get({Vector, '$class'})):add(Vector, (get({ShippingCost, '$class'})):toString(ShippingCost)),
            (get({Vector, '$class'})):add(Vector, (get({Tax, '$class'})):toString(Tax)),
            (get({Vector, '$class'})):add(Vector, (get({Total, '$class'})):toString(Total)),
            (get({Vector, '$class'})):add(Vector, (get({Order, '$class'})):getSpecial(Order)),
            (get({Vector, '$class'})):add(Vector, (get({Order, '$class'})):getUserComments(Order)),
            (get({Vector, '$class'})):add(Vector, (get({Order, '$class'})):getUserCancelComments(Order)),
            (get({Vector, '$class'})):add(Vector, (get({Order, '$class'})):getStoreComments(Order)),
            (get({Vector, '$class'})):add(Vector, (get({Order, '$class'})):getStoreCancelComments(Order)),
            (get({This, '$class'})):insert(This, Vector),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, get({'OrderHistoryEntity', 'INSERT'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat(["Command Failed: ", Vector]), This, get({'OrderHistoryEntity', 'INSERT'}), E);
                false -> ok
            end
        end.

insert(This, Values) ->
        try
            'AbSqlBean':insert(This, Values),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, get({'OrderHistoryEntity', 'INSERT'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({'OrderHistoryEntity', 'INSERT'}), E);
                false -> ok
            end
        end.

setStatus(This, OrderId, Status) when (is_list(OrderId) orelse OrderId =:= undefined), (is_list(Status) orelse Status =:= undefined) ->
        try
            Calendar = 'Calendar':getInstance(),
            Time = allbinary_java:to_string((fun(Target_N71901) -> (get({Target_N71901, '$class'})):toString(Target_N71901) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
            UpdateHashMap = (fun(Target_N71969) -> (get({Target_N71969, '$class'})):createHashMap(Target_N71969) end)('StdUtil':getInstance()),
            (get({UpdateHashMap, '$class'})):put(UpdateHashMap, get({'OrderHistoryData', 'STATUS'}), Status),
            case ((get({Status, '$class'})):compareTo(Status, get({'OrderHistoryData', 'CANCELLED'})) =:= 0) of
                true ->
                (get({UpdateHashMap, '$class'})):put(UpdateHashMap, get({'OrderHistoryData', 'CANCELDATE'}), Time);
                false ->
                case ((get({Status, '$class'})):compareTo(Status, get({'OrderHistoryData', 'SHIPPED'})) =:= 0) of
                true ->
                (get({UpdateHashMap, '$class'})):put(UpdateHashMap, get({'OrderHistoryData', 'SHIPPEDDATE'}), Time);
                false -> ok
            end
            end,
            'AbSqlBean':updateWhere(This, get({'OrderData', 'ID'}), OrderId, UpdateHashMap)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "setStatus", E);
                false -> ok
            end
        end.

setPaymentMethod(This, OrderId, PaymentMethod) when (is_list(OrderId) orelse OrderId =:= undefined), (is_list(PaymentMethod) orelse PaymentMethod =:= undefined) ->
        try
            Calendar = 'Calendar':getInstance(),
            Time = allbinary_java:to_string((fun(Target_N72715) -> (get({Target_N72715, '$class'})):toString(Target_N72715) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
            UpdateHashMap = (fun(Target_N72783) -> (get({Target_N72783, '$class'})):createHashMap(Target_N72783) end)('StdUtil':getInstance()),
            (get({UpdateHashMap, '$class'})):put(UpdateHashMap, get({'PaymentData', 'METHOD'}), PaymentMethod),
            (get({UpdateHashMap, '$class'})):put(UpdateHashMap, get({'OrderHistoryData', 'TRANSDATE'}), Time),
            'AbSqlBean':updateWhere(This, get({'OrderData', 'ID'}), OrderId, UpdateHashMap)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "setPaymentMethod", E);
                false -> ok
            end
        end.

% throws Exception
getStoreOrders(This, StoreFrontInterface) ->
        OrderReviewVector = 'BasicArrayListD':new(),
        WhereHashMap = (fun(Target_N73347) -> (get({Target_N73347, '$class'})):createHashMap(Target_N73347) end)('StdUtil':getInstance()),
        (get({WhereHashMap, '$class'})):put(WhereHashMap, get({'StoreFrontData':getInstance(), 'NAME'}), (get({StoreFrontInterface, '$class'})):getName(StoreFrontInterface)),
        OrderHashMapVector = 'AbSqlBean':getRows(This, WhereHashMap),
        Size = (get({OrderHashMapVector, '$class'})):size(OrderHashMapVector),
        lists:foreach(fun(I) ->
            OrderReviewHashMap = (get({OrderHashMapVector, '$class'})):get(OrderHashMapVector, I),
            OrderReview = 'OrderHistory':new('Basket':new(), OrderReviewHashMap),
            (get({OrderReviewVector, '$class'})):add(OrderReviewVector, OrderReview)
        end, lists:seq(0, Size - 1)),
        OrderReviewVector.

% throws Exception
getOrders(This, UserName) when (is_list(UserName) orelse UserName =:= undefined) ->
        OrderReviewVector = 'BasicArrayListD':new(),
        WhereHashMap = (fun(Target_N73898) -> (get({Target_N73898, '$class'})):createHashMap(Target_N73898) end)('StdUtil':getInstance()),
        (get({WhereHashMap, '$class'})):put(WhereHashMap, get({'UserData', 'USERNAME'}), UserName),
        OrderHashMapVector = 'AbSqlBean':getRows(This, WhereHashMap),
        Size = (get({OrderHashMapVector, '$class'})):size(OrderHashMapVector),
        lists:foreach(fun(Index) ->
            OrderReviewHashMap = (get({OrderHashMapVector, '$class'})):get(OrderHashMapVector, Index),
            OrderReview = 'OrderHistory':new('Basket':new(), OrderReviewHashMap),
            (get({OrderReviewVector, '$class'})):add(OrderReviewVector, OrderReview)
        end, lists:seq(0, Size - 1)),
        OrderReviewVector.

% throws Exception
getOrders(This, Status, FromDate, ToDate) when (is_list(Status) orelse Status =:= undefined), (is_list(FromDate) orelse FromDate =:= undefined), (is_list(ToDate) orelse ToDate =:= undefined) ->
        OrderReviewVector = 'BasicArrayListD':new(),
        WhereHashMap = (fun(Target_N74436) -> (get({Target_N74436, '$class'})):createHashMap(Target_N74436) end)('StdUtil':getInstance()),
        (get({WhereHashMap, '$class'})):put(WhereHashMap, get({'OrderHistoryData', 'STATUS'}), Status),
        OrderHashMapVector = 'AbSqlBean':getRowsWhereBetween(This, WhereHashMap, get({'OrderHistoryData', 'ORDERDATE'}), FromDate, ToDate),
        Size = (get({OrderHashMapVector, '$class'})):size(OrderHashMapVector),
        lists:foreach(fun(Index) ->
            OrderReviewHashMap = (get({OrderHashMapVector, '$class'})):get(OrderHashMapVector, Index),
            OrderReview = 'OrderHistory':new('Basket':new(), OrderReviewHashMap),
            (get({OrderReviewVector, '$class'})):add(OrderReviewVector, OrderReview)
        end, lists:seq(0, Size - 1)),
        OrderReviewVector.

% throws Exception
getOrders(This, FromDate, ToDate) when (is_list(FromDate) orelse FromDate =:= undefined), (is_list(ToDate) orelse ToDate =:= undefined) ->
        OrderReviewVector = 'BasicArrayListD':new(),
        OrderHashMapVector = 'AbSqlBean':getRowsWhereBetween(This, get({'OrderHistoryData', 'ORDERDATE'}), FromDate, ToDate),
        Size = (get({OrderHashMapVector, '$class'})):size(OrderHashMapVector),
        lists:foreach(fun(Index) ->
            OrderReviewHashMap = (get({OrderHashMapVector, '$class'})):get(OrderHashMapVector, Index),
            OrderReview = 'OrderHistory':new('Basket':new(), OrderReviewHashMap),
            (get({OrderReviewVector, '$class'})):add(OrderReviewVector, OrderReview)
        end, lists:seq(0, Size - 1)),
        OrderReviewVector.

% throws Exception
getOrder(This, Id) when (is_list(Id) orelse Id =:= undefined) ->
        try
        WhereHashMap = (fun(Target_N75482) -> (get({Target_N75482, '$class'})):createHashMap(Target_N75482) end)('StdUtil':getInstance()),
        (get({WhereHashMap, '$class'})):put(WhereHashMap, get({'OrderData', 'ID'}), Id),
        OrderReviewHashMap = 'AbSqlBean':getRow(This, WhereHashMap),
        case (OrderReviewHashMap =/= undefined) of
            true ->
            OrderHistory = 'OrderHistory':new('Basket':new(), OrderReviewHashMap),
            throw({'$return', OrderHistory});
            false ->
            throw({'$return', undefined})
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
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'UserData', 'USERNAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'StoreFrontData':getInstance(), 'NAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderHistoryData', 'SHIPPEDDATE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " BIGINT(19) UNSIGNED ,"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderHistoryData', 'ORDERDATE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderHistoryData', 'TRANSDATE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " BIGINT(19) UNSIGNED ,"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderHistoryData', 'CANCELDATE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " BIGINT(19) UNSIGNED ,"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderHistoryData', 'STATUS'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'PaymentData', 'METHOD'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'PaymentData', 'NAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " VARCHAR(255) ,"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'PaymentData', 'TYPE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " VARCHAR(255) ,"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'PaymentData', 'EXPIRATION'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " VARCHAR(255) ,"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'PaymentData', 'NUMBER'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " VARCHAR(255) ,"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({EntryData, 'ENCRYPTION'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " BIGINT(19) UNSIGNED ,"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'BillingAddressData', 'NAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'BillingAddressData', 'STREET'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'BillingAddressData', 'CITY'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'BillingAddressData', 'STATE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'BillingAddressData', 'CODE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'BillingAddressData', 'COUNTRY'})),
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
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderHistoryData', 'SUBTOTAL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderHistoryData', 'SHIPPINGCOST'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderHistoryData', 'TAX'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderHistoryData', 'TOTAL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({EntryData, 'SPECIAL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " VARCHAR(255) ,"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderData', 'CUSTOMERCOMMENT'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderData', 'CUSTOMERCANCELCOMMENT'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderData', 'STORECOMMENT'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'OrderData', 'STORECANCELCOMMENT'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "PRIMARY KEY("),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({EntryData, 'ID'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, ") )"),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)).

dropTable(This) ->
        'AbSqlBean':dropTable(This).

% throws Exception
update(This, WhereHashMap, OrderHashMap) ->
        try
            (get({This, '$class'})):updateWhere(This, WhereHashMap, OrderHashMap)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

