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
% package org.allbinary.data.tree.dom
% import java.util.HashMap
% import java.util.Set
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.java.anyType.clazz.ClassUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonSeps
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('ModDomHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
createTextNode(Document, Name, Text) when (is_list(Name) orelse Name =:= undefined), (is_list(Text) orelse Text =:= undefined) ->
        NewValueNode = (get({Document, '$class'})):createElement(Document, Name),
        NewValueTextNode = (get({Document, '$class'})):createTextNode(Document, Text),
        (get({NewValueNode, '$class'})):appendChild(NewValueNode, NewValueTextNode),
        NewValueNode.

% throws Exception
createValueNode(Document, Text) when (is_list(Text) orelse Text =:= undefined) ->
        'ModDomHelper':createTextNode(Document, get({'DomData', 'VALUE'}), Text).

% throws Exception
createNameNode(Document, Text) when (is_list(Text) orelse Text =:= undefined) ->
        'ModDomHelper':createTextNode(Document, get({'DomData', 'NAME'}), Text).

% throws Exception
createIndexNode(Document, Index) when is_integer(Index) ->
        'ModDomHelper':createTextNode(Document, get({'DomData', 'INDEX'}), (get({Index, '$class'})):toString(Index)).

% throws Exception
createNameValueNodes(Document, ElementName, NameText, ValueText) when (is_list(ElementName) orelse ElementName =:= undefined), (is_list(NameText) orelse NameText =:= undefined), (is_list(ValueText) orelse ValueText =:= undefined) ->
        NewNode = (get({Document, '$class'})):createElement(Document, ElementName),
        (get({NewNode, '$class'})):appendChild(NewNode, 'ModDomHelper':createNameNode(Document, NameText)),
        (get({NewNode, '$class'})):appendChild(NewNode, 'ModDomHelper':createValueNode(Document, ValueText)),
        NewNode;
% throws Exception
createNameValueNodes(Document, RootNodeName, DuplicateNodeName, ValueVector) when (is_list(RootNodeName) orelse RootNodeName =:= undefined), (is_list(DuplicateNodeName) orelse DuplicateNodeName =:= undefined) ->
        StringUtil = 'StringUtil':getInstance(),
        Node = (get({Document, '$class'})):createElement(Document, RootNodeName),
        Size = (get({ValueVector, '$class'})):size(ValueVector),
        lists:foreach(fun(I) ->
            Value = (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({ValueVector, '$class'})):get(ValueVector, I)),
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, DuplicateNodeName, Value))
        end, lists:seq(0, Size - 1)),
        Node.

% throws Exception
createNameValueNodes(Document, ElementNameAndNameText, ValueText) when (is_list(ElementNameAndNameText) orelse ElementNameAndNameText =:= undefined), (is_list(ValueText) orelse ValueText =:= undefined) ->
        NewNode = 'ModDomHelper':createNameValueNodes(Document, ElementNameAndNameText, ElementNameAndNameText, ValueText),
        NewNode;
% throws Exception
createNameValueNodes(Document, RootNode, HashMap) when (is_list(RootNode) orelse RootNode =:= undefined) ->
        Node = (get({Document, '$class'})):createElement(Document, RootNode),
        'ModDomHelper':createNameValueNodes(Document, Node, HashMap);
% throws Exception
createNameValueNodes(Document, Node, HashMap) ->
        StringUtil = 'StringUtil':getInstance(),
        KeySet = (get({HashMap, '$class'})):keySet(HashMap),
        KeyArray = (get({KeySet, '$class'})):toArray(KeySet),
        Size = array:size(KeyArray),
        lists:foreach(fun(I) ->
            ObjectKey = array:get(I, KeyArray),
            Name = ObjectKey,
            AnyType = (get({HashMap, '$class'})):get(HashMap, ObjectKey),
            case (AnyType =:= undefined) of
                true ->
                put({local, value}, get({StringUtil, 'EMPTY_STRING'})),
                (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, Name, get({local, value})));
                false ->
                case allbinary_java:instance_of(AnyType, 'String') of
                true ->
                put({local, value}, (get({StringUtil, '$class'})):getNonNull(StringUtil, AnyType)),
                (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, Name, get({local, value})));
                false ->
                case allbinary_java:instance_of(AnyType, 'HashMap') of
                true ->
                (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, Name, HashMap));
                false ->
                erlang:error({'Exception', lists:concat(["HashMap value is the wrong instance and is: ", 'ClassUtil':viewAll(AnyType, get({'CommonSeps':getInstance(), 'NEW_LINE'}))])})
            end
            end
            end
        end, lists:seq(0, Size - 1)),
        Node.

% throws Exception
createNameValueIndexNodes(Document, ElementNameAndNameText, Index, ValueText) when (is_list(ElementNameAndNameText) orelse ElementNameAndNameText =:= undefined), is_integer(Index), (is_list(ValueText) orelse ValueText =:= undefined) ->
        NewNode = 'ModDomHelper':createNameValueNodes(Document, ElementNameAndNameText, ValueText),
        (get({NewNode, '$class'})):appendChild(NewNode, 'ModDomHelper':createIndexNode(Document, Index)),
        NewNode;
% throws Exception
createNameValueIndexNodes(Document, RootNodeName, DuplicateNodeName, ValueVector) when (is_list(RootNodeName) orelse RootNodeName =:= undefined), (is_list(DuplicateNodeName) orelse DuplicateNodeName =:= undefined) ->
        StringUtil = 'StringUtil':getInstance(),
        Node = (get({Document, '$class'})):createElement(Document, RootNodeName),
        Size = (get({ValueVector, '$class'})):size(ValueVector),
        lists:foreach(fun(Index) ->
            Value = (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({ValueVector, '$class'})):get(ValueVector, Index)),
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueIndexNodes(Document, DuplicateNodeName, Index, Value))
        end, lists:seq(0, Size - 1)),
        Node.





% throws Exception
createNodeWithValueNodes(Document, RootNode, HashMap) when (is_list(RootNode) orelse RootNode =:= undefined) ->
        Node = (get({Document, '$class'})):createElement(Document, RootNode),
        'ModDomHelper':createNodeWithValueNodes(Document, Node, HashMap);
% throws Exception
createNodeWithValueNodes(Document, Node, HashMap) ->
        StringUtil = 'StringUtil':getInstance(),
        KeySet = (get({HashMap, '$class'})):keySet(HashMap),
        KeyArray = (get({KeySet, '$class'})):toArray(KeySet),
        Size = array:size(KeyArray),
        lists:foreach(fun(I) ->
            Name = array:get(I, KeyArray),
            AnyType = (get({HashMap, '$class'})):get(HashMap, Name),
            Value = (get({StringUtil, '$class'})):getNonNull(StringUtil, AnyType),
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createTextNode(Document, Name, Value))
        end, lists:seq(0, Size - 1)),
        Node.


