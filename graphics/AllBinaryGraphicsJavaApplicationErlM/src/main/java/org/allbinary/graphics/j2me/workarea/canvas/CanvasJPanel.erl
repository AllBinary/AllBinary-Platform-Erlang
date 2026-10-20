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
% package org.allbinary.graphics.j2me.workarea.canvas
% import java.awt
% import java.util.HashMap
% import javax.swing.tree.DefaultMutableTreeNode
% import javax.swing.tree.MutableTreeNode
% import org.allbinary.animation.VectorExplosionGenerator
% import org.allbinary.animation.VectorMirrorGenerator
% import org.allbinary.animation.vector.VectorCenterGenerator
% import org.allbinary.game.input.GameInputStrings
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.j2me.GraphicsException
% import org.allbinary.graphics.j2me.StatusFactory
% import org.allbinary.graphics.j2me.workarea.WorkAreaJTreeJPanel
% import org.allbinary.graphics.j2me.workarea.tools.GraphicItemFactory
% import org.allbinary.graphics.j2me.workarea.tools.GraphicItemInterface
% import org.allbinary.graphics.j2me.workarea.tools.LinesGraphicItem
% import org.allbinary.graphics.j2me.workarea.tools.MouseStrings
% import org.allbinary.graphics.j2me.workarea.tools.Points
% import org.allbinary.graphics.j2me.workarea.tools.ToolFactory
% import org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEvent
% import org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEventListener
% import org.allbinary.graphics.j2me.workarea.tools.event.MyGraphicItemEventService
% import org.allbinary.graphics.pipeline.RandomRotationFactory
% import org.allbinary.log.LOGGING
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.GuiLog
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.math.PositionStrings
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.w3c.dom.Node

-module('CanvasJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements MouseListener
% implements MouseMotionListener
% implements KeyListener
% implements MyGraphicItemEventListener

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

static_init() ->
    put({?MODULE, frame}, 0),
    put({?MODULE, gridColor}, 'Color':new((fun(Target_N67235) -> (get({Target_N67235, '$class'})):intValue(Target_N67235) end)(get({'BasicColorFactory':getInstance(), 'WHITE'})))),
    put({?MODULE, backgroundColor}, 'Color':new((fun(Target_N67320) -> (get({Target_N67320, '$class'})):intValue(Target_N67320) end)(get({'BasicColorFactory':getInstance(), 'CLEAR_COLOR'})))),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, guiLog}, 'GuiLog':getInstance()),
    put({This, gameInputStrings}, 'GameInputStrings':getInstance()),
    put({This, selectedTool}, undefined),
    put({This, graphicItemHashMap}, undefined),
    put({This, canvasDimension}, undefined),
    put({This, angle}, 0.0),
    put({This, canvasTreeNode}, undefined),
    put({This, frameLabel}, undefined),
    put({This, workAreaJTreeJPanel}, undefined),
    put({This, grid}, undefined),
    ok.


new(WorkAreaJTreeJPanel, Dimension, X, Y) when is_integer(X), is_integer(Y) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, WorkAreaJTreeJPanel, Dimension, X, Y),
    This.

'$init'(This, WorkAreaJTreeJPanel, Dimension, X, Y) when is_integer(X), is_integer(Y) ->
    'JPanel':'$init'(This),
    init_fields(This),
        put({This, grid}, 'Grid':new()),
        try
            put({This, workAreaJTreeJPanel}, WorkAreaJTreeJPanel),
            (get({This, '$class'})):initComponents(This),
            (get({This, '$class'})):initMyComponents(This),
            (get({This, '$class'})):setSize(This, Dimension),
            (get({This, '$class'})):setCanvasSize(This, X, Y)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'CanvasJPanel', 'LOGGING'}), '$class'})):contains(get({'CanvasJPanel', 'LOGGING'}), get({get({'CanvasJPanel', 'LOGGING'}), 'GRAPHICSCREATION'})) of
                true ->
                (get({get({This, guiLog}), '$class'})):put(get({This, guiLog}), "Constructor Error", This, "contructor", E);
                false -> ok
            end
        end.

new(WorkAreaJTreeJPanel, Dimension, CanvasDom) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, WorkAreaJTreeJPanel, Dimension, CanvasDom),
    This.

