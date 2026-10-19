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
% package org.allbinary.logic.visual.dhtml.style.css.property
% import java.util.HashMap
% import org.allbinary.data.tree.dom.DomData
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('CssProperty').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, propertyName}, undefined),
    put({This, cssPropertyValues}, undefined),
    ok.


new(Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name),
    This;
new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Node),
    This.

init(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        put({This, propertyName}, Name),
        put({This, cssPropertyValues}, 'CssPropertyValues':new());
init(This, Node) ->
    init_fields(This),
        PropertyNode = 'DomSearchHelper':getNode(get({'DomData', 'VALUE'}), (get({Node, '$class'})):getChildNodes(Node)),
        put({This, propertyName}, 'DomNodeHelper':getTextNodeValue(PropertyNode)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'STYLE'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Name: ", (get({This, '$class'})):getName(This)]), This, "CssProperty()");
            false -> ok
        end,
        PropertyValuesNode = 'DomSearchHelper':getNode(get({'CssPropertyData':getInstance(), 'VALUES'}), (get({Node, '$class'})):getChildNodes(Node)),
        put({This, cssPropertyValues}, 'CssPropertyValues':new(PropertyValuesNode)).


getName(This) ->
        get({This, propertyName}).

toHashMap(This) ->
        HashMap = (fun(Target_N66737) -> (get({Target_N66737, '$class'})):createHashMap(Target_N66737) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'CssPropertyData':getInstance(), 'NAME'}), get({This, propertyName})),
        HashMap.

% throws Exception
toXmlNode(This, Document) ->
        HashMap = (get({This, '$class'})):toHashMap(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["CssView HashMap: ", (get({HashMap, '$class'})):toString(HashMap)]), This, "toXmlNode()");
            false -> ok
        end,
        Node = 'ModDomHelper':createNameValueNodes(Document, get({'CssPropertyData':getInstance(), 'NAME'}), get({This, propertyName})),
        (get({Node, '$class'})):appendChild(Node, (get({get({This, cssPropertyValues}), '$class'})):toXmlNode(get({This, cssPropertyValues}), Document)),
        Node.

