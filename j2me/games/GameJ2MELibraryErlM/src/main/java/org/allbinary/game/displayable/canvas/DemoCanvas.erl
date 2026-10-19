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
% import org.allbinary.game.GameInfo
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
% import org.allbinary.game.score.HighScoresHelperBase
% import org.allbinary.game.score.HighScoresPaintable
% import org.allbinary.game.score.NullHighScoresSingletonFactory
% import org.allbinary.game.state.GameState
% import org.allbinary.game.state.GameStateFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.ResizableListenerHandler
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.displayable.command.MyCommandsFactory
% import org.allbinary.graphics.displayable.event.DisplayChangeEvent
% import org.allbinary.graphics.displayable.event.DisplayChangeEventHandler
% import org.allbinary.graphics.displayable.event.DisplayChangeEventListener
% import org.allbinary.graphics.displayable.screen.FullScreenPaintableFactory
% import org.allbinary.graphics.form.CommandCurrentSelectionFormFactory
% import org.allbinary.graphics.form.FormType
% import org.allbinary.graphics.form.FormTypeFactory
% import org.allbinary.graphics.form.ScrollSelectionForm
% import org.allbinary.graphics.form.ScrollSelectionFormNoneFactory
% import org.allbinary.graphics.form.item.CommandTextItemArrayFactory
% import org.allbinary.graphics.form.item.ABCustomItem
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
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.os.OperatingSystemFactory
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.InApplicationPurchaseFactory
% import org.allbinary.logic.system.security.licensing.LockableFeature
% import org.allbinary.logic.system.security.licensing.LockableFeatureFactory
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.media.audio.AllBinaryMediaManager
% import org.allbinary.media.audio.EarlySoundsFactory
% import org.allbinary.media.audio.PrimaryPlayerQueueFactory
% import org.allbinary.media.audio.SecondaryPlayerQueueFactory
% import org.allbinary.string.CommonSeps
% import org.allbinary.thread.NullThread
% import org.allbinary.thread.ThreadFactoryUtil
% import org.allbinary.thread.ThreadUtil
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('DemoCanvas').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements GameCanvasRunnableInterface
% implements MenuListener
% implements DisplayChangeEventListener
% implements DemoPaintableInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('RunnableCanvas', Function, Arguments).

static_init() ->
    put({?MODULE, id}, 0),
    put({?MODULE, 'BOT_GAME_STATS'}, "Bot Game Statistics: "),
    put({?MODULE, 'TYPE'}, 3),
    ok.

