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
% package org.allbinary.game.displayable.canvas
% import javax.microedition.lcdui.Command
% import javax.microedition.lcdui.CommandListener
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Item
% import org.allbinary.J2MEUtil
% import org.allbinary.animation.Animation
% import org.allbinary.animation.IndexedAnimationBehavior
% import org.allbinary.animation.special.SpecialAnimation
% import org.allbinary.business.advertisement.GameAdStateFactory
% import org.allbinary.canvas.BaseGameStatistics
% import org.allbinary.canvas.CustomGameMenuUtil
% import org.allbinary.canvas.FullScreenUtil
% import org.allbinary.canvas.GameStatisticsFactory
% import org.allbinary.canvas.RunnableCanvas
% import org.allbinary.game.GameAdState
% import org.allbinary.game.commands.GameCommandsFactory
% import org.allbinary.game.configuration.event.ChangedGameFeatureListener
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.GameFeatureFactory
% import org.allbinary.game.configuration.feature.InputFeatureFactory
% import org.allbinary.game.configuration.feature.MainFeatureFactory
% import org.allbinary.game.init.BasicBuildGameInitializerFactory
% import org.allbinary.game.init.GameInitializationUtil
% import org.allbinary.game.input.GameInputStrings
% import org.allbinary.game.input.GameKey
% import org.allbinary.game.input.GameKeyFactory
% import org.allbinary.game.input.PlatformInputMappingFactory
% import org.allbinary.game.input.event.DownGameKeyEventHandler
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.game.input.event.GameKeyEventFactory
% import org.allbinary.game.input.event.GameKeyEventHandler
% import org.allbinary.game.input.event.UpGameKeyEventHandler
% import org.allbinary.game.input.mapping.InputToGameKeyMapping
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.SWTUtil
% import org.allbinary.game.midlet.DemoGameMidlet
% import org.allbinary.game.score.HighScoreCommands
% import org.allbinary.game.score.HighScores
% import org.allbinary.game.score.HighScoresFactoryInterface
% import org.allbinary.game.score.HighScoresHelper
% import org.allbinary.game.score.HighScoresPaintable
% import org.allbinary.game.score.NullHighScoresSingletonFactory
% import org.allbinary.game.state.GameState
% import org.allbinary.game.state.GameStateFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.ResizableListenerHandler
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.displayable.command.MyCommandsFactory
% import org.allbinary.graphics.displayable.event.DisplayChangeEvent
% import org.allbinary.graphics.displayable.event.DisplayChangeEventHandler
% import org.allbinary.graphics.displayable.event.DisplayChangeEventListener
% import org.allbinary.graphics.form.FormType
% import org.allbinary.graphics.form.FormTypeFactory
% import org.allbinary.graphics.form.ScrollSelectionForm
% import org.allbinary.graphics.opengles.CurrentDisplayableFactory
% import org.allbinary.graphics.opengles.OpenGLFeatureFactory
% import org.allbinary.graphics.opengles.OpenGLFeatureUtil
% import org.allbinary.graphics.opengles.OpenGLThreadUtil
% import org.allbinary.graphics.paint.InitUpdatePaintable
% import org.allbinary.graphics.paint.NullPaintable
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.graphics.paint.PaintableInterface
% import org.allbinary.graphics.paint.StatePaintable
% import org.allbinary.graphics.paint.StatePaintableFactory
% import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.os.OperatingSystemFactory
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.InApplicationPurchaseFactory
% import org.allbinary.logic.system.security.licensing.LockableFeature
% import org.allbinary.logic.system.security.licensing.LockableFeatureFactory
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.media.audio.AllBinaryMediaManager
% import org.allbinary.media.audio.EarlySoundsFactory
% import org.allbinary.string.CommonSeps
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('StartCanvas').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements GameCanvasRunnableInterface
% implements MenuListener
% implements DisplayChangeEventListener

'$handle_undefined_function'(Function, Arguments) ->
    apply('RunnableCanvas', Function, Arguments).

static_init() ->
    put({?MODULE, id}, 0),
    put({?MODULE, 'BOT_GAME_STATS'}, "Bot Game Statistics: "),
    ok.

