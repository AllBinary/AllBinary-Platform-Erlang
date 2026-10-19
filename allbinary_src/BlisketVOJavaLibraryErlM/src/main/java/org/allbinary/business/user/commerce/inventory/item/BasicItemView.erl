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
% package org.allbinary.business.user.commerce.inventory.item
% import java.util.HashMap
% import java.util.Set
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('BasicItemView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    put({This, itemInterface}, undefined),
    put({This, vector}, undefined),
    ok.


new(ItemInterface, Vector) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ItemInterface, Vector),
    This.

init(This, ItemInterface, Vector) ->
    init_fields(This),
        put({This, itemInterface}, ItemInterface),
        put({This, vector}, Vector).

% throws Exception
toXmlNode(This, Document) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PRODUCTSEARCHLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "toXmlNode");
            false -> ok
        end,
        HashMap = (get({get({This, itemInterface}), '$class'})):toHashMap(get({This, itemInterface})),
        EMPTY_STRING = get({'StringUtil':getInstance(), 'EMPTY_STRING'}),
        (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'IMAGE'}), EMPTY_STRING),
        StringUtil = 'StringUtil':getInstance(),
        KeySet = (get({HashMap, '$class'})):keySet(HashMap),
        Node = (get({Document, '$class'})):createElement(Document, get({get({This, basicItemData}), 'ITEM'})),
        NameArray = (get({KeySet, '$class'})):toArray(KeySet),
        Size2 = array:size(NameArray),
        lists:foreach(fun(Index) ->
            Name = array:get(Index, NameArray),
            put({local, value}, (get({HashMap, '$class'})):get(HashMap, Name)),
            put({local, value}, (get({StringUtil, '$class'})):getNonNull(StringUtil, get({local, value}))),
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, Name, get({local, value})))
        end, lists:seq(0, Size2 - 1)),
        TotalNode = 'ModDomHelper':createNameValueNodes(Document, get({get({This, basicItemData}), 'TOTAL'}), (fun(Target_N67250) -> (get({Target_N67250, '$class'})):toString(Target_N67250) end)((get({get({This, itemInterface}), '$class'})):getTotal(get({This, itemInterface})))),
        (get({Node, '$class'})):appendChild(Node, TotalNode),
        Size = (get({get({This, vector}), '$class'})):size(get({This, vector})),
        lists:foreach(fun(Index) ->
            DomNodeInterface = (get({get({This, vector}), '$class'})):get(get({This, vector}), Index),
            CustomNode = (get({DomNodeInterface, '$class'})):toXmlNode(DomNodeInterface, Document),
            (get({Node, '$class'})):appendChild(Node, CustomNode)
        end, lists:seq(0, Size - 1)),
        Node.

toXmlDoc(This) ->
        undefined.

view(This) ->
        undefined.