init_fields(This) ->
    put({This, basicColorFactory}, 'BasicColorFactory':getInstance()),
    put({This, myCommandsFactory}, 'MyCommandsFactory':getInstance()),
    put({This, gameAdStateFactory}, 'GameAdStateFactory':getInstance()),
    put({This, gameInputStrings}, 'GameInputStrings':getInstance()),
    put({This, gameStateFactory}, 'GameStateFactory':getInstance()),
    put({This, threadFactoryUtil}, 'ThreadFactoryUtil':getInstance()),
    put({This, formUtil}, 'FormUtil':getInstance()),
    put({This, fullscreenPaintable}, get({'FullScreenPaintableFactory':getInstance(), paintable})),
    put({This, basicGameDemoPaintable}, 'StatePaintableFactory':getInstance()),
    put({This, specialAnimationInterface}, 'SpecialAnimation':getInstance()),
    put({This, paintedSpecialAnimationInterface}, 'SpecialAnimation':getInstance()),
    put({This, fullScreenUtil}, 'FullScreenUtil':getInstance()),
    put({This, gameCanvas}, 'NullGameCanvas':getInstance()),
    put({This, highScoresHelper}, 'HighScoresHelper':new()),
    put({This, realHighScoresPaintable}, 'HighScoresPaintable':new()),
    put({This, highScoresPaintable}, 'NullPaintable':getInstance()),
    put({This, state}, 0),
    put({This, canvasThread}, get({'NullThread', 'NULL_THREAD'})),
    put({This, timeDelayHelper}, 'TimeDelayHelper':new(6000)),
    put({This, basicColor}, get({get({This, basicColorFactory}), 'RED'})),
    put({This, abeClientInformation}, undefined),
    put({This, highScoresFactoryInterface}, undefined),
    put({This, menuInputProcessor}, 'NoMenuInputProcessor':getInstance()),
    put({This, menuForm}, 'ScrollSelectionForm':getNullScrollSelectionForm()),
    put({This, gameInitializationInterfaceFactoryInterface}, undefined),
    put({This, initialized}, false),
    put({This, demoGameRunnable}, undefined),
    put({This, defaultPaintableInterface}, 'NullPaintable':getInstance()),
    put({This, paintableInterface}, 'NullPaintable':getInstance()),
    put({This, overlayPaintable}, undefined),
    put({This, progressPaintable}, 'ProgressCanvasFactory':getLazyInstance()),
    put({This, tempWait}, get({'NullWaitGameRunnable':getInstance(), 'WAIT'})),
    put({This, inputToGameKeyMapping}, (fun(Target_N70125) -> (get({Target_N70125, '$class'})):getInputMapping(Target_N70125) end)((fun(Target_N70132) -> (get({Target_N70132, '$class'})):getPersistentInputMappingInstance(Target_N70132) end)('PlatformInputMappingFactory':getInstance()))),
    put({This, gameRunnable}, 'NullWaitGameRunnable':getInstance()),
    put({This, isSingleKeyRepeatableProcessing}, (fun(Target_N74960) -> (get({Target_N74960, '$class'})):isFeature(Target_N74960, get({'InputFeatureFactory':getInstance(), 'SINGLE_KEY_REPEAT_PRESS'})) end)('Features':getInstance())),
    put({This, 'NONE'}, get({'GameKeyFactory':getInstance(), 'NONE'})),
    put({This, gameKeyEventFactory}, 'GameKeyEventFactory':getInstance()),
    put({This, lastKeyNotMapped}, (-1)),
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
        put({This, abeClientInformation}, AbeClientInformation),
        (get({This, '$class'})):setWait(This, get({'NullWaitGameRunnable':getInstance(), 'WAIT'})),
        put({This, gameInitializationInterfaceFactoryInterface}, GameInitializationInterfaceFactoryInterface),
        (fun(Target_N70379) -> (get({Target_N70379, '$class'})):initDemo(Target_N70379, AbeClientInformation, This, GameInitializationInterfaceFactoryInterface) end)('GameInitializationUtil':getInstance()),
        (fun(Target_N70429) -> (get({Target_N70429, '$class'})):fireEvent(Target_N70429, false) end)('ResizableListenerHandler':getInstance()),
        put({This, overlayPaintable}, OverlayPaintable),
        put({This, highScoresFactoryInterface}, HighScoresFactoryInterface),
        (get({This, '$class'})):setDefaultPaintableInterface(This, Paintable),
        (get({This, '$class'})):setPaintableInterface(This, (get({This, '$class'})):getDefaultPaintableInterface(This)),
        case IsContinue of
            true ->
            (get({This, '$class'})):addCommand(This, get({'GameCommandsFactory':getInstance(), 'CONTINUE_COMMAND'}));
            false -> ok
        end,
        case (fun(Target_N70640) -> (get({Target_N70640, '$class'})):isChangedFeature(Target_N70640, get({'GameFeatureFactory':getInstance(), 'SOUND'})) end)('ChangedGameFeatureListener':getInstance()) of
            true ->
            (get({This, '$class'})):mediaInit(This);
            false -> ok
        end,
        put({This, demoGameRunnable}, 'DemoGameStartupRunnable':new(This)),
        (fun(Target_N70755) -> (get({Target_N70755, '$class'})):addListenerInterface(Target_N70755, This) end)('DisplayChangeEventHandler':getInstance()).

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

