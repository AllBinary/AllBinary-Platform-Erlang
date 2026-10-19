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
% package org.allbinary.business.user.commerce.money.payment.gateway.modules.processor.authorizenet.aim

-module('AuthorizeNetAimData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'X_DELIM_DATA'}, "x_delim_data"),
    put({?MODULE, 'X_DELIM_CHAR'}, "x_delim_char"),
    put({?MODULE, 'X_ENCAP_CHAR'}, "x_encap_char"),
    put({?MODULE, 'X_AUTHENTICATION_INDICATOR'}, "x_authentication_indicator"),
    put({?MODULE, 'X_CARDHOLDER_AUTHENTICATION_VALUE'}, "x_cardholder_authentication_value"),
    put({?MODULE, 'X_DRIVERS_LICENSE_NUM'}, "x_drivers_license_num"),
    put({?MODULE, 'X_DRIVERS_LICENSE_STATE'}, "x_drivers_license_state"),
    put({?MODULE, 'X_DRIVERS_LICENSE_DOB'}, "x_drivers_license_dob"),
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

