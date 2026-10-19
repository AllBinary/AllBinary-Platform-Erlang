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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('DomSearchHelper').
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

getNodeNoThrow(NodeName, NodeList) when (is_list(NodeName) orelse NodeName =:= undefined) ->
        try
        NumberOfNodes = (get({NodeList, '$class'})):getLength(NodeList),
        lists:foreach(fun(Index) ->
            Node = (get({NodeList, '$class'})):item(NodeList, Index),
            case ((fun(Target_N65844) -> (get({Target_N65844, '$class'})):compareTo(Target_N65844, NodeName) end)((get({Node, '$class'})):getNodeName(Node)) =:= 0) of
                true ->
                throw({'$return', Node});
                false -> ok
            end
        end, lists:seq(0, NumberOfNodes - 1)),
        undefined
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getNode(NodeName, NodeList) when (is_list(NodeName) orelse NodeName =:= undefined) ->
        try
        Node = 'DomSearchHelper':getNodeNoThrow(NodeName, NodeList),
        case (Node =/= undefined) of
            true ->
            throw({'$return', Node});
            false ->
            erlang:error({'Exception', lists:concat([NodeName, " Node Not Found in search"])})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getChildNodeList(NodeName, NodeList) when (is_list(NodeName) orelse NodeName =:= undefined) ->
        Node = 'DomSearchHelper':getNode(NodeName, NodeList),
        (get({Node, '$class'})):getChildNodes(Node).

% throws Exception
getAllNodes(NodeName, NodeList) when (is_list(NodeName) orelse NodeName =:= undefined) ->
        try
        Vector = 'DomSearchHelper':getAllNodesNoThrow(NodeName, NodeList),
        case (Vector =:= undefined) of
            true ->
            erlang:error({'Exception', lists:concat([NodeName, " Node Not Found in search"])});
            false ->
            throw({'$return', Vector})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getAllNodesNoThrow(NodeName, NodeList) when (is_list(NodeName) orelse NodeName =:= undefined) ->
        NodeVector = 'BasicArrayListD':new(),
        NumberOfNodes = (get({NodeList, '$class'})):getLength(NodeList),
        lists:foreach(fun(Index) ->
            Node = (get({NodeList, '$class'})):item(NodeList, Index),
            case ((fun(Target_N66823) -> (get({Target_N66823, '$class'})):compareTo(Target_N66823, NodeName) end)((get({Node, '$class'})):getNodeName(Node)) =:= 0) of
                true ->
                (get({NodeVector, '$class'})):add(NodeVector, Node);
                false -> ok
            end
        end, lists:seq(0, NumberOfNodes - 1)),
        NodeVector.

