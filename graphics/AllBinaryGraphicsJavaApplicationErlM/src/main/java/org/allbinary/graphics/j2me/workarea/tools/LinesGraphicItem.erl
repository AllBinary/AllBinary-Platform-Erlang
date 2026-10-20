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
% package org.allbinary.graphics.j2me.workarea.tools
% import java.awt
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.swing.tree.DefaultMutableTreeNode
% import javax.swing.tree.MutableTreeNode
% import org.allbinary.dom.DomHelper
% import org.allbinary.game.input.GameInputStrings
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.j2me.StatusFactory
% import org.allbinary.graphics.j2me.workarea.canvas.CanvasDom
% import org.allbinary.graphics.j2me.workarea.canvas.IntegerDimension
% import org.allbinary.graphics.pipeline.BasicGraphicsPipeline
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.math.PositionStrings
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('LinesGraphicItem').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements GraphicItemInterface

static_init() ->
    put({?MODULE, 'RECT'}, "rect"),
    put({?MODULE, 'ARC'}, "arc"),
    put({?MODULE, 'STRING'}, "string"),
    put({?MODULE, 'CHAR'}, "char"),
    put({?MODULE, 'IMAGE'}, "image"),
    put({?MODULE, item}, 0),
    put({?MODULE, 'NAME'}, "Line Tool"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, gameInputStrings}, 'GameInputStrings':getInstance()),
    put({This, treeNode}, undefined),
    put({This, pointTreeNodeVector}, undefined),
    put({This, currentMousePoint}, undefined),
    put({This, fulcrumPoint}, undefined),
    put({This, active}, false),
    put({This, theta}, 0.0),
    put({This, color}, 'Color':new((fun(Target_N66789) -> (get({Target_N66789, '$class'})):intValue(Target_N66789) end)(get({'BasicColorFactory':getInstance(), 'WHITE'})))),
    put({This, points}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        put({This, points}, 'Points':new()),
        try
            (get({This, '$class'})):init(This),
            put({This, active}, true)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}), E)
        end.

new(LinesNode) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, LinesNode),
    This.

'$init'(This, LinesNode) ->
    init_fields(This),
        put({This, points}, 'Points':new()),
        (get({This, '$class'})):init(This),
        put({This, active}, false),
        LineNodes = (fun(Target_N67173) -> (get({Target_N67173, '$class'})):getWithoutTextNodes(Target_N67173, (get({LinesNode, '$class'})):getChildNodes(LinesNode)) end)('DomHelper':getInstance()),
        NumberOfLines = (get({LineNodes, '$class'})):size(LineNodes),
        lists:foreach(fun(Index) ->
            LineNode = (get({LineNodes, '$class'})):get(LineNodes, Index),
            PointNodes = (fun(Target_N67356) -> (get({Target_N67356, '$class'})):getWithoutTextNodes(Target_N67356, (get({LineNode, '$class'})):getChildNodes(LineNode)) end)('DomHelper':getInstance()),
            PointOneNode = (fun(Target_N67426) -> (get({Target_N67426, '$class'})):searchNodeList(Target_N67426, get({'PointsDomUtil':getInstance(), 'POINTONE'}), PointNodes) end)('DomHelper':getInstance()),
            (get({This, '$class'})):addPoint(This, (get({PointOneNode, '$class'})):getChildNodes(PointOneNode)),
            case (Index =:= (NumberOfLines - 1)) of
                true ->
                PointTwoNode = (fun(Target_N67584) -> (get({Target_N67584, '$class'})):searchNodeList(Target_N67584, get({'PointsDomUtil':getInstance(), 'POINTTWO'}), PointNodes) end)('DomHelper':getInstance()),
                (get({This, '$class'})):addPoint(This, (get({PointTwoNode, '$class'})):getChildNodes(PointTwoNode));
                false -> ok
            end
        end, lists:seq(0, NumberOfLines - 1)),
        case (NumberOfLines =:= 0) of
            true ->
            erlang:error({'Exception', "Lines node does not contain a line"});
            false -> ok
        end.