'$init'(This, WorkAreaJTreeJPanel, Dimension, CanvasDom) ->
    'JPanel':'$init'(This),
    init_fields(This),
        put({This, grid}, 'Grid':new((get({CanvasDom, '$class'})):getGrid(CanvasDom))),
        try
            put({This, workAreaJTreeJPanel}, WorkAreaJTreeJPanel),
            (get({This, '$class'})):initComponents(This),
            (get({This, '$class'})):initMyComponents(This),
            (get({This, '$class'})):setSize(This, Dimension),
            (get({This, '$class'})):setCanvasSize(This, (fun(Target_N67937) -> (get({Target_N67937, '$class'})):getWidth(Target_N67937) end)((get({CanvasDom, '$class'})):getDimension(CanvasDom)), (fun(Target_N67961) -> (get({Target_N67961, '$class'})):getHeight(Target_N67961) end)((get({CanvasDom, '$class'})):getDimension(CanvasDom))),
            put({This, graphicItemHashMap}, (get({CanvasDom, '$class'})):getGraphicItemHashMap(CanvasDom)),
            GraphicItemArray = (fun(Target_N68042) -> (get({Target_N68042, '$class'})):toArray(Target_N68042) end)((get({get({This, graphicItemHashMap}), '$class'})):keySet(get({This, graphicItemHashMap}))),
            Size = array:size(GraphicItemArray),
            lists:foreach(fun(Index) ->
                GraphicItemTreeNode = array:get(Index, GraphicItemArray),
                (get({get({This, canvasTreeNode}), '$class'})):add(get({This, canvasTreeNode}), GraphicItemTreeNode)
            end, lists:seq(0, Size - 1)),
            (get({This, '$class'})):repaint(This),
            (get({This, '$class'})):setAngle(This, (get({CanvasDom, '$class'})):getAngle(CanvasDom)),
            (get({get({This, workAreaJTreeJPanel}), '$class'})):updateTree(get({This, workAreaJTreeJPanel})),
            (get({get({This, workAreaJTreeJPanel}), '$class'})):expand(get({This, workAreaJTreeJPanel})),
            (get({get({This, workAreaJTreeJPanel}), '$class'})):repaint(get({This, workAreaJTreeJPanel}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'CanvasJPanel', 'LOGGING'}), '$class'})):contains(get({'CanvasJPanel', 'LOGGING'}), get({get({'CanvasJPanel', 'LOGGING'}), 'GRAPHICSCREATION'})) of
                true ->
                (get({get({This, guiLog}), '$class'})):put(get({This, guiLog}), "Constructor Error", This, "contructor", E);
                false -> ok
            end
        end.

% throws Exception
initMyComponents(This) ->
        put({This, frameLabel}, 'CanvasTreeLabel':new(lists:concat(["FrameLabel", (get({get({'CanvasJPanel', frame}), '$class'})):toString(get({'CanvasJPanel', frame}))]))),
        put({This, canvasTreeNode}, 'DefaultMutableTreeNode':new(get({This, frameLabel}))),
        put({'CanvasJPanel', frame}, get({'CanvasJPanel', frame}) + 1),
        (get({get({This, workAreaJTreeJPanel}), '$class'})):add(get({This, workAreaJTreeJPanel}), (get({This, '$class'})):getTreeNode(This)),
        put({This, graphicItemHashMap}, (fun(Target_N68831) -> (get({Target_N68831, '$class'})):createHashMap(Target_N68831) end)('StdUtil':getInstance())),
        put({get({This, grid}), grid}, (fun(Target_N68883) -> (get({Target_N68883, '$class'})):createXY(Target_N68883, 0, 0) end)('PointFactory':getInstance())),
        (get({This, '$class'})):setCanvasDimension(This, 'IntegerDimension':new(0, 0)),
        put({This, selectedTool}, undefined),
        (get({This, '$class'})):addKeyListener(This, This),
        (get({This, '$class'})):addMouseListener(This, This),
        (get({This, '$class'})):addMouseMotionListener(This, This),
        'MyGraphicItemEventService':addListener(This).

getTreeNode(This) ->
        get({This, canvasTreeNode}).

initComponents(This) ->
        (get({This, '$class'})):setLayout(This, 'GridLayout':new(1, 1)).

% throws Exception
setCanvasSize(This, X, Y) when is_integer(X), is_integer(Y) ->
        put({get({This, grid}), isGridPossible}, true),
        case (X =< 0) of
            true ->
            put({get({This, grid}), isGridPossible}, false),
            erlang:error({'GraphicsException', lists:concat(["X Size Error: ", X]), This, "setWorkAreaSize"});
            false -> ok
        end,
        case (Y =< 0) of
            true ->
            put({get({This, grid}), isGridPossible}, false),
            erlang:error({'GraphicsException', lists:concat(["Y Size Error: ", Y]), This, "setWorkAreaSize"});
            false -> ok
        end,
        case (X > (get({This, '$class'})):getWidth(This)) of
            true ->
            put({get({This, grid}), isGridPossible}, false);
            false -> ok
        end,
        case (Y > (get({This, '$class'})):getHeight(This)) of
            true ->
            put({get({This, grid}), isGridPossible}, false);
            false -> ok
        end,
        (get({This, '$class'})):setCanvasDimension(This, 'IntegerDimension':new(X, Y)),
        put({get({This, grid}), isChanged}, true).

setGrid(This, Point) ->
        (get({This, '$class'})):setGrid(This, (get({Point, '$class'})):getX(Point), (get({Point, '$class'})):getY(Point)).

setGrid(This, XSize, YSize) when is_integer(XSize), is_integer(YSize) ->
        try
            case ((XSize >= ((fun(Target_N69891) -> (get({Target_N69891, '$class'})):getWidth(Target_N69891) end)((get({This, '$class'})):getCanvasDimension(This)) / 2)) orelse (XSize < 1)) of
                true ->
                erlang:error({'GraphicsException', lists:concat([lists:concat([lists:concat(["X Size Error: ", XSize]), " WorkArea X: "]), (fun(Target_N69982) -> (get({Target_N69982, '$class'})):getWidth(Target_N69982) end)((get({This, '$class'})):getCanvasDimension(This))]), This, "setGrid"});
                false -> ok
            end,
            case ((YSize >= ((fun(Target_N70035) -> (get({Target_N70035, '$class'})):getHeight(Target_N70035) end)((get({This, '$class'})):getCanvasDimension(This)) / 2)) orelse (YSize < 1)) of
                true ->
                erlang:error({'GraphicsException', lists:concat([lists:concat([lists:concat(["Y Size Error", YSize]), " WorkArea Y: "]), (fun(Target_N70126) -> (get({Target_N70126, '$class'})):getHeight(Target_N70126) end)((get({This, '$class'})):getCanvasDimension(This))]), This, "setGrid"});
                false -> ok
            end,
            put({get({This, grid}), grid}, (fun(Target_N70182) -> (get({Target_N70182, '$class'})):createXY(Target_N70182, XSize, YSize) end)('PointFactory':getInstance())),
            put({get({This, grid}), isChanged}, true)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            ok
        end.

