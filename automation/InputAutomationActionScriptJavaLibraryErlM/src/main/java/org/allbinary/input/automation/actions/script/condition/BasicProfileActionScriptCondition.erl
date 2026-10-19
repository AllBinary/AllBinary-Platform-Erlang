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
% import java.awt.event.ActionEvent
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.swing
% import javax.swing.tree.TreePath
% import org.allbinary.input.automation.actions.script.JTreeInterfaceFactory
% import org.allbinary.input.automation.actions.script.ProfileActionScriptItem
% import org.allbinary.input.automation.actions.script.ProfileActionScriptNodeInterface
% import org.allbinary.input.automation.actions.script.condition.processors.ProfileActionScriptProcessorInterface
% import org.allbinary.input.automation.actions.script.condition.processors.input.GenericProfileActionScriptInputData
% import org.allbinary.input.automation.actions.script.condition.processors.input.KeyboardActionScriptInput
% import org.allbinary.input.automation.actions.script.condition.processors.input.MouseActionScriptInput
% import org.allbinary.input.automation.actions.script.condition.processors.input.ProfileActionScriptInputFactory
% import org.allbinary.input.automation.module.actions.script.condition.processors.output.GenericProfileActionScriptOutputData
% import org.allbinary.input.automation.module.actions.script.condition.processors.output.ImageActionScriptOutput
% import org.allbinary.input.automation.module.actions.script.condition.processors.output.ProfileActionScriptOutputFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('BasicProfileActionScriptCondition').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ProfileActionScriptConditionInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('ProfileActionScriptItem', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, profileActionProcessorInterfaceVector}, undefined),
    put({This, profileActionConditionInterfaceVector}, undefined),
    ok.


new(Label, Node) when (is_list(Label) orelse Label =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Label, Node),
    This.

init(This, Label, Node) when (is_list(Label) orelse Label =:= undefined) ->
        'ProfileActionScriptItem':init(This, Label, Node),
        init_fields(This),
        (get({This, '$class'})):init(This),
        NodeList = (get({Node, '$class'})):getChildNodes(Node),
        lists:foreach(fun(Index) ->
            ActionItemNode = (get({NodeList, '$class'})):item(NodeList, Index),
            case ((get({ActionItemNode, '$class'})):getNodeType(ActionItemNode) =:= get({'Node', 'ELEMENT_NODE'})) of
                true ->
                case ((fun(Target_N66763) -> (get({Target_N66763, '$class'})):compareTo(Target_N66763, get({'GenericProfileActionScriptConditionData', 'NAME'})) end)((get({ActionItemNode, '$class'})):getNodeName(ActionItemNode)) =:= 0) of
                    true ->
                    (get({This, '$class'})):addCondition(This, 'ProfileActionScriptConditionFactory':getInstance(ActionItemNode));
                    false ->
                    case ((fun(Target_N66818) -> (get({Target_N66818, '$class'})):compareTo(Target_N66818, get({'GenericProfileActionScriptInputData', 'NAME'})) end)((get({ActionItemNode, '$class'})):getNodeName(ActionItemNode)) =:= 0) of
                    true ->
                    (get({This, '$class'})):addProcessor(This, 'ProfileActionScriptInputFactory':getInstance(ActionItemNode));
                    false ->
                    case ((fun(Target_N66873) -> (get({Target_N66873, '$class'})):compareTo(Target_N66873, get({'GenericProfileActionScriptOutputData', 'NAME'})) end)((get({ActionItemNode, '$class'})):getNodeName(ActionItemNode)) =:= 0) of
                    true ->
                    (get({This, '$class'})):addProcessor(This, 'ProfileActionScriptOutputFactory':getInstance(ActionItemNode));
                    false -> ok
                end
                end
                end;
                false -> ok
            end
        end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1)).

