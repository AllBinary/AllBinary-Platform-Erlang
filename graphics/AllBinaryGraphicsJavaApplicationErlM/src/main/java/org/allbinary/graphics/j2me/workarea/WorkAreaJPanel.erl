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
% import java.awt
% import java.util.EventListener
% import java.util.HashMap
% import java.util.LinkedList
% import javax.swing
% import javax.swing.tree.MutableTreeNode
% import org.allbinary.dom.DomHelper
% import org.allbinary.graphics.j2me.StatusFactory
% import org.allbinary.graphics.j2me.workarea.canvas.CanvasDom
% import org.allbinary.graphics.j2me.workarea.canvas.CanvasJPanel
% import org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEvent
% import org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventListener
% import org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventService
% import org.allbinary.graphics.j2me.workarea.properties.PropertiesJPanel
% import org.allbinary.graphics.j2me.workarea.tools.ToolJPanel
% import org.allbinary.log.LOGGING
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.util.BasicArrayList
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('WorkAreaJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements WorkAreaJPanelInterface
% implements MyCanvasEventListener
% implements EventListener
% implements Runnable

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

static_init() ->
    put({?MODULE, document}, undefined),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, canvasJPanelList}, undefined),
    put({This, canvasHolderJPanel}, undefined),
    put({This, name}, undefined),
    put({This, selectedFrame}, 0),
    put({This, propertiesJPanel}, undefined),
    put({This, workAreaJTreeJPanel}, undefined),
    put({This, isPlaying}, false),
    put({This, innerJPanel}, undefined),
    ok.


new(Name, Dimension, X, Y) when (is_list(Name) orelse Name =:= undefined), is_integer(X), is_integer(Y) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, Dimension, X, Y),
    This.

init(This, Name, Dimension, X, Y) when (is_list(Name) orelse Name =:= undefined), is_integer(X), is_integer(Y) ->
    'JPanel':init(This),
    init_fields(This),
        try
            (get({This, '$class'})):initComponents(This),
            put({This, name}, Name),
            (get({This, '$class'})):initMyComponents(This, Dimension),
            put({This, workAreaJTreeJPanel}, 'WorkAreaJTreeJPanel':new(get({This, name}))),
            CanvasJPanel = 'CanvasJPanel':new(get({This, workAreaJTreeJPanel}), (get({This, '$class'})):getSize(This), X, Y),
            (get({get({This, canvasJPanelList}), '$class'})):add(get({This, canvasJPanelList}), CanvasJPanel),
            put({This, selectedFrame}, 0),
            (get({get({This, propertiesJPanel}), '$class'})):set(get({This, propertiesJPanel}), get({This, workAreaJTreeJPanel})),
            (get({get({This, canvasHolderJPanel}), '$class'})):add(get({This, canvasHolderJPanel}), CanvasJPanel)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

new(WorkAreaDom, Dimension) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, WorkAreaDom, Dimension),
    This.

