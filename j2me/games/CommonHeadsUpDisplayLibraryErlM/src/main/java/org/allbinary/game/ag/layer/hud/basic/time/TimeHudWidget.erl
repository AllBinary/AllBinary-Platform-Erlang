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
% package org.allbinary.game.ag.layer.hud.basic.time
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.graphics.hud.BasicHud
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.logic.math.PrimitiveLongSingleton

-module('TimeHudWidget').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicHud', Function, Arguments).

init_fields(This) ->
    put({This, 'TIME_STRING'}, "Time "),
    put({This, 'TIME_CHAR_ARRAY'}, array:from_list([$T, $i, $m, $e, $\s])),
    put({This, offset}, 0),
    put({This, string}, get({'PrimitiveLongSingleton':getInstance(), 'ZERO'})),
    put({This, totalDigits}, 1),
    put({This, timer}, undefined),
    ok.


% throws Exception
getInstance(Location, Direction, BasicColor, Timer) when is_integer(Location), is_integer(Direction) ->
        'TimeHudWidget':new(Location, Direction, 2, BasicColor, Timer).

new(Location, Direction, BufferZone, BasicColor, Timer) when is_integer(Location), is_integer(Direction), is_integer(BufferZone) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Location, Direction, BufferZone, BasicColor, Timer),
    This.

init(This, Location, Direction, BufferZone, BasicColor, Timer) when is_integer(Location), is_integer(Direction), is_integer(BufferZone) ->
        'BasicHud':init(This, Location, Direction, BufferZone, BasicColor),
        init_fields(This),
        put({This, timer}, Timer),
        (get({This, '$class'})):set(This),
        put({This, updateMaxHeight}, 14).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, updateMaxWidth}, ((get({Font, '$class'})):getSize(Font) * 5)),
        put({This, offset}, ((get({Font, '$class'})):stringWidth(Font, get({This, 'TIME_STRING'})) + 'MyFontProcessor':defaultStringWidth(Font, 3))),
        'BasicHud':updateMeasurement(This, Graphics).

update(This) ->
        (get({get({This, timer}), '$class'})):update(get({This, timer})),
        (get({This, '$class'})):set(This).

set(This) ->
        put({This, string}, (get({get({This, timer}), '$class'})):getTimeChars(get({This, timer}))),
        put({This, totalDigits}, (get({get({This, timer}), '$class'})):getCurrentTotalDigits(get({This, timer}))).

getTimer(This) ->
        get({This, timer}).

paint(This, Graphics) ->
        'BasicHud':paintDX(This, Graphics, get({This, 'TIME_CHAR_ARRAY'}), 0, array:size(get({This, 'TIME_CHAR_ARRAY'})), get({This, string}), 0, get({This, totalDigits}), get({This, offset})).

