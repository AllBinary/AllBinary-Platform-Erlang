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
% package org.allbinary.business.user.commerce.shipping.modules
% import org.allbinary.business.user.commerce.inventory.basket.BasketInterface
% import org.allbinary.business.user.commerce.inventory.order.OrderInterface
% import org.allbinary.business.user.commerce.money.Money
% import org.allbinary.string.CommonStrings

-module('BasicWeightShippingModule').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ShippingInterface

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, name}, "Basic Shipping (5 to 7 working days)"),
    put({This, description}, "We will soon provide a variety of shipping methods."),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getCost(This, Order) ->
        Basket = (get({Order, '$class'})):getBasket(Order),
        Money = 'Money':new(),
        (get({Money, '$class'})):add(Money, (get({Basket, '$class'})):getTotalWeight(Basket)),
        (get({Money, '$class'})):multiply(Money, 1),
        (get({Money, '$class'})):add(Money, "3.50"),
        Money.

getDescription(This) ->
        get({This, description}).

getName(This) ->
        get({This, name}).

