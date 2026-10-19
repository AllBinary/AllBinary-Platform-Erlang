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
% package org.allbinary.input.motion.button
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.Animation
% import org.allbinary.animation.AnimationInterface
% import org.allbinary.graphics.CellPosition
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.RectangleFactory
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings

-module('TouchButton').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Paintable', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, touchButtonInput}, undefined),
    put({This, animationInterface}, undefined),
    put({This, rawRectangle}, undefined),
    put({This, xBorder}, 0),
    put({This, yBorder}, 0),
    put({This, rectangle}, get({'RectangleFactory', 'SINGLETON'})),
    put({This, cellPosition}, undefined),
    put({This, animationX}, 0),
    put({This, animationY}, 0),
    ok.


new(TouchButtonInput, AnimationInterface, RawRectangle, CellPosition, XBorder, YBorder) when is_integer(XBorder), is_integer(YBorder) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TouchButtonInput, AnimationInterface, RawRectangle, CellPosition, XBorder, YBorder),
    This.

init(This, TouchButtonInput, AnimationInterface, RawRectangle, CellPosition, XBorder, YBorder) when is_integer(XBorder), is_integer(YBorder) ->
    'Paintable':init(This),
    init_fields(This),
        put({This, touchButtonInput}, TouchButtonInput),
        put({This, animationInterface}, AnimationInterface),
        put({This, rawRectangle}, RawRectangle),
        put({This, cellPosition}, CellPosition),
        put({This, xBorder}, XBorder),
        put({This, yBorder}, YBorder),
        (get({This, '$class'})):updateRectangle(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66569) -> (get({Target_N66569, '$class'})):toString(Target_N66569) end)((fun(Target_N66576) -> (get({Target_N66576, '$class'})):append(Target_N66576, (get({This, '$class'})):toString(This)) end)((fun(Target_N66583) -> (get({Target_N66583, '$class'})):append(Target_N66583, "Created: ") end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})).

paint(This, Graphics) ->
        (get({get({This, animationInterface}), '$class'})):paintXY(get({This, animationInterface}), Graphics, get({This, animationX}), get({This, animationY})).

updateRectangle(This) ->
        try
            X = ((get({get({This, rawRectangle}), '$class'})):getWidth(get({This, rawRectangle})) * (get({get({This, cellPosition}), '$class'})):getColumn(get({This, cellPosition}))),
            Y = ((get({get({This, rawRectangle}), '$class'})):getHeight(get({This, rawRectangle})) * (get({get({This, cellPosition}), '$class'})):getRow(get({This, cellPosition}))),
            PointFactory = 'PointFactory':getInstance(),
            put({This, rectangle}, 'Rectangle':new((get({PointFactory, '$class'})):createXY(PointFactory, (X + get({This, xBorder})), (Y + get({This, yBorder}))), (get({get({This, rawRectangle}), '$class'})):getWidth(get({This, rawRectangle})), (get({get({This, rawRectangle}), '$class'})):getHeight(get({This, rawRectangle})))),
            Point = (get({get({This, rectangle}), '$class'})):getPoint(get({This, rectangle})),
            put({This, animationX}, (get({Point, '$class'})):getX(Point)),
            put({This, animationY}, (get({Point, '$class'})):getY(Point))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "updateRectangle", E)
        end.

getCellPositionP(This) ->
        get({This, cellPosition}).

getRectangleP(This) ->
        get({This, rectangle}).

getTouchButtonInput(This) ->
        get({This, touchButtonInput}).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        StringUtil = 'StringUtil':getInstance(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "TouchButton: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, get({This, rectangle}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " CellPosition: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, get({This, cellPosition}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " xBorder: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, xBorder})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " yBorder: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, yBorder})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