init_fields(This) ->
    put({This, basicColorFactory}, 'BasicColorFactory':getInstance()),
    put({This, features}, 'Features':getInstance()),
    put({This, openGLFeatureFactory}, 'OpenGLFeatureFactory':getInstance()),
    put({This, myCommandsFactory}, 'MyCommandsFactory':getInstance()),
    put({This, gameAdStateFactory}, 'GameAdStateFactory':getInstance()),
    put({This, gameStateFactory}, 'GameStateFactory':getInstance()),
    put({This, gameInputStrings}, 'GameInputStrings':getInstance()),
    put({This, formUtil}, 'FormUtil':getInstance()),
    put({This, basicGameDemoPaintable}, 'StatePaintableFactory':getInstance()),
    put({This, specialAnimationInterface}, 'SpecialAnimation':getInstance()),
    put({This, paintedSpecialAnimationInterface}, 'SpecialAnimation':getInstance()),
    put({This, fullScreenUtil}, 'FullScreenUtil':getInstance()),
    put({This, highScoresHelper}, 'HighScoresHelper':new()),
    put({This, realHighScoresPaintable}, 'HighScoresPaintable':new()),
    put({This, highScoresPaintable}, 'NullPaintable':getInstance()),
    put({This, state}, 0),
    put({This, timeDelayHelper}, 'TimeDelayHelper':new(6000)),
    put({This, highScoresFactoryInterface}, undefined),
    put({This, menuInputProcessor}, 'NoMenuInputProcessor':getInstance()),
    put({This, menuForm}, 'ScrollSelectionForm':getNullScrollSelectionForm()),
    put({This, gameInitializationInterfaceFactoryInterface}, undefined),
    put({This, initialized}, false),
    put({This, defaultPaintableInterface}, 'NullPaintable':getInstance()),
    put({This, paintableInterface}, 'NullPaintable':getInstance()),
    put({This, overlayPaintable}, undefined),
    put({This, tempWait}, get({'NullWaitGameRunnable':getInstance(), 'WAIT'})),
    put({This, inputToGameKeyMapping}, (fun(Target_N69459) -> (get({Target_N69459, '$class'})):getInputMapping(Target_N69459) end)((fun(Target_N69466) -> (get({Target_N69466, '$class'})):getPersistentInputMappingInstance(Target_N69466) end)('PlatformInputMappingFactory':getInstance()))),
    put({This, gameRunnable}, 'NullWaitGameRunnable':getInstance()),
    put({This, progressPaintable}, 'ProgressCanvasFactory':getLazyInstance()),
    put({This, isSingleKeyRepeatableProcessing}, (get({get({This, features}), '$class'})):isFeature(get({This, features}), get({'InputFeatureFactory':getInstance(), 'SINGLE_KEY_REPEAT_PRESS'}))),
    put({This, 'NONE'}, get({'GameKeyFactory':getInstance(), 'NONE'})),
    put({This, gameKeyEventFactory}, 'GameKeyEventFactory':getInstance()),
    put({This, 'SET_STATE'}, "setState"),
    put({This, baseGameStatistics}, 'GameStatisticsFactory':getInstance()),
    ok.


new(AbeClientInformation, CommandListener, HighScoresFactoryInterface, Paintable, OverlayPaintable, GameInitializationInterfaceFactoryInterface, IsContinue) when is_boolean(IsContinue) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AbeClientInformation, CommandListener, HighScoresFactoryInterface, Paintable, OverlayPaintable, GameInitializationInterfaceFactoryInterface, IsContinue),
    This.

