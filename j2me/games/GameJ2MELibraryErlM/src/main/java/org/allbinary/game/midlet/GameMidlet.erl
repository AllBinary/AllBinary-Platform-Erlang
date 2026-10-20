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
% package org.allbinary.game.midlet
% import java.util.Enumeration
% import javax.microedition.lcdui.Canvas
% import javax.microedition.lcdui.Command
% import javax.microedition.lcdui.CommandListener
% import javax.microedition.lcdui.Displayable
% import javax.microedition.lcdui.NullCanvas
% import javax.microedition.midlet.MIDletStateChangeException
% import org.allbinary.J2MEUtil
% import org.allbinary.TsUtil
% import org.allbinary.business.advertisement.GameAdStateFactory
% import org.allbinary.canvas.FullScreenUtil
% import org.allbinary.canvas.GameStatisticsFactory
% import org.allbinary.debug.DebugFactory
% import org.allbinary.debug.DebugInterface
% import org.allbinary.game.GameAdState
% import org.allbinary.game.GameInfo
% import org.allbinary.game.GameMode
% import org.allbinary.game.GameStrings
% import org.allbinary.game.GameTypeFactory
% import org.allbinary.game.PlayerTypesFactory
% import org.allbinary.game.commands.GameCommandsFactory
% import org.allbinary.game.configuration.GameOptionsForm
% import org.allbinary.game.configuration.GameOptionsFormFactory
% import org.allbinary.game.configuration.InGameFeatures
% import org.allbinary.game.configuration.InGameOptionsForm
% import org.allbinary.game.configuration.InGameOptionsFormFactory
% import org.allbinary.game.configuration.LoadGameForm
% import org.allbinary.game.configuration.event.ChangedGameFeatureListener
% import org.allbinary.game.configuration.event.GameFeatureEventHandler
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.GameFeatureFormUtil
% import org.allbinary.game.configuration.feature.MainFeatureFactory
% import org.allbinary.game.configuration.persistance.GamePersistanceSingleton
% import org.allbinary.game.configuration.persistance.KeyValuePersistance
% import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas
% import org.allbinary.game.displayable.canvas.BasicPaintablesCanvas
% import org.allbinary.game.displayable.canvas.DemoCanvas
% import org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface
% import org.allbinary.game.displayable.canvas.GameEventHandlerUtil
% import org.allbinary.game.displayable.canvas.GameInputMappingCanvas
% import org.allbinary.game.displayable.canvas.GameInputMappingInstructionsCanvas
% import org.allbinary.game.displayable.canvas.MenuListener
% import org.allbinary.game.displayable.canvas.NullGameCanvasRunnable
% import org.allbinary.game.input.TextNotificationUtil
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.hud.event.GameNotificationEventHandler
% import org.allbinary.game.paint.help.HelpPaintable
% import org.allbinary.game.score.HighScoreCommands
% import org.allbinary.game.score.HighScoreCommandsFactory
% import org.allbinary.game.score.displayable.HighScoreTextBox
% import org.allbinary.game.score.displayable.HighScoreUtil
% import org.allbinary.game.score.displayable.HighScoresCanvas
% import org.allbinary.game.state.GameStateFactory
% import org.allbinary.graphics.ResizableListenerHandler
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.color.ColorChangeEventHandler
% import org.allbinary.graphics.displayable.CanvasStrings
% import org.allbinary.graphics.displayable.MyCanvas
% import org.allbinary.graphics.displayable.command.MyCommandsFactory
% import org.allbinary.graphics.displayable.screen.AboutCommandProcessor
% import org.allbinary.graphics.displayable.screen.AboutPaintableFactory
% import org.allbinary.graphics.displayable.screen.CommandForm
% import org.allbinary.graphics.displayable.screen.WebCommandProcessor
% import org.allbinary.input.AllBinarySensorManager
% import org.allbinary.input.event.VirtualKeyboardEventHandler
% import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.licensing.ClientInformationFactory
% import org.allbinary.logic.system.security.licensing.InApplicationPurchaseFactory
% import org.allbinary.logic.system.security.licensing.LockableFeature
% import org.allbinary.logic.system.security.licensing.LockableFeatureFactory
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.media.audio.AllBinaryMediaManager
% import org.allbinary.midlet.MidletStrings
% import org.allbinary.midlet.ProgressMidlet
% import org.allbinary.thread.NullThread
% import org.allbinary.thread.ThreadFactoryUtil
% import org.allbinary.thread.ThreadUtil
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.EnumerationUtil
% import org.allbinary.logic.StdUtil
% import org.allbinary.util.ABHashtable

-module('GameMidlet').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CommandListener

'$handle_undefined_function'(Function, Arguments) ->
    apply('ProgressMidlet', Function, Arguments).

init_fields(This) ->
    put({This, enumerationUtil}, 'EnumerationUtil':getInstance()),
    put({This, basicColorFactory}, 'BasicColorFactory':getInstance()),
    put({This, features}, 'Features':getInstance()),
    put({This, midletStrings}, 'MidletStrings':getInstance()),
    put({This, myCommandsFactory}, 'MyCommandsFactory':getInstance()),
    put({This, gameStrings}, 'GameStrings':getInstance()),
    put({This, gameAdStateFactory}, 'GameAdStateFactory':getInstance()),
    put({This, gameStateFactory}, 'GameStateFactory':getInstance()),
    put({This, tsUtil}, 'TsUtil':getInstance()),
    put({This, 'DISPLAYABLE'}, " Displayable: "),
    put({This, 'COMMAND_NAME'}, "command Name/Label: "),
    put({This, 'NO_COMMAND'}, "No Command"),
    put({This, 'NO_DISPLAYABLE'}, "No Displayable"),
    put({This, 'COMMAND_ACTION'}, (fun(Target_N68959) -> (get({Target_N68959, '$class'})):toString(Target_N68959) end)((fun(Target_N68966) -> (get({Target_N68966, '$class'})):append(Target_N68966, get({get({This, midletStrings}), 'COMMAND_ACTION'})) end)((fun(Target_N68973) -> (get({Target_N68973, '$class'})):append(Target_N68973, "GameMidlet::") end)('StringMaker':new())))),
    put({This, 'PAUSE_APP_BACKGROUND'}, "pauseAppBackground"),
    put({This, 'UN_PAUSE_APP_BACKGROUND'}, "unPauseAppBackground"),
    put({This, aboutCommandProcessor}, 'AboutCommandProcessor':getInstance()),
    put({This, webCommandProcessor}, 'WebCommandProcessor':getInstance()),
    put({This, gameMidletStateFactory}, 'GameMidletStateFactory':getInstance()),
    put({This, gameStartTimeHelper}, 'TimeDelayHelper':new(240)),
    put({This, fullScreenUtil}, 'FullScreenUtil':getInstance()),
    put({This, debugInterface}, undefined),
    put({This, allbinaryGameCanvasRunnableInterface}, get({'NullGameCanvasRunnable', 'NULL_GAME_CANVAS_RUNNABLE'})),
    put({This, thread}, get({'NullThread', 'NULL_THREAD'})),
    put({This, loadGameForm}, undefined),
    put({This, isFullScreen}, false),
    put({This, resized}, false),
    put({This, startedBefore}, false),
    ok.


