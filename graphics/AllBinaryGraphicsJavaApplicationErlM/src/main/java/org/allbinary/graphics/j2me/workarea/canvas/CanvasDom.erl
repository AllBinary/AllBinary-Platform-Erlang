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
% import java.util.HashMap
% import org.allbinary.animation.vector.VectorCenterGenerator
% import org.allbinary.dom.DomHelper
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.GraphicsStrings
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.j2me.workarea.WorkAreaJPanel
% import org.allbinary.graphics.j2me.workarea.tools.GraphicItemFactory
% import org.allbinary.graphics.j2me.workarea.tools.GraphicItemInterface
% import org.allbinary.graphics.j2me.workarea.tools.LinesGraphicItem
% import org.allbinary.logic.StdUtil
% import org.allbinary.util.BasicArrayList
% import org.w3c.dom.Node

-module('CanvasDom').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'FRAME'}, "frame"),
    put({?MODULE, 'ROTATE'}, "rotate"),
    put({?MODULE, 'SIZE'}, "size"),
    put({?MODULE, 'X'}, "X"),
    put({?MODULE, 'Y'}, "Y"),
    put({?MODULE, 'ZOOM'}, "zoom"),
    put({?MODULE, 'GRID'}, "grid"),
    put({?MODULE, 'ENABLED'}, "enabled"),
    put({?MODULE, 'POSSIBLE'}, "possible"),
    put({?MODULE, 'GRAPHICITEMS'}, "graphicItems"),
    put({?MODULE, 'REAL_SIZE'}, "realSize"),
    ok.

init_fields(This) ->
    put({This, graphicsStrings}, 'GraphicsStrings':getInstance()),
    put({This, graphicItemHashMap}, undefined),
    put({This, angle}, 0.0),
    put({This, dimension}, undefined),
    put({This, grid}, undefined),
    ok.


new(CanvasNode) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CanvasNode),
    This;
new(CanvasJPanel) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CanvasJPanel),
    This.