% throws Exception
setDefaultGrid(This) ->
        XPixelsPerWorkAreaPixel = ((get({This, '$class'})):getWidth(This) / (fun(Target_N70373) -> (get({Target_N70373, '$class'})):getWidth(Target_N70373) end)((get({This, '$class'})):getCanvasDimension(This))),
        YPixelsPerWorkAreaPixel = ((get({This, '$class'})):getHeight(This) / (fun(Target_N70431) -> (get({Target_N70431, '$class'})):getHeight(Target_N70431) end)((get({This, '$class'})):getCanvasDimension(This))),
        (get({This, '$class'})):setGrid(This, 1, 1),
        put({get({This, grid}), isChanged}, true).

getAngle(This) ->
        get({This, angle}).

setAngle(This, Angle) when is_number(Angle) ->
        put({This, angle}, Angle).

addAngle(This, Angle) when is_number(Angle) ->
        (get({This, '$class'})):setAngle(This, (get({This, angle}) + Angle)).

explodeAll(This) ->
        NewPoints = 'BasicArrayListD':new(),
        GraphicItemArray = (fun(Target_N70815) -> (get({Target_N70815, '$class'})):toArray(Target_N70815) end)((fun(Target_N70822) -> (get({Target_N70822, '$class'})):keySet(Target_N70822) end)((get({This, '$class'})):getGraphicItemHashMap(This))),
        Size = array:size(GraphicItemArray),
        lists:foreach(fun(Index) ->
            GraphicItemNode = array:get(Index, GraphicItemArray),
            GraphicItem = (fun(Target_N70990) -> (get({Target_N70990, '$class'})):get(Target_N70990, GraphicItemNode) end)((get({This, '$class'})):getGraphicItemHashMap(This)),
            case ((get({GraphicItem, '$class'})):getName(GraphicItem) =:= 'LinesGraphicItem':getStaticName()) of
                true ->
                (fun Loop() -> case ((fun(Target_N71457) -> (get({Target_N71457, '$class'})):getSize(Target_N71457) end)((get({GraphicItem, '$class'})):getPointsInterface(GraphicItem)) > 2) of true ->
                    put({local, newGraphicItem}, (fun(Target_N71109) -> (get({Target_N71109, '$class'})):getInstance(Target_N71109, This) end)((fun(Target_N71116) -> (get({Target_N71116, '$class'})):getInstance(Target_N71116, (get({GraphicItem, '$class'})):getName(GraphicItem)) end)('GraphicItemFactory':getInstance()))),
                    PointOne = 'GPoint':getInstance((get({GraphicItem, '$class'})):removePoint(GraphicItem)),
                    PointTwo = 'GPoint':getInstance((get({GraphicItem, '$class'})):removePoint(GraphicItem)),
                    case ((PointOne =/= undefined) andalso (PointTwo =/= undefined)) of
                        true ->
                        (get({get({local, newGraphicItem}), '$class'})):addPoint(get({local, newGraphicItem}), PointOne),
                        (get({get({local, newGraphicItem}), '$class'})):addPoint(get({local, newGraphicItem}), PointTwo);
                        false -> ok
                    end,
                    (get({NewPoints, '$class'})):add(NewPoints, get({local, newGraphicItem})),
                    Loop();
                false -> ok end end)();
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        Size2 = (get({NewPoints, '$class'})):size(NewPoints),
        lists:foreach(fun(Index) ->
            put({local, newGraphicItem}, (get({NewPoints, '$class'})):get(NewPoints, Index)),
            (get({get({This, canvasTreeNode}), '$class'})):add(get({This, canvasTreeNode}), (get({get({local, newGraphicItem}), '$class'})):getTreeNode(get({local, newGraphicItem}))),
            (fun(Target_N71721) -> (get({Target_N71721, '$class'})):put(Target_N71721, (get({get({local, newGraphicItem}), '$class'})):getTreeNode(get({local, newGraphicItem})), get({local, newGraphicItem})) end)((get({This, '$class'})):getGraphicItemHashMap(This))
        end, lists:seq(0, Size2 - 1)),
        (get({get({This, workAreaJTreeJPanel}), '$class'})):updateTree(get({This, workAreaJTreeJPanel})),
        (get({get({This, workAreaJTreeJPanel}), '$class'})):expand(get({This, workAreaJTreeJPanel})),
        (get({get({This, workAreaJTreeJPanel}), '$class'})):repaint(get({This, workAreaJTreeJPanel})).

% throws Exception
explode(This, HowMuch, ExplosionType) when is_integer(HowMuch), is_integer(ExplosionType) ->
        GraphicItemArray = (fun(Target_N71950) -> (get({Target_N71950, '$class'})):toArray(Target_N71950) end)((fun(Target_N71957) -> (get({Target_N71957, '$class'})):keySet(Target_N71957) end)((get({This, '$class'})):getGraphicItemHashMap(This))),
        Size = array:size(GraphicItemArray),
        lists:foreach(fun(Index) ->
            Item = (fun(Target_N72070) -> (get({Target_N72070, '$class'})):get(Target_N72070, array:get(Index, GraphicItemArray)) end)((get({This, '$class'})):getGraphicItemHashMap(This)),
            BasicArrayList = (fun(Target_N72148) -> (get({Target_N72148, '$class'})):createList(Target_N72148, (fun(Target_N72173) -> (get({Target_N72173, '$class'})):getPoints(Target_N72173) end)((get({Item, '$class'})):getPointsInterface(Item)), HowMuch, get({'VectorExplosionGenerator':getInstance(), 'RANDOM'})) end)('VectorExplosionGenerator':getInstance()),
            NewPoints = 'Points':new(),
            (get({NewPoints, '$class'})):addPoints(NewPoints, BasicArrayList),
            (get({Item, '$class'})):setPointsInterface(Item, NewPoints),
            AngleDelta = (fun(Target_N72359) -> (get({Target_N72359, '$class'})):getNextRandomAngle(Target_N72359, HowMuch) end)('RandomRotationFactory':getInstance()),
            (get({Item, '$class'})):setAngle(Item, AngleDelta)
        end, lists:seq(0, Size - 1)),
        (get({This, '$class'})):repaint(This).

% throws Exception
mirror(This) ->
        Width = (fun(Target_N72598) -> (get({Target_N72598, '$class'})):getWidth(Target_N72598) end)((get({This, '$class'})):getCanvasDimension(This)),
        GraphicItemArray = (fun(Target_N72647) -> (get({Target_N72647, '$class'})):toArray(Target_N72647) end)((fun(Target_N72654) -> (get({Target_N72654, '$class'})):keySet(Target_N72654) end)((get({This, '$class'})):getGraphicItemHashMap(This))),
        Size = array:size(GraphicItemArray),
        lists:foreach(fun(Index) ->
            Item = (fun(Target_N72767) -> (get({Target_N72767, '$class'})):get(Target_N72767, array:get(Index, GraphicItemArray)) end)((get({This, '$class'})):getGraphicItemHashMap(This)),
            BasicArrayList = (fun(Target_N72845) -> (get({Target_N72845, '$class'})):getInstance(Target_N72845, (fun(Target_N72870) -> (get({Target_N72870, '$class'})):getPoints(Target_N72870) end)((get({Item, '$class'})):getPointsInterface(Item)), Width) end)('VectorMirrorGenerator':getInstance()),
            NewPoints = 'Points':new(),
            (get({NewPoints, '$class'})):addPoints(NewPoints, BasicArrayList),
            (get({Item, '$class'})):setPointsInterface(Item, NewPoints)
        end, lists:seq(0, Size - 1)),
        (get({This, '$class'})):repaint(This).

% throws Exception
center(This) ->
        (fun(Target_N73141) -> (get({Target_N73141, '$class'})):transform(Target_N73141, (get({This, '$class'})):getGraphicItemHashMap(This)) end)('VectorCenterGenerator':new()),
        (get({This, '$class'})):repaint(This).

setNewTool(This) ->
        try
            (fun(Target_N73238) -> (get({Target_N73238, '$class'})):setStatus(Target_N73238, "Tool Selected") end)('StatusFactory':getInstance()),
            put({This, selectedTool}, (fun(Target_N73288) -> (get({Target_N73288, '$class'})):getInstance(Target_N73288, This) end)((fun(Target_N73295) -> (get({Target_N73295, '$class'})):getSelectedToolFactory(Target_N73295) end)('ToolFactory':getInstance()))),
            NewNode = (get({get({This, selectedTool}), '$class'})):getTreeNode(get({This, selectedTool})),
            (fun(Target_N73385) -> (get({Target_N73385, '$class'})):put(Target_N73385, NewNode, get({This, selectedTool})) end)((get({This, '$class'})):getGraphicItemHashMap(This)),
            (get({get({This, canvasTreeNode}), '$class'})):add(get({This, canvasTreeNode}), NewNode),
            case ((get({This, '$class'})):getSelectedTool(This) =:= undefined) of
                true ->
                erlang:error({'GraphicsException', "No Tool Selected", This, "setSelectedTool"});
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            ok
        end.

% throws Exception
duplicateGraphicItem(This, GraphicItem) ->
        GraphicItemClone = (get({GraphicItem, '$class'})):duplicate(GraphicItem),
        (fun(Target_N73630) -> (get({Target_N73630, '$class'})):put(Target_N73630, (get({GraphicItemClone, '$class'})):getTreeNode(GraphicItemClone), GraphicItemClone) end)((get({This, '$class'})):getGraphicItemHashMap(This)),
        (get({get({This, canvasTreeNode}), '$class'})):add(get({This, canvasTreeNode}), (get({GraphicItemClone, '$class'})):getTreeNode(GraphicItemClone)).

% throws Exception
duplicateGraphicItemHashMap(This, HashMap) ->
        MutableTreeNodeArray = (fun(Target_N73793) -> (get({Target_N73793, '$class'})):toArray(Target_N73793) end)((get({HashMap, '$class'})):keySet(HashMap)),
        Size = array:size(MutableTreeNodeArray),
        lists:foreach(fun(Index) ->
            TreeNode = array:get(Index, MutableTreeNodeArray),
            GraphicItem = (get({HashMap, '$class'})):get(HashMap, TreeNode),
            (get({This, '$class'})):duplicateGraphicItem(This, GraphicItem)
        end, lists:seq(0, Size - 1)).

getGraphicItemHashMap(This) ->
        get({This, graphicItemHashMap}).

getXPixelsPerWorkAreaPixel(This) ->
        try
        X = (((fun(Target_N74229) -> (get({Target_N74229, '$class'})):getX(Target_N74229) end)(get({(get({This, '$class'})):getGrid(This), grid})) * (((get({This, '$class'})):getWidth(This) - 10))) / (fun(Target_N74281) -> (get({Target_N74281, '$class'})):getWidth(Target_N74281) end)((get({This, '$class'})):getCanvasDimension(This))),
        case ((fun(Target_N74324) -> (get({Target_N74324, '$class'})):getZoom(Target_N74324) end)((get({This, '$class'})):getGrid(This)) =:= 1) of
            true ->
            throw({'$return', 1});
            false ->
            throw({'$return', X})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getYPixelsPerWorkAreaPixel(This) ->
        try
        Y = (((fun(Target_N74428) -> (get({Target_N74428, '$class'})):getY(Target_N74428) end)(get({(get({This, '$class'})):getGrid(This), grid})) * (((get({This, '$class'})):getHeight(This) - 10))) / (fun(Target_N74480) -> (get({Target_N74480, '$class'})):getHeight(Target_N74480) end)((get({This, '$class'})):getCanvasDimension(This))),
        case ((fun(Target_N74519) -> (get({Target_N74519, '$class'})):getZoom(Target_N74519) end)((get({This, '$class'})):getGrid(This)) =:= 1) of
            true ->
            throw({'$return', 1});
            false ->
            throw({'$return', Y})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getSelectedTool(This) ->
        get({This, selectedTool}).

drawItems(This, Graphics) ->
        AngleDouble = get({This, angle}),
        GraphicItemArray = (fun(Target_N74720) -> (get({Target_N74720, '$class'})):toArray(Target_N74720) end)((fun(Target_N74727) -> (get({Target_N74727, '$class'})):keySet(Target_N74727) end)((get({This, '$class'})):getGraphicItemHashMap(This))),
        Size = array:size(GraphicItemArray),
        lists:foreach(fun(Index) ->
            Item = (fun(Target_N74840) -> (get({Target_N74840, '$class'})):get(Target_N74840, array:get(Index, GraphicItemArray)) end)((get({This, '$class'})):getGraphicItemHashMap(This)),
            (get({Item, '$class'})):paint(Item, Graphics, AngleDouble, (get({This, '$class'})):getCanvasDimension(This), (get({This, '$class'})):getXPixelsPerWorkAreaPixel(This), (get({This, '$class'})):getYPixelsPerWorkAreaPixel(This))
        end, lists:seq(0, Size - 1)).

drawGrid(This, Graphics) ->
        XAdjust = ((((get({This, '$class'})):getWidth(This) rem (get({This, '$class'})):getXPixelsPerWorkAreaPixel(This))) / 2),
        YAdjust = ((((get({This, '$class'})):getHeight(This) rem (get({This, '$class'})):getYPixelsPerWorkAreaPixel(This))) / 2),
        XLeft = XAdjust,
        YUpper = YAdjust,
        XRight = ((get({This, '$class'})):getWidth(This) - XAdjust),
        YLower = ((get({This, '$class'})):getHeight(This) - YAdjust),
        (get({Graphics, '$class'})):setColor(Graphics, get({'CanvasJPanel', gridColor})),
        lists:foreach(fun(Value) ->
            (get({Graphics, '$class'})):drawLine(Graphics, XLeft, Value, XRight, Value)
        end, lists:seq(YAdjust, ((get({This, '$class'})):getHeight(This) - YAdjust), (get({This, '$class'})):getYPixelsPerWorkAreaPixel(This))),
        lists:foreach(fun(Value) ->
            (get({Graphics, '$class'})):drawLine(Graphics, Value, YUpper, Value, YLower)
        end, lists:seq(XAdjust, ((get({This, '$class'})):getWidth(This) - XAdjust), (get({This, '$class'})):getYPixelsPerWorkAreaPixel(This))).

paint(This, Graphics) ->
        try
            case get({(get({This, '$class'})):getGrid(This), isChanged}) of
                true ->
                (get({Graphics, '$class'})):setColor(Graphics, get({'CanvasJPanel', backgroundColor})),
                (get({Graphics, '$class'})):fillRect(Graphics, 0, 0, (get({This, '$class'})):getWidth(This), (get({This, '$class'})):getHeight(This)),
                case ((((fun(Target_N75912) -> (get({Target_N75912, '$class'})):getZoom(Target_N75912) end)((get({This, '$class'})):getGrid(This)) > 2) andalso get({(get({This, '$class'})):getGrid(This), isGridOn})) andalso get({(get({This, '$class'})):getGrid(This), isGridPossible})) of
                    true ->
                    (get({This, '$class'})):setDefaultGrid(This),
                    (get({This, '$class'})):drawGrid(This, Graphics);
                    false -> ok
                end,
                (get({This, '$class'})):drawItems(This, Graphics),
                (get({Graphics, '$class'})):drawString(Graphics, (fun(Target_N76075) -> (get({Target_N76075, '$class'})):toString(Target_N76075) end)((get({This, '$class'})):getAngle(This)), ((get({This, '$class'})):getWidth(This) - 75), ((get({This, '$class'})):getHeight(This) - 15)),
                put({get({This, grid}), isChanged}, false);
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            ok
        end.

repaint(This) ->
        case (get({This, grid}) =/= undefined) of
            true ->
            put({get({This, grid}), isChanged}, true);
            false -> ok
        end,
        'JPanel':repaint(This).

% throws Exception
toDom(This) ->
        (fun(Target_N76367) -> (get({Target_N76367, '$class'})):toDom(Target_N76367) end)('CanvasDom':new(This)).

changed(This) ->
        put({get({This, grid}), isChanged}, true).

mouseClicked(This, MouseEvent) ->
        (fun(Target_N76495) -> (get({Target_N76495, '$class'})):setStatusNoLog(Target_N76495, (get({'MouseStrings':getInstance(), 'MOUSE_CLICKED_LABEL'}) + (get({This, '$class'})):logMouseEvent(This, MouseEvent))) end)('StatusFactory':getInstance()),
        case (((get({This, '$class'})):getSelectedTool(This) =/= undefined) andalso (fun(Target_N76600) -> (get({Target_N76600, '$class'})):isActive(Target_N76600) end)((get({This, '$class'})):getSelectedTool(This))) of
            true ->
            put({local, graphicItem}, (get({This, '$class'})):getSelectedTool(This)),
            (get({get({local, graphicItem}), '$class'})):mouseClicked(get({local, graphicItem}), MouseEvent, (get({This, '$class'})):getXPixelsPerWorkAreaPixel(This), (get({This, '$class'})):getYPixelsPerWorkAreaPixel(This));
            false ->
            (get({This, '$class'})):setNewTool(This),
            put({local, graphicItem}, (get({This, '$class'})):getSelectedTool(This)),
            case (get({local, graphicItem}) =/= undefined) of
                true ->
                (get({get({local, graphicItem}), '$class'})):mouseClicked(get({local, graphicItem}), MouseEvent, (get({This, '$class'})):getXPixelsPerWorkAreaPixel(This), (get({This, '$class'})):getYPixelsPerWorkAreaPixel(This));
                false -> ok
            end
        end,
        put({get({This, grid}), isChanged}, true),
        (get({This, '$class'})):repaint(This),
        (get({get({This, workAreaJTreeJPanel}), '$class'})):updateTree(get({This, workAreaJTreeJPanel})),
        (get({get({This, workAreaJTreeJPanel}), '$class'})):expand(get({This, workAreaJTreeJPanel})),
        (get({get({This, workAreaJTreeJPanel}), '$class'})):repaint(get({This, workAreaJTreeJPanel})).

mouseEntered(This, MouseEvent) ->
        (fun(Target_N77059) -> (get({Target_N77059, '$class'})):setStatusNoLog(Target_N77059, (get({This, '$class'})):logMouseEvent(This, MouseEvent)) end)('StatusFactory':getInstance()).

mouseExited(This, MouseEvent) ->
        (fun(Target_N77181) -> (get({Target_N77181, '$class'})):setStatusNoLog(Target_N77181, (get({This, '$class'})):logMouseEvent(This, MouseEvent)) end)('StatusFactory':getInstance()).

mousePressed(This, MouseEvent) ->
        (fun(Target_N77303) -> (get({Target_N77303, '$class'})):setStatusNoLog(Target_N77303, (get({'MouseStrings':getInstance(), 'MOUSE_PRESSED_LABEL'}) + (get({This, '$class'})):logMouseEvent(This, MouseEvent))) end)('StatusFactory':getInstance()),
        case ((get({This, '$class'})):getSelectedTool(This) =/= undefined) of
            true ->
            GraphicItem = (get({This, '$class'})):getSelectedTool(This),
            (get({GraphicItem, '$class'})):mousePressed(GraphicItem, MouseEvent, (get({This, '$class'})):getXPixelsPerWorkAreaPixel(This), (get({This, '$class'})):getYPixelsPerWorkAreaPixel(This));
            false -> ok
        end,
        (get({This, '$class'})):requestFocus(This),
        put({get({This, grid}), isChanged}, true),
        (get({This, '$class'})):repaint(This).

mouseReleased(This, MouseEvent) ->
        (fun(Target_N77641) -> (get({Target_N77641, '$class'})):setStatusNoLog(Target_N77641, (get({'MouseStrings':getInstance(), 'MOUSE_RELEASED_LABEL'}) + (get({This, '$class'})):logMouseEvent(This, MouseEvent))) end)('StatusFactory':getInstance()),
        GraphicItem = (get({This, '$class'})):getSelectedTool(This),
        case (GraphicItem =/= undefined) of
            true ->
            (get({GraphicItem, '$class'})):mouseReleased(GraphicItem, MouseEvent, (get({This, '$class'})):getXPixelsPerWorkAreaPixel(This), (get({This, '$class'})):getYPixelsPerWorkAreaPixel(This));
            false -> ok
        end,
        (get({This, '$class'})):requestFocus(This),
        put({get({This, grid}), isChanged}, true),
        (get({This, '$class'})):repaint(This).

mouseDragged(This, MouseEvent) ->
        (fun(Target_N77976) -> (get({Target_N77976, '$class'})):setStatusNoLog(Target_N77976, (get({'MouseStrings':getInstance(), 'MOUSE_DRAGGED_LABEL'}) + (get({This, '$class'})):logMouseEvent(This, MouseEvent))) end)('StatusFactory':getInstance()),
        GraphicItem = (get({This, '$class'})):getSelectedTool(This),
        case (GraphicItem =/= undefined) of
            true ->
            (get({GraphicItem, '$class'})):mouseDragged(GraphicItem, MouseEvent, (get({This, '$class'})):getXPixelsPerWorkAreaPixel(This), (get({This, '$class'})):getYPixelsPerWorkAreaPixel(This));
            false -> ok
        end,
        (get({This, '$class'})):requestFocus(This),
        put({get({This, grid}), isChanged}, true),
        (get({This, '$class'})):repaint(This).

mouseMoved(This, MouseEvent) ->
        (fun(Target_N78311) -> (get({Target_N78311, '$class'})):setStatusNoLog(Target_N78311, (get({'MouseStrings':getInstance(), 'MOUSE_MOVED_LABEL'}) + (get({This, '$class'})):logMouseEvent(This, MouseEvent))) end)('StatusFactory':getInstance()),
        case (((get({This, '$class'})):getSelectedTool(This) =/= undefined) andalso (fun(Target_N78416) -> (get({Target_N78416, '$class'})):isActive(Target_N78416) end)((get({This, '$class'})):getSelectedTool(This))) of
            true ->
            GraphicItem = (get({This, '$class'})):getSelectedTool(This),
            (get({GraphicItem, '$class'})):mouseMoved(GraphicItem, MouseEvent, (get({This, '$class'})):getXPixelsPerWorkAreaPixel(This), (get({This, '$class'})):getYPixelsPerWorkAreaPixel(This));
            false -> ok
        end,
        (get({This, '$class'})):requestFocus(This),
        put({get({This, grid}), isChanged}, true),
        (get({This, '$class'})):repaint(This).

logMouseEvent(This, MouseEvent) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'PositionStrings':getInstance(), 'X_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(((get({MouseEvent, '$class'})):getX(MouseEvent) / (get({This, '$class'})):getXPixelsPerWorkAreaPixel(This)))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'PositionStrings':getInstance(), 'Y_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(((get({MouseEvent, '$class'})):getY(MouseEvent) / (get({This, '$class'})):getYPixelsPerWorkAreaPixel(This)))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

keyPressed(This, KeyEvent) ->
        (fun(Target_N79067) -> (get({Target_N79067, '$class'})):setStatus(Target_N79067, "Key Pressed") end)('StatusFactory':getInstance()),
        try
            GraphicItemArray = (fun(Target_N79125) -> (get({Target_N79125, '$class'})):toArray(Target_N79125) end)((get({get({This, graphicItemHashMap}), '$class'})):keySet(get({This, graphicItemHashMap}))),
            Size = array:size(GraphicItemArray),
            lists:foreach(fun(Index) ->
                GraphicItemInterface = (get({get({This, graphicItemHashMap}), '$class'})):get(get({This, graphicItemHashMap}), array:get(Index, GraphicItemArray)),
                KeyCode = (get({KeyEvent, '$class'})):getKeyCode(KeyEvent),
                case (get({GraphicItemInterface, '$class'})):isActive(GraphicItemInterface) of
                    true ->
                    case (KeyCode =:= get({KeyEvent, 'VK_UP'})) of
                        true ->
                        (get({GraphicItemInterface, '$class'})):translate(GraphicItemInterface, 0, (-1));
                        false ->
                        case (KeyCode =:= get({KeyEvent, 'VK_DOWN'})) of
                        true ->
                        (get({GraphicItemInterface, '$class'})):translate(GraphicItemInterface, 0, 1);
                        false ->
                        case (KeyCode =:= get({KeyEvent, 'VK_LEFT'})) of
                        true ->
                        (get({GraphicItemInterface, '$class'})):translate(GraphicItemInterface, (-1), 0);
                        false ->
                        case (KeyCode =:= get({KeyEvent, 'VK_RIGHT'})) of
                        true ->
                        (get({GraphicItemInterface, '$class'})):translate(GraphicItemInterface, 1, 0);
                        false -> ok
                    end
                    end
                    end
                    end;
                    false -> ok
                end
            end, lists:seq(0, Size - 1))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({get({This, gameInputStrings}), 'KEY_PRESSED'}), E)
        end,
        case (((get({This, '$class'})):getSelectedTool(This) =/= undefined) andalso (fun(Target_N79916) -> (get({Target_N79916, '$class'})):isActive(Target_N79916) end)((get({This, '$class'})):getSelectedTool(This))) of
            true ->
            (fun(Target_N79966) -> (get({Target_N79966, '$class'})):setStatus(Target_N79966, "Key Pressed for Tool") end)('StatusFactory':getInstance()),
            GraphicItem = (get({This, '$class'})):getSelectedTool(This),
            (get({GraphicItem, '$class'})):keyPressed(GraphicItem, KeyEvent);
            false ->
            (get({This, '$class'})):setNewTool(This)
        end,
        put({get({This, grid}), isChanged}, true),
        (get({This, '$class'})):repaint(This).

