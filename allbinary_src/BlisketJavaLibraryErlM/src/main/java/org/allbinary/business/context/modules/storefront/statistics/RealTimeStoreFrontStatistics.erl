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
% package org.allbinary.business.context.modules.storefront.statistics
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.context.modules.storefront.statistics.advertisements.StoreFrontAdvertisementsStatistics
% import org.allbinary.business.context.modules.storefront.statistics.advertisements.StoreFrontAdvertisementsStatisticsInterface
% import org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatistics
% import org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatisticsInterface
% import org.allbinary.business.context.modules.storefront.statistics.orders.history.StoreFrontOrdersHistoryStatistics
% import org.allbinary.business.context.modules.storefront.statistics.orders.history.StoreFrontOrdersHistoryStatisticsInterface
% import org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatistics
% import org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatisticsInterface

-module('RealTimeStoreFrontStatistics').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements StoreFrontStatisticsInterface

init_fields(This) ->
    put({This, storeFrontAdvertisementsStatisticsInterface}, undefined),
    put({This, storeFrontUsersStatisticsInterface}, undefined),
    put({This, storeFrontInventoryStatisticsInterface}, undefined),
    put({This, storeFrontOrderHistoryStatisticsInterface}, undefined),
    ok.


new(StoreFrontInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, StoreFrontInterface),
    This.

'$init'(This, StoreFrontInterface) ->
    init_fields(This),
        put({This, storeFrontAdvertisementsStatisticsInterface}, 'StoreFrontAdvertisementsStatistics':new(StoreFrontInterface)),
        put({This, storeFrontUsersStatisticsInterface}, 'StoreFrontUsersStatistics':new(StoreFrontInterface)),
        put({This, storeFrontInventoryStatisticsInterface}, 'StoreFrontInventoryStatistics':new(StoreFrontInterface)),
        put({This, storeFrontOrderHistoryStatisticsInterface}, 'StoreFrontOrdersHistoryStatistics':new(StoreFrontInterface)).

getAdvertisements(This) ->
        get({This, storeFrontAdvertisementsStatisticsInterface}).

getUsers(This) ->
        get({This, storeFrontUsersStatisticsInterface}).

getInventory(This) ->
        get({This, storeFrontInventoryStatisticsInterface}).

getOrders(This) ->
        get({This, storeFrontOrderHistoryStatisticsInterface}).