new(ClientInformationFactory) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ClientInformationFactory),
    This.

'$init'(This, ClientInformationFactory) ->
        'ProgressMidlet':'$init'(This, ClientInformationFactory),
        init_fields(This),
        (fun(Target_N69607) -> (get({Target_N69607, '$class'})):initWithRange(Target_N69607, 16#291, 6) end)('SmallIntegerSingletonFactory':getInstance()),
        put({This, loadGameForm}, 'CommandForm':getNullCommandForm()),
        ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
        (get({ProgressCanvas, '$class'})):init(ProgressCanvas, This),
        (fun(Target_N69766) -> (get({Target_N69766, '$class'})):addListenerInterface(Target_N69766, 'ChangedGameFeatureListener':getInstance()) end)('GameFeatureEventHandler':getInstance()),
        (fun(Target_N69813) -> (get({Target_N69813, '$class'})):clear(Target_N69813) end)('GamePersistanceSingleton':getInstance()),
        put({This, debugInterface}, 'DebugFactory':getInstance()),
        (get({This, '$class'})):init(This).

init(This) ->
        ok.

% throws Exception
setDemo(This) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

% throws Exception
createGame(This) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

% throws Exception
mediaShutdown(This) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

stopAll(This) ->
        ok.

pauseApp(This) ->
        (get({This, '$class'})):pauseAppBackground(This, true),
        GameAdState = (get({get({This, gameAdStateFactory}), '$class'})):getCurrentInstance(get({This, gameAdStateFactory})),
        (fun(Target_N70284) -> (get({Target_N70284, '$class'})):stopAll(Target_N70284) end)((get({GameAdState, '$class'})):getAdvertisements(GameAdState)).

pauseAppBackground(This, Background) when is_boolean(Background) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({This, 'PAUSE_APP_BACKGROUND'})),
        case (get({This, allbinaryGameCanvasRunnableInterface}) =/= get({'NullGameCanvasRunnable', 'NULL_GAME_CANVAS_RUNNABLE'})) of
            true ->
            (get({get({This, allbinaryGameCanvasRunnableInterface}), '$class'})):pause(get({This, allbinaryGameCanvasRunnableInterface}));
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "<<<<<< Null", This, get({This, 'PAUSE_APP_BACKGROUND'}))
        end,
        (fun(Target_N70528) -> (get({Target_N70528, '$class'})):shutdown(Target_N70528) end)('AllBinarySensorManager':getInstance()).

unPauseApp(This) ->
        (get({This, '$class'})):unPauseAppBackground(This, true),
        GameAdState = (get({get({This, gameAdStateFactory}), '$class'})):getCurrentInstance(get({This, gameAdStateFactory})),
        (fun(Target_N70679) -> (get({Target_N70679, '$class'})):startAll(Target_N70679) end)((get({GameAdState, '$class'})):getAdvertisements(GameAdState)).

unPauseAppBackground(This, Background) when is_boolean(Background) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({This, 'UN_PAUSE_APP_BACKGROUND'})),
        (fun(Target_N70791) -> (get({Target_N70791, '$class'})):init(Target_N70791) end)('AllBinarySensorManager':getInstance()),
        GameCanvasRunnableInterface = get({This, allbinaryGameCanvasRunnableInterface}),
        case (GameCanvasRunnableInterface =/= get({'NullGameCanvasRunnable', 'NULL_GAME_CANVAS_RUNNABLE'})) of
            true ->
            (get({GameCanvasRunnableInterface, '$class'})):unPause(GameCanvasRunnableInterface);
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "<<<<<< Null", This, get({This, 'UN_PAUSE_APP_BACKGROUND'}))
        end.

destroyAppInRunnable(This, Unconditional, IsProgress) when is_boolean(Unconditional), is_boolean(IsProgress) ->
        ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
        case IsProgress of
            true ->
            (get({ProgressCanvas, '$class'})):start(ProgressCanvas),
            (get({This, '$class'})):commandAction(This, get({get({This, myCommandsFactory}), 'SET_DISPLAYABLE'}), ProgressCanvas);
            false -> ok
        end,
        (get({This, '$class'})):destroyApp(This, Unconditional),
        case IsProgress of
            true ->
            (get({ProgressCanvas, '$class'})):'end'(ProgressCanvas);
            false -> ok
        end.

