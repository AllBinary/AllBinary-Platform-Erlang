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
% import java.util.HashMap
% import javax.swing.tree.MutableTreeNode
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.j2me.workarea.canvas.CanvasDom
% import org.allbinary.graphics.j2me.workarea.canvas.CanvasJPanel
% import org.allbinary.graphics.j2me.workarea.canvas.IntegerDimension
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.math.RectangleCollisionPointUtil
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Node

-module('SelectionTool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements GraphicItemInterface

static_init() ->
    put({?MODULE, 'NAME'}, "Selection Tool"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, canvasJPanel}, undefined),
    put({This, active}, true),
    put({This, controlIdDown}, false),
    put({This, rectColor}, 'Color':new((fun(Target_N67744) -> (get({Target_N67744, '$class'})):intValue(Target_N67744) end)(get({'BasicColorFactory':getInstance(), 'RED'})))),
    put({This, startPoint}, get({'PointFactory':getInstance(), 'ZERO_ZERO'})),
    put({This, endPoint}, get({This, startPoint})),
    ok.


new(CanvasJPanel) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CanvasJPanel),
    This.

init(This, CanvasJPanel) ->
    init_fields(This),
        put({This, canvasJPanel}, CanvasJPanel).

setColor(This, Color) ->
        ok.

getTreeNode(This) ->
        undefined.

getPointsInterface(This) ->
        undefined.

setPointsInterface(This, Points) ->
        ok.

isValid(This) ->
        true.

isActive(This) ->
        get({This, active}).

deactivate(This) ->
        ok.

activate(This) ->
        ok.

setFulcrumPoint(This, Point) ->
        ok.

% throws Exception
translate(This, X, Y) when is_integer(X), is_integer(Y) ->
        ok.

setRotate(This, Theta) when is_number(Theta) ->
        ok.

addRotate(This, Theta) when is_number(Theta) ->
        ok.

setAngle(This, Angle) when is_number(Angle) ->
        ok.

addAngle(This, Angle) when is_number(Angle) ->
        ok.

getAngle(This) ->
        0.0.

makeSelection(This) ->
        XRect = (get({This, '$class'})):getXRect(This),
        XRect2 = (erlang:abs(((get({get({This, endPoint}), '$class'})):getX(get({This, endPoint})) - (get({get({This, startPoint}), '$class'})):getX(get({This, startPoint})))) + XRect),
        YRect = (get({This, '$class'})):getYRect(This),
        YRect2 = (erlang:abs(((get({get({This, endPoint}), '$class'})):getY(get({This, endPoint})) - (get({get({This, startPoint}), '$class'})):getY(get({This, startPoint})))) + YRect),
        HashMap = (get({get({This, canvasJPanel}), '$class'})):getGraphicItemHashMap(get({This, canvasJPanel})),
        GraphicItemArray = (fun(Target_N67135) -> (get({Target_N67135, '$class'})):toArray(Target_N67135) end)((get({HashMap, '$class'})):keySet(HashMap)),
        Size = array:size(GraphicItemArray),
        lists:foreach(fun(Index) ->
            Item = (get({HashMap, '$class'})):get(HashMap, array:get(Index, GraphicItemArray)),
            case ((get({Item, '$class'})):getName(Item) =:= 'LinesGraphicItem':getStaticName()) of
                true ->
                case 'RectangleCollisionPointUtil':allPointsInsideCell(XRect, YRect, XRect2, YRect2, (fun(Target_N67409) -> (get({Target_N67409, '$class'})):getPoints(Target_N67409) end)((get({Item, '$class'})):getPointsInterface(Item)), (get({get({This, canvasJPanel}), '$class'})):getXPixelsPerWorkAreaPixel(get({This, canvasJPanel})), (get({get({This, canvasJPanel}), '$class'})):getYPixelsPerWorkAreaPixel(get({This, canvasJPanel}))) of
                    true ->
                    (get({Item, '$class'})):setColor(Item, get({'Color', 'YELLOW'})),
                    (get({Item, '$class'})):activate(Item);
                    false ->
                    case (not get({This, controlIdDown})) of
                    true ->
                    (get({Item, '$class'})):setColor(Item, get({'Color', 'WHITE'})),
                    (get({Item, '$class'})):deactivate(Item);
                    false -> ok
                end
                end;
                false -> ok
            end
        end, lists:seq(0, Size - 1)).

getXRect(This) ->
        XDiff = ((get({get({This, endPoint}), '$class'})):getX(get({This, endPoint})) - (get({get({This, startPoint}), '$class'})):getX(get({This, startPoint}))),
        put({local, xRect}, (get({get({This, startPoint}), '$class'})):getX(get({This, startPoint}))),
        case (XDiff < 0) of
            true ->
            put({local, xRect}, (get({get({This, endPoint}), '$class'})):getX(get({This, endPoint})));
            false -> ok
        end,
        get({local, xRect}).