'$init'(This, CanvasNode) ->
    init_fields(This),
        put({This, grid}, 'Grid':new()),
        put({get({This, grid}), grid}, (fun(Target_N66683) -> (get({Target_N66683, '$class'})):createXY(Target_N66683, 0, 0) end)('PointFactory':getInstance())),
        put({This, dimension}, 'IntegerDimension':new(0, 0)),
        Name = (get({CanvasNode, '$class'})):getNodeName(CanvasNode),
        case ((get({Name, '$class'})):compareTo(Name, get({'CanvasDom', 'FRAME'})) =:= 0) of
            true ->
            put({This, graphicItemHashMap}, (fun(Target_N66919) -> (get({Target_N66919, '$class'})):createHashMap(Target_N66919) end)('StdUtil':getInstance())),
            AngleNode = (fun(Target_N66956) -> (get({Target_N66956, '$class'})):searchNodeList(Target_N66956, get({?MODULE, 'ROTATE'}), (get({CanvasNode, '$class'})):getChildNodes(CanvasNode)) end)('DomHelper':getInstance()),
            AngleTextNode = (get({AngleNode, '$class'})):getFirstChild(AngleNode),
            Angle = (fun(Target_N67080) -> (get({Target_N67080, '$class'})):doubleValue(Target_N67080) end)((get({AngleTextNode, '$class'})):getNodeValue(AngleTextNode)),
            (get({This, '$class'})):setAngle(This, Angle),
            SizeNode = (fun(Target_N67168) -> (get({Target_N67168, '$class'})):searchNodeList(Target_N67168, get({?MODULE, 'SIZE'}), (get({CanvasNode, '$class'})):getChildNodes(CanvasNode)) end)('DomHelper':getInstance()),
            XNode = (fun(Target_N67249) -> (get({Target_N67249, '$class'})):searchNodeList(Target_N67249, get({?MODULE, 'X'}), (get({SizeNode, '$class'})):getChildNodes(SizeNode)) end)('DomHelper':getInstance()),
            XTextNode = (get({XNode, '$class'})):getFirstChild(XNode),
            X = (fun(Target_N67373) -> (get({Target_N67373, '$class'})):intValue(Target_N67373) end)((get({XTextNode, '$class'})):getNodeValue(XTextNode)),
            YNode = (fun(Target_N67435) -> (get({Target_N67435, '$class'})):searchNodeList(Target_N67435, get({?MODULE, 'Y'}), (get({SizeNode, '$class'})):getChildNodes(SizeNode)) end)('DomHelper':getInstance()),
            YTextNode = (get({YNode, '$class'})):getFirstChild(YNode),
            Y = (fun(Target_N67559) -> (get({Target_N67559, '$class'})):intValue(Target_N67559) end)((get({YTextNode, '$class'})):getNodeValue(YTextNode)),
            (get({This, '$class'})):setWorkArea(This, X, Y),
            ZoomNode = (fun(Target_N67655) -> (get({Target_N67655, '$class'})):searchNodeList(Target_N67655, get({?MODULE, 'ZOOM'}), (get({CanvasNode, '$class'})):getChildNodes(CanvasNode)) end)('DomHelper':getInstance()),
            ZoomTextNode = (get({ZoomNode, '$class'})):getFirstChild(ZoomNode),
            (get({get({This, grid}), '$class'})):setZoom(get({This, grid}), (fun(Target_N67791) -> (get({Target_N67791, '$class'})):intValue(Target_N67791) end)((get({ZoomTextNode, '$class'})):getNodeValue(ZoomTextNode))),
            GridNode = (fun(Target_N67844) -> (get({Target_N67844, '$class'})):searchNodeList(Target_N67844, get({?MODULE, 'GRID'}), (get({CanvasNode, '$class'})):getChildNodes(CanvasNode)) end)('DomHelper':getInstance()),
            GridSizeNode = (fun(Target_N67925) -> (get({Target_N67925, '$class'})):searchNodeList(Target_N67925, get({?MODULE, 'SIZE'}), (get({GridNode, '$class'})):getChildNodes(GridNode)) end)('DomHelper':getInstance()),
            GridXNode = (fun(Target_N68006) -> (get({Target_N68006, '$class'})):searchNodeList(Target_N68006, get({?MODULE, 'X'}), (get({GridSizeNode, '$class'})):getChildNodes(GridSizeNode)) end)('DomHelper':getInstance()),
            GridXTextNode = (get({GridXNode, '$class'})):getFirstChild(GridXNode),
            GridX = (fun(Target_N68130) -> (get({Target_N68130, '$class'})):intValue(Target_N68130) end)((get({GridXTextNode, '$class'})):getNodeValue(GridXTextNode)),
            GridYNode = (fun(Target_N68192) -> (get({Target_N68192, '$class'})):searchNodeList(Target_N68192, get({?MODULE, 'Y'}), (get({GridSizeNode, '$class'})):getChildNodes(GridSizeNode)) end)('DomHelper':getInstance()),
            GridYTextNode = (get({GridYNode, '$class'})):getFirstChild(GridYNode),
            GridY = (fun(Target_N68316) -> (get({Target_N68316, '$class'})):intValue(Target_N68316) end)((get({GridYTextNode, '$class'})):getNodeValue(GridYTextNode)),
            (get({This, '$class'})):setGrid(This, GridX, GridY),
            EnableNode = (fun(Target_N68412) -> (get({Target_N68412, '$class'})):searchNodeList(Target_N68412, get({?MODULE, 'ENABLED'}), (get({GridNode, '$class'})):getChildNodes(GridNode)) end)('DomHelper':getInstance()),
            EnableTextNode = (get({EnableNode, '$class'})):getFirstChild(EnableNode),
            (get({get({This, grid}), '$class'})):showGrid(get({This, grid}), (fun(Target_N68548) -> (get({Target_N68548, '$class'})):booleanValue(Target_N68548) end)((get({EnableTextNode, '$class'})):getNodeValue(EnableTextNode))),
            PossibleNode = (fun(Target_N68601) -> (get({Target_N68601, '$class'})):searchNodeList(Target_N68601, get({?MODULE, 'POSSIBLE'}), (get({GridNode, '$class'})):getChildNodes(GridNode)) end)('DomHelper':getInstance()),
            PossibleTextNode = (get({PossibleNode, '$class'})):getFirstChild(PossibleNode),
            put({get({This, grid}), isGridPossible}, (fun(Target_N68740) -> (get({Target_N68740, '$class'})):booleanValue(Target_N68740) end)((get({PossibleTextNode, '$class'})):getNodeValue(PossibleTextNode))),
            GraphicItemNodeList = (fun(Target_N68792) -> (get({Target_N68792, '$class'})):getChildrenWithoutTextNodes(Target_N68792, get({?MODULE, 'GRAPHICITEMS'}), (get({CanvasNode, '$class'})):getChildNodes(CanvasNode)) end)('DomHelper':getInstance()),
            case (GraphicItemNodeList =/= undefined) of
                true ->
                put({This, graphicItemHashMap}, (fun(Target_N68904) -> (get({Target_N68904, '$class'})):getInstance(Target_N68904, GraphicItemNodeList) end)('GraphicItemFactory':getInstance()));
                false -> ok
            end;
            false ->
            erlang:error({'Exception', lists:concat(["Frame Element Not Found but Found: ", Name])})
        end;
