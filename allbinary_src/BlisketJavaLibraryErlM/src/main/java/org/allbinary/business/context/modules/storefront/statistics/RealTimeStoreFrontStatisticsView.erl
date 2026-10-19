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
% import org.allbinary.business.context.modules.storefront.statistics.advertisements.StoreFrontAdvertisementsStatisticsView
% import org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatisticsInterface
% import org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatisticsView
% import org.allbinary.business.context.modules.storefront.statistics.orders.history.StoreFrontOrdersHistoryStatisticsInterface
% import org.allbinary.business.context.modules.storefront.statistics.orders.history.StoreFrontOrdersHistoryStatisticsView
% import org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatisticsInterface
% import org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatisticsView
% import org.allbinary.business.user.role.UserRole
% import org.allbinary.business.user.role.UserRoleFactory
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('RealTimeStoreFrontStatisticsView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, storeFrontStatisticsInterface}, undefined),
    put({This, userRole}, undefined),
    ok.


new(StoreFrontStatisticsInterface, UserRole) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, StoreFrontStatisticsInterface, UserRole),
    This.

init(This, StoreFrontStatisticsInterface, UserRole) ->
    init_fields(This),
        put({This, storeFrontStatisticsInterface}, StoreFrontStatisticsInterface),
        put({This, userRole}, UserRole).

% throws Exception
toXmlNode(This, Document) ->
        Node = (get({Document, '$class'})):createElement(Document, get({'StoreFrontStatisticsData':getInstance(), 'NAME'})),
        StoreFrontAdvertisementsStatisticsInterface = (get({get({This, storeFrontStatisticsInterface}), '$class'})):getAdvertisements(get({This, storeFrontStatisticsInterface})),
        StoreFrontAdvertisementsStatisticsDomNodeInterface = 'StoreFrontAdvertisementsStatisticsView':new(StoreFrontAdvertisementsStatisticsInterface),
        (get({Node, '$class'})):appendChild(Node, (get({StoreFrontAdvertisementsStatisticsDomNodeInterface, '$class'})):toXmlNode(StoreFrontAdvertisementsStatisticsDomNodeInterface, Document)),
        StoreFrontInventoryStatisticsInterface = (get({get({This, storeFrontStatisticsInterface}), '$class'})):getInventory(get({This, storeFrontStatisticsInterface})),
        StoreFrontInventoryStatisticsDomNodeInterface = 'StoreFrontInventoryStatisticsView':new(StoreFrontInventoryStatisticsInterface),
        (get({Node, '$class'})):appendChild(Node, (get({StoreFrontInventoryStatisticsDomNodeInterface, '$class'})):toXmlNode(StoreFrontInventoryStatisticsDomNodeInterface, Document)),
        StoreFrontOrdersHistoryStatisticsInterface = (get({get({This, storeFrontStatisticsInterface}), '$class'})):getOrders(get({This, storeFrontStatisticsInterface})),
        StoreFrontOrdersHistoryStatisticsDomNodeInterface = 'StoreFrontOrdersHistoryStatisticsView':new(StoreFrontOrdersHistoryStatisticsInterface),
        (get({Node, '$class'})):appendChild(Node, (get({StoreFrontOrdersHistoryStatisticsDomNodeInterface, '$class'})):toXmlNode(StoreFrontOrdersHistoryStatisticsDomNodeInterface, Document)),
        case (get({This, userRole}) =:= get({'UserRoleFactory':getInstance(), 'ADMINISTRATOR'})) of
            true ->
            StoreFrontUsersStatisticsInterface = (get({get({This, storeFrontStatisticsInterface}), '$class'})):getUsers(get({This, storeFrontStatisticsInterface})),
            StoreFrontUsersStatisticsDomNodeInterface = 'StoreFrontUsersStatisticsView':new(StoreFrontUsersStatisticsInterface),
            (get({Node, '$class'})):appendChild(Node, (get({StoreFrontUsersStatisticsDomNodeInterface, '$class'})):toXmlNode(StoreFrontUsersStatisticsDomNodeInterface, Document));
            false -> ok
        end,
        Node.

