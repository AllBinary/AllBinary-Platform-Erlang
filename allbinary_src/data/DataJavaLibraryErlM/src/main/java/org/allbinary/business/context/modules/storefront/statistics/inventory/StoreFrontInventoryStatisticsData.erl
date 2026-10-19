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
% package org.allbinary.business.context.modules.storefront.statistics.inventory

-module('StoreFrontInventoryStatisticsData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'StoreFrontInventoryStatisticsData':new()),
    ok.

init_fields(This) ->
    put({This, 'NAME'}, "STOREFRONT_INVENTORY_STATISTICS_NAME"),
    put({This, 'NUMBEROFITEMS'}, "STOREFRONT_INVENTORY_STATISTICS_NUMBER_OF_ITEMS"),
    put({This, 'TOTALVALUE'}, "STOREFRONT_INVENTORY_STATISTICS_TOTAL_VALUE"),
    ok.


getInstance() ->
        get({'StoreFrontInventoryStatisticsData', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