onDisplayChangeEvent(This, DisplayChangeEvent) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N71123) -> (get({Target_N71123, '$class'})):toString(Target_N71123) end)((fun(Target_N71130) -> (get({Target_N71130, '$class'})):append(Target_N71130, (get({get({This, displayInfo}), '$class'})):toString(get({This, displayInfo}))) end)((fun(Target_N71137) -> (get({Target_N71137, '$class'})):append(Target_N71137, get({get({This, commonLabels}), 'START_LABEL'})) end)('StringMaker':new()))), This, get({get({This, canvasStrings}), 'ON_DISPLAY_CHANGE_EVENT'})),
            ScrollSelectionForm = (get({This, '$class'})):getMenuForm(This),
            case (ScrollSelectionForm =/= undefined) of
                true ->
                FormType = (fun(Target_N71319) -> (get({Target_N71319, '$class'})):getFormType(Target_N71319) end)('FormTypeFactory':getInstance()),
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
                List = (fun(Target_N71893) -> (get({Target_N71893, '$class'})):getList(Target_N71893) end)('LockableFeatureFactory':getInstance()),
                case (((get({List, '$class'})):size(List) > 0) andalso (not (get({InApplicationPurchaseFactory, '$class'})):isPurchased(InApplicationPurchaseFactory, (get({List, '$class'})):get(List, 0)))) of
                    true ->
                    (get({CommandList, '$class'})):add(CommandList, get({GameCommandsFactory, 'BUY_COMMAND'}));
                    false -> ok
                end;
                false -> ok
            end,
            (get({CommandList, '$class'})):add(CommandList, get({'HighScoreCommands':getInstance(), 'DISPLAY'})),
            try
                IsOverScan = (fun(Target_N72148) -> (get({Target_N72148, '$class'})):isOverScan(Target_N72148) end)((fun(Target_N72155) -> (get({Target_N72155, '$class'})):getOperatingSystemInstance(Target_N72155) end)('OperatingSystemFactory':getInstance())),
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
        CommandTextItemArrayFactory = (fun(Target_N73317) -> (get({Target_N73317, '$class'})):getCommandTextItemArrayFactory(Target_N73317) end)('DemoLimitedCommandTextItemArrayFactory':getInstance()),
        Items = (get({CommandTextItemArrayFactory, '$class'})):getInstance(CommandTextItemArrayFactory, (get({This, '$class'})):getCommandStack(This), get({get({This, basicColorFactory}), 'BLACK'}), get({get({This, basicColorFactory}), 'WHITE'})),
        FormType = (fun(Target_N73482) -> (get({Target_N73482, '$class'})):getFormType(Target_N73482) end)('FormTypeFactory':getInstance()),
        Rectangle = (get({get({This, formUtil}), '$class'})):createFormRectangle(get({This, formUtil})),
        'PreLogUtil':put((fun(Target_N73595) -> (get({Target_N73595, '$class'})):toString(Target_N73595) end)((fun(Target_N73602) -> (get({Target_N73602, '$class'})):append(Target_N73602, (get({get({This, displayInfo}), '$class'})):toString(get({This, displayInfo}))) end)((fun(Target_N73609) -> (get({Target_N73609, '$class'})):append(Target_N73609, get({get({This, commonLabels}), 'START_LABEL'})) end)('StringMaker':new()))), This, "initMenu"),
        ScrollSelectionForm = 'CommandCurrentSelectionFormFactory':getInstance(get({'StringUtil':getInstance(), 'EMPTY_STRING'}), Items, Rectangle, FormType, 15, true, get({get({This, basicColorFactory}), 'BLACK'}), get({get({This, basicColorFactory}), 'WHITE'})),
        (get({This, '$class'})):setMenuForm(This, ScrollSelectionForm),
        FormType2 = (fun(Target_N73876) -> (get({Target_N73876, '$class'})):getFormType(Target_N73876) end)('FormTypeFactory':getInstance()),
        Rectangle2 = (get({get({This, formUtil}), '$class'})):createFormRectangle(get({This, formUtil})),
        (get({ScrollSelectionForm, '$class'})):init(ScrollSelectionForm, Rectangle2, FormType2),
        case ((get({This, '$class'})):getMenuForm(This) =/= 'ScrollSelectionFormNoneFactory':getInstance()) of
            true ->
            (get({This, '$class'})):setMenuInputProcessor(This, 'CommandFormInputProcessor':new('BasicArrayListD':new(), (-1), This, (get({This, '$class'})):getMenuForm(This)));
            false -> ok
        end,
        (get({This, '$class'})):open(This).

open(This) ->
        (fun(Target_N74177) -> (get({Target_N74177, '$class'})):addListenerInterface(Target_N74177, (get({This, '$class'})):getMenuInputProcessor(This)) end)('BasicMotionGesturesHandler':getInstance()),
        (fun(Target_N74219) -> (get({Target_N74219, '$class'})):addListener(Target_N74219, (get({This, '$class'})):getMenuInputProcessor(This)) end)('GameKeyEventHandler':getInstance()).

