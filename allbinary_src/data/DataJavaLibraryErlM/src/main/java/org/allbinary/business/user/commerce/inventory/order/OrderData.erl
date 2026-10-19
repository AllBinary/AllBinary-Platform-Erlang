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
% package org.allbinary.business.user.commerce.inventory.order

-module('OrderData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'ORDERS'}, "ORDERS"),
    put({?MODULE, 'ORDER'}, "ORDER"),
    put({?MODULE, 'ID'}, "ORDER_ID"),
    put({?MODULE, 'CUSTOMERCOMMENT'}, "ORDER_CUSTOMER_COMMENT"),
    put({?MODULE, 'CUSTOMERCANCELCOMMENT'}, "ORDER_CUSTOMER_CANCEL_COMMENT"),
    put({?MODULE, 'STORECOMMENT'}, "ORDER_STORE_COMMENT"),
    put({?MODULE, 'STORECANCELCOMMENT'}, "ORDER_STORE_CANCEL_COMMENT"),
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


