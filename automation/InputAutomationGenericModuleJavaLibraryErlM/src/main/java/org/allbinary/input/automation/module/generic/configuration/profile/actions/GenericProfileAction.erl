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
% package org.allbinary.input.automation.module.generic.configuration.profile.actions
% import java.util.HashMap
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.input.automation.module.generic.configuration.profile.actions.script.GenericProfileActionScript
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('GenericProfileAction').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, name}, undefined),
    put({This, genericProfileActionScript}, undefined),
    put({This, genericProfileActionJPanel}, undefined),
    ok.


new(GenericProfileActionJPanel, Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GenericProfileActionJPanel, Node),
    This.

'$init'(This, GenericProfileActionJPanel, Node) ->
    init_fields(This),
        ActionNameNode = 'DomSearchHelper':getNode(get({'GenericProfileActionData', 'NAME'}), (get({Node, '$class'})):getChildNodes(Node)),
        case (ActionNameNode =/= undefined) of
            true ->
            put({This, name}, 'DomNodeHelper':getTextNodeValue(ActionNameNode));
            false ->
            erlang:error({'Exception', "Profile Action Name Node Null"})
        end,
        (get({This, '$class'})):setGenericProfileActionScript(This, 'GenericProfileActionScript':new(get({This, genericProfileActionJPanel}), Node)).

new(Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name),
    This.

'$init'(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        put({This, name}, Name),
        (get({This, '$class'})):setGenericProfileActionScript(This, 'GenericProfileActionScript':new(get({This, genericProfileActionJPanel}))).

getName(This) ->
        get({This, name}).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({This, name}, Name).

toHashMap(This) ->
        HashMap = (fun(Target_N66655) -> (get({Target_N66655, '$class'})):createHashMap(Target_N66655) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'GenericProfileActionData', 'NAME'}), get({This, name})),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["HashMap: ", (get({HashMap, '$class'})):toString(HashMap)]), This, "toHashMap()"),
        HashMap.

% throws Exception
toXmlNode(This, Document) ->
        Node = 'ModDomHelper':createNodeWithValueNodes(Document, get({'GenericProfileActionData', 'NAME'}), (get({This, '$class'})):toHashMap(This)),
        (get({Node, '$class'})):appendChild(Node, (fun(Target_N66946) -> (get({Target_N66946, '$class'})):toXmlNode(Target_N66946, Document) end)((get({This, '$class'})):getGenericProfileActionScript(This))),
        Node.

getGenericProfileActionScript(This) ->
        get({This, genericProfileActionScript}).

setGenericProfileActionScript(This, GenericProfileActionScript) ->
        put({This, genericProfileActionScript}, GenericProfileActionScript).

