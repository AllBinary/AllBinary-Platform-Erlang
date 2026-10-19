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
% import java.util.HashMap
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('StoreFrontOrdersHistoryStatisticsView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, storeFrontOrdersHistoryStatisticsInterface}, undefined),
    ok.


new(StoreFrontOrdersHistoryStatisticsInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, StoreFrontOrdersHistoryStatisticsInterface),
    This.

init(This, StoreFrontOrdersHistoryStatisticsInterface) ->
    init_fields(This),
        put({This, storeFrontOrdersHistoryStatisticsInterface}, StoreFrontOrdersHistoryStatisticsInterface).

% throws Exception
toXmlNode(This, Document) ->
        HashMap = (get({get({This, storeFrontOrdersHistoryStatisticsInterface}), '$class'})):toHashMap(get({This, storeFrontOrdersHistoryStatisticsInterface})),
        Node = 'ModDomHelper':createNameValueNodes(Document, get({'StoreFrontOrdersHistoryStatisticsData':getInstance(), 'NAME'}), HashMap),
        Node.

