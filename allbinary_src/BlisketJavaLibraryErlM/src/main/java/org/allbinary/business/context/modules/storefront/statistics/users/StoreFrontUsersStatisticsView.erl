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
% package org.allbinary.business.context.modules.storefront.statistics.users
% import java.util.HashMap
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('StoreFrontUsersStatisticsView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, storeFrontUsersStatisticsInterface}, undefined),
    ok.


new(StoreFrontUsersStatisticsInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, StoreFrontUsersStatisticsInterface),
    This.

init(This, StoreFrontUsersStatisticsInterface) ->
    init_fields(This),
        put({This, storeFrontUsersStatisticsInterface}, StoreFrontUsersStatisticsInterface).

% throws Exception
toXmlNode(This, Document) ->
        HashMap = (get({get({This, storeFrontUsersStatisticsInterface}), '$class'})):toHashMap(get({This, storeFrontUsersStatisticsInterface})),
        Node = 'ModDomHelper':createNameValueNodes(Document, get({'StoreFrontUsersStatisticsData':getInstance(), 'NAME'}), HashMap),
        Node.