close(This) ->
        (fun(Target_N74297) -> (get({Target_N74297, '$class'})):removeListener(Target_N74297, (get({This, '$class'})):getMenuInputProcessor(This)) end)('BasicMotionGesturesHandler':getInstance()),
        (fun(Target_N74339) -> (get({Target_N74339, '$class'})):removeListener(Target_N74339, (get({This, '$class'})):getMenuInputProcessor(This)) end)('GameKeyEventHandler':getInstance()).

getSourceId(This) ->
        get({'DemoCanvas', id}).

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
                (fun(Target_N75648) -> (get({Target_N75648, '$class'})):fireEvent(Target_N75648, GameKeyEvent) end)('DownGameKeyEventHandler':getInstance());
                false ->
                case (get({This, lastKeyNotMapped}) =/= KeyCode) of
                    true ->
                    put({This, lastKeyNotMapped}, KeyCode),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N75481) -> (get({Target_N75481, '$class'})):toString(Target_N75481) end)((fun(Target_N75488) -> (get({Target_N75488, '$class'})):appendint(Target_N75488, KeyCode) end)((fun(Target_N75495) -> (get({Target_N75495, '$class'})):append(Target_N75495, get({get({This, gameInputStrings}), 'NO_KEY'})) end)('StringMaker':new()))), This, get({get({This, gameInputStrings}), 'ADD_KEY_EVENT'}));
                    false -> ok
                end
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
                (fun(Target_N76134) -> (get({Target_N76134, '$class'})):fireEvent(Target_N76134, GameKeyEvent) end)('UpGameKeyEventHandler':getInstance());
                false ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N75970) -> (get({Target_N75970, '$class'})):toString(Target_N75970) end)((fun(Target_N75977) -> (get({Target_N75977, '$class'})):appendint(Target_N75977, KeyCode) end)((fun(Target_N75984) -> (get({Target_N75984, '$class'})):append(Target_N75984, get({get({This, gameInputStrings}), 'NO_KEY'})) end)('StringMaker':new()))), This, get({get({This, gameInputStrings}), 'REMOVE_KEY_EVENT'}))
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Key Event Error", This, get({get({This, gameInputStrings}), 'REMOVE_KEY_EVENT'}), E)
        end.

pause(This) ->
        (get({This, '$class'})):close(This),
        (get({This, '$class'})):setPaused(This, true),
        put({This, gameRunnable}, 'NullWaitGameRunnable':getInstance()),
        (get({get({This, gameCanvas}), '$class'})):pause(get({This, gameCanvas})).

unPause(This) ->
        (get({This, '$class'})):open(This),
        (get({get({This, gameCanvas}), '$class'})):unPause(get({This, gameCanvas})),
        put({This, gameRunnable}, get({get({This, gameCanvas}), gameRunnable})),
        (get({This, '$class'})):setPaused(This, false).

isPausable(This) ->
        try
        case ((fun(Target_N76611) -> (get({Target_N76611, '$class'})):getUsedRunnable(Target_N76611) end)('CurrentDisplayableFactory':getInstance()) =:= 'NullWaitGameRunnable':getInstance()) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isGameOver(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N76747) -> (get({Target_N76747, '$class'})):toString(Target_N76747) end)((fun(Target_N76754) -> (get({Target_N76754, '$class'})):append(Target_N76754, " since not a game") end)((fun(Target_N76761) -> (get({Target_N76761, '$class'})):append(Target_N76761, get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})) end)('StringMaker':new()))), This, "isGameOver"),
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
        (fun(Target_N77425) -> (get({Target_N77425, '$class'})):paint(Target_N77425, Graphics) end)((get({This, '$class'})):getBasicGameDemoPaintable(This)),
        (get({get({This, overlayPaintable}), '$class'})):paint(get({This, overlayPaintable}), Graphics),
        (get({get({This, fullscreenPaintable}), '$class'})):paint(get({This, fullscreenPaintable}), Graphics),
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
                    (fun(Target_N78062) -> (get({Target_N78062, '$class'})):setHighScores(Target_N78062, HighScores) end)((get({This, '$class'})):getRealHighScoresPaintable(This))
                end
            end;
            false -> ok
        end
        end,
        (get({This, '$class'})):setState(This, get({local, newState})),
        (get({This, '$class'})):updateDemoState(This).

