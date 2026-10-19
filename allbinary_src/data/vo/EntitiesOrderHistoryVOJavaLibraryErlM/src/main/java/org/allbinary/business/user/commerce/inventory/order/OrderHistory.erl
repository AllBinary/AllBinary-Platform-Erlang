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
% import java.util.Date
% import java.util.HashMap
% import java.util.Set
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.user.UserData
% import org.allbinary.business.user.address.BillingAddressData
% import org.allbinary.business.user.address.ShippingAddressData
% import org.allbinary.business.user.address.StreetAddress
% import org.allbinary.business.user.commerce.inventory.basket.BasketInterface
% import org.allbinary.business.user.commerce.money.Money
% import org.allbinary.business.user.commerce.money.MoneyException
% import org.allbinary.business.user.commerce.money.payment.Payment
% import org.allbinary.business.user.commerce.money.payment.PaymentData
% import org.allbinary.business.user.commerce.shipping.ShippingMethodData
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.string.StringUtil
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('OrderHistory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements OrderHistoryInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Order', Function, Arguments).

init_fields(This) ->
    put({This, userName}, undefined),
    put({This, shippingAddress}, undefined),
    put({This, billingAddress}, undefined),
    put({This, payment}, undefined),
    put({This, shipDate}, undefined),
    put({This, orderDate}, undefined),
    put({This, transDate}, undefined),
    put({This, cancelDate}, undefined),
    put({This, status}, undefined),
    put({This, subTotal}, undefined),
    put({This, shippingCost}, undefined),
    put({This, taxes}, undefined),
    put({This, total}, undefined),
    ok.


new(BasketInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, BasketInterface),
    This.

init(This, BasketInterface) ->
        'Order':init(This, BasketInterface),
        init_fields(This).

new(BasketInterface, OrderHistory) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, BasketInterface, OrderHistory),
    This;
new(BasketInterface, OrderHistoryHashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, BasketInterface, OrderHistoryHashMap),
    This.

init(This, BasketInterface, OrderHistory) ->
        'Order':init(This, (get({OrderHistory, '$class'})):getStoreName(OrderHistory), BasketInterface, (get({OrderHistory, '$class'})):getId(OrderHistory), (get({OrderHistory, '$class'})):getShippingMethod(OrderHistory), (get({OrderHistory, '$class'})):getSpecial(OrderHistory), (get({OrderHistory, '$class'})):getPaymentMethod(OrderHistory)),
        init_fields(This),
        put({This, userName}, (get({OrderHistory, '$class'})):getUserName(OrderHistory)),
        put({This, shippingAddress}, (get({OrderHistory, '$class'})):getShippingAddress(OrderHistory)),
        put({This, billingAddress}, (get({OrderHistory, '$class'})):getBillingAddress(OrderHistory)),
        put({This, payment}, (get({OrderHistory, '$class'})):getPaymentInfo(OrderHistory)),
        put({This, shipDate}, (get({OrderHistory, '$class'})):getShipDate(OrderHistory)),
        put({This, orderDate}, (get({OrderHistory, '$class'})):getOrderDate(OrderHistory)),
        put({This, transDate}, (get({OrderHistory, '$class'})):getTransDate(OrderHistory)),
        put({This, cancelDate}, (get({OrderHistory, '$class'})):getCancelDate(OrderHistory)),
        put({This, status}, (get({OrderHistory, '$class'})):getStatus(OrderHistory)),
        put({This, subTotal}, (get({OrderHistory, '$class'})):getSubTotal(OrderHistory)),
        put({This, shippingCost}, (get({OrderHistory, '$class'})):getShippingCost(OrderHistory)),
        put({This, taxes}, (get({OrderHistory, '$class'})):getTaxes(OrderHistory)),
        put({This, total}, (get({OrderHistory, '$class'})):getTotal(OrderHistory)),
        'Order':setUserComments(This, (get({OrderHistory, '$class'})):getUserComments(OrderHistory)),
        'Order':setUserCancelComments(This, (get({OrderHistory, '$class'})):getUserCancelComments(OrderHistory)),
        'Order':setStoreComments(This, (get({OrderHistory, '$class'})):getStoreComments(OrderHistory)),
        'Order':setStoreCancelComments(This, (get({OrderHistory, '$class'})):getStoreCancelComments(OrderHistory));