% throws Exception
addProcessorNodes(This, Node) ->
        NodeList = (get({Node, '$class'})):getChildNodes(Node),
        lists:foreach(fun(Index) ->
            ProcessorActionItemNode = (get({NodeList, '$class'})):item(NodeList, Index),
            case ((fun(Target_N67343) -> (get({Target_N67343, '$class'})):compareTo(Target_N67343, get({'GenericProfileActionScriptInputData', 'NAME'})) end)((get({ProcessorActionItemNode, '$class'})):getNodeName(ProcessorActionItemNode)) =:= 0) of
                true ->
                (get({This, '$class'})):addProcessor(This, 'ProfileActionScriptInputFactory':getInstance(ProcessorActionItemNode));
                false ->
                case ((fun(Target_N67398) -> (get({Target_N67398, '$class'})):compareTo(Target_N67398, get({'GenericProfileActionScriptOutputData', 'NAME'})) end)((get({ProcessorActionItemNode, '$class'})):getNodeName(ProcessorActionItemNode)) =:= 0) of
                true ->
                (get({This, '$class'})):addProcessor(This, 'ProfileActionScriptOutputFactory':getInstance(ProcessorActionItemNode));
                false -> ok
            end
            end
        end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1)).

new(Label) when (is_list(Label) orelse Label =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Label),
    This.

init(This, Label) when (is_list(Label) orelse Label =:= undefined) ->
        'ProfileActionScriptItem':init(This, Label),
        init_fields(This),
        (get({This, '$class'})):init(This).

init(This) ->
        (get({This, '$class'})):setProfileActionProcessorInterfaceVector(This, 'BasicArrayListD':new()),
        (get({This, '$class'})):setProfileActionConditionInterfaceVector(This, 'BasicArrayListD':new()),
        (fun(Target_N67822) -> (get({Target_N67822, '$class'})):add(Target_N67822, (get({This, '$class'})):getConditionJPopupMenu(This)) end)((get({This, '$class'})):getJPopupMenu(This)),
        (fun(Target_N67859) -> (get({Target_N67859, '$class'})):add(Target_N67859, (get({This, '$class'})):getInputJPopupMenu(This)) end)((get({This, '$class'})):getJPopupMenu(This)),
        (fun(Target_N67896) -> (get({Target_N67896, '$class'})):add(Target_N67896, (get({This, '$class'})):getOutputJPopupMenu(This)) end)((get({This, '$class'})):getJPopupMenu(This)).

getConditionJPopupMenu(This) ->
        JMenu = 'JMenu':new(get({'BasicProfileActionScriptCondition', 'NEW_CONDITION'})),
        JMenuItemColorAt = 'JMenuItem':new(get({'BasicProfileActionScriptCondition', 'NEW_COLOR_AT'})),
        JMenuItemAlways = 'JMenuItem':new(get({'BasicProfileActionScriptCondition', 'NEW_ALWAYS'})),
        JMenuItemTimeInterval = 'JMenuItem':new(get({'BasicProfileActionScriptCondition', 'NEW_TIME_INTERVAL'})),
        (get({JMenuItemColorAt, '$class'})):addActionListener(JMenuItemColorAt, This),
        (get({JMenuItemAlways, '$class'})):addActionListener(JMenuItemAlways, This),
        (get({JMenuItemTimeInterval, '$class'})):addActionListener(JMenuItemTimeInterval, This),
        (get({JMenu, '$class'})):add(JMenu, JMenuItemColorAt),
        (get({JMenu, '$class'})):add(JMenu, JMenuItemAlways),
        (get({JMenu, '$class'})):add(JMenu, JMenuItemTimeInterval),
        JMenu.

