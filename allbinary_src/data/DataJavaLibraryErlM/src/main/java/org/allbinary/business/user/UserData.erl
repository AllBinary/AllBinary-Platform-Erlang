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
% package org.allbinary.business.user

-module('UserData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'MAXLEN'}, 250),
    put({?MODULE, 'NAME'}, "USER_NAME"),
    put({?MODULE, 'USERNAME'}, "CUSTOMER_USER_NAME"),
    put({?MODULE, 'PASSWORD'}, "CUSTOMER_PASSWORD"),
    put({?MODULE, 'PREFIXNAME'}, "CUSTOMER_PREFIX_NAME"),
    put({?MODULE, 'FIRSTNAME'}, "CUSTOMER_FIRST_NAME"),
    put({?MODULE, 'LASTNAME'}, "CUSTOMER_LAST_NAME"),
    put({?MODULE, 'MIDDLENAME'}, "CUSTOMER_MIDDLE_NAME"),
    put({?MODULE, 'SUFFIXNAME'}, "CUSTOMER_SUFFIX_NAME"),
    put({?MODULE, 'COMPANY'}, "CUSTOMER_COMPANY"),
    put({?MODULE, 'POSITIONATCOMPANY'}, "CUSTOMER_POSITION_AT_COMPANY"),
    put({?MODULE, 'MAINEMAIL'}, "CUSTOMER_MAIN_EMAIL"),
    put({?MODULE, 'SECONDARYEMAIL'}, "CUSTOMER_SECONDARY_EMAIL"),
    put({?MODULE, 'HOMEPHONE'}, "CUSTOMER_HOME_PHONE"),
    put({?MODULE, 'CELLPHONE'}, "CUSTOMER_CELL_PHONE"),
    put({?MODULE, 'WORKPHONE'}, "CUSTOMER_WORK_PHONE"),
    put({?MODULE, 'OTHERCONTACT'}, "CUSTOMER_OTHER_CONTACT"),
    put({?MODULE, 'ELECTRONICDEVICE'}, "CUSTOMER_ELECTRONIC_DEVICE"),
    put({?MODULE, 'FAX'}, "CUSTOMER_FAX"),
    put({?MODULE, 'SECRET'}, "CUSTOMER_SECRET"),
    put({?MODULE, 'PERMISSIONS'}, "CUSTOMER_PERMISSIONS"),
    put({?MODULE, 'CONFIGURATION'}, "CUSTOMER_CONFIGURATION"),
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