init(This, AbeClientInformation, CommandListener, HighScoresFactoryInterface, Paintable, OverlayPaintable, GameInitializationInterfaceFactoryInterface, IsContinue) when is_boolean(IsContinue) ->
        'RunnableCanvas':init(This, CommandListener, get({'CurrentDisplayableFactory':getInstance(), 'DEFAULT_CHILD_NAME_LIST'}), true),
        init_fields(This),
        (get({This, '$class'})):setWait(This, get({'NullWaitGameRunnable':getInstance(), 'WAIT'})),
        put({This, gameInitializationInterfaceFactoryInterface}, GameInitializationInterfaceFactoryInterface),
        (fun(Target_N69727) -> (get({Target_N69727, '$class'})):initDemo(Target_N69727, AbeClientInformation, This, GameInitializationInterfaceFactoryInterface) end)('GameInitializationUtil':getInstance()),
        (fun(Target_N69777) -> (get({Target_N69777, '$class'})):fireEvent(Target_N69777, false) end)('ResizableListenerHandler':getInstance()),
        put({This, overlayPaintable}, OverlayPaintable),
        put({This, highScoresFactoryInterface}, HighScoresFactoryInterface),
        (get({This, '$class'})):setDefaultPaintableInterface(This, Paintable),
        (get({This, '$class'})):setPaintableInterface(This, (get({This, '$class'})):getDefaultPaintableInterface(This)),
        case IsContinue of
            true ->
            (get({This, '$class'})):addCommand(This, get({'GameCommandsFactory':getInstance(), 'CONTINUE_COMMAND'}));
            false -> ok
        end,
        case (fun(Target_N69988) -> (get({Target_N69988, '$class'})):isChangedFeature(Target_N69988, get({'GameFeatureFactory':getInstance(), 'SOUND'})) end)('ChangedGameFeatureListener':getInstance()) of
            true ->
            (get({This, '$class'})):mediaInit(This);
            false -> ok
        end,
        (fun(Target_N70065) -> (get({Target_N70065, '$class'})):addListenerInterface(Target_N70065, This) end)('DisplayChangeEventHandler':getInstance()).

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

onDisplayChangeEvent(This, DisplayChangeEvent) ->
        try
            ScrollSelectionForm = (get({This, '$class'})):getMenuForm(This),
            case (ScrollSelectionForm =/= undefined) of
                true ->
                FormType = (fun(Target_N70491) -> (get({Target_N70491, '$class'})):getFormType(Target_N70491) end)('FormTypeFactory':getInstance()),
                Rectangle = (get({get({This, formUtil}), '$class'})):createFormRectangle(get({This, formUtil})),
                (get({ScrollSelectionForm, '$class'})):init(ScrollSelectionForm, Rectangle, FormType);
                false -> ok
            end,
            (get({get({This, overlayPaintable}), '$class'})):init(get({This, overlayPaintable}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, canvasStrings}), 'ON_DISPLAY_CHANGE_EVENT'}), E)
        end.