% throws Exception
init(This) ->
        put({This, treeNode}, 'DefaultMutableTreeNode':new((get({'PointsDomUtil':getInstance(), 'LINES'}) + get({'LinesGraphicItem', item})))),
        put({'LinesGraphicItem', item}, get({'LinesGraphicItem', item}) + 1),
        (get({get({This, points}), '$class'})):init(get({This, points})),
        put({This, pointTreeNodeVector}, 'BasicArrayListD':new()),
        put({This, fulcrumPoint}, (fun(Target_N68044) -> (get({Target_N68044, '$class'})):createXY(Target_N68044, 0, 0) end)('PointFactory':getInstance())).

% throws Exception
translate(This, X, Y) when is_integer(X), is_integer(Y) ->
        (fun(Target_N68120) -> (get({Target_N68120, '$class'})):setStatus(Target_N68120, lists:concat(["Translating: ", (get({get({This, points}), '$class'})):getPoints(get({This, points}))])) end)('StatusFactory':getInstance()),
        BasicGraphicsPipeline = 'BasicGraphicsPipeline':new((get({get({This, points}), '$class'})):getPoints(get({This, points}))),
        (get({BasicGraphicsPipeline, '$class'})):translate(BasicGraphicsPipeline, X, Y),
        put({This, points}, 'Points':new()),
        (get({get({This, points}), '$class'})):addPoints(get({This, points}), (get({BasicGraphicsPipeline, '$class'})):getMatrix(BasicGraphicsPipeline)).

setRotate(This, Theta) when is_number(Theta) ->
        put({local, theta}, Theta),
        (fun Loop() -> case (get({local, theta}) > (2 * get({'Math', 'PI'}))) of true ->
            put({local, theta}, (get({local, theta}) - (2 * get({'Math', 'PI'})))),
            Loop();
        false -> ok end end)(),
        (fun Loop() -> case (get({local, theta}) < 0.0) of true ->
            put({local, theta}, (get({local, theta}) + (2 * get({'Math', 'PI'})))),
            Loop();
        false -> ok end end)(),
        put({This, theta}, get({local, theta})).

addRotate(This, Theta) when is_number(Theta) ->
        (get({This, '$class'})):setRotate(This, (get({This, theta}) + Theta)).

setAngle(This, Angle) when is_number(Angle) ->
        (get({This, '$class'})):setRotate(This, ((Angle) * math:pi() / 180)).

addAngle(This, Angle) when is_number(Angle) ->
        (get({This, '$class'})):setRotate(This, (get({This, theta}) + ((Angle) * math:pi() / 180))).

getTreeNode(This) ->
        get({This, treeNode}).

getName(This) ->
        get({'LinesGraphicItem', 'NAME'}).

getStaticName() ->
        get({'LinesGraphicItem', 'NAME'}).

% throws Exception
addPoint(This, PointNodes) ->
        List = (fun(Target_N69130) -> (get({Target_N69130, '$class'})):getWithoutTextNodes(Target_N69130, PointNodes) end)('DomHelper':getInstance()),
        XNode = (fun(Target_N69192) -> (get({Target_N69192, '$class'})):searchNodeList(Target_N69192, get({'PositionStrings':getInstance(), 'X'}), List) end)('DomHelper':getInstance()),
        XTextNode = (get({XNode, '$class'})):getFirstChild(XNode),
        XInteger = (get({XTextNode, '$class'})):getNodeValue(XTextNode),
        YNode = (fun(Target_N69379) -> (get({Target_N69379, '$class'})):searchNodeList(Target_N69379, get({'PositionStrings':getInstance(), 'Y'}), List) end)('DomHelper':getInstance()),
        YTextNode = (get({YNode, '$class'})):getFirstChild(YNode),
        YInteger = (get({YTextNode, '$class'})):getNodeValue(YTextNode),
        Point = (fun(Target_N69566) -> (get({Target_N69566, '$class'})):createXY(Target_N69566, (get({XInteger, '$class'})):intValue(XInteger), (get({YInteger, '$class'})):intValue(YInteger)) end)('PointFactory':getInstance()),
        (get({This, '$class'})):addPoint(This, Point);