updateDemoState(This) ->
        'PreLogUtil':put((fun(Target_N78315) -> (get({Target_N78315, '$class'})):toString(Target_N78315) end)((fun(Target_N78322) -> (get({Target_N78322, '$class'})):createInstance(Target_N78322, get({This, state})) end)('SmallIntegerSingletonFactory':getInstance())), This, get({This, 'SET_STATE'})),
        (fun(Target_N78381) -> (get({Target_N78381, '$class'})):setState(Target_N78381, get({This, state})) end)((get({This, '$class'})):getBasicGameDemoPaintable(This)),
        case (get({This, state}) =:= 0) of
            true ->
            put({This, highScoresPaintable}, 'NullPaintable':getInstance()),
            put({This, paintedSpecialAnimationInterface}, (get({This, '$class'})):getSpecialAnimationInterface(This)),
            case ((not (get({get({This, demoGameRunnable}), '$class'})):isRunning(get({This, demoGameRunnable}))) andalso (get({get({This, gameCanvas}), '$class'})):isInitialized(get({This, gameCanvas}))) of
                true ->
                (fun(Target_N78710) -> (get({Target_N78710, '$class'})):reset(Target_N78710) end)((get({This, '$class'})):getSpecialAnimationInterface(This));
                false -> ok
            end;
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
create(This) ->
        'PreLogUtil':put(get({get({This, commonStrings}), 'START'}), This, "create"),
        put({This, highScoresPaintable}, 'NullPaintable':getInstance()),
        RandomLevel = (get({This, '$class'})):getNextRandom(This),
        put({This, gameCanvas}, (get({This, '$class'})):createRunnable(This, RandomLevel)),
        put({This, basicColor}, (fun(Target_N79287) -> (get({Target_N79287, '$class'})):getForegroundBasicColor(Target_N79287) end)((get({get({This, gameCanvas}), '$class'})):getLayerManager(get({This, gameCanvas})))),
        (fun(Target_N79319) -> (get({Target_N79319, '$class'})):setBasicColorP(Target_N79319, get({This, basicColor})) end)((get({This, '$class'})):getRealHighScoresPaintable(This)),
        (get({get({This, gameCanvas}), '$class'})):setGameCanvasStartListener(get({This, gameCanvas}), This),
        GameInfo = (fun(Target_N79400) -> (get({Target_N79400, '$class'})):getGameInfo(Target_N79400) end)((get({get({This, gameCanvas}), '$class'})):getLayerManager(get({This, gameCanvas}))),
        (fun(Target_N79446) -> (get({Target_N79446, '$class'})):fetchHighScores(Target_N79446, GameInfo, get({This, highScoresHelper})) end)((get({This, '$class'})):getHighScoresFactoryInterface(This)).

% throws Exception
start(This) ->
        GameCanvas = get({This, gameCanvas}),
        'PreLogUtil':put((fun(Target_N79593) -> (get({Target_N79593, '$class'})):toString(Target_N79593) end)((fun(Target_N79600) -> (get({Target_N79600, '$class'})):append(Target_N79600, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), GameCanvas)) end)((fun(Target_N79607) -> (get({Target_N79607, '$class'})):append(Target_N79607, "Game Thread in DemoCanvas: ") end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'START'})),
        put({This, canvasThread}, (get({get({This, threadFactoryUtil}), '$class'})):getInstanceGameCanvasRunnable(get({This, threadFactoryUtil}), GameCanvas)),
        (get({get({This, gameCanvas}), '$class'})):setThread(get({This, gameCanvas}), get({This, canvasThread})),
        (get({get({This, threadFactoryUtil}), '$class'})):start(get({This, threadFactoryUtil}), get({This, canvasThread})),
        case ((get({This, '$class'})):getWait(This) =:= get({'NullWaitGameRunnable':getInstance(), 'WAIT'})) of
            true ->
            (get({This, '$class'})):setWait(This, (get({This, '$class'})):getTempWait(This));
            false -> ok
        end.

preDemoProcess(This) ->
        case ((not (get({get({This, gameCanvas}), '$class'})):isInitialized(get({This, gameCanvas}))) orelse ((get({get({This, gameCanvas}), '$class'})):getTitle(get({This, gameCanvas})) =:= get({'NullGameCanvas', 'NO_GAME'}))) of
            true ->
            case 'AllBinaryMediaManager':update() of
                true ->
                case (not (fun(Target_N80050) -> (get({Target_N80050, '$class'})):process(Target_N80050) end)('PrimaryPlayerQueueFactory':getInstance())) of
                    true ->
                    (fun(Target_N80083) -> (get({Target_N80083, '$class'})):process(Target_N80083) end)('SecondaryPlayerQueueFactory':getInstance());
                    false -> ok
                end;
                false -> ok
            end;
            false -> ok
        end,
        (get({get({This, overlayPaintable}), '$class'})):update(get({This, overlayPaintable})).

