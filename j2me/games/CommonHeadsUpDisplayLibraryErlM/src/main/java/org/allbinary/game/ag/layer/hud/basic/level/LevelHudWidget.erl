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
% package org.allbinary.game.ag.layer.hud.basic.level
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.graphics.hud.BasicHud
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.paint.PaintableInterface
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.math.PrimitiveLongUtil

-module('LevelHudWidget').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements PaintableInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicHud', Function, Arguments).

init_fields(This) ->
    put({This, level}, 0),
    put({This, maxlevel}, 0),
    put({This, levelString}, undefined),
    put({This, levelNumberCharArray}, get({'NullUtil':getInstance(), 'NULL_CHAR_ARRAY'})),
    put({This, levelNumberTotalDigits}, 0),
    put({This, offset}, 0),
    put({This, primitiveLongUtil}, undefined),
    ok.


% throws Exception
createHud(Maxlevel, Location, Direction) when is_integer(Maxlevel), is_integer(Location), is_integer(Direction) ->
        'LevelHudWidget':new(Maxlevel, Location, Direction).

new(Maxlevel, Location, Direction) when is_integer(Maxlevel), is_integer(Location), is_integer(Direction) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Maxlevel, Location, Direction),
    This.

init(This, Maxlevel, Location, Direction) when is_integer(Maxlevel), is_integer(Location), is_integer(Direction) ->
        'BasicHud':init(This, Location, Direction, 2, get({'BasicColorFactory':getInstance(), 'GREY'})),
        init_fields(This),
        put({This, primitiveLongUtil}, 'PrimitiveLongUtil':createPowerOfTen(1000)),
        LEVEL = "Lv ",
        put({This, levelString}, (get({LEVEL, '$class'})):toCharArray(LEVEL)),
        put({This, maxlevel}, Maxlevel),
        put({This, level}, Maxlevel),
        (get({This, '$class'})):update(This),
        put({This, updateMaxHeight}, 14).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, updateMaxWidth}, ((get({Font, '$class'})):getSize(Font) * 4)),
        put({This, offset}, ((get({Font, '$class'})):charsWidth(Font, get({This, levelString}), 0, array:size(get({This, levelString}))) + (get({Font, '$class'})):getSize(Font))),
        'BasicHud':updateMeasurement(This, Graphics).

update(This) ->
        put({This, levelNumberCharArray}, (get({get({This, primitiveLongUtil}), '$class'})):getCharArray(get({This, primitiveLongUtil}), get({This, level}))),
        put({This, levelNumberTotalDigits}, (get({get({This, primitiveLongUtil}), '$class'})):getCurrentTotalDigits(get({This, primitiveLongUtil}))).

setLevel(This, Level) when is_integer(Level) ->
        put({This, level}, Level),
        (get({This, '$class'})):update(This).

nextLevel(This) ->
        put({This, level}, get({This, level}) + 1),
        (get({This, '$class'})):update(This).

previousLevel(This) ->
        put({This, level}, get({This, level}) - 1),
        case (get({This, level}) < 0) of
            true ->
            put({This, level}, 0);
            false -> ok
        end,
        (get({This, '$class'})):update(This).

isComplete(This) ->
        try
        case (get({This, level}) =< get({This, maxlevel})) of
            true ->
            throw({'$return', false});
            false ->
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

paint(This, Graphics) ->
        'BasicHud':paintDX(This, Graphics, get({This, levelString}), 0, array:size(get({This, levelString})), get({This, levelNumberCharArray}), 0, get({This, levelNumberTotalDigits}), get({This, offset})).

paintThreed(This, Graphics) ->
        ok.