getCustomCommands(This) ->
        try
        GameCommandsFactory = 'GameCommandsFactory':getInstance(),
        case 'J2MEUtil':isHTML() of
            true ->
            put({local, commandArray}, array:from_list([get({GameCommandsFactory, 'START_COMMAND'}), get({'HighScoreCommands':getInstance(), 'DISPLAY'}), get({'GameInputMappingCanvas', 'DISPLAY'}), get({GameCommandsFactory, 'DISPLAY_ABOUT'})])),
            throw({'$return', get({local, commandArray})});
            false ->
            CommandList = 'BasicArrayListD':new(),
            (get({CommandList, '$class'})):add(CommandList, get({GameCommandsFactory, 'START_COMMAND'})),
            InApplicationPurchaseFactory = 'InApplicationPurchaseFactory':getInstance(),
            case (get({InApplicationPurchaseFactory, '$class'})):isEnabled(InApplicationPurchaseFactory) of
                true ->
                List = (fun(Target_N71058) -> (get({Target_N71058, '$class'})):getList(Target_N71058) end)('LockableFeatureFactory':getInstance()),
                case (((get({List, '$class'})):size(List) > 0) andalso (not (get({InApplicationPurchaseFactory, '$class'})):isPurchased(InApplicationPurchaseFactory, (get({List, '$class'})):get(List, 0)))) of
                    true ->
                    (get({CommandList, '$class'})):add(CommandList, get({GameCommandsFactory, 'BUY_COMMAND'}));
                    false -> ok
                end;
                false -> ok
            end,
            (get({CommandList, '$class'})):add(CommandList, get({'HighScoreCommands':getInstance(), 'DISPLAY'})),
            try
                IsOverScan = (fun(Target_N71313) -> (get({Target_N71313, '$class'})):isOverScan(Target_N71313) end)((fun(Target_N71320) -> (get({Target_N71320, '$class'})):getOperatingSystemInstance(Target_N71320) end)('OperatingSystemFactory':getInstance())),
                case get({'SWTUtil', isSWT}) of
                    true ->
                    (get({CommandList, '$class'})):add(CommandList, get({'GameInputMappingCanvas', 'DISPLAY'}));
                    false ->
                    case (not IsOverScan) of
                    true ->
                    (get({CommandList, '$class'})):add(CommandList, get({GameCommandsFactory, 'DISPLAY_OPTIONS'})),
                    (get({CommandList, '$class'})):add(CommandList, get({GameCommandsFactory, 'DISPLAY_LOAD_FORM'})),
                    (get({CommandList, '$class'})):add(CommandList, get({'GameInputMappingCanvas', 'DISPLAY'}));
                    false -> ok
                end
                end
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                ok
            end,
            (get({CommandList, '$class'})):add(CommandList, get({GameCommandsFactory, 'DISPLAY_ABOUT'})),
            put({local, commandArray}, (get({CommandList, '$class'})):toArray(CommandList)),
            throw({'$return', get({local, commandArray})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

initCommands(This, CmdListener) ->
        (get({This, '$class'})):removeAllCommands(This),
        CommandArray = (get({This, '$class'})):getCustomCommands(This),
        Size = array:size(CommandArray),
        lists:foreach(fun(Index) ->
            (get({This, '$class'})):addCommand(This, array:get(Index, CommandArray))
        end, lists:seq(0, Size - 1)),
        'CustomGameMenuUtil':add(This),
        (get({This, '$class'})):setCommandListener(This, CmdListener).

% throws Exception
initPostPaint(This) ->
        ok.

% throws Exception
mediaInit(This) ->
        'AllBinaryMediaManager':init('EarlySoundsFactory':getInstance()).

itemStateChanged(This, Item) ->
        'ForcedLogUtil':log(get({get({This, commonStrings}), 'NOT_IMPLEMENTED'}), This).

% throws Exception
initMenu(This) ->
        (get({This, '$class'})):close(This),
        (get({This, '$class'})):open(This).

open(This) ->
        (fun(Target_N72522) -> (get({Target_N72522, '$class'})):addListenerInterface(Target_N72522, (get({This, '$class'})):getMenuInputProcessor(This)) end)('BasicMotionGesturesHandler':getInstance()),
        (fun(Target_N72564) -> (get({Target_N72564, '$class'})):addListener(Target_N72564, (get({This, '$class'})):getMenuInputProcessor(This)) end)('GameKeyEventHandler':getInstance()).

close(This) ->
        (fun(Target_N72642) -> (get({Target_N72642, '$class'})):removeListener(Target_N72642, (get({This, '$class'})):getMenuInputProcessor(This)) end)('BasicMotionGesturesHandler':getInstance()),
        (fun(Target_N72684) -> (get({Target_N72684, '$class'})):removeListener(Target_N72684, (get({This, '$class'})):getMenuInputProcessor(This)) end)('GameKeyEventHandler':getInstance()).

getSourceId(This) ->
        get({'StartCanvas', id}).

keyPressed(This, KeyCode) when is_integer(KeyCode) ->
        (get({This, '$class'})):keyPressedByDevice(This, KeyCode, 0).

keyReleased(This, KeyCode) when is_integer(KeyCode) ->
        (get({This, '$class'})):keyReleasedByDevice(This, KeyCode, 0).

keyRepeated(This, KeyCode) when is_integer(KeyCode) ->
        (get({This, '$class'})):keyRepeatedByDevice(This, KeyCode, 0).

keyPressedByDevice(This, KeyCode, DeviceId) when is_integer(KeyCode), is_integer(DeviceId) ->
        (get({This, '$class'})):addGameKeyEvent(This, KeyCode, false).

keyReleasedByDevice(This, KeyCode, DeviceId) when is_integer(KeyCode), is_integer(DeviceId) ->
        (get({This, '$class'})):removeGameKeyEvent(This, KeyCode, false).

keyRepeatedByDevice(This, KeyCode, DeviceId) when is_integer(KeyCode), is_integer(DeviceId) ->
        case get({This, isSingleKeyRepeatableProcessing}) of
            true ->
            (get({This, '$class'})):addGameKeyEvent(This, KeyCode, true);
            false -> ok
        end.

addGameKeyEvent(This, KeyCode, Repeated) when is_integer(KeyCode), is_boolean(Repeated) ->
        try
            GameKey = (get({get({This, inputToGameKeyMapping}), '$class'})):getInstanceForCanvas(get({This, inputToGameKeyMapping}), This, KeyCode),
            case (GameKey =/= get({This, 'NONE'})) of
                true ->
                GameKeyEvent = (get({get({This, gameKeyEventFactory}), '$class'})):getInstanceForInput(get({This, gameKeyEventFactory}), This, GameKey),
                (fun(Target_N73890) -> (get({Target_N73890, '$class'})):fireEvent(Target_N73890, GameKeyEvent) end)('DownGameKeyEventHandler':getInstance());
                false ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N73726) -> (get({Target_N73726, '$class'})):toString(Target_N73726) end)((fun(Target_N73733) -> (get({Target_N73733, '$class'})):appendint(Target_N73733, KeyCode) end)((fun(Target_N73740) -> (get({Target_N73740, '$class'})):append(Target_N73740, get({get({This, gameInputStrings}), 'NO_KEY'})) end)('StringMaker':new()))), This, get({get({This, gameInputStrings}), 'ADD_KEY_EVENT'}))
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Key Event Error", This, get({get({This, gameInputStrings}), 'ADD_KEY_EVENT'}), E)
        end.

