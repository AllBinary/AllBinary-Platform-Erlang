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
% package org.allbinary.game.layer.hud.basic
% import javax.microedition.lcdui.Graphics
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.game.graphics.hud.BasicHud
% import org.allbinary.game.layer.hud.LapInfo
% import org.allbinary.graphics.color.BasicColor

-module('LapWidget').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicHud', Function, Arguments).

init_fields(This) ->
    put({This, 'LAP_STR'}, "Lap "),
    put({This, 'OF_STR'}, " of "),
    put({This, string}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    ok.


new(Location, Direction, BasicColor) when is_integer(Location), is_integer(Direction) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Location, Direction, BasicColor),
    This.

'$init'(This, Location, Direction, BasicColor) when is_integer(Location), is_integer(Direction) ->
        'BasicHud':'$init'(This, Location, Direction, 2, BasicColor),
        init_fields(This),
        put({This, updateMaxHeight}, 15),
        put({This, updateMaxWidth}, 40).

update(This, LapInfo) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'LAP_STR'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((get({LapInfo, '$class'})):getCurrentLap(LapInfo))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'OF_STR'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((get({LapInfo, '$class'})):getTotalLaps(LapInfo))),
        put({This, string}, (get({StringBuffer, '$class'})):toString(StringBuffer)).

paint(This, Graphics) ->
        'BasicHud':paintString(This, Graphics, get({This, string})).