init(This, BasketInterface, OrderHistoryHashMap) ->
        'Order':init(This, (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'StoreFrontData':getInstance(), 'NAME'})), BasketInterface, (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'OrderData', 'ID'})), (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'ShippingMethodData', 'NAME'})), (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'EntryData':getInstance(), 'SPECIAL'})), (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'PaymentData', 'METHOD'}))),
        init_fields(This),
        put({This, shippingAddress}, 'StreetAddress':new((get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'ShippingAddressData', 'NAME'})), (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'ShippingAddressData', 'STREET'})), (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'ShippingAddressData', 'CITY'})), (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'ShippingAddressData', 'STATE'})), (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'ShippingAddressData', 'CODE'})), (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'ShippingAddressData', 'COUNTRY'})))),
        put({This, billingAddress}, 'StreetAddress':new((get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'BillingAddressData', 'NAME'})), (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'BillingAddressData', 'STREET'})), (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'BillingAddressData', 'CITY'})), (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'BillingAddressData', 'STATE'})), (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'BillingAddressData', 'CODE'})), (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'BillingAddressData', 'COUNTRY'})))),
        put({This, payment}, 'Payment':new(OrderHistoryHashMap)),
        put({This, userName}, (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'UserData', 'USERNAME'}))),
        put({This, orderDate}, (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'OrderHistoryData', 'ORDERDATE'}))),
        put({This, shipDate}, (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'OrderHistoryData', 'SHIPPEDDATE'}))),
        put({This, transDate}, (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'OrderHistoryData', 'TRANSDATE'}))),
        put({This, cancelDate}, (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'OrderHistoryData', 'CANCELDATE'}))),
        put({This, status}, (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'OrderHistoryData', 'STATUS'}))),
        put({This, subTotal}, 'Money':new((get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'OrderHistoryData', 'SUBTOTAL'})))),
        put({This, total}, 'Money':new((get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'OrderHistoryData', 'TOTAL'})))),
        put({This, shippingCost}, 'Money':new((get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'OrderHistoryData', 'SHIPPINGCOST'})))),
        put({This, taxes}, 'Money':new((get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'OrderHistoryData', 'TAX'})))),
        'Order':setUserComments(This, (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'OrderData', 'CUSTOMERCOMMENT'}))),
        'Order':setUserCancelComments(This, (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'OrderData', 'CUSTOMERCANCELCOMMENT'}))),
        'Order':setStoreComments(This, (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'OrderData', 'STORECOMMENT'}))),
        'Order':setStoreCancelComments(This, (get({OrderHistoryHashMap, '$class'})):get(OrderHistoryHashMap, get({'OrderData', 'STORECANCELCOMMENT'}))).


setUserName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, userName}, Value).

setDefaultShippingAddress(This, ShippingAddress) ->
        put({This, shippingAddress}, ShippingAddress).

setBillingAddress(This, BillingAddress) ->
        put({This, billingAddress}, BillingAddress).

setPaymentInfo(This, Payment) ->
        put({This, payment}, Payment).

setShipDate(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, shipDate}, Value).

setOrderDate(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, orderDate}, Value).

setTransDate(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, transDate}, Value).

setCancelDate(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, cancelDate}, Value).

setStatus(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, status}, Value).

setSubTotal(This, Value) ->
        put({This, subTotal}, Value).

setShippingCost(This, Value) ->
        put({This, shippingCost}, Value).

setTaxes(This, Value) ->
        put({This, taxes}, Value).

setTotal(This, Value) ->
        put({This, total}, Value).

getUserName(This) ->
        get({This, userName}).

getShippingAddress(This) ->
        get({This, shippingAddress}).

getBillingAddress(This) ->
        get({This, billingAddress}).

getPaymentInfo(This) ->
        get({This, payment}).

getShipDate(This) ->
        get({This, shipDate}).

getOrderDate(This) ->
        get({This, orderDate}).

getTransDate(This) ->
        get({This, transDate}).

getCancelDate(This) ->
        get({This, cancelDate}).

getStatus(This) ->
        get({This, status}).

getSubTotal(This) ->
        get({This, subTotal}).

getShippingCost(This) ->
        get({This, shippingCost}).

getTaxes(This) ->
        get({This, taxes}).

getTotal(This) ->
        get({This, total}).