removeGameKeyEvent(This, KeyCode, Repeated) when is_integer(KeyCode), is_boolean(Repeated) ->
        try
            GameKey = (get({get({This, inputToGameKeyMapping}), '$class'})):getInstanceForCanvas(get({This, inputToGameKeyMapping}), This, KeyCode),
            case (GameKey =/= get({This, 'NONE'})) of
                true ->
                GameKeyEvent = (get({get({This, gameKeyEventFactory}), '$class'})):getInstanceForInput(get({This, gameKeyEventFactory}), This, GameKey),
                (fun(Target_N74376) -> (get({Target_N74376, '$class'})):fireEvent(Target_N74376, GameKeyEvent) end)('UpGameKeyEventHandler':getInstance());
                false ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N74212) -> (get({Target_N74212, '$class'})):toString(Target_N74212) end)((fun(Target_N74219) -> (get({Target_N74219, '$class'})):appendint(Target_N74219, KeyCode) end)((fun(Target_N74226) -> (get({Target_N74226, '$class'})):append(Target_N74226, get({get({This, gameInputStrings}), 'NO_KEY'})) end)('StringMaker':new()))), This, get({get({This, gameInputStrings}), 'REMOVE_KEY_EVENT'}))
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Key Event Error", This, get({get({This, gameInputStrings}), 'REMOVE_KEY_EVENT'}), E)
        end.

pause(This) ->
        (get({This, '$class'})):close(This),
        (get({This, '$class'})):setPaused(This, true).

unPause(This) ->
        (get({This, '$class'})):open(This),
        (get({This, '$class'})):setPaused(This, false).

isPausable(This) ->
        try
        case ((fun(Target_N74732) -> (get({Target_N74732, '$class'})):getUsedRunnable(Target_N74732) end)('CurrentDisplayableFactory':getInstance()) =:= 'NullWaitGameRunnable':getInstance()) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isGameOver(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N74868) -> (get({Target_N74868, '$class'})):toString(Target_N74868) end)((fun(Target_N74875) -> (get({Target_N74875, '$class'})):append(Target_N74875, " since not a game") end)((fun(Target_N74882) -> (get({Target_N74882, '$class'})):append(Target_N74882, get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})) end)('StringMaker':new()))), This, "isGameOver"),
        false.

% throws Exception
setLoadStateHashtable(This, Hashtable) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Trying to continue a demo lol - only continue a game canvas not the demo", This, "setLoadStateHashtable").

