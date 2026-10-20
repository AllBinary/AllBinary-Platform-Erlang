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
% package admin.taghelpers
% import java.util.HashMap
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.user.UserData
% import org.allbinary.business.user.address.BillingAddressData
% import org.allbinary.business.user.address.ShippingAddressData
% import org.allbinary.business.user.commerce.inventory.order.OrderData
% import org.allbinary.business.user.commerce.inventory.order.OrderHistoryData
% import org.allbinary.business.user.commerce.money.payment.PaymentData
% import org.allbinary.business.user.commerce.shipping.ShippingMethodData
% import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil

-module('UpdateOrderHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TagHelper', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, request}, undefined),
    put({This, entryId}, undefined),
    put({This, orderId}, undefined),
    put({This, userName}, undefined),
    put({This, storeName}, undefined),
    put({This, shipDate}, undefined),
    put({This, orderDate}, undefined),
    put({This, transDate}, undefined),
    put({This, cancelDate}, undefined),
    put({This, status}, undefined),
    put({This, paymentMethod}, undefined),
    put({This, name}, undefined),
    put({This, type}, undefined),
    put({This, expiration}, undefined),
    put({This, number}, undefined),
    put({This, encryption}, undefined),
    put({This, billingName}, undefined),
    put({This, billingStreet}, undefined),
    put({This, billingCity}, undefined),
    put({This, billingState}, undefined),
    put({This, billingCode}, undefined),
    put({This, billingCountry}, undefined),
    put({This, shippingName}, undefined),
    put({This, shippingStreet}, undefined),
    put({This, shippingCity}, undefined),
    put({This, shippingState}, undefined),
    put({This, shippingCode}, undefined),
    put({This, shippingCountry}, undefined),
    put({This, shippingMethodName}, undefined),
    put({This, subTotal}, undefined),
    put({This, shippingCost}, undefined),
    put({This, tax}, undefined),
    put({This, total}, undefined),
    put({This, special}, undefined),
    put({This, userComment}, undefined),
    put({This, userCancelComment}, undefined),
    put({This, storeComment}, undefined),
    put({This, storeCancelComment}, undefined),
    ok.


new(HashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap, PageContext),
    This.

'$init'(This, HashMap, PageContext) ->
    'TagHelper':'$init'(This),
    init_fields(This),
        put({This, request}, (get({PageContext, '$class'})):getRequest(PageContext)),
        (get({This, '$class'})):getFormData(This).

