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
% import java.io.Serializable
% import java.util.HashMap
% import java.util.Set
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.user.commerce.inventory.basket.BasketInterface
% import org.allbinary.business.user.commerce.money.payment.PaymentData
% import org.allbinary.business.user.commerce.shipping.ShippingMethodData
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('Order').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements OrderInterface
% implements Serializable

init_fields(This) ->
    put({This, basket}, undefined),
    put({This, paymentMethod}, undefined),
    put({This, shippingType}, undefined),
    put({This, storeName}, undefined),
    put({This, special}, undefined),
    put({This, id}, undefined),
    put({This, userComment}, undefined),
    put({This, userCancelComment}, undefined),
    put({This, storeComment}, undefined),
    put({This, storeCancelComment}, undefined),
    ok.


new(Basket) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Basket),
    This.

init(This, Basket) ->
    init_fields(This),
        put({This, basket}, Basket),
        put({This, id}, undefined),
        put({This, shippingType}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})).

new(StoreName, Basket, Id, ShippingType, Special, PaymentMethod) when (is_list(StoreName) orelse StoreName =:= undefined), (is_list(Id) orelse Id =:= undefined), (is_list(ShippingType) orelse ShippingType =:= undefined), (is_list(Special) orelse Special =:= undefined), (is_list(PaymentMethod) orelse PaymentMethod =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, StoreName, Basket, Id, ShippingType, Special, PaymentMethod),
    This.

init(This, StoreName, Basket, Id, ShippingType, Special, PaymentMethod) when (is_list(StoreName) orelse StoreName =:= undefined), (is_list(Id) orelse Id =:= undefined), (is_list(ShippingType) orelse ShippingType =:= undefined), (is_list(Special) orelse Special =:= undefined), (is_list(PaymentMethod) orelse PaymentMethod =:= undefined) ->
    init_fields(This),
        put({This, storeName}, StoreName),
        put({This, basket}, Basket),
        put({This, id}, Id),
        put({This, shippingType}, ShippingType),
        put({This, special}, Special),
        put({This, paymentMethod}, PaymentMethod).

isIdValid(This) ->
        try
        case (((((get({This, '$class'})):getId(This) =:= undefined) orelse ((fun(Target_N66869) -> (get({Target_N66869, '$class'})):compareTo(Target_N66869, get({'StringUtil':getInstance(), 'EMPTY_STRING'})) end)((get({This, '$class'})):getId(This)) =:= 0)) orelse ((fun(Target_N66925) -> (get({Target_N66925, '$class'})):length(Target_N66925) end)((get({This, '$class'})):getId(This)) > get({'OrderHistoryData', 'MAXIDLEN'}))) orelse (not (fun(Target_N66966) -> (get({Target_N66966, '$class'})):isNumber(Target_N66966, (get({This, '$class'})):getId(This)) end)('StringValidationUtil':getInstance()))) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isValid(This) ->
        true.

getIdValidationInfo(This) ->
        try
        EMPTY_STRING = get({'StringUtil':getInstance(), 'EMPTY_STRING'}),
        case (((((get({This, '$class'})):getId(This) =:= undefined) orelse ((fun(Target_N67234) -> (get({Target_N67234, '$class'})):compareTo(Target_N67234, EMPTY_STRING) end)((get({This, '$class'})):getId(This)) =:= 0)) orelse ((fun(Target_N67274) -> (get({Target_N67274, '$class'})):length(Target_N67274) end)((get({This, '$class'})):getId(This)) > get({'OrderHistoryData', 'MAXIDLEN'}))) orelse (not (fun(Target_N67315) -> (get({Target_N67315, '$class'})):isNumber(Target_N67315, (get({This, '$class'})):getId(This)) end)('StringValidationUtil':getInstance()))) of
            true ->
            throw({'$return', lists:concat([lists:concat(["Please enter a valid order Id < ", get({'OrderHistoryData', 'MAXIDLEN'})]), " digits in length.<br>"])});
            false -> ok
        end,
        EMPTY_STRING
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setShippingMethod(This, ShippingType) when (is_list(ShippingType) orelse ShippingType =:= undefined) ->
        put({This, shippingType}, ShippingType).

