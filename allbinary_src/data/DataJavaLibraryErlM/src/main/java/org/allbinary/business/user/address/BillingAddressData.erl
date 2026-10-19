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

-module('BillingAddressData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'MAX'}, 255),
    put({?MODULE, 'MIN'}, 0),
    put({?MODULE, 'MULTIPLE'}, "BILLINGADDRESSES"),
    put({?MODULE, 'STATES'}, "BILLINGADDRESS_STATES"),
    put({?MODULE, 'SETTOSHIPPINGADDRESS'}, "Set To Shipping Address"),
    put({?MODULE, 'SELECT'}, "Select Billing Address"),
    put({?MODULE, 'SETTOSHIPPINGADDRESSNAME'}, "SETTOSHIPPINGADDRESS"),
    put({?MODULE, 'BILLINGADDRESSES'}, "BILLINGADDRESSES"),
    put({?MODULE, 'BILLINGADDRESS'}, "BILLINGADDRESS"),
    put({?MODULE, 'ID'}, "BILLINGADDRESS_ID"),
    put({?MODULE, 'ADDRESS'}, "BILLINGADDRESS_ADDRESS"),
    put({?MODULE, 'NAME'}, "BILLINGADDRESS_NAME"),
    put({?MODULE, 'STREET'}, "BILLINGADDRESS_STREET"),
    put({?MODULE, 'CITY'}, "BILLINGADDRESS_CITY"),
    put({?MODULE, 'STATE'}, "BILLINGADDRESS_STATE"),
    put({?MODULE, 'CODE'}, "BILLINGADDRESS_CODE"),
    put({?MODULE, 'COUNTRY'}, "BILLINGADDRESS_COUNTRY"),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

