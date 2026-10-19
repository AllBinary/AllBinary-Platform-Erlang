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
% package org.allbinary.input.automation.actions.script
% import java.awt.event.ActionEvent
% import java.awt.event.ActionListener
% import javax.swing
% import javax.swing.tree.DefaultMutableTreeNode
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Node

-module('ProfileActionScriptItem').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements ProfileActionScriptItemInterface
% implements ActionListener

'$handle_undefined_function'(Function, Arguments) ->
    apply('DefaultMutableTreeNode', Function, Arguments).

static_init() ->
    put({?MODULE, 'EDIT'}, "Edit"),
    put({?MODULE, 'DELETE'}, "Delete"),
    put({?MODULE, 'NEW_CONDITION'}, "New Condition"),
    put({?MODULE, 'NEW_INPUT'}, "New Input"),
    put({?MODULE, 'NEW_OUTPUT'}, "New Output"),
    put({?MODULE, 'NEW_COLOR_AT'}, "Color At"),
    put({?MODULE, 'NEW_TIME_INTERVAL'}, "Time Interval"),
    put({?MODULE, 'NEW_ALWAYS'}, "Always On/Off"),
    put({?MODULE, 'NEW_KEY_INPUT'}, "Key"),
    put({?MODULE, 'NEW_MOUSE_INPUT'}, "Mouse"),
    put({?MODULE, 'NEW_JOYSTICK_INPUT'}, "Joystick"),
    put({?MODULE, 'NEW_IMAGE_OUTPUT'}, "Image"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, jPopupMenu}, undefined),
    ok.


new(Label, Node) when (is_list(Label) orelse Label =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Label, Node),
    This.

init(This, Label, Node) when (is_list(Label) orelse Label =:= undefined) ->
        'DefaultMutableTreeNode':init(This, Label),
        init_fields(This),
        (get({This, '$class'})):init(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Label: ", Label]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})).

new(Label) when (is_list(Label) orelse Label =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Label),
    This.

init(This, Label) when (is_list(Label) orelse Label =:= undefined) ->
        'DefaultMutableTreeNode':init(This, Label),
        init_fields(This),
        (get({This, '$class'})):init(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Label: ", Label]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})).

init(This) ->
        (get({This, '$class'})):setJPopupMenu(This, 'JPopupMenu':new()),
        JMenuItemEdit = 'JMenuItem':new(get({'ProfileActionScriptItem', 'EDIT'})),
        JMenuItemDelete = 'JMenuItem':new(get({'ProfileActionScriptItem', 'DELETE'})),
        (get({JMenuItemEdit, '$class'})):addActionListener(JMenuItemEdit, This),
        (get({JMenuItemDelete, '$class'})):addActionListener(JMenuItemDelete, This),
        (fun(Target_N66922) -> (get({Target_N66922, '$class'})):add(Target_N66922, JMenuItemEdit) end)((get({This, '$class'})):getJPopupMenu(This)),
        (fun(Target_N66956) -> (get({Target_N66956, '$class'})):add(Target_N66956, JMenuItemDelete) end)((get({This, '$class'})):getJPopupMenu(This)).

% throws Exception
process(This, Frame) ->
        erlang:error({'RuntimeException'}).

getJPopupMenu(This) ->
        get({This, jPopupMenu}).

showDialog(This) ->
        erlang:error({'RuntimeException'}).

actionPerformed(This, ActionEvent) ->
        case ((fun(Target_N67177) -> (get({Target_N67177, '$class'})):compareTo(Target_N67177, get({'ProfileActionScriptItem', 'EDIT'})) end)((get({ActionEvent, '$class'})):getActionCommand(ActionEvent)) =:= 0) of
            true ->
            (get({This, '$class'})):showDialog(This);
            false -> ok
        end.

setJPopupMenu(This, JPopupMenu) ->
        put({This, jPopupMenu}, JPopupMenu).