'$init'(This, CanvasJPanel) ->
    init_fields(This),
        put({This, angle}, (get({CanvasJPanel, '$class'})):getAngle(CanvasJPanel)),
        put({This, graphicItemHashMap}, (get({CanvasJPanel, '$class'})):getGraphicItemHashMap(CanvasJPanel)),
        put({This, dimension}, (get({CanvasJPanel, '$class'})):getCanvasDimension(CanvasJPanel)),
        put({This, grid}, 'Grid':new((get({CanvasJPanel, '$class'})):getGrid(CanvasJPanel))),
        put({This, angle}, (get({CanvasJPanel, '$class'})):getAngle(CanvasJPanel)).


getAngle(This) ->
        get({This, angle}).

getGraphicItemHashMap(This) ->
        get({This, graphicItemHashMap}).

setAngle(This, Angle) when is_number(Angle) ->
        put({This, angle}, Angle).

% throws Exception
setWorkArea(This, X, Y) when is_integer(X), is_integer(Y) ->
        (get({This, '$class'})):setDimension(This, 'IntegerDimension':new(X, Y)).

% throws Exception
setGrid(This, GridX, GridY) when is_integer(GridX), is_integer(GridY) ->
        put({get({This, grid}), grid}, (fun(Target_N69555) -> (get({Target_N69555, '$class'})):createXY(Target_N69555, GridX, GridY) end)('PointFactory':getInstance())).

getPointNode(This, Point, PointName) when (is_list(PointName) orelse PointName =:= undefined) ->
        Document = 'WorkAreaJPanel':getDocument(),
        PointNode = (get({Document, '$class'})):createElement(Document, PointName),
        XNode = (get({Document, '$class'})):createElement(Document, get({?MODULE, 'X'})),
        XTextNode = (get({Document, '$class'})):createTextNode(Document, allbinary_java:to_string((get({Point, '$class'})):getX(Point))),
        (get({XNode, '$class'})):appendChild(XNode, XTextNode),
        YNode = (get({Document, '$class'})):createElement(Document, get({?MODULE, 'Y'})),
        YTextNode = (get({Document, '$class'})):createTextNode(Document, allbinary_java:to_string((get({Point, '$class'})):getY(Point))),
        (get({YNode, '$class'})):appendChild(YNode, YTextNode),
        (get({PointNode, '$class'})):appendChild(PointNode, XNode),
        (get({PointNode, '$class'})):appendChild(PointNode, YNode),
        PointNode.