addPoint(This, Point) ->
        (fun(Target_N69730) -> (get({Target_N69730, '$class'})):add(Target_N69730, Point) end)((get({get({This, points}), '$class'})):getPoints(get({This, points}))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({Point, '$class'})):toString(Point), This, "addPoint"),
        (get({get({This, pointTreeNodeVector}), '$class'})):add(get({This, pointTreeNodeVector}), 'DefaultMutableTreeNode':new((get({Point, '$class'})):toString(Point))),
        (get({get({This, treeNode}), '$class'})):add(get({This, treeNode}), (get({get({This, pointTreeNodeVector}), '$class'})):get(get({This, pointTreeNodeVector}), ((get({get({This, pointTreeNodeVector}), '$class'})):size(get({This, pointTreeNodeVector})) - 1))).


removePoint(This) ->
        put({local, point}, undefined),
        case ((get({get({This, points}), '$class'})):getSize(get({This, points})) > 0) of
            true ->
            LastPoint = ((get({get({This, points}), '$class'})):getSize(get({This, points})) - 1),
            put({local, point}, (fun(Target_N70147) -> (get({Target_N70147, '$class'})):removeAt(Target_N70147, LastPoint) end)((get({get({This, points}), '$class'})):getPoints(get({This, points})))),
            Index = ((get({get({This, pointTreeNodeVector}), '$class'})):size(get({This, pointTreeNodeVector})) - 1),
            case (Index > 0) of
                true ->
                (get({get({This, treeNode}), '$class'})):remove(get({This, treeNode}), (get({get({This, pointTreeNodeVector}), '$class'})):get(get({This, pointTreeNodeVector}), Index)),
                (get({get({This, pointTreeNodeVector}), '$class'})):remove(get({This, pointTreeNodeVector}), Index);
                false -> ok
            end;
            false -> ok
        end,
        get({local, point}).

isActive(This) ->
        get({This, active}).

deactivate(This) ->
        put({This, active}, false).

activate(This) ->
        put({This, active}, true).

% throws Exception
duplicatePoints(This, List) ->
        Size = (get({List, '$class'})):size(List),
        lists:foreach(fun(Index) ->
            Point = (get({List, '$class'})):get(List, Index),
            case (Point =/= undefined) of
                true ->
                (fun(Target_N70705) -> (get({Target_N70705, '$class'})):add(Target_N70705, (fun(Target_N70733) -> (get({Target_N70733, '$class'})):createXY(Target_N70733, (get({Point, '$class'})):getX(Point), (get({Point, '$class'})):getY(Point)) end)('PointFactory':getInstance())) end)((get({get({This, points}), '$class'})):getPoints(get({This, points}))),
                (get({get({This, pointTreeNodeVector}), '$class'})):add(get({This, pointTreeNodeVector}), 'DefaultMutableTreeNode':new((get({Point, '$class'})):toString(Point))),
                (get({get({This, treeNode}), '$class'})):add(get({This, treeNode}), (get({get({This, pointTreeNodeVector}), '$class'})):get(get({This, pointTreeNodeVector}), ((get({get({This, pointTreeNodeVector}), '$class'})):size(get({This, pointTreeNodeVector})) - 1)));
                false -> ok
            end
        end, lists:seq(0, Size - 1)).

% throws Exception
duplicate(This) ->
        LinesGraphicItem = 'LinesGraphicItem':new(),
        (get({LinesGraphicItem, '$class'})):duplicatePoints(LinesGraphicItem, (get({get({This, points}), '$class'})):getPoints(get({This, points}))),
        (get({LinesGraphicItem, '$class'})):deactivate(LinesGraphicItem),
        LinesGraphicItem.

getAngle(This) ->
        ((get({This, theta})) * 180 / math:pi()).

setFulcrumPoint(This, Point) ->
        put({This, fulcrumPoint}, Point).

