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
% package org.allbinary.game.ag.layer.hud.basic
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.graphics.hud.BasicHud
% import org.allbinary.game.graphics.hud.BasicHudFactory
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.paint.PaintableInterface
% import org.allbinary.logic.math.PrimitiveLongSingleton
% import org.allbinary.logic.math.PrimitiveLongUtil

-module('NumberStringHud').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements PaintableInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicHud', Function, Arguments).

init_fields(This) ->
    put({This, primitiveLongUtil}, undefined),
    put({This, prependString}, undefined),
    put({This, 'PREPEND_STRING'}, undefined),
    put({This, value}, 0),
    put({This, max}, 0),
    put({This, offset}, 0),
    put({This, valueString}, undefined),
    put({This, valueTotalDigits}, 0),
    ok.


new(PrependString, Max, Location, Direction, BufferZone, BasicColor) when (is_list(PrependString) orelse PrependString =:= undefined), is_integer(Max), is_integer(Location), is_integer(Direction), is_integer(BufferZone) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PrependString, Max, Location, Direction, BufferZone, BasicColor),
    This.

'$init'(This, PrependString, Max, Location, Direction, BufferZone, BasicColor) when (is_list(PrependString) orelse PrependString =:= undefined), is_integer(Max), is_integer(Location), is_integer(Direction), is_integer(BufferZone) ->
        'BasicHud':'$init'(This, Location, Direction, BufferZone, BasicColor),
        init_fields(This),
        put({This, prependString}, PrependString),
        put({This, 'PREPEND_STRING'}, (get({PrependString, '$class'})):toCharArray(PrependString)),
        put({This, valueString}, array:get(0, get({'PrimitiveLongSingleton':getInstance(), 'NUMBER_CHAR_ARRAYS'}))),
        put({This, primitiveLongUtil}, 'PrimitiveLongUtil':createPowerOfTen((Max + 1))),
        put({This, max}, Max),
        put({This, value}, 0),
        case (Direction =:= 0) of
            true ->
            erlang:error({'RuntimeException', get({'BasicHudFactory':getInstance(), 'DIRECTION_EXCEPTION'})});
            false -> ok
        end.

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, offset}, ((get({Font, '$class'})):stringWidth(Font, get({This, prependString})) + 'MyFontProcessor':defaultCharWidth(Font))),
        'BasicHud':updateMeasurement(This, Graphics).

get(This) ->
        get({This, value}).

add(This, Value) when is_integer(Value) ->
        (get({This, '$class'})):set(This, (get({This, value}) + Value)).

set(This, Value) when is_integer(Value) ->
        put({This, value}, Value),
        case (get({This, value}) > get({This, max})) of
            true ->
            put({This, value}, 0);
            false -> ok
        end,
        put({This, valueString}, (get({get({This, primitiveLongUtil}), '$class'})):getCharArray(get({This, primitiveLongUtil}), get({This, value}))),
        put({This, valueTotalDigits}, (get({get({This, primitiveLongUtil}), '$class'})):getCurrentTotalDigits(get({This, primitiveLongUtil}))).

reduce(This, Value) when is_integer(Value) ->
        (get({This, '$class'})):set(This, (get({This, value}) - Value)).

paint(This, Graphics) ->
        'BasicHud':paintDX(This, Graphics, get({This, 'PREPEND_STRING'}), 0, array:size(get({This, 'PREPEND_STRING'})), get({This, valueString}), 0, get({This, valueTotalDigits}), get({This, offset})).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        CharArray = get({This, 'PREPEND_STRING'}),
        Len = array:size(get({This, 'PREPEND_STRING'})),
        CharArray2 = get({This, valueString}),
        Len2 = get({This, valueTotalDigits}),
        (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP(get({This, basicSetColorUtil}), Graphics, (get({This, '$class'})):getBasicColorP(This)),
        (get({Graphics, '$class'})):drawChars(Graphics, CharArray, 0, Len, X, Y, 0),
        (get({Graphics, '$class'})):drawChars(Graphics, CharArray2, 0, Len2, (X - get({This, offset})), Y, 0).

paintThreed(This, Graphics) ->
        ok.

