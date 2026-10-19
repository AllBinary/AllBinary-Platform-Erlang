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
% import java.awt.event.MouseEvent
% import javax.swing
% import javax.swing.tree.DefaultMutableTreeNode
% import javax.swing.tree.DefaultTreeModel
% import javax.swing.tree.TreePath
% import org.allbinary.input.automation.actions.script.JTreeInterface
% import org.allbinary.input.automation.actions.script.condition.CustomTreeNodeInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('GenericProfileActionScriptJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements JTreeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, defaultMutableTreeNode}, 'DefaultMutableTreeNode':new("Root")),
    put({This, genericProfileActionScript}, undefined),
    put({This, actionScriptJTree}, undefined),
    put({This, jScrollPane1}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'JPanel':init(This),
    init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        (get({This, '$class'})):initComponents(This).

updateJTree(This) ->
        DefaultTreeModel = 'DefaultTreeModel':new((get({This, '$class'})):getGenericProfileActionScript(This)),
        (fun(Target_N66266) -> (get({Target_N66266, '$class'})):setModel(Target_N66266, DefaultTreeModel) end)((get({This, '$class'})):getActionScriptJTree(This)),
        (get({This, '$class'})):repaint(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Updated UI", This, "updateJTree").

getGenericProfileActionScript(This) ->
        get({This, genericProfileActionScript}).

setGenericProfileActionScript(This, GenericProfileActionScript) ->
        put({This, genericProfileActionScript}, GenericProfileActionScript).

getActionScriptJTree(This) ->
        get({This, actionScriptJTree}).

setActionScriptJTree(This, ActionScriptJTree) ->
        put({This, actionScriptJTree}, ActionScriptJTree).

initComponents(This) ->
        put({This, jScrollPane1}, 'JScrollPane':new()),
        put({This, actionScriptJTree}, 'JTree':new()),
        (get({This, '$class'})):setLayout(This, 'GridLayout':new(1, 0)),
        (get({get({This, actionScriptJTree}), '$class'})):setPreferredSize(get({This, actionScriptJTree}), 'Dimension':new(500, 500)),
        (get({get({This, actionScriptJTree}), '$class'})):addMouseListener(get({This, actionScriptJTree}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mouseClicked
%             ok % mouseReleased
),
        (get({get({This, jScrollPane1}), '$class'})):setViewportView(get({This, jScrollPane1}), get({This, actionScriptJTree})),
        (get({This, '$class'})):add(This, get({This, jScrollPane1})).

actionScriptJTreeMouseReleased(This, Evt) ->
        Button = (get({Evt, '$class'})):getButton(Evt),
        case (Button =:= get({'MouseEvent', 'BUTTON3'})) of
            true ->
            TreePath = (fun(Target_N67289) -> (get({Target_N67289, '$class'})):getSelectionPath(Target_N67289) end)((get({This, '$class'})):getActionScriptJTree(This)),
            case (TreePath =/= undefined) of
                true ->
                AnyType = (get({TreePath, '$class'})):getLastPathComponent(TreePath),
                case allbinary_java:instance_of(AnyType, 'CustomTreeNodeInterface') of
                    true ->
                    CustomTreeNodeInterface = AnyType,
                    JPopupMenu = (get({CustomTreeNodeInterface, '$class'})):getJPopupMenu(CustomTreeNodeInterface),
                    (get({JPopupMenu, '$class'})):show(JPopupMenu, (get({Evt, '$class'})):getSource(Evt), (get({Evt, '$class'})):getX(Evt), (get({Evt, '$class'})):getY(Evt));
                    false -> ok
                end;
                false -> ok
            end;
            false -> ok
        end.

actionScriptJTreeMouseClicked(This, Evt) ->
        ok.