% throws Exception
getLoadStateHashtable(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Trying to continue a demo lol - only continue a game canvas not the demo", This, "getLoadStateHashtable"),
        get({get({This, stdUtil}), 'NULL_TABLE'}).

% throws Exception
getCurrentStateHashtable(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Trying to save the AI lol", This, "getCurrentStateHashtable"),
        get({get({This, stdUtil}), 'NULL_TABLE'}).

setHighScoreSubmitted(This, IsNotUsed) when is_boolean(IsNotUsed) ->
        ok.

paint(This, Graphics) ->
        (get({get({This, paintableInterface}), '$class'})):paint(get({This, paintableInterface}), Graphics),
        (get({get({This, paintedSpecialAnimationInterface}), '$class'})):paintXY(get({This, paintedSpecialAnimationInterface}), Graphics, 0, 0),
        (get({get({This, highScoresPaintable}), '$class'})):paint(get({This, highScoresPaintable}), Graphics),
        (fun(Target_N75546) -> (get({Target_N75546, '$class'})):paint(Target_N75546, Graphics) end)((get({This, '$class'})):getBasicGameDemoPaintable(This)),
        (get({get({This, overlayPaintable}), '$class'})):paint(get({This, overlayPaintable}), Graphics),
        (get({get({This, progressPaintable}), '$class'})):paint(get({This, progressPaintable}), Graphics).

paintThreed(This, Graphics) ->
        (get({get({This, paintableInterface}), '$class'})):paintThreed(get({This, paintableInterface}), Graphics),
        (get({get({This, paintedSpecialAnimationInterface}), '$class'})):paintThreedXYZ(get({This, paintedSpecialAnimationInterface}), Graphics, 0, 0, 0).

processGameOver(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Not Implemented since not a game", This, "setGameOver").

demoStateChange(This) ->
        put({local, newState}, (get({This, state}) + 1)),
        case (get({local, newState}) > 2) of
            true ->
            put({local, newState}, 0);
            false ->
            case (get({local, newState}) =:= 2) of
            true ->
            case (not (get({get({This, highScoresHelper}), '$class'})):isAnyHighScores(get({This, highScoresHelper}))) of
                true ->
                put({local, newState}, 0);
                false ->
                HighScores = (get({get({This, highScoresHelper}), '$class'})):getNextHighScores(get({This, highScoresHelper})),
                case (HighScores =:= 'NullHighScoresSingletonFactory':getInstance()) of
                    true ->
                    put({local, newState}, 0);
                    false ->
                    (fun(Target_N76135) -> (get({Target_N76135, '$class'})):setHighScores(Target_N76135, HighScores) end)((get({This, '$class'})):getRealHighScoresPaintable(This))
                end
            end;
            false -> ok
        end
        end,
        (get({This, '$class'})):setState(This, get({local, newState})),
        (get({This, '$class'})):updateDemoState(This).

updateDemoState(This) ->
        'PreLogUtil':put((fun(Target_N76388) -> (get({Target_N76388, '$class'})):toString(Target_N76388) end)((fun(Target_N76395) -> (get({Target_N76395, '$class'})):createInstance(Target_N76395, get({This, state})) end)('SmallIntegerSingletonFactory':getInstance())), This, get({This, 'SET_STATE'})),
        (fun(Target_N76454) -> (get({Target_N76454, '$class'})):setState(Target_N76454, get({This, state})) end)((get({This, '$class'})):getBasicGameDemoPaintable(This)),
        case (get({This, state}) =:= 0) of
            true ->
            put({This, highScoresPaintable}, 'NullPaintable':getInstance()),
            put({This, paintedSpecialAnimationInterface}, (get({This, '$class'})):getSpecialAnimationInterface(This)),
            (fun(Target_N76727) -> (get({Target_N76727, '$class'})):reset(Target_N76727) end)((get({This, '$class'})):getSpecialAnimationInterface(This));
            false ->
            case (get({This, state}) =:= 1) of
            true ->
            put({This, paintedSpecialAnimationInterface}, 'SpecialAnimation':getInstance());
            false ->
            case (get({This, state}) =:= 2) of
            true ->
            put({This, highScoresPaintable}, (get({This, '$class'})):getRealHighScoresPaintable(This));
            false -> ok
        end
        end
        end,
        GameAdState = (get({get({This, gameAdStateFactory}), '$class'})):getCurrentInstance(get({This, gameAdStateFactory})),
        (get({GameAdState, '$class'})):processPageAdState(GameAdState).

% throws Exception
getNextRandom(This) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

% throws Exception
createGameLayerManager(This, RandomValue) when is_integer(RandomValue) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

% throws Exception
createRunnable(This, RandomLevel) when is_integer(RandomLevel) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

% throws Exception
createCanvas(This) ->
        put({This, highScoresPaintable}, 'NullPaintable':getInstance()),
        RandomLevel = (get({This, '$class'})):getNextRandom(This).

% throws Exception
start(This) ->
        ok.

preDemoProcess(This) ->
        (get({get({This, overlayPaintable}), '$class'})):update(get({This, overlayPaintable})).

% throws Exception
process(This) ->
        (fun(Target_N77307) -> (get({Target_N77307, '$class'})):processInputList(Target_N77307) end)((get({This, '$class'})):getMenuInputProcessor(This)),
        (get({This, '$class'})):preDemoProcess(This),
        case (get({This, state}) =:= 0) of
            true ->
            IndexedAnimationBehavior = (fun(Target_N77391) -> (get({Target_N77391, '$class'})):getAnimationBehavior(Target_N77391) end)((get({This, '$class'})):getSpecialAnimationInterface(This)),
            case (get({IndexedAnimationBehavior, loopIndex}) < 1) of
                true ->
                (get({get({This, timeDelayHelper}), '$class'})):setStartTimeTNT(get({This, timeDelayHelper}));
                false -> ok
            end,
            DemoGameMidlet = (get({This, '$class'})):getCustomCommandListener(This);
            false -> ok
        end.

% throws Exception
startDemoGame(This) ->
        ok.

% throws Exception
processGame(This) ->
        (get({get({This, gameRunnable}), '$class'})):run(get({This, gameRunnable})),
        (get({get({This, specialAnimationInterface}), '$class'})):nextFrame(get({This, specialAnimationInterface})),
        (get({This, '$class'})):process(This).

run(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START_RUNNABLE'}), This, get({get({This, commonStrings}), 'RUN'})),
        try
            ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
            (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, 50, "Demo Thread"),
            (get({This, '$class'})):setCurrentThread(This),
            (get({This, '$class'})):setRunning(This, true),
            case (get({get({This, features}), '$class'})):isFeature(get({This, features}), get({'MainFeatureFactory':getInstance(), 'LOAD_ONDEMAND'})) of
                true ->
                (get({ProgressCanvas, '$class'})):'end'(ProgressCanvas);
                false ->
                (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, 50, "Demo Thread Running")
            end,
            (get({get({This, fullScreenUtil}), '$class'})):initOnRun(get({This, fullScreenUtil}), This, (get({This, '$class'})):getCustomCommandListener(This)),
            (get({This, '$class'})):initMenu(This),
            (get({This, '$class'})):initPostPaint(This),
            (get({This, '$class'})):updateDemoState(This),
            case (get({get({This, features}), '$class'})):isDefault(get({This, features}), get({get({This, openGLFeatureFactory}), 'OPENGL_AS_GAME_THREAD'})) of
                true ->
                (fun(Target_N78200) -> (get({Target_N78200, '$class'})):onResume(Target_N78200) end)('OpenGLThreadUtil':getInstance());
                false -> ok
            end,
            case ((get({get({This, features}), '$class'})):isDefault(get({This, features}), get({get({This, openGLFeatureFactory}), 'OPENGL_AS_GAME_THREAD'})) orelse 'J2MEUtil':isHTML()) of
                true ->
                ok;
                false ->
                (fun Loop() -> case (get({This, '$class'})):isRunning(This) of true ->
                    (get({get({This, loopTimeHelper}), '$class'})):setStartTimeTNT(get({This, loopTimeHelper})),
                    (get({This, '$class'})):processGame(This),
                    (get({This, '$class'})):processLoopSleep(This),
                    Loop();
                false -> ok end end)(),
                (get({This, '$class'})):'end'(This)
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'RUN'}), E)
        end,
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END_RUNNABLE'}), This, get({get({This, commonStrings}), 'RUN'})).

setRunning(This, Running) when is_boolean(Running) ->
        'RunnableCanvas':setRunning(This, Running),
        try
            case ((((get({get({This, features}), '$class'})):isDefault(get({This, features}), get({get({This, openGLFeatureFactory}), 'OPENGL'})) orelse 'J2MEUtil':isHTML())) andalso (not Running)) of
                true ->
                CurrentDisplayableFactory = 'CurrentDisplayableFactory':getInstance(),
                (get({CurrentDisplayableFactory, '$class'})):clearRunnable(CurrentDisplayableFactory),
                (get({This, '$class'})):'end'(This);
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({This, 'SET_RUNNING'}), E)
        end.

