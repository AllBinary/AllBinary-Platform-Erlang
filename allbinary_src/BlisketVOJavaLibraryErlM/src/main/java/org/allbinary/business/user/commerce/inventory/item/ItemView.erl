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
% import org.allbinary.business.user.address.StreetAddressData
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.string.StringUtil
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('ItemView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, itemInterface}, undefined),
    put({This, vector}, undefined),
    ok.


new(ItemInterface, Vector) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ItemInterface, Vector),
    This.

'$init'(This, ItemInterface, Vector) ->
    init_fields(This),
        put({This, itemInterface}, ItemInterface),
        put({This, vector}, Vector).

% throws Exception
toXmlNode(This, Document) ->
        HashMap = (get({get({This, itemInterface}), '$class'})):toHashMap(get({This, itemInterface})),
        KeySet = (get({HashMap, '$class'})):keySet(HashMap),
        Node = (get({Document, '$class'})):createElement(Document, get({'ItemData', 'ITEM'})),
        BasicItemView = 'BasicItemView':new(get({This, itemInterface}), get({This, vector})),
        (get({Node, '$class'})):appendChild(Node, (get({BasicItemView, '$class'})):toXmlNode(BasicItemView, Document)),
        StringUtil = 'StringUtil':getInstance(),
        NameArray = (get({KeySet, '$class'})):toArray(KeySet),
        Size = array:size(NameArray),
        lists:foreach(fun(Index) ->
            Name = array:get(Index, NameArray),
            put({local, value}, (get({HashMap, '$class'})):get(HashMap, Name)),
            put({local, value}, (get({StringUtil, '$class'})):getNonNull(StringUtil, get({local, value}))),
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, Name, get({local, value})))
        end, lists:seq(0, Size - 1)),
        ShippingAddressNode = (get({Document, '$class'})):createElement(Document, get({'StreetAddressData', 'NAME'})),
        (get({ShippingAddressNode, '$class'})):appendChild(ShippingAddressNode, (fun(Target_N66836) -> (get({Target_N66836, '$class'})):toXmlNode(Target_N66836, Document) end)((get({get({This, itemInterface}), '$class'})):getShippingAddress(get({This, itemInterface})))),
        Node.

