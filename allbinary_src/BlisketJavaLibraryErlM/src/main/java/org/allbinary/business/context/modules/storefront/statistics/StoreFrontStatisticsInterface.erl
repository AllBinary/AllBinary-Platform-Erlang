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
% import org.allbinary.business.context.modules.storefront.statistics.advertisements.StoreFrontAdvertisementsStatisticsInterface
% import org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatisticsInterface
% import org.allbinary.business.context.modules.storefront.statistics.orders.history.StoreFrontOrdersHistoryStatisticsInterface
% import org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatisticsInterface

-module('StoreFrontStatisticsInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getAdvertisements(This) ->
    erlang:error({abstract_method, getAdvertisements}).

getUsers(This) ->
    erlang:error({abstract_method, getUsers}).

getInventory(This) ->
    erlang:error({abstract_method, getInventory}).

getOrders(This) ->
    erlang:error({abstract_method, getOrders}).