destroyApp(This, Unconditional) when is_boolean(Unconditional) ->
        METHOD_NAME = "GameMidlet::destroyApp",
        try
            'PreLogUtil':put((fun(Target_N71347) -> (get({Target_N71347, '$class'})):toString(Target_N71347) end)('GameStatisticsFactory':getInstance()), This, METHOD_NAME),
            GameAdState = (get({get({This, gameAdStateFactory}), '$class'})):getCurrentInstance(get({This, gameAdStateFactory})),
            (fun(Target_N71445) -> (get({Target_N71445, '$class'})):stopAll(Target_N71445) end)((get({GameAdState, '$class'})):getAdvertisements(GameAdState)),
            case (not (get({This, '$class'})):isDestroyed(This)) of
                true ->
                (get({This, '$class'})):stopGameCanvasRunnableInterface(This),
                (get({This, '$class'})):setGameCanvasRunnableInterface(This, get({'NullGameCanvasRunnable', 'NULL_GAME_CANVAS_RUNNABLE'})),
                (get({This, '$class'})):mediaShutdown(This);
                false ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Midlet Managment Error: Midlet Should Only Be Destroyed Once", This, METHOD_NAME)
            end,
            'ProgressMidlet':destroyApp(This, true),
            'PreLogUtil':put(get({get({This, commonStrings}), 'END'}), This, METHOD_NAME)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, METHOD_NAME, E)
        end,
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END'}), This, METHOD_NAME).

% throws MIDletStateChangeException
startApp(This) ->
        try
            GameAdState = (get({get({This, gameAdStateFactory}), '$class'})):getCurrentInstance(get({This, gameAdStateFactory})),
            (fun(Target_N71962) -> (get({Target_N71962, '$class'})):startAll(Target_N71962) end)((get({GameAdState, '$class'})):getAdvertisements(GameAdState)),
            START_APP = "startApp",
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, START_APP),
            GameCanvasRunnableInterface = get({This, allbinaryGameCanvasRunnableInterface}),
            case (GameCanvasRunnableInterface =:= get({'NullGameCanvasRunnable', 'NULL_GAME_CANVAS_RUNNABLE'})) of
                true ->
                (get({get({This, gameMidletStateFactory}), '$class'})):setCurrentGameState(get({This, gameMidletStateFactory}), get({get({This, gameStateFactory}), 'NO_GAME_STATE'})),
                (get({This, '$class'})):setDemo(This);
                false ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "GameCanvasRunnableInterface is available", This, START_APP),
                case (GameCanvasRunnableInterface =:= (get({This, '$class'})):getCurrentDisplayable(This)) of
                    true ->
                    (get({This, '$class'})):unPauseAppBackground(This, false);
                    false ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "GameCanvasRunnableInterface is not current displayable", This, START_APP)
                end
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "startApp", E),
            (get({This, '$class'})):destroyApp(This, false),
            (get({This, '$class'})):notifyDestroyed(This)
        end.