% throws Exception
'end'(This) ->
        ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
        (get({get({This, baseGameStatistics}), '$class'})):add(get({This, baseGameStatistics}), (fun(Target_N79154) -> (get({Target_N79154, '$class'})):toString(Target_N79154) end)((fun(Target_N79161) -> (get({Target_N79161, '$class'})):append(Target_N79161, get({'CommonSeps':getInstance(), 'NEW_LINE'})) end)((fun(Target_N79168) -> (get({Target_N79168, '$class'})):append(Target_N79168, (get({get({This, baseGameStatistics}), '$class'})):toString(get({This, baseGameStatistics}))) end)((fun(Target_N79175) -> (get({Target_N79175, '$class'})):append(Target_N79175, get({'StartCanvas', 'BOT_GAME_STATS'})) end)('StringMaker':new()))))),
        (get({get({This, baseGameStatistics}), '$class'})):init(get({This, baseGameStatistics})),
        case (get({get({This, features}), '$class'})):isFeature(get({This, features}), get({'MainFeatureFactory':getInstance(), 'LOAD_ONDEMAND'})) of
            true ->
            (get({ProgressCanvas, '$class'})):start(ProgressCanvas);
            false -> ok
        end,
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Demo End", This, get({get({This, commonStrings}), 'RUN'})),
        (get({This, '$class'})):close(This),
        (fun(Target_N79439) -> (get({Target_N79439, '$class'})):removeListener(Target_N79439, This) end)('DisplayChangeEventHandler':getInstance()).

