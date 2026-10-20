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
% package org.allbinary.business.user.commerce.money.payment

-module('PaymentData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'MIN'}, 4),
    put({?MODULE, 'MAX'}, 19),
    put({?MODULE, 'ADDNEW'}, "Add New Payment"),
    put({?MODULE, 'VIEW'}, "View Payment"),
    put({?MODULE, 'SELECT'}, "Select Payment"),
    put({?MODULE, 'CHANGE'}, "Change Payment"),
    put({?MODULE, 'PAYMENT'}, "PAYMENT"),
    put({?MODULE, 'METHOD'}, "PAYMENT_METHOD"),
    put({?MODULE, 'ID'}, "PAYMENT_ID"),
    put({?MODULE, 'NUMBER'}, "PAYMENT_NUMBER"),
    put({?MODULE, 'NAME'}, "PAYMENT_NAME"),
    put({?MODULE, 'TYPE'}, "PAYMENT_TYPE"),
    put({?MODULE, 'EXPIRATION'}, "PAYMENT_EXPIRATION"),
    put({?MODULE, 'TENDERTYPE'}, "PAYMENT_TENDERTYPE"),
    put({?MODULE, 'TRANSACTIONTYPE'}, "PAYMENT_TRANSACTIONTYPE"),
    put({?MODULE, 'ABA'}, "PAYMENT_ABA"),
    put({?MODULE, 'ACCOUNT'}, "PAYMENT_ACCOUNT"),
    put({?MODULE, 'ACCOUNTTYPE'}, "PAYMENT_ACCOUNTTYPE"),
    put({?MODULE, 'AUTHORIZATIONCODE'}, "PAYMENT_AUTHORIZATIONCODE"),
    put({?MODULE, 'CHECKNUMBER'}, "PAYMENT_CHECKNUMBER"),
    put({?MODULE, 'CHECKTYPE'}, "PAYMENT_CHECKTYPE"),
    put({?MODULE, 'DRIVERSLICENSE'}, "PAYMENT_DRIVERSLICENSE"),
    put({?MODULE, 'MAGNETICINKCHECKREADER'}, "PAYMENT_MAGNETICINKCHECKREADER"),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


