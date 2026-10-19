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
% package org.allbinary.input.automation.module.generic.configuration.profile
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActions
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('GenericProfile').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, name}, undefined),
    put({This, vector}, undefined),
    put({This, genericProfileActions}, undefined),
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
        (get({This, '$class'})):setName(This, Name),
        put({This, vector}, 'BasicArrayListD':new());
init(This, Node) ->
    init_fields(This),
        (get({This, '$class'})):setName(This, 'DomNodeHelper':getTextNodeValue(Node)),
        put({This, vector}, 'BasicArrayListD':new()),
        NodeList = (get({Node, '$class'})):getChildNodes(Node),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["Name: ", (get({This, '$class'})):getName(This)]), " Child Nodes: "]), (get({NodeList, '$class'})):getLength(NodeList)]), This, "Contructor"),
        lists:foreach(fun(Index) ->
            ProfileNode = (get({NodeList, '$class'})):item(NodeList, Index),
            case ((fun(Target_N66333) -> (get({Target_N66333, '$class'})):compareTo(Target_N66333, get({'GenericProfileDataWorkerData', 'NAME'})) end)((get({ProfileNode, '$class'})):getNodeName(ProfileNode)) =:= 0) of
                true ->
                GenericProfileDataWorkerType = 'GenericProfileDataWorkerType':getInstance(ProfileNode),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Adding GenericProfileDataWorkerType: ", (get({GenericProfileDataWorkerType, '$class'})):toString(GenericProfileDataWorkerType)]), This, "Contructor"),
                (get({get({This, vector}), '$class'})):add(get({This, vector}), GenericProfileDataWorkerType);
                false -> ok
            end
        end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1)).


getGenericProfileDataWorkerTypeVector(This) ->
        get({This, vector}).

add(This, GenericProfileDataWorkerType) ->
        case (not (get({get({This, vector}), '$class'})):contains(get({This, vector}), GenericProfileDataWorkerType)) of
            true ->
            (get({get({This, vector}), '$class'})):add(get({This, vector}), GenericProfileDataWorkerType);
            false -> ok
        end.

remove(This, GenericProfileDataWorkerType) ->
        (get({get({This, vector}), '$class'})):remove(get({This, vector}), GenericProfileDataWorkerType).

% throws Exception
toXmlNode(This, Document) ->
        Node = 'ModDomHelper':createTextNode(Document, get({'GenericProfileData', 'NAME'}), get({This, name})),
        Size = (get({get({This, vector}), '$class'})):size(get({This, vector})),
        lists:foreach(fun(Index) ->
            GenericProfileDataWorkerType = (get({get({This, vector}), '$class'})):get(get({This, vector}), Index),
            (get({Node, '$class'})):appendChild(Node, (get({GenericProfileDataWorkerType, '$class'})):toXmlNode(GenericProfileDataWorkerType, Document))
        end, lists:seq(0, Size - 1)),
        Node.

getName(This) ->
        get({This, name}).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({This, name}, Name).

getGenericProfileActions(This) ->
        get({This, genericProfileActions}).

setGenericProfileActions(This, GenericProfileActions) ->
        put({This, genericProfileActions}, GenericProfileActions).