keyReleased(This, KeyEvent) ->
        ok.

keyTyped(This, KeyEvent) ->
        ok.

delete(This, Evt) ->
        (fun(Target_N80319) -> (get({Target_N80319, '$class'})):remove(Target_N80319, (get({Evt, '$class'})):getTreeNode(Evt)) end)((get({This, '$class'})):getGraphicItemHashMap(This)),
        (get({get({This, workAreaJTreeJPanel}), '$class'})):updateTree(get({This, workAreaJTreeJPanel})),
        (get({get({This, workAreaJTreeJPanel}), '$class'})):expand(get({This, workAreaJTreeJPanel})),
        (get({get({This, workAreaJTreeJPanel}), '$class'})):repaint(get({This, workAreaJTreeJPanel})).

deselect(This, Evt) ->
        GraphicItemInterface = (fun(Target_N80486) -> (get({Target_N80486, '$class'})):get(Target_N80486, (get({Evt, '$class'})):getTreeNode(Evt)) end)((get({This, '$class'})):getGraphicItemHashMap(This)),
        case (GraphicItemInterface =/= undefined) of
            true ->
            (get({GraphicItemInterface, '$class'})):setColor(GraphicItemInterface, get({'Color', 'WHITE'})),
            (get({GraphicItemInterface, '$class'})):deactivate(GraphicItemInterface),
            (get({get({This, workAreaJTreeJPanel}), '$class'})):repaint(get({This, workAreaJTreeJPanel}));
            false -> ok
        end.

