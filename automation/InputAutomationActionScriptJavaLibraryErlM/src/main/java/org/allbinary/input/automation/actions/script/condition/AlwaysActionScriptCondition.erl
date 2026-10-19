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
% package org.allbinary.input.automation.actions.script.condition
% import java.util.HashMap
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('AlwaysActionScriptCondition').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements AlwaysActionScriptConditionInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicProfileActionScriptCondition', Function, Arguments).

static_init() ->
    put({?MODULE, 'NAME'}, "Always On/Off"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, alwaysActionScriptConditionJPanel}, undefined),
    put({This, isOn}, false),
    ok.


new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Node),
    This.

init(This, Node) ->
        'BasicProfileActionScriptCondition':init(This, get({'AlwaysActionScriptCondition', 'NAME'}), Node),
        init_fields(This),
        ActionNode = 'DomSearchHelper':getNode(get({'AlwaysActionScriptConditionData', 'NAME'}), (get({Node, '$class'})):getChildNodes(Node)),
        case (ActionNode =/= undefined) of
            true ->
            NodeList = (get({ActionNode, '$class'})):getChildNodes(ActionNode),
            lists:foreach(fun(Index) ->
                ChildNode = (get({NodeList, '$class'})):item(NodeList, Index),
                case ((fun(Target_N66312) -> (get({Target_N66312, '$class'})):compareTo(Target_N66312, get({'AlwaysActionScriptConditionData', 'IS_ON'})) end)((get({ChildNode, '$class'})):getNodeName(ChildNode)) =:= 0) of
                    true ->
                    BooleanString = 'DomNodeHelper':getTextNodeValue(ChildNode),
                    (get({This, '$class'})):setIsOn(This, (get({BooleanString, '$class'})):booleanValue(BooleanString));
                    false ->
                    erlang:error({'Exception', "Action Script Condition Unknown Node"})
                end
            end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1));
            false ->
            erlang:error({'Exception', "Action Script Condition Node Null"})
        end,
        (get({This, '$class'})):init(This).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'BasicProfileActionScriptCondition':init(This, get({'AlwaysActionScriptCondition', 'NAME'})),
        init_fields(This),
        (get({This, '$class'})):init(This).

init(This) ->
        put({This, alwaysActionScriptConditionJPanel}, 'AlwaysActionScriptConditionJPanel':new(This)).

isIsOn(This) ->
        get({This, isOn}).

setIsOn(This, IsOn) when is_boolean(IsOn) ->
        put({This, isOn}, IsOn).

showDialog(This) ->
        (fun(Target_N66883) -> (get({Target_N66883, '$class'})):setVisible(Target_N66883, true) end)((get({get({This, alwaysActionScriptConditionJPanel}), '$class'})):getAlwaysActionJDialog(get({This, alwaysActionScriptConditionJPanel}))).

toHashMap(This) ->
        HashMap = (fun(Target_N66954) -> (get({Target_N66954, '$class'})):createHashMap(Target_N66954) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'AlwaysActionScriptConditionData', 'IS_ON'}), allbinary_java:to_string((get({This, '$class'})):isIsOn(This))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["HashMap: ", (get({HashMap, '$class'})):toString(HashMap)]), This, "toHashMap()"),
        HashMap.

% throws Exception
toXmlNode(This, Document) ->
        Node = 'BasicProfileActionScriptCondition':toXmlNode(This, Document),
        (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNodeWithValueNodes(Document, get({'AlwaysActionScriptConditionData', 'NAME'}), (get({This, '$class'})):toHashMap(This))),
        Node.

% throws Exception
shouldProcess(This, Frame) ->
        try
        case (get({This, '$class'})):isIsOn(This) of
            true ->
            throw({'$return', 'BasicProfileActionScriptCondition':shouldProcess(This, Frame)});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

log(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Is On: ", (get({This, '$class'})):isIsOn(This)]), This, "log").

