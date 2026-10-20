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
% package org.allbinary.game.ag.layer.hud.basic.score
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.ag.layer.hud.basic.NumberStringHud
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory

-module('ScoreHudWidget').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('NumberStringHud', Function, Arguments).

init_fields(This) ->
    ok.


% throws Exception
getInstance(Maxscore, Location, Direction) when is_integer(Maxscore), is_integer(Location), is_integer(Direction) ->
        'ScoreHudWidget':new(Maxscore, Location, Direction, 2, get({'BasicColorFactory':getInstance(), 'GREY'})).

new(Maxscore, Location, Direction, BufferZone, BasicColor) when is_integer(Maxscore), is_integer(Location), is_integer(Direction), is_integer(BufferZone) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Maxscore, Location, Direction, BufferZone, BasicColor),
    This.

'$init'(This, Maxscore, Location, Direction, BufferZone, BasicColor) when is_integer(Maxscore), is_integer(Location), is_integer(Direction), is_integer(BufferZone) ->
        'NumberStringHud':'$init'(This, "Pts ", Maxscore, Location, Direction, BufferZone, BasicColor),
        put({This, updateMaxHeight}, 14).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, updateMaxWidth}, ((get({Font, '$class'})):getSize(Font) * 5)),
        'NumberStringHud':updateMeasurement(This, Graphics).