commandAction(This, Command, Displayable) ->
        try
            put({local, displayableAsString}, get({This, 'NO_DISPLAYABLE'})),
            case (Displayable =/= undefined) of
                true ->
                put({local, displayableAsString}, (get({Displayable, '$class'})):toString(Displayable));
                false -> ok
            end,
            put({local, label}, get({This, 'NO_COMMAND'})),
            case (Command =/= undefined) of
                true ->
                put({local, label}, (get({Command, '$class'})):getLabel(Command));
                false -> ok
            end,
            'PreLogUtil':put((fun(Target_N72797) -> (get({Target_N72797, '$class'})):toString(Target_N72797) end)((fun(Target_N72804) -> (get({Target_N72804, '$class'})):append(Target_N72804, get({local, displayableAsString})) end)((fun(Target_N72811) -> (get({Target_N72811, '$class'})):append(Target_N72811, get({This, 'DISPLAYABLE'})) end)((fun(Target_N72818) -> (get({Target_N72818, '$class'})):append(Target_N72818, get({local, label})) end)((fun(Target_N72825) -> (get({Target_N72825, '$class'})):append(Target_N72825, get({This, 'COMMAND_NAME'})) end)('StringMaker':new()))))), This, get({This, 'COMMAND_ACTION'})),
            GameCommandsFactory = 'GameCommandsFactory':getInstance(),
            AllbinaryGameCanvasRunnableInterface = get({This, allbinaryGameCanvasRunnableInterface}),
            GameCanvasRunnableInterface = AllbinaryGameCanvasRunnableInterface,
            case (Command =:= get({GameCommandsFactory, 'SHOW_GAME_CANVAS'})) of
                true ->
                case (((fun(Target_N80441) -> (get({Target_N80441, '$class'})):getCurrent(Target_N80441) end)((get({This, '$class'})):getDisplay(This)) =/= GameCanvasRunnableInterface) andalso ((get({AllbinaryGameCanvasRunnableInterface, '$class'})):getType(AllbinaryGameCanvasRunnableInterface) =/= (get({get({'NullGameCanvasRunnable', 'NULL_GAME_CANVAS_RUNNABLE'}), '$class'})):getType(get({'NullGameCanvasRunnable', 'NULL_GAME_CANVAS_RUNNABLE'})))) of
                    true ->
                    (get({This, '$class'})):setDisplay(This, GameCanvasRunnableInterface);
                    false -> ok
                end,
                (get({This, '$class'})):unPauseAppBackground(This, false);
                false ->
                case (Command =:= get({GameCommandsFactory, 'CLOSE_AND_SHOW_GAME_CANVAS'})) of
                true ->
                put({local, menuListener}, Displayable),
                (get({get({local, menuListener}), '$class'})):close(get({local, menuListener})),
                (get({This, '$class'})):setDisplay(This, GameCanvasRunnableInterface),
                (get({This, '$class'})):unPauseAppBackground(This, false);
                false ->
                case (Command =:= get({GameCommandsFactory, 'EXIT_COMMAND'})) of
                true ->
                case ((fun(Target_N80128) -> (get({Target_N80128, '$class'})):size(Target_N80128) end)((fun(Target_N80135) -> (get({Target_N80135, '$class'})):getEventListenerInterfaceListP(Target_N80135) end)('GameMidletEventHandler':getInstance())) =:= 0) of
                    true ->
                    (get({This, '$class'})):exitProgress(This, true);
                    false -> ok
                end,
                (fun(Target_N80202) -> (get({Target_N80202, '$class'})):fireEvent(Target_N80202, 'DemoGameMidletEvent':new(This, get({'DemoGameMidletStateFactory':getInstance(), 'NONE'}))) end)('GameMidletEventHandler':getInstance());
                false ->
                case (Command =:= get({GameCommandsFactory, 'EXIT_WITHOUT_PROGRESS_COMMAND'})) of
                true ->
                (get({This, '$class'})):exitProgress(This, false);
                false ->
                case (((Command =:= get({GameCommandsFactory, 'START_COMMAND'})) orelse (Command =:= get({GameCommandsFactory, 'RESTART_COMMAND'}))) orelse (Command =:= get({GameCommandsFactory, 'CONTINUE_COMMAND'}))) of
                true ->
                case (((get({get({This, gameMidletStateFactory}), '$class'})):getCurrentGameState(get({This, gameMidletStateFactory})) =/= get({get({This, gameStateFactory}), 'PLAYING_GAME_STATE'})) orelse (Command =:= get({GameCommandsFactory, 'RESTART_COMMAND'}))) of
                    true ->
                    case (get({get({This, gameStartTimeHelper}), '$class'})):isTimeTNT(get({This, gameStartTimeHelper})) of
                        true ->
                        case ((Command =:= get({GameCommandsFactory, 'START_COMMAND'})) andalso (get({This, '$class'})):isDemoLoading(This)) of
                            true ->
                            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Trying to Start Game Before Loading Complete", This, get({get({This, midletStrings}), 'COMMAND_ACTION'}));
                            false ->
                            put({This, startedBefore}, true),
                            (get({This, '$class'})):createGame(This),
                            (get({get({This, gameMidletStateFactory}), '$class'})):setCurrentGameState(get({This, gameMidletStateFactory}), get({get({This, gameStateFactory}), 'PLAYING_GAME_STATE'}))
                        end;
                        false ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Starting Game Too Often", This, get({get({This, midletStrings}), 'COMMAND_ACTION'}))
                    end;
                    false ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Already in playing state", This, get({This, 'COMMAND_ACTION'}))
                end;
                false ->
                case (Command =:= get({GameCommandsFactory, 'BUY_COMMAND'})) of
                true ->
                InApplicationPurchaseFactory = 'InApplicationPurchaseFactory':getInstance(),
                List = (fun(Target_N79389) -> (get({Target_N79389, '$class'})):getList(Target_N79389) end)('LockableFeatureFactory':getInstance()),
                LockableFeature = (get({List, '$class'})):get(List, 0),
                case (((get({List, '$class'})):size(List) > 0) andalso (not (get({InApplicationPurchaseFactory, '$class'})):isPurchased(InApplicationPurchaseFactory, LockableFeature))) of
                    true ->
                    (get({InApplicationPurchaseFactory, '$class'})):purchase(InApplicationPurchaseFactory, LockableFeature);
                    false ->
                    (fun(Target_N79571) -> (get({Target_N79571, '$class'})):fireSuccess(Target_N79571, "Already Purchased") end)('TextNotificationUtil':getInstance())
                end;
                false ->
                case (Command =:= get({GameCommandsFactory, 'QUIT_COMMAND'})) of
                true ->
                case (get({get({This, gameStartTimeHelper}), '$class'})):isTimeTNT(get({This, gameStartTimeHelper})) of
                    true ->
                    case allbinary_java:instance_of(Displayable, 'HighScoreTextBox') of
                        true ->
                        put({local, menuListener}, Displayable),
                        (get({get({local, menuListener}), '$class'})):close(get({local, menuListener}));
                        false -> ok
                    end,
                    (get({This, '$class'})):stopGameCanvasRunnableInterface(This),
                    (get({get({This, gameMidletStateFactory}), '$class'})):setCurrentGameState(get({This, gameMidletStateFactory}), get({get({This, gameStateFactory}), 'NO_GAME_STATE'})),
                    (get({This, '$class'})):setDemo(This);
                    false -> ok
                end;
                false ->
                case (Command =:= get({get({This, myCommandsFactory}), 'RESUME_COMMAND'})) of
                true ->
                (get({This, '$class'})):unPauseAppBackground(This, false);
                false ->
                case (Command =:= get({get({This, myCommandsFactory}), 'PAUSE_COMMAND'})) of
                true ->
                (get({This, '$class'})):pauseAppBackground(This, false);
                false ->
                case (Command =:= get({get({This, myCommandsFactory}), 'SET_DISPLAYABLE'})) of
                true ->
                (get({This, '$class'})):pauseAppBackground(This, false),
                (get({This, '$class'})):setDisplay(This, Displayable);
                false ->
                case (Command =:= get({GameCommandsFactory, 'SET_MENU_DISPLAYABLE'})) of
                true ->
                (get({This, '$class'})):pauseAppBackground(This, false),
                put({local, menuListener}, Displayable),
                (get({get({local, menuListener}), '$class'})):open(get({local, menuListener})),
                (get({This, '$class'})):setDisplay(This, Displayable);
                false ->
                case (Command =:= get({GameCommandsFactory, 'START_TRACE'})) of
                true ->
                (get({get({This, debugInterface}), '$class'})):start(get({This, debugInterface})),
                put({local, gameCanvas}, AllbinaryGameCanvasRunnableInterface),
                (get({get({local, gameCanvas}), '$class'})):addCommand(get({local, gameCanvas}), get({GameCommandsFactory, 'STOP_TRACE'})),
                (get({get({local, gameCanvas}), '$class'})):removeCommand(get({local, gameCanvas}), get({GameCommandsFactory, 'START_TRACE'}));
                false ->
                case (Command =:= get({GameCommandsFactory, 'STOP_TRACE'})) of
                true ->
                (get({This, '$class'})):pauseAppBackground(This, false),
                (get({get({This, debugInterface}), '$class'})):stop(get({This, debugInterface})),
                (get({This, '$class'})):unPauseAppBackground(This, false),
                put({local, gameCanvas}, AllbinaryGameCanvasRunnableInterface),
                (get({get({local, gameCanvas}), '$class'})):addCommand(get({local, gameCanvas}), get({GameCommandsFactory, 'START_TRACE'})),
                (get({get({local, gameCanvas}), '$class'})):removeCommand(get({local, gameCanvas}), get({GameCommandsFactory, 'STOP_TRACE'}));
                false ->
                case (Command =:= get({GameCommandsFactory, 'DEFAULT_OPTIONS'})) of
                true ->
                put({local, tempDisplayable}, Displayable),
                case allbinary_java:instance_of(get({local, tempDisplayable}), 'GameOptionsForm') of
                    true ->
                    (fun(Target_N78423) -> (get({Target_N78423, '$class'})):setDefault(Target_N78423, get({local, tempDisplayable})) end)('GameFeatureFormUtil':getInstance());
                    false -> ok
                end;
                false ->
                case (Command =:= get({'GameInputMappingInstructionsCanvas', 'DISPLAY'})) of
                true ->
                put({local, tempDisplayable}, Displayable),
                case allbinary_java:instance_of(get({local, tempDisplayable}), 'GameInputMappingCanvas') of
                    true ->
                    put({local, gameInputMappingCanvas}, get({local, tempDisplayable})),
                    (get({get({local, gameInputMappingCanvas}), '$class'})):update(get({local, gameInputMappingCanvas}));
                    false -> ok
                end,
                (get({This, '$class'})):commandAction(This, get({GameCommandsFactory, 'SET_MENU_DISPLAYABLE'}), (get({This, '$class'})):getInputMappingInstructionsCanvas(This));
                false ->
                case (fun(Target_N73613) -> (get({Target_N73613, '$class'})):isHighScoreCommand(Target_N73613, Command) end)('HighScoreCommandsFactory':getInstance()) of
                true ->
                put({local, tempDisplayable}, Displayable),
                case allbinary_java:instance_of(get({local, tempDisplayable}), 'HighScoresCanvas') of
                    true ->
                    HighScoresCanvas = get({local, tempDisplayable}),
                    (get({HighScoresCanvas, '$class'})):updateCommand(HighScoresCanvas, Command);
                    false -> ok
                end;
                false ->
                case (Command =:= get({'HighScoreCommands':getInstance(), 'DISPLAY'})) of
                true ->
                (get({This, '$class'})):commandAction(This, get({GameCommandsFactory, 'SET_MENU_DISPLAYABLE'}), (get({This, '$class'})):createHighScoresCanvas(This));
                false ->
                case (Command =:= get({'GameInputMappingInstructionsCanvas', 'CLOSE'})) of
                true ->
                put({local, menuListener}, Displayable),
                (get({get({local, menuListener}), '$class'})):close(get({local, menuListener})),
                (get({This, '$class'})):commandAction(This, get({'GameInputMappingCanvas', 'DISPLAY'}), get({'NullCanvas', 'NULL_CANVAS'}));
                false ->
                case (Command =:= get({'GameInputMappingCanvas', 'DISPLAY'})) of
                true ->
                case 'J2MEUtil':isHTML() of
                    true ->
                    (get({This, '$class'})):pauseAppBackground(This, false);
                    false -> ok
                end,
                (get({This, '$class'})):commandAction(This, get({GameCommandsFactory, 'SET_MENU_DISPLAYABLE'}), (get({This, '$class'})):getInputMappingCanvas(This));
                false ->
                case (Command =:= get({'GameInputMappingCanvas', 'DEFAULT'})) of
                true ->
                put({local, tempDisplayable}, Displayable),
                case allbinary_java:instance_of(get({local, tempDisplayable}), 'GameInputMappingCanvas') of
                    true ->
                    put({local, gameInputMappingCanvas}, get({local, tempDisplayable})),
                    (get({get({local, gameInputMappingCanvas}), '$class'})):setDefault(get({local, gameInputMappingCanvas}));
                    false -> ok
                end;
                false ->
                case (Command =:= get({'InGameOptionsForm', 'DISPLAY'})) of
                true ->
                (get({This, '$class'})):pauseAppBackground(This, false),
                ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
                (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, 50, "In Game Options"),
                put({local, layerManager}, (get({This, '$class'})):createGameLayerManager(This)),
                InGameOptionsFormFactory = 'InGameOptionsFormFactory':getInstance(),
                (get({InGameOptionsFormFactory, '$class'})):init(InGameOptionsFormFactory, This, 'InGameFeatures':new(), "Options In Game", (get({get({local, layerManager}), '$class'})):getBackgroundBasicColor(get({local, layerManager})), (get({get({local, layerManager}), '$class'})):getForegroundBasicColor(get({local, layerManager}))),
                put({local, inGameOptionsForm}, (get({InGameOptionsFormFactory, '$class'})):get(InGameOptionsFormFactory)),
                (get({get({local, inGameOptionsForm}), '$class'})):setItemStateListener(get({local, inGameOptionsForm}), AllbinaryGameCanvasRunnableInterface),
                (get({This, '$class'})):commandAction(This, get({GameCommandsFactory, 'SET_MENU_DISPLAYABLE'}), get({local, inGameOptionsForm}));
                false ->
                case (Command =:= get({'InGameOptionsForm', 'DEFAULT'})) of
                true ->
                put({local, inGameOptionsForm}, (fun(Target_N77049) -> (get({Target_N77049, '$class'})):get(Target_N77049) end)('InGameOptionsFormFactory':getInstance())),
                (fun(Target_N77101) -> (get({Target_N77101, '$class'})):setDefault(Target_N77101, get({local, inGameOptionsForm})) end)('GameFeatureFormUtil':getInstance());
                false ->
                case (Command =:= get({GameCommandsFactory, 'DISPLAY_OPTIONS'})) of
                true ->
                'AllBinaryMediaManager':setMuted(true),
                (get({This, '$class'})):stopAll(This),
                put({local, mainFeatureFactory}, 'MainFeatureFactory':getInstance()),
                put({This, isFullScreen}, (get({get({This, features}), '$class'})):isFeature(get({This, features}), get({get({local, mainFeatureFactory}), 'FULL_SCREEN'}))),
                (fun(Target_N76917) -> (get({Target_N76917, '$class'})):fireEvent(Target_N76917, true) end)('ResizableListenerHandler':getInstance()),
                (get({This, '$class'})):setResized(This, false),
                (get({This, '$class'})):commandAction(This, get({GameCommandsFactory, 'SET_MENU_DISPLAYABLE'}), (get({This, '$class'})):getGameOptionsForm(This));
                false ->
                case (Command =:= get({GameCommandsFactory, 'CLOSE_OPTIONS'})) of
                true ->
                (fun(Target_N76291) -> (get({Target_N76291, '$class'})):fireEvent(Target_N76291, false) end)('ResizableListenerHandler':getInstance()),
                (get({This, '$class'})):commandAction(This, get({GameCommandsFactory, 'CLOSE_AND_SHOW_GAME_CANVAS'}), Displayable),
                StringBuffer = 'StringMaker':new(),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Close isFullScreen/change: "),
                (get({StringBuffer, '$class'})):appendboolean(StringBuffer, get({This, isFullScreen})),
                (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({get({This, fullScreenUtil}), '$class'})):isScreenChange(get({This, fullScreenUtil}), get({This, isFullScreen}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, " isResized: "),
                (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isResized(This)),
                'PreLogUtil':put((get({StringBuffer, '$class'})):toString(StringBuffer), This, get({This, 'COMMAND_ACTION'})),
                case ((get({This, '$class'})):isResized(This) orelse (get({get({This, fullScreenUtil}), '$class'})):isScreenChange(get({This, fullScreenUtil}), get({This, isFullScreen}))) of
                    true ->
                    (get({This, '$class'})):updateFullScreen(This);
                    false -> ok
                end,
                'AllBinaryMediaManager':setMuted(false);
                false ->
                case (Command =:= get({GameCommandsFactory, 'DISPLAY_LOAD_FORM'})) of
                true ->
                (get({This, '$class'})):pauseAppBackground(This, false),
                put({local, keyValuePersistance}, 'GamePersistanceSingleton':getInstance()),
                (get({get({local, keyValuePersistance}), '$class'})):clear(get({local, keyValuePersistance})),
                (get({get({local, keyValuePersistance}), '$class'})):loadAll(get({local, keyValuePersistance}), get({This, abeClientInformation})),
                case ((get({This, '$class'})):getLoadGameForm(This) =:= 'CommandForm':getNullCommandForm()) of
                    true ->
                    put({local, layerManager}, (get({This, '$class'})):createGameLayerManager(This)),
                    (get({This, '$class'})):setLoadGameForm(This, 'LoadGameForm':new(This, "Load Game", (get({get({local, layerManager}), '$class'})):getBackgroundBasicColor(get({local, layerManager})), (get({get({local, layerManager}), '$class'})):getForegroundBasicColor(get({local, layerManager}))));
                    false ->
                    (fun(Target_N76088) -> (get({Target_N76088, '$class'})):update(Target_N76088) end)((get({This, '$class'})):getLoadGameForm(This))
                end,
                (get({This, '$class'})):commandAction(This, get({GameCommandsFactory, 'SET_MENU_DISPLAYABLE'}), (get({This, '$class'})):getLoadGameForm(This));
                false ->
                case (Command =:= get({GameCommandsFactory, 'LOAD_FILE'})) of
                true ->
                put({local, loadGameForm}, (get({This, '$class'})):getLoadGameForm(This)),
                put({local, index}, (get({get({local, loadGameForm}), '$class'})):getSelectedId(get({local, loadGameForm}))),
                case (get({local, index}) =/= (-1)) of
                    true ->
                    put({local, keyValuePersistance}, 'GamePersistanceSingleton':getInstance()),
                    (get({This, '$class'})):setStartStateHashtable(This, (get({get({local, keyValuePersistance}), '$class'})):get(get({local, keyValuePersistance}), get({local, index}))),
                    put({local, menuListener}, (get({This, '$class'})):getLoadGameForm(This)),
                    (get({get({local, menuListener}), '$class'})):close(get({local, menuListener})),
                    'PreLogUtil':put((fun(Target_N75756) -> (get({Target_N75756, '$class'})):toString(Target_N75756) end)('BasicMotionGesturesHandler':getInstance()), This, get({This, 'COMMAND_ACTION'})),
                    (get({This, '$class'})):commandAction(This, get({GameCommandsFactory, 'START_COMMAND'}), get({'NullCanvas', 'NULL_CANVAS'})),
                    'PreLogUtil':put((fun(Target_N75867) -> (get({Target_N75867, '$class'})):toString(Target_N75867) end)('BasicMotionGesturesHandler':getInstance()), This, get({This, 'COMMAND_ACTION'}));
                    false -> ok
                end;
                false ->
                case (Command =:= get({GameCommandsFactory, 'DELETE_FILE'})) of
                true ->
                put({local, loadGameForm}, (get({This, '$class'})):getLoadGameForm(This)),
                put({local, index}, (get({get({local, loadGameForm}), '$class'})):getSelectedText(get({local, loadGameForm}))),
                case (get({local, index}) =/= (-1)) of
                    true ->
                    put({local, keyValuePersistance}, 'GamePersistanceSingleton':getInstance()),
                    (get({get({local, keyValuePersistance}), '$class'})):delete(get({local, keyValuePersistance}), get({This, abeClientInformation}), get({local, index})),
                    (get({get({local, keyValuePersistance}), '$class'})):clear(get({local, keyValuePersistance})),
                    (get({get({local, keyValuePersistance}), '$class'})):loadAllSize(get({local, keyValuePersistance}), get({This, abeClientInformation}), 1),
                    (fun(Target_N75412) -> (get({Target_N75412, '$class'})):update(Target_N75412) end)((get({This, '$class'})):getLoadGameForm(This));
                    false -> ok
                end;
                false ->
                case (Command =:= get({GameCommandsFactory, 'SAVE'})) of
                true ->
                put({local, keyValuePersistance}, 'GamePersistanceSingleton':getInstance()),
                (get({This, '$class'})):pauseAppBackground(This, false),
                (get({get({local, keyValuePersistance}), '$class'})):save(get({local, keyValuePersistance}), get({This, abeClientInformation}), (get({This, '$class'})):getCurrentStateHashtable(This)),
                (get({This, '$class'})):unPauseAppBackground(This, false);
                false ->
                case (Command =:= get({'HighScoreUtil', 'SUBMIT_TEXTBOX_COMMAND'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Submitted Score", This, get({This, 'COMMAND_ACTION'})),
                case allbinary_java:instance_of(Displayable, 'HighScoreTextBox') of
                    true ->
                    HighScoreTextBox = Displayable,
                    put({HighScoreTextBox, submitted}, true);
                    false -> ok
                end,
                (get({AllbinaryGameCanvasRunnableInterface, '$class'})):setHighScoreSubmitted(AllbinaryGameCanvasRunnableInterface, true),
                (get({This, '$class'})):commandAction(This, get({GameCommandsFactory, 'CLOSE_AND_SHOW_GAME_CANVAS'}), Displayable);
                false ->
                case (Command =:= get({GameCommandsFactory, 'DISPLAY_ABOUT'})) of
                true ->
                (get({get({This, aboutCommandProcessor}), '$class'})):process(get({This, aboutCommandProcessor}), This, get({GameCommandsFactory, 'SET_MENU_DISPLAYABLE'}), (get({This, '$class'})):getAboutCanvas(This));
                false ->
                case (Command =:= get({GameCommandsFactory, 'OPEN_WEB_URL'})) of
                true ->
                (get({get({This, webCommandProcessor}), '$class'})):process(get({This, webCommandProcessor}), This, get({GameCommandsFactory, 'OPEN_WEB_URL'}), get({'NullCanvas', 'NULL_CANVAS'}));
                false ->
                case (Command =:= get({GameCommandsFactory, 'TOGGLE_KEYBOARD'})) of
                true ->
                VirtualKeyboardEventHandler = 'VirtualKeyboardEventHandler':getInstance(),
                (get({VirtualKeyboardEventHandler, '$class'})):fireEvent(VirtualKeyboardEventHandler, get({VirtualKeyboardEventHandler, 'SHOW_EVENT'}));
                false ->
                case ((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), (get({Command, '$class'})):getLabel(Command), (get({get({GameCommandsFactory, 'TOGGLE_FULLSCREEN'}), '$class'})):getLabel(get({GameCommandsFactory, 'TOGGLE_FULLSCREEN'}))) =:= 0) of
                true ->
                put({local, mainFeatureFactory}, 'MainFeatureFactory':getInstance()),
                IsFullScreen = (get({get({This, features}), '$class'})):isFeature(get({This, features}), get({get({local, mainFeatureFactory}), 'FULL_SCREEN'})),
                case IsFullScreen of
                    true ->
                    (get({get({This, features}), '$class'})):removeDefault(get({This, features}), get({get({local, mainFeatureFactory}), 'FULL_SCREEN'}));
                    false ->
                    (get({get({This, features}), '$class'})):addDefault(get({This, features}), get({get({local, mainFeatureFactory}), 'FULL_SCREEN'}))
                end,
                (get({This, '$class'})):updateFullScreen(This);
                false -> ok
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (fun(Target_N80625) -> (get({Target_N80625, '$class'})):toString(Target_N80625) end)((fun(Target_N80632) -> (get({Target_N80632, '$class'})):append(Target_N80632, (get({Command, '$class'})):getLabel(Command)) end)((fun(Target_N80639) -> (get({Target_N80639, '$class'})):append(Target_N80639, get({get({This, commonStrings}), 'EXCEPTION_LABEL'})) end)('StringMaker':new()))), This, get({get({This, midletStrings}), 'COMMAND_ACTION'}), E),
            case (Command =/= get({'GameCommandsFactory':getInstance(), 'EXIT_COMMAND'})) of
                true ->
                (get({This, '$class'})):exitProgress(This, false);
                false -> ok
            end
        end.

updateFullScreen(This) ->
        MainFeatureFactory = 'MainFeatureFactory':getInstance(),
        IsFullScreen = (get({get({This, features}), '$class'})):isFeature(get({This, features}), get({MainFeatureFactory, 'FULL_SCREEN'})),
        Displayable = (fun(Target_N81054) -> (get({Target_N81054, '$class'})):getCurrent(Target_N81054) end)((get({This, '$class'})):getDisplay(This)),
        case allbinary_java:instance_of(Displayable, 'Canvas') of
            true ->
            Canvas = Displayable,
            (get({Canvas, '$class'})):setFullScreenMode(Canvas, IsFullScreen);
            false -> ok
        end.

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

% throws Exception
getInputMappingInstructionsCanvas(This) ->
        'GameInputMappingInstructionsCanvas':new(This, (get({This, '$class'})):createGameLayerManager(This)).

% throws Exception
getInputMappingCanvas(This) ->
        'GameInputMappingCanvas':new(get({This, abeClientInformation}), This, (get({This, '$class'})):createGameLayerManager(This), (get({This, '$class'})):getHelpPaintable(This)).

% throws Exception
getAboutCanvas(This) ->
        'BasicPaintablesCanvas':new(This, get({'CanvasStrings':getInstance(), 'ABOUT'}), (get({This, '$class'})):createGameLayerManager(This), get({'AboutPaintableFactory':getInstance(), paintableArray})).

% throws Exception
getHelpPaintable(This) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

% throws Exception
createHighScoresCanvas(This) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

% throws Exception
startGameCanvasRunnableInterface(This) ->
        ThreadFactoryUtil = 'ThreadFactoryUtil':getInstance(),
        put({This, thread}, (get({ThreadFactoryUtil, '$class'})):getInstanceGameCanvasRunnable(ThreadFactoryUtil, get({This, allbinaryGameCanvasRunnableInterface}))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N81933) -> (get({Target_N81933, '$class'})):toString(Target_N81933) end)((fun(Target_N81940) -> (get({Target_N81940, '$class'})):appendint(Target_N81940, trunc((get({get({This, thread}), '$class'})):getPriority(get({This, thread})))) end)((fun(Target_N81947) -> (get({Target_N81947, '$class'})):append(Target_N81947, "Thread Priority: ") end)('StringMaker':new()))), This, "startGameCanvasRunnableInterface"),
        (get({get({This, allbinaryGameCanvasRunnableInterface}), '$class'})):setThread(get({This, allbinaryGameCanvasRunnableInterface}), get({This, thread})),
        (get({ThreadFactoryUtil, '$class'})):start(ThreadFactoryUtil, get({This, thread})).

