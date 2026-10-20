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
% import java.awt
% import java.awt.event.InputEvent
% import java.util.HashMap
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.logic.string.StringMaker
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('MouseActionScriptInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements MouseActionScriptInputInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicProfileActionScriptInput', Function, Arguments).

static_init() ->
    put({?MODULE, 'NAME'}, "Mouse"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, point}, undefined),
    put({This, buttons}, 0),
    put({This, mouseActionScriptInputJPanel}, undefined),
    ok.


new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Node),
    This.

'$init'(This, Node) ->
        'BasicProfileActionScriptInput':'$init'(This, get({'MouseActionScriptInput', 'NAME'}), Node),
        init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        put({This, point}, 'Point':new()),
        ActionNode = 'DomSearchHelper':getNode(get({'MouseActionScriptInputData', 'NAME'}), (get({Node, '$class'})):getChildNodes(Node)),
        case (ActionNode =/= undefined) of
            true ->
            NodeList = (get({ActionNode, '$class'})):getChildNodes(ActionNode),
            lists:foreach(fun(Index) ->
                ChildNode = (get({NodeList, '$class'})):item(NodeList, Index),
                case ((fun(Target_N66548) -> (get({Target_N66548, '$class'})):compareTo(Target_N66548, get({'MouseActionScriptInputData', 'BUTTONS'})) end)((get({ChildNode, '$class'})):getNodeName(ChildNode)) =:= 0) of
                    true ->
                    Buttons = 'DomNodeHelper':getTextNodeValue(ChildNode),
                    (get({This, '$class'})):setButtonClicks(This, (fun(Target_N67235) -> (get({Target_N67235, '$class'})):intValue(Target_N67235) end)(allbinary_java:to_string(Buttons)));
                    false ->
                    case ((fun(Target_N66603) -> (get({Target_N66603, '$class'})):compareTo(Target_N66603, get({'MouseActionScriptInputData', 'MOVE'})) end)((get({ChildNode, '$class'})):getNodeName(ChildNode)) =:= 0) of
                    true ->
                    MouseXNode = 'DomSearchHelper':getNode(get({'MouseActionScriptInputData', 'MOVE_X'}), (get({ChildNode, '$class'})):getChildNodes(ChildNode)),
                    MouseXString = 'DomNodeHelper':getTextNodeValue(MouseXNode),
                    MouseXInteger = allbinary_java:to_string(MouseXString),
                    MouseYNode = 'DomSearchHelper':getNode(get({'MouseActionScriptInputData', 'MOVE_Y'}), (get({ChildNode, '$class'})):getChildNodes(ChildNode)),
                    MouseYString = 'DomNodeHelper':getTextNodeValue(MouseYNode),
                    MouseYInteger = allbinary_java:to_string(MouseYString),
                    NewPoint = 'Point':new((get({MouseXInteger, '$class'})):intValue(MouseXInteger), (get({MouseYInteger, '$class'})):intValue(MouseYInteger)),
                    (get({This, '$class'})):setPoint(This, NewPoint);
                    false ->
                    erlang:error({'Exception', "Action Script Input Unknown Node"})
                end
                end
            end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1));
            false ->
            erlang:error({'Exception', "Action Script Input Node Null"})
        end,
        (get({This, '$class'})):setAllowsChildren(This, false),
        put({This, mouseActionScriptInputJPanel}, 'MouseActionScriptInputJPanel':new(This)).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'BasicProfileActionScriptInput':'$init'(This, get({'MouseActionScriptInput', 'NAME'})),
        init_fields(This),
        put({This, point}, 'Point':new()),
        (get({This, '$class'})):setAllowsChildren(This, false),
        put({This, mouseActionScriptInputJPanel}, 'MouseActionScriptInputJPanel':new(This)).

setPoint(This, Point) ->
        put({This, point}, Point).

getPoint(This) ->
        get({This, point}).

getButtonClicks(This) ->
        get({This, buttons}).

setButtonClicks(This, Buttons) when is_integer(Buttons) ->
        put({This, buttons}, Buttons).