getInputJPopupMenu(This) ->
        JMenu = 'JMenu':new(get({'BasicProfileActionScriptCondition', 'NEW_INPUT'})),
        JMenuItemKey = 'JMenuItem':new(get({'BasicProfileActionScriptCondition', 'NEW_KEY_INPUT'})),
        JMenuItemMouse = 'JMenuItem':new(get({'BasicProfileActionScriptCondition', 'NEW_MOUSE_INPUT'})),
        JMenuItemJoystick = 'JMenuItem':new(get({'BasicProfileActionScriptCondition', 'NEW_JOYSTICK_INPUT'})),
        (get({JMenuItemKey, '$class'})):addActionListener(JMenuItemKey, This),
        (get({JMenuItemMouse, '$class'})):addActionListener(JMenuItemMouse, This),
        (get({JMenuItemJoystick, '$class'})):addActionListener(JMenuItemJoystick, This),
        (get({JMenu, '$class'})):add(JMenu, JMenuItemKey),
        (get({JMenu, '$class'})):add(JMenu, JMenuItemMouse),
        (get({JMenu, '$class'})):add(JMenu, JMenuItemJoystick),
        JMenu.

getOutputJPopupMenu(This) ->
        JMenu = 'JMenu':new(get({'BasicProfileActionScriptCondition', 'NEW_OUTPUT'})),
        JMenuItemImage = 'JMenuItem':new(get({'BasicProfileActionScriptCondition', 'NEW_IMAGE_OUTPUT'})),
        (get({JMenuItemImage, '$class'})):addActionListener(JMenuItemImage, This),
        (get({JMenu, '$class'})):add(JMenu, JMenuItemImage),
        JMenu.

addProcessor(This, ProfileActionProcessorInterface) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "addInput"),
        (fun(Target_N69035) -> (get({Target_N69035, '$class'})):add(Target_N69035, ProfileActionProcessorInterface) end)((get({This, '$class'})):getProfileActionProcessorInterfaceVector(This)),
        (get({This, '$class'})):add(This, ProfileActionProcessorInterface).

removeProcessor(This, ProfileActionProcessorInterface) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "removeInput"),
        (fun(Target_N69192) -> (get({Target_N69192, '$class'})):remove(Target_N69192, ProfileActionProcessorInterface) end)((get({This, '$class'})):getProfileActionProcessorInterfaceVector(This)),
        (get({This, '$class'})):remove(This, ProfileActionProcessorInterface).

removeCondition(This, ProfileActionScriptNodeInterface) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "removeCondition"),
        (fun(Target_N69349) -> (get({Target_N69349, '$class'})):remove(Target_N69349, ProfileActionScriptNodeInterface) end)((get({This, '$class'})):getProfileActionConditionInterfaceVector(This)),
        (get({This, '$class'})):remove(This, ProfileActionScriptNodeInterface).

addCondition(This, ProfileActionScriptNodeInterface) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "addCondition"),
        (fun(Target_N69506) -> (get({Target_N69506, '$class'})):add(Target_N69506, ProfileActionScriptNodeInterface) end)((get({This, '$class'})):getProfileActionConditionInterfaceVector(This)),
        (get({This, '$class'})):add(This, ProfileActionScriptNodeInterface).

% throws Exception
toXmlNode(This, Document) ->
        Node = (get({Document, '$class'})):createElement(Document, get({'GenericProfileActionScriptConditionData', 'NAME'})),
        ProfileActionConditionInterfaceVector = (get({This, '$class'})):getProfileActionConditionInterfaceVector(This),
        Size = (get({ProfileActionConditionInterfaceVector, '$class'})):size(ProfileActionConditionInterfaceVector),
        lists:foreach(fun(Index) ->
            ProfileActionConditionInterface = (get({ProfileActionConditionInterfaceVector, '$class'})):get(ProfileActionConditionInterfaceVector, Index),
            (get({Node, '$class'})):appendChild(Node, (get({ProfileActionConditionInterface, '$class'})):toXmlNode(ProfileActionConditionInterface, Document))
        end, lists:seq(0, Size - 1)),
        ProfileActionProcessorInterfaceVector = (get({This, '$class'})):getProfileActionProcessorInterfaceVector(This),
        Size2 = (get({ProfileActionProcessorInterfaceVector, '$class'})):size(ProfileActionProcessorInterfaceVector),
        lists:foreach(fun(Index) ->
            ProfileActionProcessorInterface = (get({ProfileActionProcessorInterfaceVector, '$class'})):get(ProfileActionProcessorInterfaceVector, Index),
            (get({Node, '$class'})):appendChild(Node, (get({ProfileActionProcessorInterface, '$class'})):toXmlNode(ProfileActionProcessorInterface, Document))
        end, lists:seq(0, Size2 - 1)),
        Node.

