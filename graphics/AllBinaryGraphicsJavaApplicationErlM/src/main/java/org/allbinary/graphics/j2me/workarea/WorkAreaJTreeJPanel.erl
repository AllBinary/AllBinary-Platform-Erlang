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
% package org.allbinary.graphics.j2me.workarea
% import javax.swing
% import javax.swing.tree.DefaultMutableTreeNode
% import javax.swing.tree.MutableTreeNode
% import javax.swing.tree.TreePath
% import org.allbinary.graphics.j2me.workarea.canvas.CanvasTreeLabel
% import org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEvent
% import org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventService
% import org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventSource
% import org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEvent
% import org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEventService
% import org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEventSource
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('WorkAreaJTreeJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, rootTreeNode}, undefined),
    put({This, workAreaJTree}, undefined),
    put({This, highlightedBasicArrayList}, undefined),
    put({This, copyJMenuItem}, undefined),
    put({This, deleteJMenuItem}, undefined),
    put({This, itemJPopupMenu}, undefined),
    put({This, itemJScrollPane1}, undefined),
    put({This, rotateJMenuItem}, undefined),
    put({This, workAreaPropertiesJPanel}, undefined),
    ok.


new(WorkAreaName) when (is_list(WorkAreaName) orelse WorkAreaName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, WorkAreaName),
    This.

init(This, WorkAreaName) when (is_list(WorkAreaName) orelse WorkAreaName =:= undefined) ->
    'JPanel':init(This),
    init_fields(This),
        (get({This, '$class'})):initComponents(This),
        put({This, rootTreeNode}, 'DefaultMutableTreeNode':new(WorkAreaName)),
        (get({get({This, workAreaPropertiesJPanel}), '$class'})):removeAll(get({This, workAreaPropertiesJPanel})),
        (get({This, '$class'})):updateTree(This),
        put({This, highlightedBasicArrayList}, 'BasicArrayListD':new()).

add(This, TreeNode) ->
        (get({get({This, rootTreeNode}), '$class'})):add(get({This, rootTreeNode}), TreeNode).

updateTree(This) ->
        put({This, workAreaJTree}, 'JTree':new(get({This, rootTreeNode}))),
        (get({get({This, workAreaJTree}), '$class'})):addMouseListener(get({This, workAreaJTree}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({get({This, workAreaPropertiesJPanel}), '$class'})):removeAll(get({This, workAreaPropertiesJPanel})),
        (get({get({This, workAreaPropertiesJPanel}), '$class'})):add(get({This, workAreaPropertiesJPanel}), get({This, workAreaJTree})).

getNode(This, TreePathArray) when (is_tuple(TreePathArray) orelse TreePathArray =:= undefined) ->
        BasicArrayList = 'BasicArrayListD':new(),
        case (TreePathArray =/= undefined) of
            true ->
            lists:foreach(fun(Index) ->
                (get({BasicArrayList, '$class'})):add(BasicArrayList, (get({This, '$class'})):getNode(This, array:get(Index, TreePathArray)))
            end, lists:seq(0, array:size(TreePathArray) - 1));
            false -> ok
        end,
        BasicArrayList;
getNode(This, TreePath) ->
        try
        case (TreePath =/= undefined) of
            true ->
            Obj = (get({TreePath, '$class'})):getPath(TreePath),
            case (Obj =/= undefined) of
                true ->
                Node = array:get((array:size(Obj) - 1), Obj),
                throw({'$return', Node});
                false -> ok
            end;
            false -> ok
        end,
        undefined
        catch throw:{'$return', ReturnValue} -> ReturnValue end.


% throws Exception
deselectAll(This) ->
        Size = (get({get({This, highlightedBasicArrayList}), '$class'})):size(get({This, highlightedBasicArrayList})),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["size: ", Size]), This, "deselectAll"),
        lists:foreach(fun(Index) ->
            Node = (get({get({This, highlightedBasicArrayList}), '$class'})):get(get({This, highlightedBasicArrayList}), Index),
            'MyGraphicItemEventService':fire('MyGraphicItemEvent':new('MyGraphicItemEventSource':new(get({'MyGraphicItemEventService', 'DESELECT'}), Node)))
        end, lists:seq(0, Size - 1)),
        (get({get({This, highlightedBasicArrayList}), '$class'})):clear(get({This, highlightedBasicArrayList})).

% throws Exception
selectGraphicItem(This, Node) ->
        (get({get({This, highlightedBasicArrayList}), '$class'})):add(get({This, highlightedBasicArrayList}), Node),
        'MyGraphicItemEventService':fire('MyGraphicItemEvent':new('MyGraphicItemEventSource':new(get({'MyGraphicItemEventService', 'SELECT'}), Node))).

% throws Exception
removeGraphicItem(This, Node) ->
        'MyGraphicItemEventService':fire('MyGraphicItemEvent':new('MyGraphicItemEventSource':new(get({'MyGraphicItemEventService', 'DELETE'}), Node))).

