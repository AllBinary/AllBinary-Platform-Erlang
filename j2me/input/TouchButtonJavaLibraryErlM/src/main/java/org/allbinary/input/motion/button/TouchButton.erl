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
% import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory
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
    put({This, hintAnimationInterface}, undefined),
    put({This, rawRectangle}, undefined),
    put({This, xBorder}, 0),
    put({This, yBorder}, 0),
    put({This, rectangleP}, get({'RectangleFactory', 'SINGLETON'})),
    put({This, cellPositionP}, undefined),
    put({This, animationX}, 0),
    put({This, animationY}, 0),
    put({This, hintAnimationY}, 0),
    ok.


% throws Exception
createButton(TouchButtonInput, TouchButtonResource, RawRectangle, CellPosition, XBorder, YBorder) when is_integer(XBorder), is_integer(YBorder) ->
        'TouchButton':new(TouchButtonInput, (fun(Target_N65981) -> (get({Target_N65981, '$class'})):getInstance(Target_N65981, 0) end)((fun(Target_N65988) -> (get({Target_N65988, '$class'})):get(Target_N65988, get({TouchButtonResource, 'RESOURCE'})) end)('FeaturedAnimationInterfaceFactoryInterfaceFactory':getInstance())), (fun(Target_N66039) -> (get({Target_N66039, '$class'})):getInstance(Target_N66039, 0) end)((fun(Target_N66046) -> (get({Target_N66046, '$class'})):get(Target_N66046, get({TouchButtonResource, 'HINT'})) end)('FeaturedAnimationInterfaceFactoryInterfaceFactory':getInstance())), RawRectangle, CellPosition, XBorder, YBorder).

new(TouchButtonInput, AnimationInterface, HintAnimationInterface, RawRectangle, CellPosition, XBorder, YBorder) when is_integer(XBorder), is_integer(YBorder) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TouchButtonInput, AnimationInterface, HintAnimationInterface, RawRectangle, CellPosition, XBorder, YBorder),
    This.

init(This, TouchButtonInput, AnimationInterface, HintAnimationInterface, RawRectangle, CellPosition, XBorder, YBorder) when is_integer(XBorder), is_integer(YBorder) ->
    'Paintable':init(This),
    init_fields(This),
        put({This, touchButtonInput}, TouchButtonInput),
        put({This, animationInterface}, AnimationInterface),
        put({This, hintAnimationInterface}, HintAnimationInterface),
        put({This, rawRectangle}, RawRectangle),
        put({This, cellPositionP}, CellPosition),
        put({This, xBorder}, XBorder),
        put({This, yBorder}, YBorder),
        (get({This, '$class'})):updateRectangle(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67004) -> (get({Target_N67004, '$class'})):toString(Target_N67004) end)((fun(Target_N67011) -> (get({Target_N67011, '$class'})):append(Target_N67011, (get({This, '$class'})):toString(This)) end)((fun(Target_N67018) -> (get({Target_N67018, '$class'})):append(Target_N67018, "Created: ") end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})).

paintHint(This, Graphics) ->
        (get({get({This, hintAnimationInterface}), '$class'})):paintXY(get({This, hintAnimationInterface}), Graphics, get({This, animationX}), get({This, hintAnimationY})).

paint(This, Graphics) ->
        (get({get({This, animationInterface}), '$class'})):paintXY(get({This, animationInterface}), Graphics, get({This, animationX}), get({This, animationY})).

updateRectangle(This) ->
        try
            PointFactory = 'PointFactory':getInstance(),
            X = ((get({get({This, rawRectangle}), '$class'})):getWidth(get({This, rawRectangle})) * (get({get({This, cellPositionP}), '$class'})):getColumn(get({This, cellPositionP}))),
            Y = ((get({get({This, rawRectangle}), '$class'})):getHeight(get({This, rawRectangle})) * (get({get({This, cellPositionP}), '$class'})):getRow(get({This, cellPositionP}))),
            put({This, rectangleP}, 'Rectangle':new((get({PointFactory, '$class'})):createXY(PointFactory, (X + get({This, xBorder})), (Y + get({This, yBorder}))), (get({get({This, rawRectangle}), '$class'})):getWidth(get({This, rawRectangle})), (get({get({This, rawRectangle}), '$class'})):getHeight(get({This, rawRectangle})))),
            Point = (get({get({This, rectangleP}), '$class'})):getPoint(get({This, rectangleP})),
            put({This, animationX}, (get({Point, '$class'})):getX(Point)),
            put({This, animationY}, (get({Point, '$class'})):getY(Point)),
            put({This, hintAnimationY}, (get({This, animationY}) - 32))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "updateRectangle", E)
        end.

getCellPosition(This) ->
        get({This, cellPositionP}).

getRectangle(This) ->
        get({This, rectangleP}).

getTouchButtonInput(This) ->
        get({This, touchButtonInput}).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        StringUtil = 'StringUtil':getInstance(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "TouchButton: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, (get({This, '$class'})):getRectangle(This))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " CellPosition: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, get({This, cellPositionP}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " xBorder: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, xBorder})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " yBorder: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, yBorder})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

