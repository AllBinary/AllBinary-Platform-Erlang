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
% package org.allbinary.business.user.commerce.money.payment.gateway
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('PaymentGatewayPageData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'EXTENSION'}, ".jsp"),
    put({?MODULE, 'NAME'}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({?MODULE, 'FORWARDMAKEPAYMENT'}, "MakePayment.jsp"),
    put({?MODULE, 'PAYMENTOPTIONS'}, lists:concat(["PaymentOptions", get({'PaymentGatewayPageData', 'EXTENSION'})])),
    put({?MODULE, 'STARTCHECKOUT'}, lists:concat(["StartCheckout", get({'PaymentGatewayPageData', 'EXTENSION'})])),
    ok.

init_fields(This) ->
    put({This, 'MAKEPAYMENT'}, undefined),
    put({This, 'CHECKOUT'}, undefined),
    put({This, 'SHIPPING'}, undefined),
    put({This, 'SHIPPINGADDRESS'}, undefined),
    put({This, 'SHIPPINGADDRESSACTION'}, undefined),
    put({This, 'BILLINGADDRESS'}, undefined),
    put({This, 'PAYMENT'}, undefined),
    put({This, 'AUTHORIZE'}, undefined),
    put({This, 'FINISH'}, undefined),
    ok.


new(Location, PaymentMethod) when (is_list(Location) orelse Location =:= undefined), (is_list(PaymentMethod) orelse PaymentMethod =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Location, PaymentMethod),
    This.

init(This, Location, PaymentMethod) when (is_list(Location) orelse Location =:= undefined), (is_list(PaymentMethod) orelse PaymentMethod =:= undefined) ->
    init_fields(This),
        PaymentMethodString = lists:concat([get({'PaymentGatewayPageData', 'NAME'}), PaymentMethod]),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, Location),
        (get({StringBuffer, '$class'})):append(StringBuffer, "MakePayment"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'PaymentGatewayPageData', 'EXTENSION'})),
        put({This, 'MAKEPAYMENT'}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, PaymentMethodString),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Checkout"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'PaymentGatewayPageData', 'EXTENSION'})),
        put({This, 'CHECKOUT'}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, PaymentMethodString),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Shipping"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'PaymentGatewayPageData', 'EXTENSION'})),
        put({This, 'SHIPPING'}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, PaymentMethodString),
        (get({StringBuffer, '$class'})):append(StringBuffer, "ShippingAddress"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'PaymentGatewayPageData', 'EXTENSION'})),
        put({This, 'SHIPPINGADDRESS'}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, PaymentMethodString),
        (get({StringBuffer, '$class'})):append(StringBuffer, "ShippingAddressAction"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'PaymentGatewayPageData', 'EXTENSION'})),
        put({This, 'SHIPPINGADDRESSACTION'}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, PaymentMethodString),
        (get({StringBuffer, '$class'})):append(StringBuffer, "BillingAddress"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'PaymentGatewayPageData', 'EXTENSION'})),
        put({This, 'BILLINGADDRESS'}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, PaymentMethodString),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Payment"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'PaymentGatewayPageData', 'EXTENSION'})),
        put({This, 'PAYMENT'}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, PaymentMethodString),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Authorize"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'PaymentGatewayPageData', 'EXTENSION'})),
        put({This, 'AUTHORIZE'}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, PaymentMethodString),
        (get({StringBuffer, '$class'})):append(StringBuffer, "PaymentFinish"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'PaymentGatewayPageData', 'EXTENSION'})),
        put({This, 'FINISH'}, (get({StringBuffer, '$class'})):toString(StringBuffer)).