setPaymentMethod(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, paymentMethod}, Value).

setSpecial(This, Special) when (is_list(Special) orelse Special =:= undefined) ->
        put({This, special}, Special).

setId(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, id}, Value).

setStoreName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, storeName}, Value).

setUserComments(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, userComment}, Value).

setUserCancelComments(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, userCancelComment}, Value).

setStoreComments(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, storeComment}, Value).

setStoreCancelComments(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, storeCancelComment}, Value).

getBasket(This) ->
        get({This, basket}).

getShippingMethod(This) ->
        get({This, shippingType}).

getPaymentMethod(This) ->
        get({This, paymentMethod}).

getSpecial(This) ->
        get({This, special}).

getId(This) ->
        get({This, id}).

getStoreName(This) ->
        get({This, storeName}).

getUserComments(This) ->
        get({This, userComment}).

getUserCancelComments(This) ->
        get({This, userCancelComment}).

getStoreComments(This) ->
        get({This, storeComment}).

getStoreCancelComments(This) ->
        get({This, storeCancelComment}).

reviewOrder(This, PaymentMethod) when (is_list(PaymentMethod) orelse PaymentMethod =:= undefined) ->
        "Create your own Order.reviewOrder".

viewOrder(This, PaymentMethod) when (is_list(PaymentMethod) orelse PaymentMethod =:= undefined) ->
        "Create your own Order.viewOrder".

emailOrder(This, UserName, PaymentMethod, StoreFrontInterface) when (is_list(UserName) orelse UserName =:= undefined), (is_list(PaymentMethod) orelse PaymentMethod =:= undefined) ->
        "Create your own Order.emailOrder".

toHashMapOrder(This) ->
        HashMap = (fun(Target_N68773) -> (get({Target_N68773, '$class'})):createHashMap(Target_N68773) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'PaymentData', 'METHOD'}), get({This, paymentMethod})),
        (get({HashMap, '$class'})):put(HashMap, get({'ShippingMethodData', 'NAME'}), get({This, shippingType})),
        (get({HashMap, '$class'})):put(HashMap, get({'StoreFrontData':getInstance(), 'NAME'}), get({This, storeName})),
        (get({HashMap, '$class'})):put(HashMap, get({'EntryData':getInstance(), 'SPECIAL'}), get({This, special})),
        (get({HashMap, '$class'})):put(HashMap, get({'OrderData', 'ID'}), get({This, id})),
        (get({HashMap, '$class'})):put(HashMap, get({'OrderData', 'CUSTOMERCOMMENT'}), get({This, userComment})),
        (get({HashMap, '$class'})):put(HashMap, get({'OrderData', 'CUSTOMERCANCELCOMMENT'}), get({This, userCancelComment})),
        (get({HashMap, '$class'})):put(HashMap, get({'OrderData', 'STORECOMMENT'}), get({This, storeComment})),
        (get({HashMap, '$class'})):put(HashMap, get({'OrderData', 'STORECANCELCOMMENT'}), get({This, storeCancelComment})),
        HashMap.

% throws Exception
toXmlNode(This, Document) ->
        HashMap = (get({This, '$class'})):toHashMapOrder(This),
        KeySet = (get({HashMap, '$class'})):keySet(HashMap),
        KeyArray = (get({KeySet, '$class'})):toArray(KeySet),
        Size = array:size(KeyArray),
        Node = (get({Document, '$class'})):createElement(Document, get({'OrderData', 'ORDER'})),
        lists:foreach(fun(I) ->
            Name = array:get(I, KeyArray),
            put({local, value}, (get({HashMap, '$class'})):get(HashMap, Name)),
            put({local, value}, (fun(Target_N69699) -> (get({Target_N69699, '$class'})):getNonNull(Target_N69699, get({local, value})) end)('StringUtil':getInstance())),
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, Name, get({local, value})))
        end, lists:seq(0, Size - 1)),
        Node.