highlight(This, Evt) ->
        GraphicItemInterface = (fun(Target_N80721) -> (get({Target_N80721, '$class'})):get(Target_N80721, (get({Evt, '$class'})):getTreeNode(Evt)) end)((get({This, '$class'})):getGraphicItemHashMap(This)),
        case (GraphicItemInterface =/= undefined) of
            true ->
            (get({GraphicItemInterface, '$class'})):setColor(GraphicItemInterface, get({'Color', 'YELLOW'})),
            (get({GraphicItemInterface, '$class'})):activate(GraphicItemInterface),
            (get({get({This, workAreaJTreeJPanel}), '$class'})):repaint(get({This, workAreaJTreeJPanel}));
            false -> ok
        end.

% throws Exception
duplicate(This) ->
        NewCanvasJPanel = 'CanvasJPanel':new(get({This, workAreaJTreeJPanel}), (get({This, '$class'})):getSize(This), (fun(Target_N80984) -> (get({Target_N80984, '$class'})):getWidth(Target_N80984) end)((get({This, '$class'})):getCanvasDimension(This)), (fun(Target_N81003) -> (get({Target_N81003, '$class'})):getHeight(Target_N81003) end)((get({This, '$class'})):getCanvasDimension(This))),
        (get({NewCanvasJPanel, '$class'})):setGrid(NewCanvasJPanel, (fun(Target_N81060) -> (get({Target_N81060, '$class'})):getGrid(Target_N81060) end)((get({This, '$class'})):getGrid(This))),
        (get({NewCanvasJPanel, '$class'})):setAngle(NewCanvasJPanel, (get({This, '$class'})):getAngle(This)),
        (get({NewCanvasJPanel, '$class'})):duplicateGraphicItemHashMap(NewCanvasJPanel, (get({This, '$class'})):getGraphicItemHashMap(This)),
        (get({get({This, workAreaJTreeJPanel}), '$class'})):updateTree(get({This, workAreaJTreeJPanel})),
        (get({get({This, workAreaJTreeJPanel}), '$class'})):expand(get({This, workAreaJTreeJPanel})),
        (get({get({This, workAreaJTreeJPanel}), '$class'})):repaint(get({This, workAreaJTreeJPanel})),
        NewCanvasJPanel.

