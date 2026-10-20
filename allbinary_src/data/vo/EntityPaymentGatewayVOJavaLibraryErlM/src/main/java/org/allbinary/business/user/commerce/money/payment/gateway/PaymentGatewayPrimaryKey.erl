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
% import org.allbinary.business.context.modules.storefront.StoreFront
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('PaymentGatewayPrimaryKey').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements Serializable

init_fields(This) ->
    put({This, storeName}, undefined),
    put({This, name}, undefined),
    ok.


new(StoreName, GatewayName) when (is_list(StoreName) orelse StoreName =:= undefined), (is_list(GatewayName) orelse GatewayName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, StoreName, GatewayName),
    This.

'$init'(This, StoreName, GatewayName) when (is_list(StoreName) orelse StoreName =:= undefined), (is_list(GatewayName) orelse GatewayName =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):setStoreName(This, StoreName),
        (get({This, '$class'})):setName(This, GatewayName).

getStoreName(This) ->
        get({This, storeName}).

setStoreName(This, StoreName) when (is_list(StoreName) orelse StoreName =:= undefined) ->
        put({This, storeName}, StoreName).

getName(This) ->
        get({This, name}).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({This, name}, Name).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({'PaymentGatewayPrimaryKey', '$class'})):getName('PaymentGatewayPrimaryKey')),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({'StoreFront', '$class'})):getName('StoreFront')),
        (get({StringBuffer, '$class'})):append(StringBuffer, " ="),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getStoreName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({'PaymentGateway', '$class'})):getName('PaymentGateway')),
        (get({StringBuffer, '$class'})):append(StringBuffer, "="),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getName(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

