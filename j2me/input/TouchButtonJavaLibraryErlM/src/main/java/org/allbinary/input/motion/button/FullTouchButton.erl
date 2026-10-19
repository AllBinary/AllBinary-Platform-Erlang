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
% import org.allbinary.animation.Animation
% import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory
% import org.allbinary.graphics.CellPosition
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.Rectangle

-module('FullTouchButton').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TouchButton', Function, Arguments).

init_fields(This) ->
    ok.


% throws Exception
createButton(TouchButtonInput, TouchButtonResource, RawRectangle, CellPosition, XBorder, YBorder) when is_integer(XBorder), is_integer(YBorder) ->
        'FullTouchButton':new(TouchButtonInput, (fun(Target_N65781) -> (get({Target_N65781, '$class'})):getInstance(Target_N65781, 0) end)((fun(Target_N65788) -> (get({Target_N65788, '$class'})):get(Target_N65788, get({TouchButtonResource, 'RESOURCE'})) end)('FeaturedAnimationInterfaceFactoryInterfaceFactory':getInstance())), (fun(Target_N65839) -> (get({Target_N65839, '$class'})):getInstance(Target_N65839, 0) end)((fun(Target_N65846) -> (get({Target_N65846, '$class'})):get(Target_N65846, get({TouchButtonResource, 'HINT'})) end)('FeaturedAnimationInterfaceFactoryInterfaceFactory':getInstance())), RawRectangle, CellPosition, XBorder, YBorder).

new(TouchButtonInput, AnimationInterface, HintAnimationInterface, RawRectangle, CellPosition, XBorder, YBorder) when is_integer(XBorder), is_integer(YBorder) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TouchButtonInput, AnimationInterface, HintAnimationInterface, RawRectangle, CellPosition, XBorder, YBorder),
    This.

init(This, TouchButtonInput, AnimationInterface, HintAnimationInterface, RawRectangle, CellPosition, XBorder, YBorder) when is_integer(XBorder), is_integer(YBorder) ->
        'TouchButton':init(This, TouchButtonInput, AnimationInterface, HintAnimationInterface, RawRectangle, CellPosition, XBorder, YBorder).

updateRectangle(This) ->
        try
            PointFactory = 'PointFactory':getInstance(),
            X = ((get({get({This, rawRectangle}), '$class'})):getWidth(get({This, rawRectangle})) * (get({get({This, cellPositionP}), '$class'})):getColumn(get({This, cellPositionP}))),
            Y = ((get({get({This, rawRectangle}), '$class'})):getHeight(get({This, rawRectangle})) * (get({get({This, cellPositionP}), '$class'})):getRow(get({This, cellPositionP}))),
            put({This, rectangleP}, 'Rectangle':new((get({PointFactory, '$class'})):createXY(PointFactory, X, Y), ((get({get({This, rawRectangle}), '$class'})):getWidth(get({This, rawRectangle})) + ((2 * get({This, xBorder})))), ((get({get({This, rawRectangle}), '$class'})):getHeight(get({This, rawRectangle})) + ((2 * get({This, yBorder})))))),
            Point = (get({get({This, rectangleP}), '$class'})):getPoint(get({This, rectangleP})),
            put({This, animationX}, ((get({Point, '$class'})):getX(Point) + get({This, xBorder}))),
            put({This, animationY}, ((get({Point, '$class'})):getY(Point) + get({This, yBorder}))),
            put({This, hintAnimationY}, ((get({This, animationY}) - (get({get({This, rectangleP}), '$class'})):getHeight(get({This, rectangleP}))) bsr 1))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "updateRectangle", E)
        end.

