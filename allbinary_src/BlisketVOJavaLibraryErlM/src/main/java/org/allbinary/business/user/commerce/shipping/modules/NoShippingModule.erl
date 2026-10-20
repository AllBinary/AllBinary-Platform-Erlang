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
% import org.allbinary.business.user.commerce.inventory.order.OrderInterface
% import org.allbinary.business.user.commerce.money.Money
% import org.allbinary.string.CommonStrings

-module('NoShippingModule').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ShippingInterface

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, name}, "No Shipping"),
    put({This, description}, "This shipping method is for items that are not shipped."),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getCost(This, Order) ->
        'Money':new().

getDescription(This) ->
        get({This, description}).

getName(This) ->
        get({This, name}).