% throws Exception
process(This) ->
        'RunnableCanvas':process(This),
        (fun(Target_N80187) -> (get({Target_N80187, '$class'})):processInputList(Target_N80187) end)((get({This, '$class'})):getMenuInputProcessor(This)),
        (get({This, '$class'})):preDemoProcess(This),
        case (get({This, state}) =:= 0) of
            true ->
            IndexedAnimationBehavior = ((fun(Target_N80274) -> (get({Target_N80274, '$class'})):getAnimationBehavior(Target_N80274) end)((get({This, '$class'})):getSpecialAnimationInterface(This))),
            case (get({IndexedAnimationBehavior, loopIndex}) < 1) of
                true ->
                (get({get({This, timeDelayHelper}), '$class'})):setStartTimeTNT(get({This, timeDelayHelper}));
                false -> ok
            end,
            DemoGameMidlet = (get({This, '$class'})):getCustomCommandListener(This),
            case ((get({This, gameCanvas}) =/= 'NullGameCanvas':getInstance()) andalso (get({get({This, gameCanvas}), '$class'})):isGameOver(get({This, gameCanvas}))) of
                true ->
                (get({This, '$class'})):stopGameDemo(This),
                RandomLevel = (get({This, '$class'})):getNextRandom(This),
                GameInfo = (fun(Target_N80847) -> (get({Target_N80847, '$class'})):getGameInfo(Target_N80847) end)((get({get({This, gameCanvas}), '$class'})):getLayerManager(get({This, gameCanvas}))),
                (get({GameInfo, '$class'})):setCurrentLevel(GameInfo, RandomLevel),
                (get({get({This, gameCanvas}), '$class'})):setGameOver(get({This, gameCanvas}), false),
                (get({This, '$class'})):start(This);
                false ->
                case ((get({This, gameCanvas}) =:= 'NullGameCanvas':getInstance()) andalso (get({DemoGameMidlet, '$class'})):isReady(DemoGameMidlet)) of
                true ->
                case (not (get({get({This, demoGameRunnable}), '$class'})):isRunning(get({This, demoGameRunnable}))) of
                    true ->
                    (get({This, '$class'})):startDemoGame(This),
                    (get({get({This, demoGameRunnable}), '$class'})):setRunning(get({This, demoGameRunnable}), true),
                    Thread = (get({get({This, threadFactoryUtil}), '$class'})):getInstanceForRunnable(get({This, threadFactoryUtil}), get({This, demoGameRunnable})),
                    (get({get({This, demoGameRunnable}), '$class'})):setThread(get({This, demoGameRunnable}), Thread),
                    (get({get({This, threadFactoryUtil}), '$class'})):start(get({This, threadFactoryUtil}), Thread);
                    false -> ok
                end;
                false -> ok
            end
            end;
            false -> ok
        end.

% throws Exception
startDemoGame(This) ->
        'DemoCanvasProgressUtil':showProgress(This).

% throws Exception
stopGameDemo(This) ->
        case (get({This, gameCanvas}) =/= 'NullGameCanvas':getInstance()) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Set Running False", This, "stopGameDemo"),
            (get({get({This, gameCanvas}), '$class'})):setRunning(get({This, gameCanvas}), false);
            false -> ok
        end,
        (fun(Target_N81218) -> (get({Target_N81218, '$class'})):join(Target_N81218, get({This, canvasThread})) end)('ThreadUtil':getInstance()).

showGamePaintable(This) ->
        METHOD_NAME = "showGamePaintable",
        'PreLogUtil':put(get({get({This, commonStrings}), 'START'}), This, METHOD_NAME),
        IsDefault = 'J2MEUtil':isHTML(),
        case (((get({This, gameCanvas}) =/= 'NullGameCanvas':getInstance()) andalso ((((get({get({This, gameCanvas}), '$class'})):isRunning(get({This, gameCanvas})) orelse IsDefault) orelse get({'SWTUtil', isSWT})))) andalso (not (((get({get({This, gameCanvas}), '$class'})):getType(get({This, gameCanvas})) =:= get({'NullGameCanvas', 'TYPE'}))))) of
            true ->
            put({This, gameRunnable}, get({get({This, gameCanvas}), gameRunnable})),
            'PreLogUtil':put("Showing Game", This, METHOD_NAME),
            (get({This, '$class'})):setPaintableInterface(This, get({This, gameCanvas}));
            false ->
            put({This, gameRunnable}, 'NullWaitGameRunnable':getInstance()),
            'PreLogUtil':put("Not Showing Game", This, METHOD_NAME),
            (get({This, '$class'})):setPaintableInterface(This, (get({This, '$class'})):getDefaultPaintableInterface(This))
        end.

