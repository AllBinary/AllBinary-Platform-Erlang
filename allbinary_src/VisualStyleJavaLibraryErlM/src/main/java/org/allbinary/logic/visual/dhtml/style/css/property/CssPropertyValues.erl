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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tree.dom.DomData
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('CssPropertyValues').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, propertyValueVector}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        put({This, propertyValueVector}, 'BasicArrayListD':new()).

new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Node),
    This.

'$init'(This, Node) ->
    init_fields(This),
        IndexPropertyValueHashMap = (fun(Target_N66177) -> (get({Target_N66177, '$class'})):createHashMap(Target_N66177) end)('StdUtil':getInstance()),
        put({This, propertyValueVector}, 'BasicArrayListD':new()),
        CssPropertyNodeVector = 'DomSearchHelper':getAllNodes(get({'CssPropertyValueData':getInstance(), 'NAME'}), (get({Node, '$class'})):getChildNodes(Node)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'STYLE'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Number Of Properties: ", (get({CssPropertyNodeVector, '$class'})):size(CssPropertyNodeVector)]), This, "CssProperties()");
            false -> ok
        end,
        Size = (get({CssPropertyNodeVector, '$class'})):size(CssPropertyNodeVector),
        lists:foreach(fun(Index) ->
            CssPropertyValueNode = (get({CssPropertyNodeVector, '$class'})):get(CssPropertyNodeVector, Index),
            ValueNode = 'DomSearchHelper':getNode(get({'DomData', 'VALUE'}), (get({CssPropertyValueNode, '$class'})):getChildNodes(CssPropertyValueNode)),
            put({local, propertyValue}, 'DomNodeHelper':getTextNodeValue(ValueNode)),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'STYLE'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Property Value: ", get({local, propertyValue})]), This, "CssProperties()");
                false -> ok
            end,
            IndexNode = 'DomSearchHelper':getNode(get({'DomData', 'INDEX'}), (get({CssPropertyValueNode, '$class'})):getChildNodes(CssPropertyValueNode)),
            IndexValue = 'DomNodeHelper':getTextNodeValue(IndexNode),
            (get({IndexPropertyValueHashMap, '$class'})):put(IndexPropertyValueHashMap, IndexValue, get({local, propertyValue}))
        end, lists:seq(0, Size - 1)),
        Size2 = (fun(Target_N67302) -> (get({Target_N67302, '$class'})):size(Target_N67302) end)((get({IndexPropertyValueHashMap, '$class'})):keySet(IndexPropertyValueHashMap)),
        lists:foreach(fun(Index) ->
            IndexInt = Index,
            put({local, propertyValue}, (get({IndexPropertyValueHashMap, '$class'})):get(IndexPropertyValueHashMap, (get({IndexInt, '$class'})):toString(IndexInt))),
            (get({get({This, propertyValueVector}), '$class'})):add(get({This, propertyValueVector}), get({local, propertyValue}))
        end, lists:seq(0, Size2 - 1)).

toHashMap(This) ->
        CommonSeps = 'CommonSeps':getInstance(),
        CssPropertyValueData = 'CssPropertyValueData':getInstance(),
        HashMap = (fun(Target_N67741) -> (get({Target_N67741, '$class'})):createHashMap(Target_N67741) end)('StdUtil':getInstance()),
        StringBuffer = 'StringMaker':new(),
        Size = (get({get({This, propertyValueVector}), '$class'})):size(get({This, propertyValueVector})),
        put({local, index}, 0),
        (fun Loop() -> case (get({local, index}) < Size) of true ->
            Value = (get({get({This, propertyValueVector}), '$class'})):get(get({This, propertyValueVector}), get({local, index})),
            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({CssPropertyValueData, 'NAME'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'BRACKET_OPEN'})),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, get({local, index})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'BRACKET_CLOSE'})),
            (get({HashMap, '$class'})):put(HashMap, (get({StringBuffer, '$class'})):toString(StringBuffer), Value),
            put({local, index}, get({local, index}) + 1),
            put({local, index}, get({local, index}) + 1),
            Loop();
        false -> ok end end)(),
        HashMap.

% throws Exception
toXmlNode(This, Document) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            HashMap = (get({This, '$class'})):toHashMap(This),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["CssPropertyValues HashMap: ", (get({HashMap, '$class'})):toString(HashMap)]), This, "toXmlNode()");
            false -> ok
        end,
        'ModDomHelper':createNameValueIndexNodes(Document, get({'CssPropertyData':getInstance(), 'VALUES'}), get({'CssPropertyValueData':getInstance(), 'NAME'}), get({This, propertyValueVector})).