getFormData(This) ->
        put({This, entryId}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'EntryData':getInstance(), 'ID'}))),
        put({This, orderId}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderData', 'ID'}))),
        put({This, userName}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'UserData', 'USERNAME'}))),
        put({This, storeName}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'StoreFrontData':getInstance(), 'NAME'}))),
        put({This, shipDate}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'SHIPPEDDATE'}))),
        put({This, orderDate}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'ORDERDATE'}))),
        put({This, transDate}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'TRANSDATE'}))),
        put({This, cancelDate}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'CANCELDATE'}))),
        put({This, status}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'STATUS'}))),
        put({This, paymentMethod}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'PaymentData', 'METHOD'}))),
        put({This, name}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'PaymentData', 'NAME'}))),
        put({This, type}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'PaymentData', 'TYPE'}))),
        put({This, expiration}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'PaymentData', 'EXPIRATION'}))),
        put({This, number}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'PaymentData', 'NUMBER'}))),
        put({This, encryption}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'EntryData':getInstance(), 'ENCRYPTION'}))),
        put({This, billingName}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BillingAddressData', 'NAME'}))),
        put({This, billingStreet}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BillingAddressData', 'STREET'}))),
        put({This, billingCity}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BillingAddressData', 'CITY'}))),
        put({This, billingState}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BillingAddressData', 'STATE'}))),
        put({This, billingCode}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BillingAddressData', 'CODE'}))),
        put({This, billingCountry}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BillingAddressData', 'COUNTRY'}))),
        put({This, shippingName}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'ShippingAddressData', 'NAME'}))),
        put({This, shippingStreet}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'ShippingAddressData', 'STREET'}))),
        put({This, shippingCity}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'ShippingAddressData', 'CITY'}))),
        put({This, shippingState}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'ShippingAddressData', 'STATE'}))),
        put({This, shippingCode}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'ShippingAddressData', 'CODE'}))),
        put({This, shippingCountry}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'ShippingAddressData', 'COUNTRY'}))),
        put({This, shippingMethodName}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'ShippingMethodData', 'NAME'}))),
        put({This, subTotal}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'SUBTOTAL'}))),
        put({This, shippingCost}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'SHIPPINGCOST'}))),
        put({This, tax}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'TAX'}))),
        put({This, total}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'TOTAL'}))),
        put({This, special}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'EntryData':getInstance(), 'SPECIAL'}))),
        put({This, userComment}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderData', 'CUSTOMERCOMMENT'}))),
        put({This, userCancelComment}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderData', 'CUSTOMERCANCELCOMMENT'}))),
        put({This, storeComment}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderData', 'STORECOMMENT'}))),
        put({This, storeCancelComment}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderData', 'STORECANCELCOMMENT'}))).

update(This) ->
        try
            Success = "Successful update",
            OrderHashMap = (fun(Target_N69682) -> (get({Target_N69682, '$class'})):createHashMap(Target_N69682) end)('StdUtil':getInstance()),
            WhereHashMap = (fun(Target_N69733) -> (get({Target_N69733, '$class'})):createHashMap(Target_N69733) end)('StdUtil':getInstance()),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'EntryData':getInstance(), 'ID'}), get({This, entryId})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'OrderData', 'ID'}), get({This, orderId})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'UserData', 'USERNAME'}), get({This, userName})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'StoreFrontData':getInstance(), 'NAME'}), get({This, storeName})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'OrderHistoryData', 'SHIPPEDDATE'}), get({This, shipDate})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'OrderHistoryData', 'ORDERDATE'}), get({This, orderDate})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'OrderHistoryData', 'TRANSDATE'}), get({This, transDate})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'OrderHistoryData', 'CANCELDATE'}), get({This, cancelDate})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'OrderHistoryData', 'STATUS'}), get({This, status})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'PaymentData', 'METHOD'}), get({This, paymentMethod})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'PaymentData', 'NAME'}), get({This, name})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'PaymentData', 'TYPE'}), get({This, type})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'PaymentData', 'EXPIRATION'}), get({This, expiration})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'BillingAddressData', 'NAME'}), get({This, billingName})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'BillingAddressData', 'STREET'}), get({This, billingStreet})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'BillingAddressData', 'CITY'}), get({This, billingCity})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'BillingAddressData', 'STATE'}), get({This, billingState})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'BillingAddressData', 'CODE'}), get({This, billingCode})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'BillingAddressData', 'COUNTRY'}), get({This, billingCountry})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'ShippingAddressData', 'NAME'}), get({This, shippingName})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'ShippingAddressData', 'STREET'}), get({This, shippingStreet})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'ShippingAddressData', 'CITY'}), get({This, shippingCity})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'ShippingAddressData', 'STATE'}), get({This, shippingState})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'ShippingAddressData', 'CODE'}), get({This, shippingCode})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'ShippingAddressData', 'COUNTRY'}), get({This, shippingCountry})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'ShippingMethodData', 'NAME'}), get({This, shippingMethodName})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'OrderHistoryData', 'SUBTOTAL'}), get({This, subTotal})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'OrderHistoryData', 'SHIPPINGCOST'}), get({This, shippingCost})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'OrderHistoryData', 'TAX'}), get({This, tax})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'OrderHistoryData', 'TOTAL'}), get({This, total})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'EntryData':getInstance(), 'SPECIAL'}), get({This, special})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'OrderData', 'CUSTOMERCOMMENT'}), get({This, userComment})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'OrderData', 'CUSTOMERCANCELCOMMENT'}), get({This, userCancelComment})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'OrderData', 'STORECOMMENT'}), get({This, storeComment})),
            (get({OrderHashMap, '$class'})):put(OrderHashMap, get({'OrderData', 'STORECANCELCOMMENT'}), get({This, storeCancelComment})),
            (get({WhereHashMap, '$class'})):put(WhereHashMap, get({'OrderData', 'ID'}), get({This, orderId})),
            (fun(Target_N71535) -> (get({Target_N71535, '$class'})):update(Target_N71535, WhereHashMap, OrderHashMap) end)('OrderHistoryEntityFactory':getInstance()),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Success, This, "update()");
                false -> ok
            end,
            Success
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to update order table",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "update()", E);
                false -> ok
            end,
            Error
        end.