setGameState(This, GameState) ->
        ok.

getGameState(This) ->
        get({get({This, gameStateFactory}), 'PLAYING_GAME_STATE'}).

getState(This) ->
        get({This, state}).

setState(This, State) when is_integer(State) ->
        put({This, state}, State).

isHighScoreSubmitted(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Wow the AI got a high score!", This, "isHighScoreSubmitted"),
        false.

getRealHighScoresPaintable(This) ->
        get({This, realHighScoresPaintable}).

setSpecialAnimationInterface(This, SpecialAnimationInterface) ->
        (get({SpecialAnimationInterface, '$class'})):setFrame(SpecialAnimationInterface, 0),
        put({This, specialAnimationInterface}, SpecialAnimationInterface).

getSpecialAnimationInterface(This) ->
        get({This, specialAnimationInterface}).

setPaintableInterface(This, PaintableInterface) ->
        put({This, paintableInterface}, PaintableInterface).

getPaintableInterface(This) ->
        get({This, paintableInterface}).

setDefaultPaintableInterface(This, DefaultPaintableInterface) ->
        put({This, defaultPaintableInterface}, DefaultPaintableInterface).

getDefaultPaintableInterface(This) ->
        get({This, defaultPaintableInterface}).

getHighScoresFactoryInterface(This) ->
        get({This, highScoresFactoryInterface}).

setMenuInputProcessor(This, MenuInputProcessor) ->
        put({This, menuInputProcessor}, MenuInputProcessor).

getMenuInputProcessor(This) ->
        get({This, menuInputProcessor}).

getMenuForm(This) ->
        get({This, menuForm}).

setMenuForm(This, MenuForm) ->
        put({This, menuForm}, MenuForm).

isInitialized(This) ->
        get({This, initialized}).

getOverlayPaintable(This) ->
        get({This, overlayPaintable}).

setBasicGameDemoPaintable(This, BasicGameDemoPaintable) ->
        put({This, basicGameDemoPaintable}, BasicGameDemoPaintable).

getBasicGameDemoPaintable(This) ->
        get({This, basicGameDemoPaintable}).

setTempWait(This, TempWait) when is_integer(TempWait) ->
        put({This, tempWait}, TempWait).

getTempWait(This) ->
        get({This, tempWait}).

isSingleThread(This) ->
        ((fun(Target_N80881) -> (get({Target_N80881, '$class'})):isAnyThreed(Target_N80881) end)('OpenGLFeatureUtil':getInstance()) orelse get({'SWTUtil', isSWT})).

isRunningInAnotherThread(This) ->
        try
        Features = 'Features':getInstance(),
        OpenGLFeatureFactory = 'OpenGLFeatureFactory':getInstance(),
        case (get({Features, '$class'})):isDefault(Features, get({OpenGLFeatureFactory, 'OPENGL_AS_GAME_THREAD'})) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', (get({This, '$class'})):isRunning(This)})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getGameInitializationInterfaceFactoryInterface(This) ->
        get({This, gameInitializationInterfaceFactoryInterface}).

