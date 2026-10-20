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
% import org.allbinary.graphics.color.BasicColor

-module('PositionWidget').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicHud', Function, Arguments).

init_fields(This) ->
    put({This, position}, 0),
    put({This, positionString}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    ok.


new(Position, Location, Direction, BasicColor) when is_integer(Position), is_integer(Location), is_integer(Direction) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Position, Location, Direction, BasicColor),
    This.

'$init'(This, Position, Location, Direction, BasicColor) when is_integer(Position), is_integer(Location), is_integer(Direction) ->
        'BasicHud':'$init'(This, Location, Direction, 2, BasicColor),
        init_fields(This),
        put({This, updateMaxHeight}, 10),
        put({This, updateMaxWidth}, 40).

get(This) ->
        get({This, position}).

set(This, Position) when is_integer(Position) ->
        put({This, position}, Position),
        put({This, positionString}, 'PositionWidget':toString((get({This, '$class'})):get(This))).

paint(This, Graphics) ->
        'BasicHud':paintString(This, Graphics, get({This, positionString})).

toString(Position) when is_integer(Position) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, allbinary_java:to_string(Position)),
        case (Position =:= 1) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, "st");
            false ->
            case (Position =:= 2) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, "nd");
            false ->
            case (Position =:= 3) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, "rd");
            false ->
            (get({StringBuffer, '$class'})):append(StringBuffer, "th")
        end
        end
        end,
        (get({StringBuffer, '$class'})):toString(StringBuffer).