% throws Exception
removeCanvas(This, Node) ->
        'MyCanvasEventService':fire('MyCanvasEvent':new('MyCanvasEventSource':new(get({'MyCanvasEventService', 'DELETE'}), Node))).

% throws Exception
remove(This, TreePath) ->
        Node = (get({This, '$class'})):getNode(This, TreePath),
        case (Node =/= undefined) of
            true ->
            case allbinary_java:instance_of((get({Node, '$class'})):getUserObject(Node), 'CanvasTreeLabel') of
                true ->
                (get({This, '$class'})):removeCanvas(This, Node);
                false ->
                (get({This, '$class'})):removeGraphicItem(This, Node)
            end;
            false -> ok
        end,
        Parent = (get({Node, '$class'})):getParent(Node),
        (get({Parent, '$class'})):remove(Parent, Node).

% throws Exception
copy(This) ->
        TreePath = (get({get({This, workAreaJTree}), '$class'})):getSelectionPath(get({This, workAreaJTree})),
        (get({This, '$class'})):copy(This, TreePath),
        (get({This, '$class'})):updateTree(This),
        (get({This, '$class'})):expand(This),
        (get({This, '$class'})):repaint(This).

% throws Exception
copy(This, TreePath) ->
        Node = (get({This, '$class'})):getNode(This, TreePath),
        case (Node =/= undefined) of
            true ->
            case allbinary_java:instance_of((get({Node, '$class'})):getUserObject(Node), 'CanvasTreeLabel') of
                true ->
                'MyCanvasEventService':fire('MyCanvasEvent':new('MyCanvasEventSource':new(get({'MyCanvasEventService', 'DUPLICATE'}), Node)));
                false ->
                'MyGraphicItemEventService':fire('MyGraphicItemEvent':new('MyGraphicItemEventSource':new(get({'MyGraphicItemEventService', 'DUPLICATE'}), Node)))
            end;
            false -> ok
        end.

% throws Exception
rotate(This, TreePath, Angle) when is_number(Angle) ->
        Node = (get({This, '$class'})):getNode(This, TreePath),
        case (Node =/= undefined) of
            true ->
            case allbinary_java:instance_of((get({Node, '$class'})):getUserObject(Node), 'CanvasTreeLabel') of
                true ->
                'MyCanvasEventService':fire('MyCanvasEvent':new('MyCanvasEventSource':new(get({'MyCanvasEventService', 'ROTATE'}), Angle, Node)));
                false ->
                'MyGraphicItemEventService':fire('MyGraphicItemEvent':new('MyGraphicItemEventSource':new(get({'MyGraphicItemEventService', 'ROTATE'}), Angle, Node)))
            end;
            false -> ok
        end.

getRootTreeNode(This) ->
        get({This, rootTreeNode}).

expand(This) ->
        (get({get({This, workAreaJTree}), '$class'})):expandRow(get({This, workAreaJTree}), 0),
        (get({get({This, workAreaJTree}), '$class'})):expandRow(get({This, workAreaJTree}), 1).

expand(This, TreePath) ->
        (get({get({This, workAreaJTree}), '$class'})):expandPath(get({This, workAreaJTree}), TreePath).

