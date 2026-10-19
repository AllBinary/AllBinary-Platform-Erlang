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
% package org.allbinary.dom
% import java.io.ByteArrayOutputStream
% import java.io.File
% import javax.xml.parsers.DocumentBuilder
% import javax.xml.parsers.DocumentBuilderFactory
% import javax.xml.transform.Transformer
% import javax.xml.transform.TransformerFactory
% import javax.xml.transform.dom.DOMSource
% import javax.xml.transform.stream.StreamResult
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('DomHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'DomHelper':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'DomHelper', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

createDocument(This) ->
        try
            Factory = 'DocumentBuilderFactory':newInstance(),
            Builder = (get({Factory, '$class'})):newDocumentBuilder(Factory),
            Document = (get({Builder, '$class'})):newDocument(Builder),
            Document
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            undefined
        end.

% throws Exception
createDocument(This, XmlFile) ->
        try
            Factory = 'DocumentBuilderFactory':newInstance(),
            Builder = (get({Factory, '$class'})):newDocumentBuilder(Factory),
            Document = (get({Builder, '$class'})):parse(Builder, XmlFile),
            Document
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws Exception
toString(This, Document) ->
        try
            DomSource = 'DOMSource':new(Document),
            ByteArrayOutputStream = 'ByteArrayOutputStream':new(),
            StreamResult = 'StreamResult':new(ByteArrayOutputStream),
            CopyTransformerFactory = 'TransformerFactory':newInstance(),
            CopyTransformer = (get({CopyTransformerFactory, '$class'})):newTransformer(CopyTransformerFactory),
            (get({CopyTransformer, '$class'})):transform(CopyTransformer, DomSource, StreamResult),
            (get({ByteArrayOutputStream, '$class'})):toString(ByteArrayOutputStream)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws Exception
save(This, File, Document) ->
        try
            CopyTransformerFactory = 'TransformerFactory':newInstance(),
            CopyTransformer = (get({CopyTransformerFactory, '$class'})):newTransformer(CopyTransformerFactory),
            DomSource = 'DOMSource':new(Document),
            (get({File, '$class'})):createNewFile(File),
            StreamResult = 'StreamResult':new(File),
            (get({CopyTransformer, '$class'})):transform(CopyTransformer, DomSource, StreamResult)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws Exception
getChildNodeList(This, NodeName, NodeList) when (is_list(NodeName) orelse NodeName =:= undefined) ->
        try
        NumberOfNodes = (get({NodeList, '$class'})):getLength(NodeList),
        lists:foreach(fun(Index) ->
            Node = (get({NodeList, '$class'})):item(NodeList, Index),
            case ((fun(Target_N67488) -> (get({Target_N67488, '$class'})):compareTo(Target_N67488, NodeName) end)((get({Node, '$class'})):getNodeName(Node)) =:= 0) of
                true ->
                throw({'$return', (get({Node, '$class'})):getChildNodes(Node)});
                false -> ok
            end
        end, lists:seq(0, NumberOfNodes - 1)),
        erlang:error({'Exception', lists:concat([NodeName, " Node Not Found"])})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getChildrenWithoutTextNodes(This, NodeName, NodeList) when (is_list(NodeName) orelse NodeName =:= undefined) ->
        List = 'BasicArrayListD':new(),
        ChildNodeList = (get({This, '$class'})):getChildNodeList(This, NodeName, NodeList),
        NumberOfChildren = (get({ChildNodeList, '$class'})):getLength(ChildNodeList),
        lists:foreach(fun(Index) ->
            Node = (get({ChildNodeList, '$class'})):item(ChildNodeList, Index),
            case ((get({Node, '$class'})):getNodeType(Node) =/= get({'Node', 'TEXT_NODE'})) of
                true ->
                (get({List, '$class'})):add(List, Node);
                false -> ok
            end
        end, lists:seq(0, NumberOfChildren - 1)),
        List.

% throws Exception
getWithoutTextNodes(This, NodeList) ->
        List = 'BasicArrayListD':new(),
        NumberOfChildren = (get({NodeList, '$class'})):getLength(NodeList),
        lists:foreach(fun(Index) ->
            Node = (get({NodeList, '$class'})):item(NodeList, Index),
            case ((get({Node, '$class'})):getNodeType(Node) =/= get({'Node', 'TEXT_NODE'})) of
                true ->
                (get({List, '$class'})):add(List, Node);
                false -> ok
            end
        end, lists:seq(0, NumberOfChildren - 1)),
        List.

% throws Exception
searchNodeList(This, NodeName, NodeList) when (is_list(NodeName) orelse NodeName =:= undefined) ->
        try
        NumberOfNodes = (get({NodeList, '$class'})):getLength(NodeList),
        lists:foreach(fun(Index) ->
            Node = (get({NodeList, '$class'})):item(NodeList, Index),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["NodeName: ", (get({Node, '$class'})):getNodeName(Node)]), This, "searchNodeList"),
            case ((fun(Target_N68692) -> (get({Target_N68692, '$class'})):compareTo(Target_N68692, NodeName) end)((get({Node, '$class'})):getNodeName(Node)) =:= 0) of
                true ->
                throw({'$return', Node});
                false -> ok
            end
        end, lists:seq(0, NumberOfNodes - 1)),
        erlang:error({'Exception', lists:concat([NodeName, " Node Not Found in search"])})
        catch throw:{'$return', ReturnValue} -> ReturnValue end;
% throws Exception
searchNodeList(This, NodeName, NodeList) when (is_list(NodeName) orelse NodeName =:= undefined) ->
        try
        NumberOfNodes = (get({NodeList, '$class'})):size(NodeList),
        lists:foreach(fun(Index) ->
            Node = (get({NodeList, '$class'})):get(NodeList, Index),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["NodeName: ", (get({Node, '$class'})):getNodeName(Node)]), This, "searchNodeList"),
            case ((fun(Target_N69110) -> (get({Target_N69110, '$class'})):compareTo(Target_N69110, NodeName) end)((get({Node, '$class'})):getNodeName(Node)) =:= 0) of
                true ->
                throw({'$return', Node});
                false -> ok
            end
        end, lists:seq(0, NumberOfNodes - 1)),
        erlang:error({'Exception', lists:concat([NodeName, " Node Not Found in search"])})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.