isReadyForStateChange(This) ->
        ((not (get({get({This, demoGameRunnable}), '$class'})):isRunning(get({This, demoGameRunnable}))) andalso (get({get({This, gameCanvas}), '$class'})):isInitialized(get({This, gameCanvas}))).

% throws Exception
processGame(This) ->
        (get({get({This, gameRunnable}), '$class'})):run(get({This, gameRunnable})),
        case ((not (get({get({This, specialAnimationInterface}), '$class'})):isComplete(get({This, specialAnimationInterface}))) andalso (get({This, '$class'})):isReadyForStateChange(This)) of
            true ->
            (get({get({This, specialAnimationInterface}), '$class'})):nextFrame(get({This, specialAnimationInterface}));
            false -> ok
        end,
        case ((get({get({This, timeDelayHelper}), '$class'})):isTimeTNT(get({This, timeDelayHelper})) andalso (get({This, '$class'})):isReadyForStateChange(This)) of
            true ->
            (get({This, '$class'})):demoStateChange(This);
            false ->
            (get({This, '$class'})):process(This)
        end.

run(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START_RUNNABLE'}), This, get({get({This, commonStrings}), 'RUN'})),
        try
            ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
            Features = 'Features':getInstance(),
            OpenGLFeatureFactory = 'OpenGLFeatureFactory':getInstance(),
            (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, 50, "Demo Thread"),
            (get({This, '$class'})):setCurrentThread(This),
            (get({This, '$class'})):setRunning(This, true),
            case (get({Features, '$class'})):isFeature(Features, get({'MainFeatureFactory':getInstance(), 'LOAD_ONDEMAND'})) of
                true ->
                (get({ProgressCanvas, '$class'})):'end'(ProgressCanvas);
                false ->
                (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, 50, "Demo Thread Running")
            end,
            (get({get({This, fullScreenUtil}), '$class'})):initOnRun(get({This, fullScreenUtil}), This, (get({This, '$class'})):getCustomCommandListener(This)),
            (get({This, '$class'})):initMenu(This),
            (get({This, '$class'})):initPostPaint(This),
            (get({This, '$class'})):updateDemoState(This),
            case (get({Features, '$class'})):isDefault(Features, get({OpenGLFeatureFactory, 'OPENGL_AS_GAME_THREAD'})) of
                true ->
                (fun Loop() -> case ((get({This, gameCanvas}) =:= 'NullGameCanvas':getInstance()) orelse (not (get({get({This, gameCanvas}), '$class'})):isInitialized(get({This, gameCanvas})))) of true ->
                    (get({get({This, loopTimeHelper}), '$class'})):setStartTimeTNT(get({This, loopTimeHelper})),
                    (get({This, '$class'})):processGame(This),
                    (get({This, '$class'})):processLoopSleep(This),
                    Loop();
                false -> ok end end)(),
                put({local, demoGameRunnable}, 'DemoGameRunnable':new(This)),
                put({local, currentDisplayableFactory}, 'CurrentDisplayableFactory':getInstance()),
                (get({get({local, currentDisplayableFactory}), '$class'})):setRunnable(get({local, currentDisplayableFactory}), get({local, demoGameRunnable})),
                (get({get({local, currentDisplayableFactory}), '$class'})):setMyCanvas(get({local, currentDisplayableFactory}), This),
                (fun(Target_N82987) -> (get({Target_N82987, '$class'})):onResume(Target_N82987) end)('OpenGLThreadUtil':getInstance());
                false -> ok
            end,
            case ((get({Features, '$class'})):isDefault(Features, get({OpenGLFeatureFactory, 'OPENGL_AS_GAME_THREAD'})) orelse 'J2MEUtil':isHTML()) of
                true ->
                put({local, demoGameRunnable}, 'DemoGameRunnable':new(This)),
                put({local, currentDisplayableFactory}, 'CurrentDisplayableFactory':getInstance()),
                (get({get({local, currentDisplayableFactory}), '$class'})):setRunnable(get({local, currentDisplayableFactory}), get({local, demoGameRunnable})),
                (get({get({local, currentDisplayableFactory}), '$class'})):setMyCanvas(get({local, currentDisplayableFactory}), This);
                false ->
                (fun Loop() -> case (get({This, '$class'})):isRunning(This) of true ->
                    (get({This, '$class'})):run3(This),
                    Loop();
                false -> ok end end)(),
                (get({This, '$class'})):'end'(This)
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'RUN'}), E)
        end,
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END_RUNNABLE'}), This, get({get({This, commonStrings}), 'RUN'})).