% throws Exception
stopGameCanvasRunnableInterface(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, gameStrings}), 'STOP_GAME_CANVAS_RUNNABLE_INTERFACE'})),
        (fun(Target_N82189) -> (get({Target_N82189, '$class'})):removeAllListeners(Target_N82189) end)('GameNotificationEventHandler':getInstance()),
        (fun(Target_N82217) -> (get({Target_N82217, '$class'})):removeAllListeners(Target_N82217) end)('ColorChangeEventHandler':getInstance()),
        'GameEventHandlerUtil':removeAllListeners(),
        GameCanvasRunnableInterface = get({This, allbinaryGameCanvasRunnableInterface}),
        case (GameCanvasRunnableInterface =/= get({'NullGameCanvasRunnable', 'NULL_GAME_CANVAS_RUNNABLE'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N82430) -> (get({Target_N82430, '$class'})):toString(Target_N82430) end)((fun(Target_N82437) -> (get({Target_N82437, '$class'})):append(Target_N82437, (get({GameCanvasRunnableInterface, '$class'})):toString(GameCanvasRunnableInterface)) end)((fun(Target_N82444) -> (get({Target_N82444, '$class'})):append(Target_N82444, "Set Running False: ") end)('StringMaker':new()))), This, get({get({This, gameStrings}), 'STOP_GAME_CANVAS_RUNNABLE_INTERFACE'})),
            (get({GameCanvasRunnableInterface, '$class'})):setRunning(GameCanvasRunnableInterface, false);
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "StopGame - Could Not Stop", This, get({get({This, gameStrings}), 'STOP_GAME_CANVAS_RUNNABLE_INTERFACE'}))
        end,
        (fun(Target_N82550) -> (get({Target_N82550, '$class'})):join(Target_N82550, get({This, thread})) end)('ThreadUtil':getInstance()),
        ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
        case (get({get({This, features}), '$class'})):isFeature(get({This, features}), get({'MainFeatureFactory':getInstance(), 'LOAD_ALL'})) of
            true ->
            (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, 50, "Stopped Game Runnable");
            false ->
            (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, 50, "Stopped Main Runnable")
        end,
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END'}), This, get({get({This, gameStrings}), 'STOP_GAME_CANVAS_RUNNABLE_INTERFACE'})).

