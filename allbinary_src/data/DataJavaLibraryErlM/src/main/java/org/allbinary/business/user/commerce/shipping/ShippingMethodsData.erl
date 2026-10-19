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
% package org.allbinary.business.user.commerce.shipping

-module('ShippingMethodsData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SHIPPINGMETHODSORDERSUMMARIES'}, "SHIPPINGMETHODS_ORDERSUMMARIES"),
    put({?MODULE, 'SHIPPINGMETHODORDERSUMMARY'}, "SHIPPINGMETHOD_ORDERSUMMARY"),
    put({?MODULE, 'SHIPPINGMETHODS'}, "SHIPPINGMETHODS"),
    put({?MODULE, 'NAME'}, "SHIPPINGMETHODS_NAME"),
    put({?MODULE, 'SHIPPINGCOST'}, "SHIPPINGMETHOD_SHIPPINGCOST"),
    put({?MODULE, 'TAXRATE'}, "SHIPPINGMETHOD_TAXRATE"),
    put({?MODULE, 'SUBTOTAL'}, "SHIPPINGMETHOD_SUBTOTAL"),
    put({?MODULE, 'TAX'}, "SHIPPINGMETHOD_TAX"),
    put({?MODULE, 'TOTAL'}, "SHIPPINGMETHOD_TOTAL"),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


