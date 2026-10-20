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
% package org.allbinary.input.automation.actions.script.condition.processors.input
% import java.util.HashMap
% import java.util.Iterator
% import java.util.Set
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.input.automation.actions.script.condition.processors.BasicProfileActionScriptProcessor
% import org.allbinary.input.automation.robot.InputRobotFactory
% import org.allbinary.input.automation.robot.InputRobotInterface
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.util.ABHashtable
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('BasicProfileActionScriptInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ProfileActionScriptInputInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicProfileActionScriptProcessor', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, inputRobotInterface}, undefined),
    put({This, time}, 0),
    ok.


new(Label, Node) when (is_list(Label) orelse Label =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Label, Node),
    This.

'$init'(This, Label, Node) when (is_list(Label) orelse Label =:= undefined) ->
        'BasicProfileActionScriptProcessor':'$init'(This, Label, Node),
        init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({get({This, commonStrings}), 'START'}), Label]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        ActionNode = 'DomSearchHelper':getNode(get({'GenericProfileActionScriptInputData', 'TYPE'}), (get({Node, '$class'})):getChildNodes(Node)),
        InputTypeString = 'DomNodeHelper':getTextNodeValue(ActionNode),
        TimeNode = 'DomSearchHelper':getNodeNoThrow(get({'GenericProfileActionScriptInputData', 'DELAY'}), (get({Node, '$class'})):getChildNodes(Node)),
        case (TimeNode =/= undefined) of
            true ->
            DelayString = 'DomNodeHelper':getTextNodeValue(TimeNode),
            (get({This, '$class'})):setTime(This, (fun(Target_N66688) -> (get({Target_N66688, '$class'})):intValue(Target_N66688) end)(allbinary_java:to_string(DelayString)));
            false ->
            (get({This, '$class'})):setTime(This, 0)
        end,
        (get({This, '$class'})):setInputRobotInterface(This, (fun(Target_N66744) -> (get({Target_N66744, '$class'})):get(Target_N66744, InputTypeString) end)('InputRobotFactory':getInstance())).

new(Label) when (is_list(Label) orelse Label =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Label),
    This.

'$init'(This, Label) when (is_list(Label) orelse Label =:= undefined) ->
        'BasicProfileActionScriptProcessor':'$init'(This, Label),
        init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({get({This, commonStrings}), 'START'}), Label]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        InputRobotFactory = 'InputRobotFactory':getInstance(),
        Hashtable = (get({InputRobotFactory, '$class'})):get(InputRobotFactory),
        Set = (get({Hashtable, '$class'})):keySet(Hashtable),
        Iterator = (get({Set, '$class'})):iterator(Set),
        (get({This, '$class'})):setInputRobotInterface(This, (get({InputRobotFactory, '$class'})):get(InputRobotFactory, (get({Iterator, '$class'})):next(Iterator))),
        (get({This, '$class'})):setTime(This, 0).

getTime(This) ->
        get({This, time}).

setTime(This, Time) when is_integer(Time) ->
        put({This, time}, Time).

'BasicProfileActionScriptInput_toHashMap'(This) ->
        HashMap = (fun(Target_N67480) -> (get({Target_N67480, '$class'})):createHashMap(Target_N67480) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'GenericProfileActionScriptInputData', 'TYPE'}), (fun(Target_N67556) -> (get({Target_N67556, '$class'})):getName(Target_N67556) end)((get({This, '$class'})):getInputRobotInterface(This))),
        (get({HashMap, '$class'})):put(HashMap, get({'GenericProfileActionScriptInputData', 'DELAY'}), allbinary_java:to_string((get({This, '$class'})):getTime(This))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["HashMap: ", (get({HashMap, '$class'})):toString(HashMap)]), This, "toHashMap()"),
        HashMap.

% throws Exception
toXmlNode(This, Document) ->
        Node = 'ModDomHelper':createNodeWithValueNodes(Document, get({'GenericProfileActionScriptInputData', 'NAME'}), (get({This, '$class'})):'BasicProfileActionScriptInput_toHashMap'(This)),
        Node.

setInputRobotInterface(This, InputRobotInterface) ->
        put({This, inputRobotInterface}, InputRobotInterface).

getInputRobotInterface(This) ->
        get({This, inputRobotInterface}).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, 'BasicProfileActionScriptProcessor':toString(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Input Type: "),
        case ((get({This, '$class'})):getInputRobotInterface(This) =/= undefined) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N68224) -> (get({Target_N68224, '$class'})):getName(Target_N68224) end)((get({This, '$class'})):getInputRobotInterface(This)));
            false ->
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'StringUtil':getInstance(), 'NULL_STRING'}))
        end,
        (get({StringBuffer, '$class'})):append(StringBuffer, " Time: "),
        (get({StringBuffer, '$class'})):appendlong(StringBuffer, (get({This, '$class'})):getTime(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

