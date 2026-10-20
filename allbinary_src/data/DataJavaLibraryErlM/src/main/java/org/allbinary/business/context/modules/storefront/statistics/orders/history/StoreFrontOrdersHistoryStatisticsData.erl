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
% package org.allbinary.business.context.modules.storefront.statistics.orders.history

-module('StoreFrontOrdersHistoryStatisticsData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'StoreFrontOrdersHistoryStatisticsData':new()),
    ok.

init_fields(This) ->
    put({This, 'NAME'}, "STOREFRONT_ORDERS_HISTORY_STATISTICS_NAME"),
    put({This, 'NUMBEROFORDERS'}, "STOREFRONT_ORDERS_HISTORY_STATISTICS_NUMBER_OF_ORDERS"),
    put({This, 'SUBTOTAL'}, "STOREFRONT_ORDERS_HISTORY_STATISTICS_SUBTOTAL"),
    put({This, 'SHIPPINGCOST'}, "STOREFRONT_ORDERS_HISTORY_STATISTICS_SHIPPINGCOST"),
    put({This, 'TAXES'}, "STOREFRONT_ORDERS_HISTORY_STATISTICS_TAXES"),
    put({This, 'TOTAL'}, "STOREFRONT_ORDERS_HISTORY_STATISTICS_TOTAL"),
    ok.


getInstance() ->
        get({'StoreFrontOrdersHistoryStatisticsData', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