% throws Exception
toDom(This) ->
        Document = 'WorkAreaJPanel':getDocument(),
        FrameNode = (get({Document, '$class'})):createElement(Document, get({?MODULE, 'FRAME'})),
        AngleNode = (get({Document, '$class'})):createElement(Document, get({?MODULE, 'ROTATE'})),
        AngleTextNode = (get({Document, '$class'})):createTextNode(Document, (fun(Target_N70561) -> (get({Target_N70561, '$class'})):toString(Target_N70561) end)((get({This, '$class'})):getAngle(This))),
        (get({AngleNode, '$class'})):appendChild(AngleNode, AngleTextNode),
        SizeNode = (get({This, '$class'})):getPointNode(This, (fun(Target_N70679) -> (get({Target_N70679, '$class'})):createXY(Target_N70679, (fun(Target_N70704) -> (get({Target_N70704, '$class'})):getWidth(Target_N70704) end)((get({This, '$class'})):getDimension(This)), (fun(Target_N70723) -> (get({Target_N70723, '$class'})):getHeight(Target_N70723) end)((get({This, '$class'})):getDimension(This))) end)('PointFactory':getInstance()), get({?MODULE, 'SIZE'})),
        ZoomNode = (get({Document, '$class'})):createElement(Document, get({?MODULE, 'ZOOM'})),
        ZoomTextNode = (get({Document, '$class'})):createTextNode(Document, (fun(Target_N70882) -> (get({Target_N70882, '$class'})):toString(Target_N70882) end)((fun(Target_N70902) -> (get({Target_N70902, '$class'})):getZoom(Target_N70902) end)((get({This, '$class'})):getGrid(This)))),
        (get({ZoomNode, '$class'})):appendChild(ZoomNode, ZoomTextNode),
        GridNode = (get({Document, '$class'})):createElement(Document, get({?MODULE, 'GRID'})),
        GridSizeNode = (get({This, '$class'})):getPointNode(This, get({(get({This, '$class'})):getGrid(This), grid}), get({?MODULE, 'SIZE'})),
        (get({GridNode, '$class'})):appendChild(GridNode, GridSizeNode),
        EnableNode = (get({Document, '$class'})):createElement(Document, get({?MODULE, 'ENABLED'})),
        EnableTextNode = (get({Document, '$class'})):createTextNode(Document, (fun(Target_N71265) -> (get({Target_N71265, '$class'})):toString(Target_N71265) end)((fun(Target_N71285) -> (get({Target_N71285, '$class'})):isGridOn(Target_N71285) end)((get({This, '$class'})):getGrid(This)))),
        (get({EnableNode, '$class'})):appendChild(EnableNode, EnableTextNode),
        (get({GridNode, '$class'})):appendChild(GridNode, EnableNode),
        PossibleNode = (get({Document, '$class'})):createElement(Document, get({?MODULE, 'POSSIBLE'})),
        PossibleTextNode = (get({Document, '$class'})):createTextNode(Document, (fun(Target_N71496) -> (get({Target_N71496, '$class'})):toString(Target_N71496) end)((fun(Target_N71516) -> (get({Target_N71516, '$class'})):isGridPossible(Target_N71516) end)((get({This, '$class'})):getGrid(This)))),
        (get({PossibleNode, '$class'})):appendChild(PossibleNode, PossibleTextNode),
        (get({GridNode, '$class'})):appendChild(GridNode, PossibleNode),
        RealSizeNode = (get({Document, '$class'})):createElement(Document, get({'CanvasDom', 'REAL_SIZE'})),
        VectorCenterGenerator = 'VectorCenterGenerator':new(),
        (get({VectorCenterGenerator, '$class'})):calculate(VectorCenterGenerator, (get({This, '$class'})):getGraphicItemHashMap(This)),
        WidthNode = (get({Document, '$class'})):createElement(Document, get({get({This, graphicsStrings}), 'WIDTH'})),
        WidthTextNode = (get({Document, '$class'})):createTextNode(Document, allbinary_java:to_string((get({VectorCenterGenerator, '$class'})):getWidth(VectorCenterGenerator))),
        (get({WidthNode, '$class'})):appendChild(WidthNode, WidthTextNode),
        (get({RealSizeNode, '$class'})):appendChild(RealSizeNode, WidthNode),
        HeightNode = (get({Document, '$class'})):createElement(Document, get({get({This, graphicsStrings}), 'HEIGHT'})),
        HeightTextNode = (get({Document, '$class'})):createTextNode(Document, allbinary_java:to_string((get({VectorCenterGenerator, '$class'})):getHeight(VectorCenterGenerator))),
        (get({HeightNode, '$class'})):appendChild(HeightNode, HeightTextNode),
        (get({RealSizeNode, '$class'})):appendChild(RealSizeNode, HeightNode),
        (get({FrameNode, '$class'})):appendChild(FrameNode, AngleNode),
        (get({FrameNode, '$class'})):appendChild(FrameNode, SizeNode),
        (get({FrameNode, '$class'})):appendChild(FrameNode, ZoomNode),
        (get({FrameNode, '$class'})):appendChild(FrameNode, GridNode),
        (get({FrameNode, '$class'})):appendChild(FrameNode, RealSizeNode),
        GraphicItemNode = (get({Document, '$class'})):createElement(Document, get({?MODULE, 'GRAPHICITEMS'})),
        GraphicItemArray = (fun(Target_N72472) -> (get({Target_N72472, '$class'})):toArray(Target_N72472) end)((fun(Target_N72479) -> (get({Target_N72479, '$class'})):keySet(Target_N72479) end)((get({This, '$class'})):getGraphicItemHashMap(This))),
        Size = array:size(GraphicItemArray),
        lists:foreach(fun(Index) ->
            Item = (get({get({This, graphicItemHashMap}), '$class'})):get(get({This, graphicItemHashMap}), array:get(Index, GraphicItemArray)),
            case ((get({Item, '$class'})):getName(Item) =:= 'LinesGraphicItem':getStaticName()) of
                true ->
                case (get({Item, '$class'})):isValid(Item) of
                    true ->
                    (get({GraphicItemNode, '$class'})):appendChild(GraphicItemNode, (get({Item, '$class'})):toDom(Item, This));
                    false -> ok
                end;
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        (get({FrameNode, '$class'})):appendChild(FrameNode, GraphicItemNode),
        FrameNode.

getDimension(This) ->
        get({This, dimension}).

setDimension(This, Dimension) ->
        put({This, dimension}, Dimension).

getGrid(This) ->
        get({This, grid}).

