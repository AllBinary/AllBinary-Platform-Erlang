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

-module('OrderHistoryData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'MAXIDLEN'}, 19),
    put({?MODULE, 'DATEDELTA'}, "DATE_DELTA"),
    put({?MODULE, 'DATETYPE'}, "DATE_TYPE"),
    put({?MODULE, 'TYPELONG'}, "TYPE_LONG"),
    put({?MODULE, 'TYPECAESAR'}, "TYPE_CAESAR"),
    put({?MODULE, 'TODATE'}, "TO_DATE"),
    put({?MODULE, 'FROMHOUR'}, "FROM_HOUR"),
    put({?MODULE, 'FROMDAY'}, "FROM_DAY"),
    put({?MODULE, 'FROMMONTH'}, "FROM_MONTH"),
    put({?MODULE, 'FROMYEAR'}, "FROM_YEAR"),
    put({?MODULE, 'TOHOUR'}, "TO_HOUR"),
    put({?MODULE, 'TODAY'}, "TO_DAY"),
    put({?MODULE, 'TOMONTH'}, "TO_MONTH"),
    put({?MODULE, 'TOYEAR'}, "TO_YEAR"),
    put({?MODULE, 'ORDERHISTORY'}, "ORDERHISTORY"),
    put({?MODULE, 'SHIPPEDDATE'}, "ORDERHISTORY_SHIPPED_DATE"),
    put({?MODULE, 'ORDERDATE'}, "ORDERHISTORY_ORDER_DATE"),
    put({?MODULE, 'TRANSDATE'}, "ORDERHISTORY_TRANS_DATE"),
    put({?MODULE, 'CANCELDATE'}, "ORDERHISTORY_CANCEL_DATE"),
    put({?MODULE, 'SHIPPEDDATEFORMATTED'}, "ORDERHISTORY_SHIPPED_DATE_FORMATTED"),
    put({?MODULE, 'ORDERDATEFORMATTED'}, "ORDERHISTORY_ORDER_DATE_FORMATTED"),
    put({?MODULE, 'TRANSDATEFORMATTED'}, "ORDERHISTORY_TRANS_DATE_FORMATTED"),
    put({?MODULE, 'CANCELDATEFORMATTED'}, "ORDERHISTORY_CANCEL_DATE_FORMATTED"),
    put({?MODULE, 'SUBTOTAL'}, "ORDERHISTORY_SUB_TOTAL"),
    put({?MODULE, 'SHIPPINGCOST'}, "ORDERHISTORY_SHIPPING_COST"),
    put({?MODULE, 'TAX'}, "ORDERHISTORY_TAX"),
    put({?MODULE, 'TOTAL'}, "ORDERHISTORY_TOTAL"),
    put({?MODULE, 'CANCELINFO'}, "ORDERHISTORY_CANCEL_INFO"),
    put({?MODULE, 'CANCELTYPE'}, "ORDERHISTORY_CANCEL_TYPE"),
    put({?MODULE, 'STATUS'}, "ORDERHISTORY_STATUS"),
    put({?MODULE, 'PREPROCESSINGNAME'}, "PREPROCESSING"),
    put({?MODULE, 'PROCESSINGNAME'}, "PROCESSING"),
    put({?MODULE, 'CANCELLEDNAME'}, "CANCELLED"),
    put({?MODULE, 'PARTIALLYSHIPPEDNAME'}, "PARTIALLYSHIPPED"),
    put({?MODULE, 'SHIPPEDNAME'}, "SHIPPED"),
    put({?MODULE, 'PREPROCESSING'}, "Order Preprocessing"),
    put({?MODULE, 'PROCESSING'}, "Order Processing"),
    put({?MODULE, 'CANCELLED'}, "Order Cancelled"),
    put({?MODULE, 'PARTIALLYSHIPPED'}, "Order Partially Shipped"),
    put({?MODULE, 'SHIPPED'}, "Order Shipped"),
    put({?MODULE, 'SETSTATUS'}, "Set Status"),
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


