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
% package org.allbinary.business.user.commerce.inventory.basket

-module('BasketData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'BASKET'}, "BASKET"),
    put({?MODULE, 'NAME'}, "NAME"),
    put({?MODULE, 'BASKETREVIEW'}, "BASKET_REVIEW"),
    put({?MODULE, 'TOTALWEIGHT'}, "BASKET_TOTALWEIGTH"),
    put({?MODULE, 'ITEMTOTAL'}, "BASKET_ITEMTOTAL"),
    put({?MODULE, 'ITEMTOTALINBASKET'}, "BASKET_ITEMTOTALINBASKET"),
    put({?MODULE, 'SUBTOTAL'}, "BASKET_SUBTOTAL"),
    put({?MODULE, 'ISEMPTY'}, "BASKET_ISEMPTY"),
    put({?MODULE, 'INSERT'}, "BASKET_INSERT"),
    put({?MODULE, 'DELETE'}, "BASKET_DELETE"),
    put({?MODULE, 'ADJUST'}, "BASKET_ADJUST"),
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