% throws Exception
run3(This) ->
        (get({get({This, loopTimeHelper}), '$class'})):setStartTimeTNT(get({This, loopTimeHelper})),
        (get({This, '$class'})):processGame(This),
        (get({This, '$class'})):processLoopSleep(This).

setRunning(This, Running) when is_boolean(Running) ->
        'RunnableCanvas':setRunning(This, Running),
        try
            Features = 'Features':getInstance(),
            OpenGLFeatureFactory = 'OpenGLFeatureFactory':getInstance(),
            case Running of
                true ->
                ok;
                false ->
                case ((((get({Features, '$class'})):isDefault(Features, get({OpenGLFeatureFactory, 'OPENGL'})) orelse 'J2MEUtil':isHTML())) orelse get({'SWTUtil', isSWT})) of
                    true ->
                    CurrentDisplayableFactory = 'CurrentDisplayableFactory':getInstance(),
                    (get({CurrentDisplayableFactory, '$class'})):clearRunnable(CurrentDisplayableFactory),
                    (get({This, '$class'})):'end'(This);
                    false -> ok
                end
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({This, 'SET_RUNNING'}), E)
        end.

% throws Exception
'end'(This) ->
        ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
        Features = 'Features':getInstance(),
        (get({get({This, baseGameStatistics}), '$class'})):add(get({This, baseGameStatistics}), (fun(Target_N84326) -> (get({Target_N84326, '$class'})):toString(Target_N84326) end)((fun(Target_N84333) -> (get({Target_N84333, '$class'})):append(Target_N84333, get({'CommonSeps':getInstance(), 'NEW_LINE'})) end)((fun(Target_N84340) -> (get({Target_N84340, '$class'})):append(Target_N84340, (get({get({This, baseGameStatistics}), '$class'})):toString(get({This, baseGameStatistics}))) end)((fun(Target_N84347) -> (get({Target_N84347, '$class'})):append(Target_N84347, get({'DemoCanvas', 'BOT_GAME_STATS'})) end)('StringMaker':new()))))),
        (get({get({This, baseGameStatistics}), '$class'})):init(get({This, baseGameStatistics})),
        case (get({Features, '$class'})):isFeature(Features, get({'MainFeatureFactory':getInstance(), 'LOAD_ONDEMAND'})) of
            true ->
            (get({ProgressCanvas, '$class'})):start(ProgressCanvas);
            false -> ok
        end,
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Demo End", This, get({get({This, commonStrings}), 'RUN'})),
        (get({This, '$class'})):close(This),
        (fun(Target_N84608) -> (get({Target_N84608, '$class'})):removeListener(Target_N84608, This) end)('DisplayChangeEventHandler':getInstance()),
        (get({This, '$class'})):stopGameDemo(This).

setGameState(This, GameState) ->
        ok.

getGameState(This) ->
        get({get({This, gameStateFactory}), 'PLAYING_GAME_STATE'}).

getGameCanvasRunnableInterface(This) ->
        get({This, gameCanvas}).

isDemoLoading(This) ->
        try
        GameCanvas = get({This, gameCanvas}),
        case (GameCanvas =:= 'NullGameCanvas':getInstance()) of
            true ->
            throw({'$return', true});
            false ->
            case (get({GameCanvas, '$class'})):isInitialized(GameCanvas) of
            true ->
            throw({'$return', false});
            false -> ok
        end
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

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
        ((fun(Target_N86257) -> (get({Target_N86257, '$class'})):isAnyThreed(Target_N86257) end)('OpenGLFeatureUtil':getInstance()) orelse get({'SWTUtil', isSWT})).

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

getType(This) ->
        get({'DemoCanvas', 'TYPE'}).

