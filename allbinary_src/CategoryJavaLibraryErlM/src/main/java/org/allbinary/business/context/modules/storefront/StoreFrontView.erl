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
% package org.allbinary.business.context.modules.storefront
% import java.util.HashMap
% import org.allbinary.business.user.commerce.inventory.basket.BasketData
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('StoreFrontView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, storeFrontInterface}, undefined),
    ok.


new(StoreFrontInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, StoreFrontInterface),
    This.

init(This, StoreFrontInterface) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Constructing: StoreFrontView for: ", (get({StoreFrontInterface, '$class'})):getName(StoreFrontInterface)]), This, get({CommonStrings, 'GET_INSTANCE'}));
            false -> ok
        end,
        put({This, storeFrontInterface}, StoreFrontInterface).

% throws Exception
toXmlNode(This, Document) ->
        HashMap = (get({get({This, storeFrontInterface}), '$class'})):toHashMap(get({This, storeFrontInterface})),
        StoreFrontData = 'StoreFrontData':getInstance(),
        (get({HashMap, '$class'})):put(HashMap, get({StoreFrontData, 'CURRENTHOMEHOSTNAME'}), (get({get({This, storeFrontInterface}), '$class'})):getCurrentHomeHostName(get({This, storeFrontInterface}))),
        (get({HashMap, '$class'})):put(HashMap, get({StoreFrontData, 'CURRENTHOMEHOSTNAMEPATH'}), (get({get({This, storeFrontInterface}), '$class'})):getCurrentHomeHostNamePath(get({This, storeFrontInterface}))),
        (get({HashMap, '$class'})):put(HashMap, get({StoreFrontData, 'CURRENTHOSTNAME'}), (get({get({This, storeFrontInterface}), '$class'})):getCurrentHostName(get({This, storeFrontInterface}))),
        (get({HashMap, '$class'})):put(HashMap, get({StoreFrontData, 'CURRENTHOSTNAMEPATH'}), (get({get({This, storeFrontInterface}), '$class'})):getCurrentHostNamePath(get({This, storeFrontInterface}))),
        (get({HashMap, '$class'})):put(HashMap, get({'BasketData', 'NAME'}), (get({get({This, storeFrontInterface}), '$class'})):getBasketName(get({This, storeFrontInterface}))),
        Node = 'ModDomHelper':createNameValueNodes(Document, get({StoreFrontData, 'NAME'}), HashMap),
        Node.