toHashMap(This) ->
        HashMap = (fun(Target_N71092) -> (get({Target_N71092, '$class'})):createHashMap(Target_N71092) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'UserData', 'USERNAME'}), get({This, userName})),
        (get({HashMap, '$class'})):put(HashMap, get({'OrderHistoryData', 'ORDERDATE'}), get({This, orderDate})),
        (get({HashMap, '$class'})):put(HashMap, get({'OrderHistoryData', 'SHIPPEDDATE'}), get({This, shipDate})),
        (get({HashMap, '$class'})):put(HashMap, get({'OrderHistoryData', 'TRANSDATE'}), get({This, transDate})),
        (get({HashMap, '$class'})):put(HashMap, get({'OrderHistoryData', 'CANCELDATE'}), get({This, cancelDate})),
        (get({HashMap, '$class'})):put(HashMap, get({'OrderHistoryData', 'ORDERDATEFORMATTED'}), (fun(Target_N71418) -> (get({Target_N71418, '$class'})):toString(Target_N71418) end)('Date':new((get({get({This, orderDate}), '$class'})):longValue(get({This, orderDate}))))),
        (get({HashMap, '$class'})):put(HashMap, get({'OrderHistoryData', 'SHIPPEDDATEFORMATTED'}), (fun(Target_N71518) -> (get({Target_N71518, '$class'})):toString(Target_N71518) end)('Date':new((get({get({This, shipDate}), '$class'})):longValue(get({This, shipDate}))))),
        (get({HashMap, '$class'})):put(HashMap, get({'OrderHistoryData', 'TRANSDATEFORMATTED'}), (fun(Target_N71614) -> (get({Target_N71614, '$class'})):toString(Target_N71614) end)('Date':new((get({get({This, transDate}), '$class'})):longValue(get({This, transDate}))))),
        (get({HashMap, '$class'})):put(HashMap, get({'OrderHistoryData', 'CANCELDATEFORMATTED'}), (fun(Target_N71710) -> (get({Target_N71710, '$class'})):toString(Target_N71710) end)('Date':new((get({get({This, cancelDate}), '$class'})):longValue(get({This, cancelDate}))))),
        (get({HashMap, '$class'})):put(HashMap, get({'OrderHistoryData', 'STATUS'}), get({This, status})),
        (get({HashMap, '$class'})):put(HashMap, get({'OrderHistoryData', 'SUBTOTAL'}), (get({get({This, subTotal}), '$class'})):toString(get({This, subTotal}))),
        (get({HashMap, '$class'})):put(HashMap, get({'OrderHistoryData', 'TOTAL'}), (get({get({This, total}), '$class'})):toString(get({This, total}))),
        (get({HashMap, '$class'})):put(HashMap, get({'OrderHistoryData', 'SHIPPINGCOST'}), (get({get({This, shippingCost}), '$class'})):toString(get({This, shippingCost}))),
        (get({HashMap, '$class'})):put(HashMap, get({'OrderHistoryData', 'TAX'}), (get({get({This, taxes}), '$class'})):toString(get({This, taxes}))),
        HashMap.

% throws Exception
toXmlNode(This, Document) ->
        HashMap = (get({This, '$class'})):toHashMap(This),
        KeySet = (get({HashMap, '$class'})):keySet(HashMap),
        KeyArray = (get({KeySet, '$class'})):toArray(KeySet),
        Size = array:size(KeyArray),
        Node = (get({Document, '$class'})):createElement(Document, get({'OrderHistoryData', 'ORDERHISTORY'})),
        (get({Node, '$class'})):appendChild(Node, 'Order':toXmlNode(This, Document)),
        BillingAddressNode = (get({Document, '$class'})):createElement(Document, get({'BillingAddressData', 'BILLINGADDRESS'})),
        (get({BillingAddressNode, '$class'})):appendChild(BillingAddressNode, (get({get({This, billingAddress}), '$class'})):toXmlNode(get({This, billingAddress}), Document)),
        ShippingAddressNode = (get({Document, '$class'})):createElement(Document, get({'ShippingAddressData', 'SHIPPINGADDRESS'})),
        (get({ShippingAddressNode, '$class'})):appendChild(ShippingAddressNode, (get({get({This, shippingAddress}), '$class'})):toXmlNode(get({This, shippingAddress}), Document)),
        (get({Node, '$class'})):appendChild(Node, BillingAddressNode),
        (get({Node, '$class'})):appendChild(Node, ShippingAddressNode),
        (get({Node, '$class'})):appendChild(Node, (get({get({This, payment}), '$class'})):toXmlNode(get({This, payment}), Document)),
        lists:foreach(fun(I) ->
            Name = array:get(I, KeyArray),
            put({local, value}, (get({HashMap, '$class'})):get(HashMap, Name)),
            put({local, value}, (fun(Target_N72862) -> (get({Target_N72862, '$class'})):getNonNull(Target_N72862, get({local, value})) end)('StringUtil':getInstance())),
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, Name, get({local, value})))
        end, lists:seq(0, Size - 1)),
        Node.