getProfileActionConditionInterfaceVector(This) ->
        get({This, profileActionConditionInterfaceVector}).

setProfileActionConditionInterfaceVector(This, ProfileActionConditionInterfaceVector) ->
        put({This, profileActionConditionInterfaceVector}, ProfileActionConditionInterfaceVector).

actionPerformed(This, ActionEvent) ->
        try
            'ProfileActionScriptItem':actionPerformed(This, ActionEvent),
            case ((fun(Target_N70464) -> (get({Target_N70464, '$class'})):compareTo(Target_N70464, get({'BasicProfileActionScriptCondition', 'DELETE'})) end)((get({ActionEvent, '$class'})):getActionCommand(ActionEvent)) =:= 0) of
                true ->
                case allbinary_java:instance_of((get({This, '$class'})):getParent(This), 'ProfileActionScriptNodeInterface') of
                    true ->
                    ProfileActionScriptNodeInterface = (get({This, '$class'})):getParent(This),
                    (get({ProfileActionScriptNodeInterface, '$class'})):removeCondition(ProfileActionScriptNodeInterface, This),
                    (fun(Target_N71219) -> (get({Target_N71219, '$class'})):updateJTree(Target_N71219) end)((fun(Target_N71226) -> (get({Target_N71226, '$class'})):getJTreeInterface(Target_N71226) end)('JTreeInterfaceFactory':getInstance()));
                    false -> ok
                end;
                false ->
                case ((fun(Target_N70511) -> (get({Target_N70511, '$class'})):compareTo(Target_N70511, get({'BasicProfileActionScriptCondition', 'NEW_COLOR_AT'})) end)((get({ActionEvent, '$class'})):getActionCommand(ActionEvent)) =:= 0) of
                true ->
                (get({This, '$class'})):addCondition(This, 'ColorAtActionScriptCondition':new()),
                (get({This, '$class'})):updateTree(This);
                false ->
                case ((fun(Target_N70558) -> (get({Target_N70558, '$class'})):compareTo(Target_N70558, get({'BasicProfileActionScriptCondition', 'NEW_ALWAYS'})) end)((get({ActionEvent, '$class'})):getActionCommand(ActionEvent)) =:= 0) of
                true ->
                (get({This, '$class'})):addCondition(This, 'AlwaysActionScriptCondition':new()),
                (get({This, '$class'})):updateTree(This);
                false ->
                case ((fun(Target_N70605) -> (get({Target_N70605, '$class'})):compareTo(Target_N70605, get({'BasicProfileActionScriptCondition', 'NEW_TIME_INTERVAL'})) end)((get({ActionEvent, '$class'})):getActionCommand(ActionEvent)) =:= 0) of
                true ->
                (get({This, '$class'})):addCondition(This, 'TimeIntervalActionScriptCondition':new()),
                (get({This, '$class'})):updateTree(This);
                false ->
                case ((fun(Target_N70652) -> (get({Target_N70652, '$class'})):compareTo(Target_N70652, get({'BasicProfileActionScriptCondition', 'NEW_KEY_INPUT'})) end)((get({ActionEvent, '$class'})):getActionCommand(ActionEvent)) =:= 0) of
                true ->
                (get({This, '$class'})):addProcessor(This, 'KeyboardActionScriptInput':new()),
                (get({This, '$class'})):updateTree(This);
                false ->
                case ((fun(Target_N70699) -> (get({Target_N70699, '$class'})):compareTo(Target_N70699, get({'BasicProfileActionScriptCondition', 'NEW_MOUSE_INPUT'})) end)((get({ActionEvent, '$class'})):getActionCommand(ActionEvent)) =:= 0) of
                true ->
                (get({This, '$class'})):addProcessor(This, 'MouseActionScriptInput':new()),
                (get({This, '$class'})):updateTree(This);
                false ->
                case ((fun(Target_N70746) -> (get({Target_N70746, '$class'})):compareTo(Target_N70746, get({'BasicProfileActionScriptCondition', 'NEW_IMAGE_OUTPUT'})) end)((get({ActionEvent, '$class'})):getActionCommand(ActionEvent)) =:= 0) of
                true ->
                (get({This, '$class'})):addProcessor(This, 'ImageActionScriptOutput':new()),
                (get({This, '$class'})):updateTree(This);
                false -> ok
            end
            end
            end
            end
            end
            end
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Error", This, "actionPerformed", E)
        end.

