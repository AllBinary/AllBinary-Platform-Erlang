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
% package org.allbinary.business.user.address

-module('ShippingAddressData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SETTOBILLINGADDRESS'}, "Set To Billing Address"),
    put({?MODULE, 'SELECT'}, "Select Shipping Address"),
    put({?MODULE, 'SELECTNAME'}, "SELECTSHIPPINGADDRESS"),
    put({?MODULE, 'MULTIPLE'}, "SHIPPINGADDRESSES"),
    put({?MODULE, 'SHIPPINGADDRESSES'}, "SHIPPINGADDRESSES"),
    put({?MODULE, 'SHIPPINGADDRESS'}, "SHIPPINGADDRESS"),
    put({?MODULE, 'ID'}, "SHIPPINGADDRESS_ID"),
    put({?MODULE, 'ADDRESS'}, "SHIPPINGADDRESS_ADDRESS"),
    put({?MODULE, 'NAME'}, "SHIPPINGADDRESS_NAME"),
    put({?MODULE, 'STREET'}, "SHIPPINGADDRESS_STREET"),
    put({?MODULE, 'CITY'}, "SHIPPINGADDRESS_CITY"),
    put({?MODULE, 'STATE'}, "SHIPPINGADDRESS_STATE"),
    put({?MODULE, 'CODE'}, "SHIPPINGADDRESS_CODE"),
    put({?MODULE, 'COUNTRY'}, "SHIPPINGADDRESS_COUNTRY"),
    put({?MODULE, 'TAX'}, "SHIPPINGADDRESS_TAX"),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