showDialog(This) ->
        (fun(Target_N67838) -> (get({Target_N67838, '$class'})):setVisible(Target_N67838, true) end)((get({get({This, mouseActionScriptInputJPanel}), '$class'})):getMouseActionJDialog(get({This, mouseActionScriptInputJPanel}))).

toHashMap(This) ->
        HashMap = (fun(Target_N67909) -> (get({Target_N67909, '$class'})):createHashMap(Target_N67909) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'MouseActionScriptInputData', 'BUTTONS'}), allbinary_java:to_string((get({This, '$class'})):getButtonClicks(This))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["HashMap: ", (get({HashMap, '$class'})):toString(HashMap)]), This, "toHashMap()"),
        HashMap.

% throws Exception
toXmlNode(This, Document) ->
        Node = 'BasicProfileActionScriptInput':toXmlNode(This, Document),
        MouseNode = 'ModDomHelper':createNodeWithValueNodes(Document, get({'MouseActionScriptInputData', 'NAME'}), (get({This, '$class'})):toHashMap(This)),
        (get({Node, '$class'})):appendChild(Node, MouseNode),
        HashMap = (fun(Target_N68294) -> (get({Target_N68294, '$class'})):createHashMap(Target_N68294) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'MouseActionScriptInputData', 'MOVE_X'}), allbinary_java:to_string(get({(get({This, '$class'})):getPoint(This), x}))),
        (get({HashMap, '$class'})):put(HashMap, get({'MouseActionScriptInputData', 'MOVE_Y'}), allbinary_java:to_string(get({(get({This, '$class'})):getPoint(This), y}))),
        (get({MouseNode, '$class'})):appendChild(MouseNode, 'ModDomHelper':createNodeWithValueNodes(Document, get({'MouseActionScriptInputData', 'MOVE'}), HashMap)),
        Node.

% throws Exception
process(This, Frame) ->
        'MouseInputAutomationProcessor':process(This).

log(This) ->
        ButtonStringBuffer = 'StringMaker':new(),
        (get({ButtonStringBuffer, '$class'})):append(ButtonStringBuffer, "1: "),
        BooleanFactory = 'BooleanFactory':getInstance(),
        case ((((get({This, '$class'})):getButtonClicks(This) band get({'InputEvent', 'BUTTON1_MASK'}))) =/= 0) of
            true ->
            (get({ButtonStringBuffer, '$class'})):append(ButtonStringBuffer, get({BooleanFactory, 'TRUE_STRING'}));
            false ->
            (get({ButtonStringBuffer, '$class'})):append(ButtonStringBuffer, get({BooleanFactory, 'FALSE_STRING'}))
        end,
        (get({ButtonStringBuffer, '$class'})):append(ButtonStringBuffer, " 2: "),
        case ((((get({This, '$class'})):getButtonClicks(This) band get({'InputEvent', 'BUTTON2_MASK'}))) =/= 0) of
            true ->
            (get({ButtonStringBuffer, '$class'})):append(ButtonStringBuffer, get({BooleanFactory, 'TRUE_STRING'}));
            false ->
            (get({ButtonStringBuffer, '$class'})):append(ButtonStringBuffer, get({BooleanFactory, 'FALSE_STRING'}))
        end,
        (get({ButtonStringBuffer, '$class'})):append(ButtonStringBuffer, " 3: "),
        case ((((get({This, '$class'})):getButtonClicks(This) band get({'InputEvent', 'BUTTON3_MASK'}))) =/= 0) of
            true ->
            (get({ButtonStringBuffer, '$class'})):append(ButtonStringBuffer, get({BooleanFactory, 'TRUE_STRING'}));
            false ->
            (get({ButtonStringBuffer, '$class'})):append(ButtonStringBuffer, get({BooleanFactory, 'FALSE_STRING'}))
        end,
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat([lists:concat([lists:concat(["Input Type: ", (fun(Target_N69357) -> (get({Target_N69357, '$class'})):getName(Target_N69357) end)((get({This, '$class'})):getInputRobotInterface(This))]), " Point: "]), (get({This, '$class'})):getPoint(This)]), " Buttons Clicked: "]), (get({ButtonStringBuffer, '$class'})):toString(ButtonStringBuffer)]), This, "log").