getProfileActionProcessorInterfaceVector(This) ->
        get({This, profileActionProcessorInterfaceVector}).

setProfileActionProcessorInterfaceVector(This, ProfileActionProcessorInterfaceVector) ->
        put({This, profileActionProcessorInterfaceVector}, ProfileActionProcessorInterfaceVector).

updateTree(This) ->
        (fun(Target_N71503) -> (get({Target_N71503, '$class'})):updateJTree(Target_N71503) end)((fun(Target_N71510) -> (get({Target_N71510, '$class'})):getJTreeInterface(Target_N71510) end)('JTreeInterfaceFactory':getInstance())),
        TreePath = 'TreePath':new(This),
        (fun(Target_N71584) -> (get({Target_N71584, '$class'})):expandPath(Target_N71584, TreePath) end)((fun(Target_N71591) -> (get({Target_N71591, '$class'})):getActionScriptJTree(Target_N71591) end)((fun(Target_N71598) -> (get({Target_N71598, '$class'})):getJTreeInterface(Target_N71598) end)('JTreeInterfaceFactory':getInstance()))).

% throws Exception
shouldProcess(This, Frame) ->
        try
        ProfileActionConditionInterfaceVector = (get({This, '$class'})):getProfileActionConditionInterfaceVector(This),
        Size = (get({ProfileActionConditionInterfaceVector, '$class'})):size(ProfileActionConditionInterfaceVector),
        lists:foreach(fun(Index) ->
            ProfileActionScriptConditionInterface = (get({ProfileActionConditionInterfaceVector, '$class'})):get(ProfileActionConditionInterfaceVector, Index),
            case (not (get({ProfileActionScriptConditionInterface, '$class'})):shouldProcess(ProfileActionScriptConditionInterface, Frame)) of
                true ->
                throw({'$return', false});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
process(This, Frame) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N72031) -> (get({Target_N72031, '$class'})):toString(Target_N72031) end)((fun(Target_N72038) -> (get({Target_N72038, '$class'})):append(Target_N72038, " inputs") end)((fun(Target_N72045) -> (get({Target_N72045, '$class'})):appendint(Target_N72045, (fun(Target_N72081) -> (get({Target_N72081, '$class'})):size(Target_N72081) end)((get({This, '$class'})):getProfileActionProcessorInterfaceVector(This))) end)((fun(Target_N72052) -> (get({Target_N72052, '$class'})):append(Target_N72052, "Start - Processing ") end)('StringMaker':new())))), This, get({get({This, commonStrings}), 'PROCESS'})),
        ProfileActionProcessorInterfaceVector = (get({This, '$class'})):getProfileActionProcessorInterfaceVector(This),
        Size = (get({ProfileActionProcessorInterfaceVector, '$class'})):size(ProfileActionProcessorInterfaceVector),
        lists:foreach(fun(Index) ->
            ProfileActionScriptProcessorInterface = (get({ProfileActionProcessorInterfaceVector, '$class'})):get(ProfileActionProcessorInterfaceVector, Index),
            (get({ProfileActionScriptProcessorInterface, '$class'})):process(ProfileActionScriptProcessorInterface, Frame)
        end, lists:seq(0, Size - 1)).