paint(This, G, CanvasAngle, Dimension, X, Y) when is_integer(X), is_integer(Y) ->
        try
            Graphics = G,
            (get({Graphics, '$class'})):setColor(Graphics, (get({This, '$class'})):getColor(This)),
            (get({Graphics, '$class'})):setStroke(Graphics, 'BasicStroke':new(X)),
            case ((get({This, '$class'})):isActive(This) andalso (get({This, currentMousePoint}) =/= undefined)) of
                true ->
                (fun(Target_N71530) -> (get({Target_N71530, '$class'})):add(Target_N71530, get({This, currentMousePoint})) end)((get({get({This, points}), '$class'})):getPoints(get({This, points})));
                false -> ok
            end,
            TempPointVector = (fun(Target_N71586) -> (get({Target_N71586, '$class'})):doTransforms(Target_N71586, (get({get({This, points}), '$class'})):getPoints(get({This, points})), CanvasAngle, (fun(Target_N71638) -> (get({Target_N71638, '$class'})):createXY(Target_N71638, (get({Dimension, '$class'})):getWidth(Dimension), (get({Dimension, '$class'})):getHeight(Dimension)) end)('PointFactory':getInstance())) end)('PointsUtil':getInstance()),
            case ((get({This, '$class'})):isActive(This) andalso (get({This, currentMousePoint}) =/= undefined)) of
                true ->
                put({This, currentMousePoint}, (fun(Target_N71779) -> (get({Target_N71779, '$class'})):removeAt(Target_N71779, ((get({get({This, points}), '$class'})):getSize(get({This, points})) - 1)) end)((get({get({This, points}), '$class'})):getPoints(get({This, points}))));
                false -> ok
            end,
            Size = (get({TempPointVector, '$class'})):size(TempPointVector),
            put({local, firstPoint}, undefined),
            case (Size > 0) of
                true ->
                put({local, firstPoint}, (get({TempPointVector, '$class'})):get(TempPointVector, 0));
                false -> ok
            end,
            lists:foreach(fun(Index) ->
                SecondPoint = (get({TempPointVector, '$class'})):get(TempPointVector, Index),
                (get({Graphics, '$class'})):drawLine(Graphics, ((((get({get({local, firstPoint}), '$class'})):getX(get({local, firstPoint})) * X)) - ((X div 4))), ((((get({get({local, firstPoint}), '$class'})):getY(get({local, firstPoint})) * Y)) - ((Y div 4))), ((((get({SecondPoint, '$class'})):getX(SecondPoint) * X)) - ((X div 4))), ((((get({SecondPoint, '$class'})):getY(SecondPoint) * Y)) - ((Y div 4)))),
                put({local, firstPoint}, SecondPoint)
            end, lists:seq(1, Size - 1))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "mouseMoved", E)
        end.

% throws Exception
toDom(This, CanvasDom) ->
        (fun(Target_N72626) -> (get({Target_N72626, '$class'})):toDom(Target_N72626, CanvasDom, (get({get({This, points}), '$class'})):getPoints(get({This, points}))) end)('PointsDomUtil':getInstance()).

isValid(This) ->
        (get({get({This, points}), '$class'})):isValid(get({This, points})).

getPointsInterface(This) ->
        get({This, points}).

setPointsInterface(This, Points) ->
        put({This, points}, Points).

getColor(This) ->
        get({This, color}).

setColor(This, Color) ->
        put({This, color}, Color).

