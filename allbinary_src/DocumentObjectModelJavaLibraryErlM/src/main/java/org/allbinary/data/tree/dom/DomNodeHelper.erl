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
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('DomNodeHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getFirstChildElement(ParentNode) ->
        put({local, node}, (get({ParentNode, '$class'})):getFirstChild(ParentNode)),
        case ((get({local, node}) =/= undefined) andalso ((get({get({local, node}), '$class'})):getNodeType(get({local, node})) =/= get({'Node', 'ELEMENT_NODE'}))) of
            true ->
            NodeList = (get({ParentNode, '$class'})):getChildNodes(ParentNode),
            lists:foreach(fun(Index) ->
                put({local, node}, (get({NodeList, '$class'})):item(NodeList, Index)),
                case ((get({get({local, node}), '$class'})):getNodeType(get({local, node})) =:= 1) of
                    true ->
                    throw('$break');
                    false -> ok
                end
            end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1));
            false -> ok
        end,
        get({local, node}).

getTextNodeValue(Node) ->
        try
        NodeTextNode = (get({Node, '$class'})):getFirstChild(Node),
        case (NodeTextNode =/= undefined) of
            true ->
            throw({'$return', (get({NodeTextNode, '$class'})):getNodeValue(NodeTextNode)});
            false ->
            throw({'$return', get({'StringUtil':getInstance(), 'EMPTY_STRING'})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getTextNodeValue(NodeName, NodeList) when (is_list(NodeName) orelse NodeName =:= undefined) ->
        Node = 'DomSearchHelper':getNode(NodeName, NodeList),
        'DomNodeHelper':getTextNodeValue(Node).

getTextNodesValue(Node) ->
        StringBuffer = 'StringMaker':new(),
        NodeList = (get({Node, '$class'})):getChildNodes(Node),
        lists:foreach(fun(Index) ->
            NodeTextNode = (get({NodeList, '$class'})):item(NodeList, Index),
            case ((get({NodeTextNode, '$class'})):getNodeType(NodeTextNode) =:= get({'Node', 'TEXT_NODE'})) of
                true ->
                case (NodeTextNode =/= undefined) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({NodeTextNode, '$class'})):getNodeValue(NodeTextNode));
                    false -> ok
                end;
                false -> ok
            end
        end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

