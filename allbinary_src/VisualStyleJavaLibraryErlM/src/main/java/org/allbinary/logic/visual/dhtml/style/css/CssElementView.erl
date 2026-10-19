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
% package org.allbinary.logic.visual.dhtml.style.css
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
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.visual.dhtml.style.css.property.CssPropertiesValidationFactory
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('CssElementView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, 'TITLE'}, "title"),
    put({This, 'DESCRIPTION'}, "description"),
    put({This, value}, undefined),
    put({This, title}, undefined),
    put({This, description}, undefined),
    put({This, cssElementVector}, undefined),
    put({This, cssPropertyVector}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        put({This, cssPropertyVector}, 'BasicArrayListD':new()),
        StringUtil = 'StringUtil':getInstance(),
        put({This, title}, get({StringUtil, 'EMPTY_STRING'})),
        put({This, description}, get({StringUtil, 'EMPTY_STRING'})),
        put({This, value}, get({StringUtil, 'EMPTY_STRING'})).

new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Node),
    This.

init(This, Node) ->
    init_fields(This),
        try
            ValueNode = 'DomSearchHelper':getNode(get({'DomData', 'VALUE'}), (get({Node, '$class'})):getChildNodes(Node)),
            put({This, value}, 'DomNodeHelper':getTextNodeValue(ValueNode)),
            TitleValueNode = 'DomSearchHelper':getNodeNoThrow(get({This, 'TITLE'}), (get({Node, '$class'})):getChildNodes(Node)),
            case (TitleValueNode =/= undefined) of
                true ->
                put({This, title}, 'DomNodeHelper':getTextNodeValue(TitleValueNode));
                false ->
                StringUtil = 'StringUtil':getInstance(),
                put({This, title}, get({StringUtil, 'EMPTY_STRING'}))
            end,
            DescriptionValueNode = 'DomSearchHelper':getNodeNoThrow(get({This, 'DESCRIPTION'}), (get({Node, '$class'})):getChildNodes(Node)),
            case (DescriptionValueNode =/= undefined) of
                true ->
                put({This, description}, 'DomNodeHelper':getTextNodeValue(DescriptionValueNode));
                false ->
                put({This, description}, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67456) -> (get({Target_N67456, '$class'})):toString(Target_N67456) end)((fun(Target_N67463) -> (get({Target_N67463, '$class'})):append(Target_N67463, get({This, description})) end)((fun(Target_N67470) -> (get({Target_N67470, '$class'})):append(Target_N67470, "\nDescription: ") end)((fun(Target_N67477) -> (get({Target_N67477, '$class'})):append(Target_N67477, get({This, title})) end)((fun(Target_N67484) -> (get({Target_N67484, '$class'})):append(Target_N67484, "\nTitle: ") end)((fun(Target_N67491) -> (get({Target_N67491, '$class'})):append(Target_N67491, get({This, value})) end)((fun(Target_N67498) -> (get({Target_N67498, '$class'})):append(Target_N67498, "Value: ") end)('StringMaker':new()))))))), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
                false -> ok
            end,
            CssElementStyleNodeVector = 'DomSearchHelper':getAllNodes(get({'CssElementData':getInstance(), 'NAME'}), (get({Node, '$class'})):getChildNodes(Node)),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Child Css Elements: ", (get({CssElementStyleNodeVector, '$class'})):size(CssElementStyleNodeVector)]), This, "CssElementView()");
                false -> ok
            end,
            put({This, cssElementVector}, 'CssElementsValidationFactory':getInstance(CssElementStyleNodeVector)),
            NodeList = (get({Node, '$class'})):getChildNodes(Node),
            put({This, cssPropertyVector}, 'CssPropertiesValidationFactory':getInstance(NodeList))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (fun(Target_N68287) -> (get({Target_N68287, '$class'})):toString(Target_N68287) end)((fun(Target_N68294) -> (get({Target_N68294, '$class'})):append(Target_N68294, get({This, description})) end)((fun(Target_N68301) -> (get({Target_N68301, '$class'})):append(Target_N68301, "\nDescription: ") end)((fun(Target_N68308) -> (get({Target_N68308, '$class'})):append(Target_N68308, get({This, title})) end)((fun(Target_N68315) -> (get({Target_N68315, '$class'})):append(Target_N68315, "\nTitle: ") end)((fun(Target_N68322) -> (get({Target_N68322, '$class'})):append(Target_N68322, get({This, value})) end)((fun(Target_N68329) -> (get({Target_N68329, '$class'})):append(Target_N68329, "Value: ") end)('StringMaker':new()))))))), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}), E);
                false -> ok
            end,
            erlang:error({'Exception', "CssElementView"})
        end.

getValue(This) ->
        get({This, value}).

toHashMap(This) ->
        HashMap = (fun(Target_N68608) -> (get({Target_N68608, '$class'})):createHashMap(Target_N68608) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'DomData', 'VALUE'}), get({This, value})),
        (get({HashMap, '$class'})):put(HashMap, get({This, 'TITLE'}), get({This, title})),
        (get({HashMap, '$class'})):put(HashMap, get({This, 'DESCRIPTION'}), get({This, description})),
        HashMap.

% throws Exception
toXmlNode(This, Document) ->
        HashMap = (get({This, '$class'})):toHashMap(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["CssView HashMap: ", (get({HashMap, '$class'})):toString(HashMap)]), This, "toXmlNode");
            false -> ok
        end,
        Node = 'ModDomHelper':createNodeWithValueNodes(Document, get({'CssElementData':getInstance(), 'NAME'}), HashMap),
        Size = (get({get({This, cssPropertyVector}), '$class'})):size(get({This, cssPropertyVector})),
        lists:foreach(fun(Index) ->
            CssPropertyDomNodeInterface = (get({get({This, cssPropertyVector}), '$class'})):get(get({This, cssPropertyVector}), Index),
            (get({Node, '$class'})):appendChild(Node, (get({CssPropertyDomNodeInterface, '$class'})):toXmlNode(CssPropertyDomNodeInterface, Document))
        end, lists:seq(0, Size - 1)),
        Size2 = (get({get({This, cssElementVector}), '$class'})):size(get({This, cssElementVector})),
        lists:foreach(fun(Index) ->
            CssElementDomNodeInterface = (get({get({This, cssElementVector}), '$class'})):get(get({This, cssElementVector}), Index),
            (get({Node, '$class'})):appendChild(Node, (get({CssElementDomNodeInterface, '$class'})):toXmlNode(CssElementDomNodeInterface, Document))
        end, lists:seq(0, Size2 - 1)),
        Node.

