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
% import org.allbinary.business.advertisement.GameAdStateFactory
% import org.allbinary.canvas.Processor
% import org.allbinary.game.GameAdState
% import org.allbinary.game.ag.layer.hud.basic.notification.GameNotification
% import org.allbinary.game.ag.layer.hud.basic.notification.GameNotificationHud
% import org.allbinary.game.layer.hud.event.GameNotificationEventHandler
% import org.allbinary.graphics.CustomGPoint
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.time.GameTickTimeDelayHelper
% import org.allbinary.time.GameTickTimeDelayHelperFactory
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.CircularIndexUtil

-module('PlayerGameNotificationHud').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('GameNotificationHud', Function, Arguments).

init_fields(This) ->
    put({This, gameTickTimeDelayHelper}, 'GameTickTimeDelayHelperFactory':getInstance()),
    put({This, 'EMPTY_STRING'}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, displayInfo}, 'DisplayInfoSingleton':getInstance()),
    put({This, timeDelayHelper}, 'TimeDelayHelper':new(0)),
    put({This, circularIndexUtil}, undefined),
    put({This, gameNotification}, 'GameNotification':new()),
    put({This, permanentGameNotification}, 'GameNotification':new()),
    put({This, setAndRemoveProcessor}, 'SetAndRemoveProcessor':new(This)),
    put({This, nextUnremoveableProcessor}, 'NextUnremoveableProcessor':new(This)),
    put({This, processor}, 'Processor':getInstance()),
    put({This, 'PERMANENT_GAME_NOTIFICATION'}, "Permanent Game Notification: "),
    put({This, lastString}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, string}, get({This, 'EMPTY_STRING'})),
    put({This, point}, get({'CustomGPoint', 'NULL_CUSTOM_POINT'})),
    put({This, width}, 0),
    ok.


new(Location, Direction, BufferZone, BasicColor) when is_integer(Location), is_integer(Direction), is_integer(BufferZone) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Location, Direction, BufferZone, BasicColor),
    This.

init(This, Location, Direction, BufferZone, BasicColor) when is_integer(Location), is_integer(Direction), is_integer(BufferZone) ->
        'GameNotificationHud':init(This, Location, Direction, BufferZone, BasicColor),
        init_fields(This),
        put({This, circularIndexUtil}, 'CircularIndexUtil':createInstance(0)),
        GameNotificationEventHandler = 'GameNotificationEventHandler':getInstance(),
        (get({GameNotificationEventHandler, '$class'})):removeAllListeners(GameNotificationEventHandler),
        (get({GameNotificationEventHandler, '$class'})):addListenerInterface(GameNotificationEventHandler, This).

updateMeasurement(This, Graphics) ->
        try
            'GameNotificationHud':updateMeasurement(This, Graphics),
            Font = (get({Graphics, '$class'})):getFont(Graphics),
            put({This, width}, (get({Font, '$class'})):stringWidth(Font, get({This, string}))),
            (get({get({This, processor}), '$class'})):process(get({This, processor})),
            put({This, processor}, 'Processor':getInstance())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            LogUtil = 'LogUtil':getInstance(),
            CommonStrings = 'CommonStrings':getInstance(),
            (get({LogUtil, '$class'})):put(LogUtil, get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'UPDATE'}), E)
        end.

getPoint(This, X, Y) when is_integer(X), is_integer(Y) ->
        put({This, point}, 'CustomGPoint':getInstance3(0, 0)),
        (get({get({This, point}), '$class'})):setX(get({This, point}), X),
        (get({get({This, point}), '$class'})):setY(get({This, point}), Y),
        get({This, point}).

add(This, String, Seconds, BasicColor, Permanent) when (is_list(String) orelse String =:= undefined) ->
        case (get({Permanent, '$class'})):booleanValue(Permanent) of
            true ->
            case (get({This, lastString}) =/= String) of
                true ->
                put({This, lastString}, String),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68488) -> (get({Target_N68488, '$class'})):toString(Target_N68488) end)((fun(Target_N68495) -> (get({Target_N68495, '$class'})):append(Target_N68495, String) end)((fun(Target_N68502) -> (get({Target_N68502, '$class'})):append(Target_N68502, get({This, 'PERMANENT_GAME_NOTIFICATION'})) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'ADD'}));
                false -> ok
            end,
            (get({get({This, permanentGameNotification}), '$class'})):add(get({This, permanentGameNotification}), String, Seconds, BasicColor),
            (get({get({This, circularIndexUtil}), '$class'})):setSize(get({This, circularIndexUtil}), (get({get({This, permanentGameNotification}), '$class'})):getSize(get({This, permanentGameNotification})));
            false ->
            (get({get({This, gameNotification}), '$class'})):add(get({This, gameNotification}), String, Seconds, BasicColor)
        end.