% throws Exception
duplicate(This, Event) ->
        TreeNode = (get({Event, '$class'})):getTreeNode(Event),
        GraphicItem = (fun(Target_N81329) -> (get({Target_N81329, '$class'})):get(Target_N81329, TreeNode) end)((get({This, '$class'})):getGraphicItemHashMap(This)),
        case (GraphicItem =/= undefined) of
            true ->
            (get({This, '$class'})):duplicateGraphicItem(This, GraphicItem),
            (get({get({This, workAreaJTreeJPanel}), '$class'})):updateTree(get({This, workAreaJTreeJPanel})),
            (get({get({This, workAreaJTreeJPanel}), '$class'})):expand(get({This, workAreaJTreeJPanel})),
            (get({get({This, workAreaJTreeJPanel}), '$class'})):repaint(get({This, workAreaJTreeJPanel}));
            false -> ok
        end.

rotate(This, Event) ->
        TreeNode = (get({Event, '$class'})):getTreeNode(Event),
        GraphicItem = (fun(Target_N81619) -> (get({Target_N81619, '$class'})):get(Target_N81619, TreeNode) end)((get({This, '$class'})):getGraphicItemHashMap(This)),
        case (GraphicItem =/= undefined) of
            true ->
            (get({GraphicItem, '$class'})):addAngle(GraphicItem, (get({Event, '$class'})):getAngle(Event));
            false -> ok
        end.

getCanvasDimension(This) ->
        get({This, canvasDimension}).

setCanvasDimension(This, CanvasDimension) ->
        put({This, canvasDimension}, CanvasDimension).

getGrid(This) ->
        get({This, grid}).