getYRect(This) ->
        YDiff = ((get({get({This, endPoint}), '$class'})):getY(get({This, endPoint})) - (get({get({This, startPoint}), '$class'})):getY(get({This, startPoint}))),
        put({local, yRect}, (get({get({This, startPoint}), '$class'})):getY(get({This, startPoint}))),
        case (YDiff < 0) of
            true ->
            put({local, yRect}, (get({get({This, endPoint}), '$class'})):getY(get({This, endPoint})));
            false -> ok
        end,
        get({local, yRect}).

paint(This, G, CanvasAngle, Dimension, X, Y) when is_integer(X), is_integer(Y) ->
        (get({G, '$class'})):setColor(G, get({This, rectColor})),
        XRect = (get({This, '$class'})):getXRect(This),
        Width = erlang:abs(((get({get({This, endPoint}), '$class'})):getX(get({This, endPoint})) - (get({get({This, startPoint}), '$class'})):getX(get({This, startPoint})))),
        YRect = (get({This, '$class'})):getYRect(This),
        Height = erlang:abs(((get({get({This, endPoint}), '$class'})):getY(get({This, endPoint})) - (get({get({This, startPoint}), '$class'})):getY(get({This, startPoint})))),
        (get({G, '$class'})):drawRect(G, XRect, YRect, Width, Height).

% throws Exception
toDom(This, CanvasDom) ->
        undefined.

removePoint(This) ->
        undefined.

addPoint(This, Point) ->
        ok.

getName(This) ->
        get({'SelectionTool', 'NAME'}).

getStaticName() ->
        get({'SelectionTool', 'NAME'}).

mouseClicked(This, MouseEvent, XPixelsPerCell, YPixelsPerCell) when is_integer(XPixelsPerCell), is_integer(YPixelsPerCell) ->
        ok.

mouseMoved(This, MouseEvent, XPixelsPerCell, YPixelsPerCell) when is_integer(XPixelsPerCell), is_integer(YPixelsPerCell) ->
        ok.

mouseEntered(This, MouseEvent) ->
        ok.

mouseExited(This, MouseEvent) ->
        ok.

mousePressed(This, MouseEvent, XPixelsPerCell, YPixelsPerCell) when is_integer(XPixelsPerCell), is_integer(YPixelsPerCell) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({'MouseStrings':getInstance(), 'MOUSE_PRESSED'})),
        put({This, startPoint}, (fun(Target_N69450) -> (get({Target_N69450, '$class'})):createXY(Target_N69450, (get({MouseEvent, '$class'})):getX(MouseEvent), (get({MouseEvent, '$class'})):getY(MouseEvent)) end)('PointFactory':getInstance())),
        put({This, endPoint}, get({This, startPoint})).

mouseReleased(This, MouseEvent, XPixelsPerCell, YPixelsPerCell) when is_integer(XPixelsPerCell), is_integer(YPixelsPerCell) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({'MouseStrings':getInstance(), 'MOUSE_RELEASED'})),
        put({This, endPoint}, (fun(Target_N69727) -> (get({Target_N69727, '$class'})):createXY(Target_N69727, (get({MouseEvent, '$class'})):getX(MouseEvent), (get({MouseEvent, '$class'})):getY(MouseEvent)) end)('PointFactory':getInstance())),
        put({This, active}, false),
        (get({This, '$class'})):makeSelection(This).

mouseDragged(This, MouseEvent, XPixelsPerCell, YPixelsPerCell) when is_integer(XPixelsPerCell), is_integer(YPixelsPerCell) ->
        put({This, endPoint}, (fun(Target_N69940) -> (get({Target_N69940, '$class'})):createXY(Target_N69940, (get({MouseEvent, '$class'})):getX(MouseEvent), (get({MouseEvent, '$class'})):getY(MouseEvent)) end)('PointFactory':getInstance())).

keyPressed(This, KeyEvent) ->
        case ((get({KeyEvent, '$class'})):getKeyCode(KeyEvent) =:= get({KeyEvent, 'VK_CONTROL'})) of
            true ->
            put({This, controlIdDown}, true);
            false -> ok
        end.

keyReleased(This, KeyEvent) ->
        case ((get({KeyEvent, '$class'})):getKeyCode(KeyEvent) =:= get({KeyEvent, 'VK_CONTROL'})) of
            true ->
            put({This, controlIdDown}, false);
            false -> ok
        end.

keyTyped(This, KeyEvent) ->
        ok.

% throws Exception
duplicate(This) ->
        undefined.