% throws Exception
processTick(This) ->
        case (get({get({This, timeDelayHelper}), '$class'})):isTime(get({This, timeDelayHelper}), get({get({This, gameTickTimeDelayHelper}), startTime})) of
            true ->
            GameAdState = (fun(Target_N68881) -> (get({Target_N68881, '$class'})):getCurrentInstance(Target_N68881) end)('GameAdStateFactory':getInstance()),
            case (get({GameAdState, '$class'})):isShowingAtLocation(GameAdState, (get({This, '$class'})):getLocation(This)) of
                true ->
                put({This, offsetY}, (-54));
                false ->
                put({This, offsetY}, 0)
            end,
            case ((get({get({This, gameNotification}), '$class'})):getSize(get({This, gameNotification})) > 0) of
                true ->
                (get({This, '$class'})):setAndRemove(This);
                false ->
                case ((get({get({This, permanentGameNotification}), '$class'})):getSize(get({This, permanentGameNotification})) > 0) of
                true ->
                (get({This, '$class'})):setNextUnremoveable(This);
                false ->
                put({This, string}, get({This, 'EMPTY_STRING'}))
            end
            end;
            false -> ok
        end.

% throws Exception
setAndRemove(This) ->
        put({This, string}, (get({get({get({This, gameNotification}), stringList}), '$class'})):removeAt(get({get({This, gameNotification}), stringList}), 0)),
        put({This, processor}, get({This, setAndRemoveProcessor})).

% throws Exception
setAndRemoveProcess(This) ->
        (get({This, '$class'})):setX(This, ((((get({get({This, displayInfo}), '$class'})):getLastWidth(get({This, displayInfo})) - get({This, width}))) bsr 1)),
        (get({get({This, point}), '$class'})):setX(get({This, point}), (get({This, '$class'})):getX(This)),
        (get({get({This, point}), '$class'})):setY(get({This, point}), (get({This, '$class'})):getY(This)),
        Time = (get({get({get({This, gameNotification}), timeList}), '$class'})):removeAt(get({get({This, gameNotification}), timeList}), 0),
        put({local, iTime}, ((get({Time, '$class'})):intValue(Time) * 1000)),
        case (get({local, iTime}) =:= 0) of
            true ->
            put({local, iTime}, 500);
            false -> ok
        end,
        put({get({This, timeDelayHelper}), delay}, get({local, iTime})),
        (get({This, '$class'})):setBasicColorP(This, (get({get({get({This, gameNotification}), colorList}), '$class'})):removeAt(get({get({This, gameNotification}), colorList}), 0)).

% throws Exception
setNextUnremoveable(This) ->
        Index = (get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})),
        put({This, string}, array:get(Index, get({get({get({This, permanentGameNotification}), stringList}), objectArray}))),
        put({This, processor}, get({This, nextUnremoveableProcessor})).

% throws Exception
setNextUnremoveableProcess(This) ->
        Index = (get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})),
        (get({This, '$class'})):setX(This, ((((get({get({This, displayInfo}), '$class'})):getLastWidth(get({This, displayInfo})) - get({This, width}))) bsr 1)),
        (get({get({This, point}), '$class'})):setX(get({This, point}), (get({This, '$class'})):getX(This)),
        (get({get({This, point}), '$class'})):setY(get({This, point}), (get({This, '$class'})):getY(This)),
        Time = array:get(Index, get({get({get({This, permanentGameNotification}), timeList}), objectArray})),
        put({get({This, timeDelayHelper}), delay}, ((get({Time, '$class'})):intValue(Time) * 1000)),
        (get({This, '$class'})):setBasicColorP(This, array:get(Index, get({get({get({This, permanentGameNotification}), colorList}), objectArray}))),
        (get({get({This, circularIndexUtil}), '$class'})):next(get({This, circularIndexUtil})).

clear(This) ->
        (get({get({This, gameNotification}), '$class'})):clear(get({This, gameNotification})),
        (get({get({This, permanentGameNotification}), '$class'})):clear(get({This, permanentGameNotification})).

paint(This, Graphics) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        'GameNotificationHud':paintString(This, Graphics, get({This, string})).
% Java nested class SetAndRemoveProcessor: move it to its own module 'SetAndRemoveProcessor'
% Java nested class NextUnremoveableProcessor: move it to its own module 'NextUnremoveableProcessor'

