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
% import org.allbinary.time.TimeDelayHelper
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('TimeIntervalActionScriptCondition').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements TimeIntervalActionScriptConditionInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicProfileActionScriptCondition', Function, Arguments).

static_init() ->
    put({?MODULE, 'NAME'}, "Time Interval"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, timeIntervalActionScriptConditionJPanel}, undefined),
    put({This, timeHelper}, undefined),
    ok.


new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Node),
    This.

'$init'(This, Node) ->
        'BasicProfileActionScriptCondition':'$init'(This, get({'TimeIntervalActionScriptCondition', 'NAME'}), Node),
        init_fields(This),
        ActionNode = 'DomSearchHelper':getNode(get({'TimeIntervalActionScriptConditionData', 'NAME'}), (get({Node, '$class'})):getChildNodes(Node)),
        case (ActionNode =/= undefined) of
            true ->
            NodeList = (get({ActionNode, '$class'})):getChildNodes(ActionNode),
            lists:foreach(fun(Index) ->
                ChildNode = (get({NodeList, '$class'})):item(NodeList, Index),
                case ((fun(Target_N66341) -> (get({Target_N66341, '$class'})):compareTo(Target_N66341, get({'TimeIntervalActionScriptConditionData', 'TIME'})) end)((get({ChildNode, '$class'})):getNodeName(ChildNode)) =:= 0) of
                    true ->
                    Interval = 'DomNodeHelper':getTextNodeValue(ChildNode),
                    (get({This, '$class'})):setTimeDelayHelper(This, 'TimeDelayHelper':new(allbinary_java:to_string(Interval)));
                    false ->
                    erlang:error({'Exception', "Time Interval Action Script Condition Unknown Node"})
                end
            end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1));
            false ->
            erlang:error({'Exception', "Time Interval Action Script Condition Node Null"})
        end,
        (get({This, '$class'})):init(This).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'BasicProfileActionScriptCondition':'$init'(This, get({'TimeIntervalActionScriptCondition', 'NAME'})),
        init_fields(This),
        (get({This, '$class'})):setTimeDelayHelper(This, 'TimeDelayHelper':new(0)),
        (get({This, '$class'})):init(This).

init(This) ->
        put({This, timeIntervalActionScriptConditionJPanel}, 'TimeIntervalActionScriptConditionJPanel':new(This)).

showDialog(This) ->
        (fun(Target_N66850) -> (get({Target_N66850, '$class'})):setVisible(Target_N66850, true) end)((get({get({This, timeIntervalActionScriptConditionJPanel}), '$class'})):getTimeIntervalActionJDialog(get({This, timeIntervalActionScriptConditionJPanel}))).

toHashMap(This) ->
        HashMap = (fun(Target_N66921) -> (get({Target_N66921, '$class'})):createHashMap(Target_N66921) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'TimeIntervalActionScriptConditionData', 'TIME'}), allbinary_java:to_string(get({get({This, timeHelper}), delay}))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["HashMap: ", (get({HashMap, '$class'})):toString(HashMap)]), This, "toHashMap()"),
        HashMap.

% throws Exception
toXmlNode(This, Document) ->
        Node = 'BasicProfileActionScriptCondition':toXmlNode(This, Document),
        (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNodeWithValueNodes(Document, get({'TimeIntervalActionScriptConditionData', 'NAME'}), (get({This, '$class'})):toHashMap(This))),
        Node.

log(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Time Interval: ", get({get({This, timeHelper}), delay})]), This, "log").

getTimeDelayHelper(This) ->
        get({This, timeHelper}).

setTimeDelayHelper(This, TimeHelper) ->
        put({This, timeHelper}, TimeHelper).

% throws Exception
shouldProcess(This, Frame) ->
        try
        TimeHelper = (get({This, '$class'})):getTimeDelayHelper(This),
        case (get({TimeHelper, '$class'})):isTimeTNT(TimeHelper) of
            true ->
            (get({TimeHelper, '$class'})):setStartTimeTNT(TimeHelper),
            throw({'$return', 'BasicProfileActionScriptCondition':shouldProcess(This, Frame)});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

