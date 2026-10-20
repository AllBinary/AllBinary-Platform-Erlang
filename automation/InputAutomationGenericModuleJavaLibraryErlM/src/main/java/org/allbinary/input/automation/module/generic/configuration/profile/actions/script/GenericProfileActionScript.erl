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
% package org.allbinary.input.automation.module.generic.configuration.profile.actions.script
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.swing.tree.DefaultMutableTreeNode
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.input.automation.actions.script.ProfileActionScriptNodeInterface
% import org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionFactory
% import org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionInterface
% import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionData
% import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionJPanel
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('GenericProfileActionScript').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements ProfileActionScriptNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('DefaultMutableTreeNode', Function, Arguments).

static_init() ->
    put({?MODULE, 'NAME'}, "Root"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, genericProfileActionJPanel}, undefined),
    put({This, profileActionConditionInterfaceVector}, undefined),
    ok.


new(GenericProfileActionJPanel, Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GenericProfileActionJPanel, Node),
    This.

'$init'(This, GenericProfileActionJPanel, Node) ->
        'DefaultMutableTreeNode':'$init'(This, get({'GenericProfileActionScript', 'NAME'})),
        init_fields(This),
        put({This, genericProfileActionJPanel}, GenericProfileActionJPanel),
        (get({This, '$class'})):setProfileActionConditionInterfaceVector(This, 'BasicArrayListD':new()),
        ActionScriptNode = 'DomSearchHelper':getNode(get({'GenericProfileActionData', 'SCRIPT'}), (get({Node, '$class'})):getChildNodes(Node)),
        case (ActionScriptNode =/= undefined) of
            true ->
            NodeList = (get({ActionScriptNode, '$class'})):getChildNodes(ActionScriptNode),
            lists:foreach(fun(Index) ->
                ActionConditionNode = (get({NodeList, '$class'})):item(NodeList, Index),
                case ((get({ActionConditionNode, '$class'})):getNodeType(ActionConditionNode) =:= get({'Node', 'ELEMENT_NODE'})) of
                    true ->
                    (get({This, '$class'})):addCondition(This, 'ProfileActionScriptConditionFactory':getInstance(ActionConditionNode));
                    false -> ok
                end
            end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1));
            false ->
            erlang:error({'Exception', "Profile Action Script Node Null"})
        end.

new(GenericProfileActionJPanel) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GenericProfileActionJPanel),
    This.

'$init'(This, GenericProfileActionJPanel) ->
    'DefaultMutableTreeNode':'$init'(This),
    init_fields(This),
        put({This, genericProfileActionJPanel}, GenericProfileActionJPanel),
        (get({This, '$class'})):setProfileActionConditionInterfaceVector(This, 'BasicArrayListD':new()).

addCondition(This, ProfileActionScriptNodeInterface) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "addCondition"),
        (fun(Target_N67092) -> (get({Target_N67092, '$class'})):add(Target_N67092, ProfileActionScriptNodeInterface) end)((get({This, '$class'})):getProfileActionConditionInterfaceVector(This)),
        (get({This, '$class'})):add(This, ProfileActionScriptNodeInterface).

removeCondition(This, ProfileActionScriptNodeInterface) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "removeCondition"),
        (fun(Target_N67249) -> (get({Target_N67249, '$class'})):remove(Target_N67249, ProfileActionScriptNodeInterface) end)((get({This, '$class'})):getProfileActionConditionInterfaceVector(This)),
        (get({This, '$class'})):remove(This, ProfileActionScriptNodeInterface).

toHashMap(This) ->
        HashMap = (fun(Target_N67362) -> (get({Target_N67362, '$class'})):createHashMap(Target_N67362) end)('StdUtil':getInstance()),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["HashMap: ", (get({HashMap, '$class'})):toString(HashMap)]), This, "toHashMap()"),
        HashMap.

getProfileActionConditionInterfaceVector(This) ->
        get({This, profileActionConditionInterfaceVector}).

setProfileActionConditionInterfaceVector(This, ProfileActionConditionInterfaceVector) ->
        put({This, profileActionConditionInterfaceVector}, ProfileActionConditionInterfaceVector).

% throws Exception
toXmlNode(This, Document) ->
        Node = (get({Document, '$class'})):createElement(Document, get({'GenericProfileActionData', 'SCRIPT'})),
        Vector = (get({This, '$class'})):getProfileActionConditionInterfaceVector(This),
        Size = (get({Vector, '$class'})):size(Vector),
        lists:foreach(fun(Index) ->
            ProfileActionConditionInterface = (get({Vector, '$class'})):get(Vector, Index),
            (get({Node, '$class'})):appendChild(Node, (get({ProfileActionConditionInterface, '$class'})):toXmlNode(ProfileActionConditionInterface, Document))
        end, lists:seq(0, Size - 1)),
        Node.