getGameCanvasRunnableInterface(This) ->
        get({This, allbinaryGameCanvasRunnableInterface}).

setGameCanvasRunnableInterface(This, GameCanvasRunnableInterface) ->
        put({This, allbinaryGameCanvasRunnableInterface}, GameCanvasRunnableInterface).

createGameLayerManager(This) ->
        GameInfo = 'GameInfo':new(get({'GameTypeFactory':getInstance(), 'SINGLE_PLAYER'}), get({'GameMode', 'SERVER'}), get({'PlayerTypesFactory':getInstance(), 'PLAYER_TYPE_ONE'}), 1, 1),
        'AllBinaryGameLayerManager':new(get({get({This, basicColorFactory}), 'BLACK'}), get({get({This, basicColorFactory}), 'WHITE'}), GameInfo).

getGameOptionsForm(This) ->
        LayerManager = (get({This, '$class'})):createGameLayerManager(This),
        (fun(Target_N83265) -> (get({Target_N83265, '$class'})):init(Target_N83265, This, "Game Options", (get({LayerManager, '$class'})):getBackgroundBasicColor(LayerManager), (get({LayerManager, '$class'})):getForegroundBasicColor(LayerManager)) end)('GameOptionsFormFactory':getInstance()).

% throws Exception
save(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'SAVE'})),
        Hashtable = (get({This, '$class'})):getCurrentStateHashtable(This),
        (fun(Target_N83500) -> (get({Target_N83500, '$class'})):save(Target_N83500, get({This, abeClientInformation}), Hashtable) end)('GamePersistanceSingleton':getInstance()).