init(This, WorkAreaDom, Dimension) ->
    'JPanel':init(This),
    init_fields(This),
        try
            (get({This, '$class'})):initComponents(This),
            put({This, name}, (get({WorkAreaDom, '$class'})):getName(WorkAreaDom)),
            (get({This, '$class'})):initMyComponents(This, Dimension),
            CanvasNodeList = (get({WorkAreaDom, '$class'})):getCanvasNodes(WorkAreaDom),
            NumberOfFrames = (get({CanvasNodeList, '$class'})):size(CanvasNodeList),
            lists:foreach(fun(Index) ->
                Node = (get({CanvasNodeList, '$class'})):get(CanvasNodeList, Index),
                CanvasJPanel = 'CanvasJPanel':new(get({This, workAreaJTreeJPanel}), (get({This, '$class'})):getSize(This), 'CanvasDom':new(Node)),
                (get({get({This, canvasJPanelList}), '$class'})):add(get({This, canvasJPanelList}), CanvasJPanel)
            end, lists:seq(0, NumberOfFrames - 1)),
            put({This, selectedFrame}, 0),
            (get({get({This, canvasHolderJPanel}), '$class'})):add(get({This, canvasHolderJPanel}), (get({This, '$class'})):getCurrentFrame(This)),
            (get({get({This, propertiesJPanel}), '$class'})):set(get({This, propertiesJPanel}), get({This, workAreaJTreeJPanel}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'WorkAreaJPanel', 'LOGGING'}), '$class'})):contains(get({'WorkAreaJPanel', 'LOGGING'}), get({get({'WorkAreaJPanel', 'LOGGING'}), 'LOADINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Constructor Error", This, "WorkAreaJPanel", E);
                false -> ok
            end,
            erlang:error(E)
        end.

initMyComponents(This, Dimension) ->
        put({This, workAreaJTreeJPanel}, 'WorkAreaJTreeJPanel':new(get({This, name}))),
        put({This, canvasHolderJPanel}, 'JPanel':new()),
        (get({get({This, canvasHolderJPanel}), '$class'})):setSize(get({This, canvasHolderJPanel}), Dimension),
        (get({get({This, canvasHolderJPanel}), '$class'})):setLayout(get({This, canvasHolderJPanel}), 'GridLayout':new(1, 1)),
        (get({This, '$class'})):setSize(This, Dimension),
        put({This, canvasJPanelList}, 'LinkedList':new()),
        GridBagLayout = 'GridBagLayout':new(),
        put({local, gridBagConstraints}, 'GridBagConstraints':new()),
        (get({get({This, innerJPanel}), '$class'})):setLayout(get({This, innerJPanel}), GridBagLayout),
        put({get({local, gridBagConstraints}), gridx}, 0),
        put({get({local, gridBagConstraints}), gridy}, 0),
        put({get({local, gridBagConstraints}), gridwidth}, 1),
        put({get({local, gridBagConstraints}), fill}, get({get({get({'java', awt}), 'GridBagConstraints'}), 'BOTH'})),
        put({get({local, gridBagConstraints}), weightx}, 0.05),
        put({get({local, gridBagConstraints}), weighty}, 0.05),
        ToolJPanel = 'ToolJPanel':new(),
        (get({GridBagLayout, '$class'})):setConstraints(GridBagLayout, ToolJPanel, get({local, gridBagConstraints})),
        (get({get({This, innerJPanel}), '$class'})):add(get({This, innerJPanel}), ToolJPanel),
        put({local, gridBagConstraints}, 'GridBagConstraints':new()),
        put({get({local, gridBagConstraints}), gridx}, 1),
        put({get({local, gridBagConstraints}), gridy}, 0),
        put({get({local, gridBagConstraints}), gridwidth}, 6),
        put({get({local, gridBagConstraints}), fill}, get({get({get({'java', awt}), 'GridBagConstraints'}), 'BOTH'})),
        put({get({local, gridBagConstraints}), weightx}, 1),
        put({get({local, gridBagConstraints}), weighty}, 1),
        (get({GridBagLayout, '$class'})):setConstraints(GridBagLayout, get({This, canvasHolderJPanel}), get({local, gridBagConstraints})),
        (get({get({This, innerJPanel}), '$class'})):add(get({This, innerJPanel}), get({This, canvasHolderJPanel})),
        put({local, gridBagConstraints}, 'GridBagConstraints':new()),
        put({get({local, gridBagConstraints}), gridx}, 8),
        put({get({local, gridBagConstraints}), gridy}, 0),
        put({get({local, gridBagConstraints}), gridwidth}, get({get({get({'java', awt}), 'GridBagConstraints'}), 'REMAINDER'})),
        put({get({local, gridBagConstraints}), fill}, get({get({get({'java', awt}), 'GridBagConstraints'}), 'BOTH'})),
        put({get({local, gridBagConstraints}), weightx}, 0.1),
        put({get({local, gridBagConstraints}), weighty}, 0.1),
        put({This, propertiesJPanel}, 'PropertiesJPanel':new()),
        (get({GridBagLayout, '$class'})):setConstraints(GridBagLayout, get({This, propertiesJPanel}), get({local, gridBagConstraints})),
        (get({get({This, innerJPanel}), '$class'})):add(get({This, innerJPanel}), get({This, propertiesJPanel})),
        'MyCanvasEventService':addListener(This).

getCanvasHashMap(This) ->
        CanvasJPanelHashMap = (fun(Target_N69266) -> (get({Target_N69266, '$class'})):createHashMap(Target_N69266) end)('StdUtil':getInstance()),
        Size = (get({get({This, canvasJPanelList}), '$class'})):size(get({This, canvasJPanelList})),
        lists:foreach(fun(Index) ->
            CanvasJPanel = (get({get({This, canvasJPanelList}), '$class'})):get(get({This, canvasJPanelList}), Index),
            (get({CanvasJPanelHashMap, '$class'})):put(CanvasJPanelHashMap, (get({CanvasJPanel, '$class'})):getTreeNode(CanvasJPanel), Index)
        end, lists:seq(0, Size - 1)),
        CanvasJPanelHashMap.

play(This) ->
        put({This, isPlaying}, true).

stop(This) ->
        put({This, isPlaying}, false).

isPlaying(This) ->
        get({This, isPlaying}).

getName(This) ->
        get({This, name}).

setName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, name}, Value).

disableCanvas(This) ->
        (get({get({This, canvasHolderJPanel}), '$class'})):removeAll(get({This, canvasHolderJPanel})).

enableCanvas(This) ->
        (get({get({This, canvasHolderJPanel}), '$class'})):add(get({This, canvasHolderJPanel}), (get({This, '$class'})):getCurrentFrame(This)).

deselect(This) ->
        'JPanel':setVisible(This, false).

select(This) ->
        'JPanel':setVisible(This, true),
        case ((get({get({This, canvasHolderJPanel}), '$class'})):getComponentCount(get({This, canvasHolderJPanel})) =:= 1) of
            true ->
            Component = (get({get({This, canvasHolderJPanel}), '$class'})):getComponent(get({This, canvasHolderJPanel}), 0),
            case (Component =/= undefined) of
                true ->
                (get({Component, '$class'})):repaint(Component);
                false -> ok
            end;
            false -> ok
        end.

changeZoom(This, Factor) when is_integer(Factor) ->
        Size = (get({get({This, canvasJPanelList}), '$class'})):size(get({This, canvasJPanelList})),
        lists:foreach(fun(Index) ->
            CanvasJPanel = (get({get({This, canvasJPanelList}), '$class'})):get(get({This, canvasJPanelList}), Index),
            (fun(Target_N70373) -> (get({Target_N70373, '$class'})):setZoom(Target_N70373, ((fun(Target_N70402) -> (get({Target_N70402, '$class'})):getZoom(Target_N70402) end)((get({CanvasJPanel, '$class'})):getGrid(CanvasJPanel)) + Factor)) end)((get({CanvasJPanel, '$class'})):getGrid(CanvasJPanel))
        end, lists:seq(0, Size - 1)).

getCurrentFrame(This) ->
        (get({get({This, canvasJPanelList}), '$class'})):get(get({This, canvasJPanelList}), get({This, selectedFrame})).

initDuplicate(This, NewCanvasJPanel) ->
        case (NewCanvasJPanel =/= undefined) of
            true ->
            (get({get({This, canvasJPanelList}), '$class'})):add(get({This, canvasJPanelList}), NewCanvasJPanel),
            (get({This, '$class'})):select(This, ((get({get({This, canvasJPanelList}), '$class'})):size(get({This, canvasJPanelList})) - 1));
            false -> ok
        end.

% throws Exception
duplicate(This, TreeNode) ->
        CanvasJPanelHashMap = (get({This, '$class'})):getCanvasHashMap(This),
        case (get({CanvasJPanelHashMap, '$class'})):containsKey(CanvasJPanelHashMap, TreeNode) of
            true ->
            FrameInteger = (get({CanvasJPanelHashMap, '$class'})):get(CanvasJPanelHashMap, TreeNode),
            CanvasJPanel = (get({get({This, canvasJPanelList}), '$class'})):get(get({This, canvasJPanelList}), (get({FrameInteger, '$class'})):intValue(FrameInteger)),
            (get({This, '$class'})):initDuplicate(This, (get({CanvasJPanel, '$class'})):duplicate(CanvasJPanel));
            false -> ok
        end;
% throws Exception
duplicate(This, Evt) ->
        (get({This, '$class'})):duplicate(This, (get({Evt, '$class'})):getTreeNode(Evt)).

% throws Exception
autoRotate(This, Increments, TotalAngle) when is_integer(Increments), is_integer(TotalAngle) ->
        IncrementAngle = ((TotalAngle div Increments)),
        lists:foreach(fun(Index) ->
            CanvasJPanel = (get({This, '$class'})):getCurrentFrame(This),
            NewCanvasJPanel = (get({CanvasJPanel, '$class'})):duplicate(CanvasJPanel),
            (get({NewCanvasJPanel, '$class'})):setAngle(NewCanvasJPanel, (IncrementAngle * Index)),
            (get({This, '$class'})):initDuplicate(This, NewCanvasJPanel)
        end, lists:seq(1, Increments - 1)).

explodeAll(This) ->
        CanvasJPanel = (get({This, '$class'})):getCurrentFrame(This),
        (get({CanvasJPanel, '$class'})):explodeAll(CanvasJPanel).

% throws Exception
autoExplode(This, NumberOfFrames, ExplodeType) when is_integer(NumberOfFrames), is_integer(ExplodeType) ->
        lists:foreach(fun(Index) ->
            CanvasJPanel = (get({This, '$class'})):getCurrentFrame(This),
            NewCanvasJPanel = (get({CanvasJPanel, '$class'})):duplicate(CanvasJPanel),
            (get({NewCanvasJPanel, '$class'})):explode(NewCanvasJPanel, (Index + 1), ExplodeType),
            (get({This, '$class'})):initDuplicate(This, NewCanvasJPanel)
        end, lists:seq(1, NumberOfFrames - 1)).

% throws Exception
autoMirror(This) ->
        CanvasJPanel = (get({This, '$class'})):getCurrentFrame(This),
        NewCanvasJPanel = (get({CanvasJPanel, '$class'})):duplicate(CanvasJPanel),
        (get({NewCanvasJPanel, '$class'})):mirror(NewCanvasJPanel),
        (get({This, '$class'})):initDuplicate(This, NewCanvasJPanel).

select(This, Index) when is_integer(Index) ->
        case (Index < (get({get({This, canvasJPanelList}), '$class'})):size(get({This, canvasJPanelList}))) of
            true ->
            CanvasJPanel = (get({get({This, canvasJPanelList}), '$class'})):get(get({This, canvasJPanelList}), Index),
            case (CanvasJPanel =/= undefined) of
                true ->
                (get({get({This, canvasHolderJPanel}), '$class'})):removeAll(get({This, canvasHolderJPanel})),
                (get({get({This, canvasHolderJPanel}), '$class'})):add(get({This, canvasHolderJPanel}), CanvasJPanel),
                put({This, selectedFrame}, Index),
                (get({CanvasJPanel, '$class'})):changed(CanvasJPanel),
                (get({get({This, canvasHolderJPanel}), '$class'})):repaint(get({This, canvasHolderJPanel})),
                (get({CanvasJPanel, '$class'})):repaint(CanvasJPanel);
                false -> ok
            end;
            false -> ok
        end;
select(This, TreeNode) ->
        CanvasJPanelHashMap = (get({This, '$class'})):getCanvasHashMap(This),
        FrameInteger = (get({CanvasJPanelHashMap, '$class'})):get(CanvasJPanelHashMap, TreeNode),
        case (FrameInteger =/= undefined) of
            true ->
            (get({This, '$class'})):select(This, (get({FrameInteger, '$class'})):intValue(FrameInteger));
            false -> ok
        end;
select(This, Evt) ->
        (get({This, '$class'})):select(This, (get({Evt, '$class'})):getTreeNode(Evt)),
        (fun(Target_N74915) -> (get({Target_N74915, '$class'})):setStatus(Target_N74915, "Frame Selected") end)('StatusFactory':getInstance()).


getDocument() ->
        get({'WorkAreaJPanel', document}).

% throws Exception
toDocument(This) ->
        put({'WorkAreaJPanel', document}, (fun(Target_N72650) -> (get({Target_N72650, '$class'})):createDocument(Target_N72650) end)('DomHelper':getInstance())),
        WorkAreaNode = (get({get({'WorkAreaJPanel', document}), '$class'})):createElement(get({'WorkAreaJPanel', document}), get({'WorkAreaDom', 'WORKAREA'})),
        NameNode = (get({get({'WorkAreaJPanel', document}), '$class'})):createElement(get({'WorkAreaJPanel', document}), get({'WorkAreaDom', 'NAME'})),
        NameTextNode = (get({get({'WorkAreaJPanel', document}), '$class'})):createTextNode(get({'WorkAreaJPanel', document}), get({This, name})),
        (get({NameNode, '$class'})):appendChild(NameNode, NameTextNode),
        FramesNode = (get({get({'WorkAreaJPanel', document}), '$class'})):createElement(get({'WorkAreaJPanel', document}), get({'WorkAreaDom', 'FRAMES'})),
        Size = (get({get({This, canvasJPanelList}), '$class'})):size(get({This, canvasJPanelList})),
        lists:foreach(fun(Index) ->
            CanvasJPanel = (get({get({This, canvasJPanelList}), '$class'})):get(get({This, canvasJPanelList}), Index),
            (get({FramesNode, '$class'})):appendChild(FramesNode, (get({CanvasJPanel, '$class'})):toDom(CanvasJPanel))
        end, lists:seq(0, Size - 1)),
        (get({WorkAreaNode, '$class'})):appendChild(WorkAreaNode, NameNode),
        (get({WorkAreaNode, '$class'})):appendChild(WorkAreaNode, FramesNode),
        (get({get({'WorkAreaJPanel', document}), '$class'})):appendChild(get({'WorkAreaJPanel', document}), WorkAreaNode),
        get({'WorkAreaJPanel', document}).

initComponents(This) ->
        put({This, innerJPanel}, 'JPanel':new()),
        (get({This, '$class'})):setLayout(This, 'GridLayout':new(1, 1)),
        (get({get({This, innerJPanel}), '$class'})):addKeyListener(get({This, innerJPanel}), 'KeyAdapter':new() % Java anonymous class body: implement it as a module
%             ok % keyTyped
%             ok % keyPressed
%             ok % keyReleased
),
        (get({This, '$class'})):add(This, get({This, innerJPanel})).

innerJPanelKeyReleased(This, Evt) ->
        (fun(Target_N73874) -> (get({Target_N73874, '$class'})):setStatus(Target_N73874, "Key Pressed1") end)('StatusFactory':getInstance()).

innerJPanelKeyPressed(This, Evt) ->
        (fun(Target_N74000) -> (get({Target_N74000, '$class'})):setStatus(Target_N74000, "Key Pressed2") end)('StatusFactory':getInstance()).

innerJPanelKeyTyped(This, Evt) ->
        (fun(Target_N74126) -> (get({Target_N74126, '$class'})):setStatus(Target_N74126, "Key Pressed3") end)('StatusFactory':getInstance()).

keyPressed(This, KeyEvent) ->
        (fun(Target_N74252) -> (get({Target_N74252, '$class'})):keyPressed(Target_N74252, KeyEvent) end)((get({This, '$class'})):getCurrentFrame(This)).

keyReleased(This, KeyEvent) ->
        ok.

keyTyped(This, KeyEvent) ->
        ok.

delete(This, Evt) ->
        CanvasJPanelHashMap = (get({This, '$class'})):getCanvasHashMap(This),
        case (get({CanvasJPanelHashMap, '$class'})):containsKey(CanvasJPanelHashMap, (get({Evt, '$class'})):getTreeNode(Evt)) of
            true ->
            (get({get({This, canvasHolderJPanel}), '$class'})):removeAll(get({This, canvasHolderJPanel})),
            FrameInt = (get({CanvasJPanelHashMap, '$class'})):get(CanvasJPanelHashMap, (get({Evt, '$class'})):getTreeNode(Evt)),
            (get({get({This, canvasJPanelList}), '$class'})):remove(get({This, canvasJPanelList}), (get({FrameInt, '$class'})):intValue(FrameInt)),
            (get({This, '$class'})):select(This, (get({FrameInt, '$class'})):intValue(FrameInt));
            false -> ok
        end.



rotate(This, Evt) ->
        CanvasJPanelHashMap = (get({This, '$class'})):getCanvasHashMap(This),
        TreeNode = (get({Evt, '$class'})):getTreeNode(Evt),
        FrameInt = (get({CanvasJPanelHashMap, '$class'})):get(CanvasJPanelHashMap, (get({Evt, '$class'})):getTreeNode(Evt)),
        CanvasJPanel = (get({get({This, canvasJPanelList}), '$class'})):get(get({This, canvasJPanelList}), (get({FrameInt, '$class'})):intValue(FrameInt)),
        case (CanvasJPanel =/= undefined) of
            true ->
            (get({CanvasJPanel, '$class'})):addAngle(CanvasJPanel, (get({Evt, '$class'})):getAngle(Evt)),
            (get({This, '$class'})):select(This, (get({FrameInt, '$class'})):intValue(FrameInt));
            false -> ok
        end,
        (fun(Target_N75327) -> (get({Target_N75327, '$class'})):setStatus(Target_N75327, "Canvas Rotated") end)('StatusFactory':getInstance()).

explode(This, Evt) ->
        (get({This, '$class'})):explodeAll(This).

% throws Exception
autoExplode(This, Evt) ->
        (get({This, '$class'})):autoExplode(This, 10, 0).

% throws Exception
center(This) ->
        CanvasJPanel = (get({This, '$class'})):getCurrentFrame(This),
        (get({CanvasJPanel, '$class'})):center(CanvasJPanel).

% throws Exception
center(This, Evt) ->
        (get({This, '$class'})):center(This).

run(This) ->
        try
            (fun Loop() -> case true of true ->
                case (get({This, '$class'})):isPlaying(This) of
                    true ->
                    Size = (get({get({This, canvasJPanelList}), '$class'})):size(get({This, canvasJPanelList})),
                    lists:foreach(fun(Index) ->
                        case (not (get({This, '$class'})):isPlaying(This)) of
                            true ->
                            throw('$break');
                            false -> ok
                        end,
                        (get({This, '$class'})):select(This, Index),
                        timer:sleep(100)
                    end, lists:seq(0, Size - 1));
                    false ->
                    timer:sleep(500)
                end,
                timer:sleep(250),
                Loop();
            false -> ok end end)()
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            ok
        end.