initComponents(This) ->
        put({This, itemJPopupMenu}, 'JPopupMenu':new()),
        put({This, deleteJMenuItem}, 'JMenuItem':new()),
        put({This, copyJMenuItem}, 'JMenuItem':new()),
        put({This, rotateJMenuItem}, 'JMenuItem':new()),
        put({This, itemJScrollPane1}, 'JScrollPane':new()),
        put({This, workAreaPropertiesJPanel}, 'JPanel':new()),
        (get({get({This, itemJPopupMenu}), '$class'})):addPopupMenuListener(get({This, itemJPopupMenu}), 'PopupMenuListener':new() % Java anonymous class body: implement it as a module
%             ok % popupMenuCanceled
%             ok % popupMenuWillBecomeInvisible
%             ok % popupMenuWillBecomeVisible
),
        (get({get({This, deleteJMenuItem}), '$class'})):setText(get({This, deleteJMenuItem}), "Delete"),
        (get({get({This, deleteJMenuItem}), '$class'})):addMouseListener(get({This, deleteJMenuItem}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({get({This, itemJPopupMenu}), '$class'})):add(get({This, itemJPopupMenu}), get({This, deleteJMenuItem})),
        (get({get({This, copyJMenuItem}), '$class'})):setText(get({This, copyJMenuItem}), "Copy"),
        (get({get({This, copyJMenuItem}), '$class'})):addMouseListener(get({This, copyJMenuItem}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({get({This, itemJPopupMenu}), '$class'})):add(get({This, itemJPopupMenu}), get({This, copyJMenuItem})),
        (get({get({This, rotateJMenuItem}), '$class'})):setText(get({This, rotateJMenuItem}), "Rotate 45*"),
        (get({get({This, rotateJMenuItem}), '$class'})):addMouseListener(get({This, rotateJMenuItem}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({get({This, itemJPopupMenu}), '$class'})):add(get({This, itemJPopupMenu}), get({This, rotateJMenuItem})),
        (get({This, '$class'})):setLayout(This, 'GridLayout':new(1, 1)),
        (get({get({This, workAreaPropertiesJPanel}), '$class'})):addMouseListener(get({This, workAreaPropertiesJPanel}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({get({This, workAreaPropertiesJPanel}), '$class'})):setLayout(get({This, workAreaPropertiesJPanel}), 'GridLayout':new(1, 0)),
        (get({get({This, itemJScrollPane1}), '$class'})):setViewportView(get({This, itemJScrollPane1}), get({This, workAreaPropertiesJPanel})),
        (get({This, '$class'})):add(This, get({This, itemJScrollPane1})).

rotateJMenuItemMousePressed(This, Evt) ->
        try
            TreePath = (get({get({This, workAreaJTree}), '$class'})):getSelectionPath(get({This, workAreaJTree})),
            (get({This, '$class'})):rotate(This, TreePath, 45),
            (get({This, '$class'})):updateTree(This),
            (get({This, '$class'})):expand(This),
            (get({This, '$class'})):repaint(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "rotateJMenuItemMousePressed", E)
        end.

workAreaJTreeMousePressed(This, Evt) ->
        try
            SelectedTreePathArray = (get({get({This, workAreaJTree}), '$class'})):getSelectionPaths(get({This, workAreaJTree})),
            List = (get({This, '$class'})):getNode(This, SelectedTreePathArray),
            case ((get({List, '$class'})):size(List) > 0) of
                true ->
                case ((((get({Evt, '$class'})):getModifiers(Evt) band get({Evt, 'BUTTON3_MASK'}))) =:= get({Evt, 'BUTTON3_MASK'})) of
                    true ->
                    lists:foreach(fun(Index) ->
                        put({local, defaultMutableTreeNode}, (get({List, '$class'})):get(List, Index)),
                        case allbinary_java:instance_of((get({get({local, defaultMutableTreeNode}), '$class'})):getUserObject(get({local, defaultMutableTreeNode})), 'CanvasTreeLabel') of
                            true ->
                            (get({get({This, itemJPopupMenu}), '$class'})):show(get({This, itemJPopupMenu}), This, (get({Evt, '$class'})):getX(Evt), (get({Evt, '$class'})):getY(Evt));
                            false ->
                            (get({get({This, itemJPopupMenu}), '$class'})):show(get({This, itemJPopupMenu}), This, (get({Evt, '$class'})):getX(Evt), (get({Evt, '$class'})):getY(Evt))
                        end
                    end, lists:seq(0, array:size(SelectedTreePathArray) - 1));
                    false -> ok
                end,
                case ((((get({Evt, '$class'})):getModifiers(Evt) band get({Evt, 'BUTTON1_MASK'}))) =:= get({Evt, 'BUTTON1_MASK'})) of
                    true ->
                    (get({This, '$class'})):deselectAll(This),
                    lists:foreach(fun(Index) ->
                        put({local, defaultMutableTreeNode}, (get({List, '$class'})):get(List, Index)),
                        case allbinary_java:instance_of((get({get({local, defaultMutableTreeNode}), '$class'})):getUserObject(get({local, defaultMutableTreeNode})), 'CanvasTreeLabel') of
                            true ->
                            'MyCanvasEventService':fire('MyCanvasEvent':new('MyCanvasEventSource':new(get({'MyCanvasEventService', 'SELECT'}), get({local, defaultMutableTreeNode}))));
                            false ->
                            (get({This, '$class'})):selectGraphicItem(This, get({local, defaultMutableTreeNode}))
                        end
                    end, lists:seq(0, array:size(SelectedTreePathArray) - 1));
                    false -> ok
                end;
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "workAreaJTreeMousePressed", E)
        end.

itemJPopupMenuPopupMenuWillBecomeInvisible(This, Evt) ->
        ok.

itemJPopupMenuPopupMenuWillBecomeVisible(This, Evt) ->
        ok.

copyJMenuItemMousePressed(This, Evt) ->
        try
            (get({This, '$class'})):copy(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "copyJMenuItemMousePressed", E)
        end.

deleteJMenuItemMousePressed(This, Evt) ->
        try
            SelectedTreePathArray = (get({get({This, workAreaJTree}), '$class'})):getSelectionPaths(get({This, workAreaJTree})),
            lists:foreach(fun(Index) ->
                TreePath = array:get(Index, SelectedTreePathArray),
                (get({This, '$class'})):remove(This, TreePath),
                (get({This, '$class'})):updateTree(This),
                (get({This, '$class'})):expand(This),
                (get({This, '$class'})):repaint(This)
            end, lists:seq(0, array:size(SelectedTreePathArray) - 1))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "deleteJMenuItemMousePressed", E)
        end.

workAreaPropertiesJPanelMousePressed(This, Evt) ->
        ok.