mouseClicked(This, MouseEvent, X, Y) when is_integer(X), is_integer(Y) ->
        try
            MousePoint = (fun(Target_N73046) -> (get({Target_N73046, '$class'})):createXY(Target_N73046, get({(get({MouseEvent, '$class'})):getPoint(MouseEvent), x}), get({(get({MouseEvent, '$class'})):getPoint(MouseEvent), y})) end)('PointFactory':getInstance()),
            case ((((get({MouseEvent, '$class'})):getModifiers(MouseEvent) band get({MouseEvent, 'BUTTON1_MASK'}))) =:= get({MouseEvent, 'BUTTON1_MASK'})) of
                true ->
                Point = (fun(Target_N73341) -> (get({Target_N73341, '$class'})):createXY(Target_N73341, ((get({MousePoint, '$class'})):getX(MousePoint) / X), ((get({MousePoint, '$class'})):getY(MousePoint) / Y)) end)('PointFactory':getInstance()),
                (fun(Target_N73445) -> (get({Target_N73445, '$class'})):setStatus(Target_N73445, lists:concat(["Line Point Added: ", (get({Point, '$class'})):toString(Point)])) end)('StatusFactory':getInstance()),
                (get({This, '$class'})):addPoint(This, Point);
                false ->
                case ((((get({MouseEvent, '$class'})):getModifiers(MouseEvent) band get({MouseEvent, 'BUTTON3_MASK'}))) =:= get({MouseEvent, 'BUTTON3_MASK'})) of
                true ->
                (fun(Target_N73275) -> (get({Target_N73275, '$class'})):setStatus(Target_N73275, "Line Point Removed") end)('StatusFactory':getInstance()),
                (get({This, '$class'})):removePoint(This);
                false -> ok
            end
            end,
            put({This, currentMousePoint}, MousePoint)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "mouseMoved", E)
        end.

mouseEntered(This, MouseEvent) ->
        ok.

mouseExited(This, MouseEvent) ->
        ok.

mousePressed(This, MouseEvent, XPixelsPerCell, YPixelsPerCell) when is_integer(XPixelsPerCell), is_integer(YPixelsPerCell) ->
        ok.

mouseReleased(This, MouseEvent, XPixelsPerCell, YPixelsPerCell) when is_integer(XPixelsPerCell), is_integer(YPixelsPerCell) ->
        ok.

mouseDragged(This, MouseEvent, XPixelsPerCell, YPixelsPerCell) when is_integer(XPixelsPerCell), is_integer(YPixelsPerCell) ->
        ok.

mouseMoved(This, MouseEvent, X, Y) when is_integer(X), is_integer(Y) ->
        try
            MousePoint = (fun(Target_N74170) -> (get({Target_N74170, '$class'})):createXY(Target_N74170, get({(get({MouseEvent, '$class'})):getPoint(MouseEvent), x}), get({(get({MouseEvent, '$class'})):getPoint(MouseEvent), y})) end)('PointFactory':getInstance()),
            Point = (fun(Target_N74272) -> (get({Target_N74272, '$class'})):createXY(Target_N74272, ((get({MousePoint, '$class'})):getX(MousePoint) / X), ((get({MousePoint, '$class'})):getY(MousePoint) / Y)) end)('PointFactory':getInstance()),
            put({This, currentMousePoint}, Point)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "mouseMoved", E)
        end.

keyPressed(This, KeyEvent) ->
        try
            KeyCode = (get({KeyEvent, '$class'})):getKeyCode(KeyEvent),
            case (KeyCode =:= get({KeyEvent, 'VK_ESCAPE'})) of
                true ->
                (fun(Target_N74951) -> (get({Target_N74951, '$class'})):setStatus(Target_N74951, "Deactivated") end)('StatusFactory':getInstance()),
                (get({This, '$class'})):deactivate(This);
                false ->
                case (KeyCode =:= get({KeyEvent, 'VK_UP'})) of
                true ->
                (get({This, '$class'})):translate(This, 0, (-1));
                false ->
                case (KeyCode =:= get({KeyEvent, 'VK_DOWN'})) of
                true ->
                (get({This, '$class'})):translate(This, 0, 1);
                false ->
                case (KeyCode =:= get({KeyEvent, 'VK_LEFT'})) of
                true ->
                (get({This, '$class'})):translate(This, (-1), 0);
                false ->
                case (KeyCode =:= get({KeyEvent, 'VK_RIGHT'})) of
                true ->
                (get({This, '$class'})):translate(This, 1, 0);
                false -> ok
            end
            end
            end
            end
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, gameInputStrings}), 'KEY_PRESSED'}), E)
        end.

keyReleased(This, KeyEvent) ->
        ok.

keyTyped(This, KeyEvent) ->
        ok.

