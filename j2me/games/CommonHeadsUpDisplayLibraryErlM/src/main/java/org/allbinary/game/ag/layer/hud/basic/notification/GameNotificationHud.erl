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
% package org.allbinary.game.ag.layer.hud.basic.notification
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.graphics.hud.BasicHud
% import org.allbinary.game.graphics.hud.BasicHudFactory
% import org.allbinary.game.layer.hud.event.GameNotificationEvent
% import org.allbinary.game.layer.hud.event.GameNotificationListenerInterface
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings

-module('GameNotificationHud').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements GameNotificationListenerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicHud', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_GAME_NOTIFICATION'}, 'GameNotificationHud':new(get({'BasicHudFactory':getInstance(), 'TOPCENTER'}), get({'BasicHudFactory':getInstance(), 'HORIZONTAL'}), 0, get({'BasicColorFactory':getInstance(), 'RED'}))),
    ok.

init_fields(This) ->
    put({This, 'METHOD_NAME'}, "onGameNotificationEvent"),
    put({This, lastGameNotificationEvent}, get({'GameNotification', 'NULL_GAME_NOTIFICATION_EVENT'})),
    ok.


new(Location, Direction, BufferZone, BasicColor) when is_integer(Location), is_integer(Direction), is_integer(BufferZone) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Location, Direction, BufferZone, BasicColor),
    This.

init(This, Location, Direction, BufferZone, BasicColor) when is_integer(Location), is_integer(Direction), is_integer(BufferZone) ->
        'BasicHud':init(This, Location, Direction, BufferZone, BasicColor),
        init_fields(This).

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

% throws Exception
onGameNotificationEvent(This, GameNotificationEvent) ->
        case (get({This, lastGameNotificationEvent}) =/= GameNotificationEvent) of
            true ->
            put({This, lastGameNotificationEvent}, GameNotificationEvent),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({GameNotificationEvent, '$class'})):getString(GameNotificationEvent), This, get({This, 'METHOD_NAME'}));
            false -> ok
        end,
        (get({This, '$class'})):add(This, (get({GameNotificationEvent, '$class'})):getString(GameNotificationEvent), (get({GameNotificationEvent, '$class'})):getSeconds(GameNotificationEvent), (get({GameNotificationEvent, '$class'})):getBasicColorP(GameNotificationEvent), (get({GameNotificationEvent, '$class'})):getPermanent(GameNotificationEvent)).

add(This, String, Seconds, BasicColor, Permanent) when (is_list(String) orelse String =:= undefined) ->
        ok.

% throws Exception
processTick(This) ->
        ok.

paint(This, Graphics) ->
        ok.

clear(This) ->
        ok.