% throws Exception
getCurrentStateHashtable(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "getCurrentStateHashtable"),
        Hashtable = (fun(Target_N83653) -> (get({Target_N83653, '$class'})):createHashtable(Target_N83653) end)('StdUtil':getInstance()),
        case (get({This, allbinaryGameCanvasRunnableInterface}) =/= get({'NullGameCanvasRunnable', 'NULL_GAME_CANVAS_RUNNABLE'})) of
            true ->
            CurrentHashtable = (get({get({This, allbinaryGameCanvasRunnableInterface}), '$class'})):getCurrentStateHashtable(get({This, allbinaryGameCanvasRunnableInterface})),
            Enumeration = (get({CurrentHashtable, '$class'})):keys(CurrentHashtable),
            put({local, key}, undefined),
            (fun Loop() -> case (get({get({This, enumerationUtil}), '$class'})):hasMoreElements(get({This, enumerationUtil}), Enumeration) of true ->
                put({local, key}, (get({get({This, enumerationUtil}), '$class'})):nextElement(get({This, enumerationUtil}), Enumeration)),
                (get({Hashtable, '$class'})):put(Hashtable, get({local, key}), (get({CurrentHashtable, '$class'})):get(CurrentHashtable, get({local, key}))),
                Loop();
            false -> ok end end)();
            false -> ok
        end,
        Hashtable.

setLoadGameForm(This, LoadGameForm) ->
        put({This, loadGameForm}, LoadGameForm).

getLoadGameForm(This) ->
        get({This, loadGameForm}).

setResized(This, Resized) when is_boolean(Resized) ->
        put({This, resized}, Resized).

isResized(This) ->
        get({This, resized}).

isDemoLoading(This) ->
        try
        case get({This, startedBefore}) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        Displayable = (fun(Target_N84453) -> (get({Target_N84453, '$class'})):getCurrent(Target_N84453) end)((get({This, '$class'})):getDisplay(This)),
        case allbinary_java:instance_of(Displayable, 'DemoCanvas') of
            true ->
            DemoCanvas = Displayable,
            case (get({DemoCanvas, '$class'})):isDemoLoading(DemoCanvas) of
                true ->
                throw({'$return', true});
                false -> ok
            end;
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

