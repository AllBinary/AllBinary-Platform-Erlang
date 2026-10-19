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
% package org.allbinary.business.user.commerce.inventory.item
% import java.util.HashMap
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.user.address.ShippingAddressData
% import org.allbinary.business.user.address.StreetAddress
% import org.allbinary.business.user.address.StreetAddressData
% import org.allbinary.business.user.commerce.inventory.order.OrderHistoryData
% import org.allbinary.business.user.commerce.money.MoneyException
% import org.allbinary.business.user.commerce.shipping.ShippingMethodData
% import org.allbinary.logic.string.StringUtil

-module('Item').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements OrderItemInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicItem', Function, Arguments).

init_fields(This) ->
    put({This, group}, undefined),
    put({This, tax}, undefined),
    put({This, shippingType}, undefined),
    put({This, shippingCost}, undefined),
    put({This, shippedDate}, undefined),
    put({This, shippingAddress}, undefined),
    put({This, special}, undefined),
    ok.


new(ItemHashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ItemHashMap),
    This.

init(This, ItemHashMap) ->
        'BasicItem':init(This, ItemHashMap),
        init_fields(This),
        (get({This, '$class'})):setData(This, ItemHashMap).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'BasicItem':init(This),
    init_fields(This),
        EMPTY = get({'StringUtil':getInstance(), 'EMPTY_STRING'}),
        put({This, group}, EMPTY),
        put({This, tax}, EMPTY),
        put({This, shippingType}, EMPTY),
        put({This, shippingCost}, EMPTY),
        put({This, shippingAddress}, 'StreetAddress':new()).

setData(This, ItemHashMap) ->
        put({This, group}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({'ShippingMethodData', 'GROUP'}))),
        put({This, tax}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({'OrderHistoryData', 'TAX'}))),
        put({This, shippingType}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({'ShippingMethodData', 'NAME'}))),
        put({This, shippingCost}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({'ShippingMethodData', 'COST'}))),
        put({This, shippedDate}, (get({ItemHashMap, '$class'})):get(ItemHashMap, get({'OrderHistoryData', 'SHIPPEDDATE'}))),
        (get({ItemHashMap, '$class'})):put(ItemHashMap, get({'StreetAddressData', 'NAME'}), (get({ItemHashMap, '$class'})):get(ItemHashMap, get({'ShippingAddressData', 'NAME'}))),
        (get({ItemHashMap, '$class'})):put(ItemHashMap, get({'StreetAddressData', 'STREET'}), (get({ItemHashMap, '$class'})):get(ItemHashMap, get({'ShippingAddressData', 'STREET'}))),
        (get({ItemHashMap, '$class'})):put(ItemHashMap, get({'StreetAddressData', 'CITY'}), (get({ItemHashMap, '$class'})):get(ItemHashMap, get({'ShippingAddressData', 'CITY'}))),
        (get({ItemHashMap, '$class'})):put(ItemHashMap, get({'StreetAddressData', 'STATE'}), (get({ItemHashMap, '$class'})):get(ItemHashMap, get({'ShippingAddressData', 'STATE'}))),
        (get({ItemHashMap, '$class'})):put(ItemHashMap, get({'StreetAddressData', 'CODE'}), (get({ItemHashMap, '$class'})):get(ItemHashMap, get({'ShippingAddressData', 'CODE'}))),
        (get({ItemHashMap, '$class'})):put(ItemHashMap, get({'StreetAddressData', 'COUNTRY'}), (get({ItemHashMap, '$class'})):get(ItemHashMap, get({'ShippingAddressData', 'COUNTRY'}))),
        put({This, shippingAddress}, 'StreetAddress':new(ItemHashMap)).

setGroup(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, group}, Value).

setTax(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, tax}, Value).

setShippingType(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, shippingType}, Value).

setShippingCost(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, shippingCost}, Value).

setShippingAddress(This, Value) ->
        put({This, shippingAddress}, Value).

setSpecial(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, special}, Value).

getGroup(This) ->
        get({This, group}).

getTax(This) ->
        get({This, tax}).

getShippingType(This) ->
        get({This, shippingType}).

getShippingCost(This) ->
        get({This, shippingCost}).

getShippingAddress(This) ->
        get({This, shippingAddress}).

getSpecial(This) ->
        get({This, special}).

toHashMap(This) ->
        HashMap = 'BasicItem':toHashMap(This),
        (get({HashMap, '$class'})):put(HashMap, get({'ShippingMethodData', 'GROUP'}), get({This, group})),
        (get({HashMap, '$class'})):put(HashMap, get({'OrderHistoryData', 'TAX'}), get({This, tax})),
        (get({HashMap, '$class'})):put(HashMap, get({'ShippingMethodData', 'NAME'}), get({This, shippingType})),
        (get({HashMap, '$class'})):put(HashMap, get({'ShippingMethodData', 'COST'}), get({This, shippingCost})),
        (get({HashMap, '$class'})):put(HashMap, get({'OrderHistoryData', 'SHIPPEDDATE'}), get({This, shippedDate})),
        (get({HashMap, '$class'})):put(HashMap, get({'EntryData':getInstance(), 'SPECIAL'}), get({This, special})),
        HashMap.

