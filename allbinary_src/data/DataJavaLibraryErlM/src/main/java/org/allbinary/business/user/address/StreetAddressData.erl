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

-module('StreetAddressData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'MAX'}, 255),
    put({?MODULE, 'MIN'}, 0),
    put({?MODULE, 'FORM'}, "FORM"),
    put({?MODULE, 'STATES'}, "STATES"),
    put({?MODULE, 'NUMBEROFADDRESSES'}, "STREETADDRESS_NUMBEROFADDRESSES"),
    put({?MODULE, 'ID'}, "STREETADDRESS_ID"),
    put({?MODULE, 'DEFAULT'}, "STREETADDRESS_DEFAULT_ADDRESS"),
    put({?MODULE, 'ADDRESS'}, "STREETADDRESS_ADDRESS"),
    put({?MODULE, 'NAME'}, "STREETADDRESS_NAME"),
    put({?MODULE, 'STREET'}, "STREETADDRESS_STREET"),
    put({?MODULE, 'CITY'}, "STREETADDRESS_CITY"),
    put({?MODULE, 'STATE'}, "STREETADDRESS_STATE"),
    put({?MODULE, 'CODE'}, "STREETADDRESS_CODE"),
    put({?MODULE, 'COUNTRY'}, "STREETADDRESS_COUNTRY"),
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

