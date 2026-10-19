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
% import javax.microedition.lcdui.ChoiceGroup
% import javax.microedition.lcdui.CommandListener
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Item
% import javax.microedition.lcdui.NullCommandListener
% import org.allbinary.AndroidUtil
% import org.allbinary.J2MEUtil
% import org.allbinary.business.advertisement.GameAdStateFactory
% import org.allbinary.canvas.BaseGameStatistics
% import org.allbinary.canvas.GameStatisticsFactory
% import org.allbinary.canvas.Processor
% import org.allbinary.canvas.RunnableCanvas
% import org.allbinary.debug.DebugFactory
% import org.allbinary.debug.NoDebug
% import org.allbinary.game.GameAdState
% import org.allbinary.game.GameInfo
% import org.allbinary.game.GameStrings
% import org.allbinary.game.GameTypeFactory
% import org.allbinary.game.Intermission
% import org.allbinary.game.IntermissionCompositeInterface
% import org.allbinary.game.IntermissionEnableListenerInterface
% import org.allbinary.game.IntermissionInterface
% import org.allbinary.game.PlayerTypesFactory
% import org.allbinary.game.commands.GameCommandsFactory
% import org.allbinary.game.configuration.InGameFeatures
% import org.allbinary.game.configuration.InGameOptionsForm
% import org.allbinary.game.configuration.event.ChangedGameFeatureListener
% import org.allbinary.game.configuration.event.GameInitializedEvent
% import org.allbinary.game.configuration.event.GameInitializedEventHandler
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.GameFeatureFactory
% import org.allbinary.game.configuration.feature.GameFeatureUtil
% import org.allbinary.game.configuration.feature.InputFeatureFactory
% import org.allbinary.game.configuration.feature.MainFeatureFactory
% import org.allbinary.game.configuration.feature.SensorFeatureFactory
% import org.allbinary.game.configuration.feature.TouchFeatureFactory
% import org.allbinary.game.displayable.GameLevelDisplayChangeEventListenersFactory
% import org.allbinary.game.init.BasicBuildGameInitializerFactory
% import org.allbinary.game.init.GameInitializationUtil
% import org.allbinary.game.input.GameInputStrings
% import org.allbinary.game.input.InputProcessor
% import org.allbinary.game.input.NoPlayerGameInput
% import org.allbinary.game.input.PlayerGameInput
% import org.allbinary.game.input.event.GameKeyEventHandler
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.SWTUtil
% import org.allbinary.game.paint.ColorFillBasePaintable
% import org.allbinary.game.paint.ColorFillPaintableFactory
% import org.allbinary.game.resource.ResourceLoadingLevel
% import org.allbinary.game.resource.ResourceLoadingLevelFactory
% import org.allbinary.game.score.HighScore
% import org.allbinary.game.score.HighScoresHelperBaseInterface
% import org.allbinary.game.score.HighScoresFactoryInterface
% import org.allbinary.game.score.HighScoresPaintable
% import org.allbinary.game.score.NullHighScoresSingletonFactory
% import org.allbinary.game.score.displayable.HighScoreTextBox
% import org.allbinary.game.state.GameState
% import org.allbinary.game.state.GameStateFactory
% import org.allbinary.graphics.GraphicsStrings
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.ScreenCapture
% import org.allbinary.graphics.ScreenCaptureFactory
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.color.BasicColorSetUtil
% import org.allbinary.graphics.displayable.CanvasStrings
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton
% import org.allbinary.graphics.displayable.command.MyCommandsFactory
% import org.allbinary.graphics.displayable.event.DisplayChangeEvent
% import org.allbinary.graphics.displayable.event.DisplayChangeEventHandler
% import org.allbinary.graphics.displayable.event.DisplayChangeEventListener
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.graphics.form.CommandCurrentSelectionFormFactory
% import org.allbinary.graphics.form.FormPaintable
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
% import org.allbinary.graphics.paint.NullInitUpdatePaintable
% import org.allbinary.graphics.paint.NullPaintable
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.graphics.paint.PaintableInterface
% import org.allbinary.image.opengles.OpenGLImageSpecificFactory
% import org.allbinary.input.gyro.SensorGameUpdateProcessor
% import org.allbinary.input.gyro.SingleSensorGameUpdateProcessor
% import org.allbinary.input.motion.button.BaseTouchInput
% import org.allbinary.input.motion.button.NoButtonsTouchInputFactory
% import org.allbinary.input.motion.button.TouchButtonFactory
% import org.allbinary.input.motion.button.TouchButtonsPaintableFactory
% import org.allbinary.input.motion.button.TouchScreenFactory
% import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler
% import org.allbinary.logic.ABSystemWrapper
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.os.OperatingSystemFactory
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.media.audio.AllBinaryMediaManager
% import org.allbinary.media.audio.PlayerQueue
% import org.allbinary.media.audio.PrimaryPlayerQueueFactory
% import org.allbinary.media.audio.SecondaryPlayerQueueFactory
% import org.allbinary.media.audio.SelectSound
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.thread.SecondaryThreadPool
% import org.allbinary.time.GameTickTimeDelayHelper
% import org.allbinary.time.GameTickTimeDelayHelperFactory
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.util.BasicArrayListUtil

-module('AllBinaryGameCanvas').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements AllBinaryGameCanvasInterface
% implements GameCanvasRunnableInterface
% implements MenuListener
% implements IntermissionCompositeInterface
% implements IntermissionEnableListenerInterface
% implements PopupMenuInterface
% implements DisplayChangeEventListener
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('RunnableCanvas', Function, Arguments).

static_init() ->
    put({?MODULE, id}, 0),
    put({?MODULE, 'TYPE'}, 2),
    ok.

init_fields(This) ->
    put({This, basicColorFactory}, 'BasicColorFactory':getInstance()),
    put({This, basicSetColorUtil}, 'BasicColorSetUtil':getInstance()),
    put({This, touchFeatureFactory}, 'TouchFeatureFactory':getInstance()),
    put({This, openGLFeatureFactory}, 'OpenGLFeatureFactory':getInstance()),
    put({This, touchButtonFactory}, 'TouchButtonFactory':getInstance()),
    put({This, gameAdStateFactory}, 'GameAdStateFactory':getInstance()),
    put({This, gameStrings}, 'GameStrings':getInstance()),
    put({This, gameInputStrings}, 'GameInputStrings':getInstance()),
    put({This, gameStateFactory}, 'GameStateFactory':getInstance()),
    put({This, gameTickTimeDelayHelper}, 'GameTickTimeDelayHelperFactory':getInstance()),
    put({This, gameTickDisplayInfoSingleton}, 'GameTickDisplayInfoSingleton':getInstance()),
    put({This, gameRunnable}, 'GameCanvasRunnable':new(This)),
    put({This, gamePauseRunnable}, 'GameCanvasPauseRunnable':new(This)),
    put({This, formUtil}, 'FormUtil':getInstance()),
    put({This, myFormUtil}, 'MyFormUtil':getInstance()),
    put({This, updateMyFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, myFontProcessor}, get({This, updateMyFontProcessor})),
    put({This, gameSpecificPaintable}, 'NullPaintable':getInstance()),
    put({This, sensorGameUpdateProcessor}, 'SingleSensorGameUpdateProcessor':new()),
    put({This, endGameInfo}, 'EndGameInfo':new()),
    put({This, startIntermissionInterface}, 'Intermission':new()),
    put({This, endLevelIntermissionInterface}, 'Intermission':new()),
    put({This, gameLayerManager}, 'AllBinaryGameLayerManager':getNullInstance()),
    put({This, gameState}, get({get({This, gameStateFactory}), 'NO_GAME_STATE'})),
    put({This, gameOver}, false),
    put({This, initialized}, false),
    put({This, gameStateTimeHelper}, 'TimeDelayHelper':new(0)),
    put({This, highScoresHelper}, undefined),
    put({This, highScoreSubmitted}, false),
    put({This, realHighScoresPaintable}, 'HighScoresPaintable':new()),
    put({This, highScoresPaintable}, 'NullPaintable':getInstance()),
    put({This, localPlayerGameInputList}, 'BasicArrayListD':new()),
    put({This, isCheating}, false),
    put({This, hashtable}, get({get({This, stdUtil}), 'NULL_TABLE'})),
    put({This, isSingleKeyRepeatableProcessing}, false),
    put({This, gameInitializationInterfaceFactoryInterface}, get({'BasicBuildGameInitializerFactory', 'NULL_BASE_BUILD_GMAE_INITIALIZER_FACTORY'})),
    put({This, touchButtonsPaintable}, 'NullPaintable':getInstance()),
    put({This, touchPaintable}, 'NullPaintable':getInstance()),
    put({This, cheatProcessor}, 'NoPlayerGameInput':getInstance()),
    put({This, gameInputProcessor}, 'Processor':getInstance()),
    put({This, endGameProcessor}, 'Processor':getInstance()),
    put({This, realEndGameProcessor}, 'Processor':getInstance()),
    put({This, startIntermissionProcessor}, 'Processor':getInstance()),
    put({This, realStartIntermissionProcessor}, 'Processor':getInstance()),
    put({This, endGamePaintable}, 'NullPaintable':getInstance()),
    put({This, endGameStatePaintable}, 'NullPaintable':getInstance()),
    put({This, nonBotPaintable}, 'NullPaintable':getInstance()),
    put({This, intermissionPaintable}, 'NullPaintable':getInstance()),
    put({This, startIntermissionPaintable}, 'NullInitUpdatePaintable':getInstance()),
    put({This, mainStateProcessor}, 'Processor':getInstance()),
    put({This, processGameProcessor}, 'Processor':getInstance()),
    put({This, highScoresFactoryInterface}, undefined),
    put({This, startLevel}, 0),
    put({This, mainMenuInputProcessor}, 'NoMenuInputProcessor':getInstance()),
    put({This, popupMenuInputProcessor}, 'NoMenuInputProcessor':getInstance()),
    put({This, menuInputProcessor}, 'NoMenuInputProcessor':getInstance()),
    put({This, menuForm}, 'ScrollSelectionForm':getNullScrollSelectionForm()),
    put({This, formPaintable}, 'NullPaintable':getInstance()),
    put({This, openMenuPaintable}, 'NullPaintable':getInstance()),
    put({This, menuPaintable}, 'NullPaintable':getInstance()),
    put({This, currentTouchInputFactory}, 'NoButtonsTouchInputFactory':getInstance()),
    put({This, colorFillPaintable}, (fun(Target_N72319) -> (get({Target_N72319, '$class'})):getInstance(Target_N72319, get({get({This, basicColorFactory}), 'BLACK'}), true) end)('ColorFillPaintableFactory':getInstance())),
    put({This, baseGameStatistics}, 'GameStatisticsFactory':getInstance()),
    put({This, primaryPlayerQueue}, 'PrimaryPlayerQueueFactory':getInstance()),
    put({This, secondaryPlayerQueue}, 'SecondaryPlayerQueueFactory':getInstance()),
    put({This, 'BUILD_GAME'}, "buildGame"),
    put({This, gameTypeFactory}, 'GameTypeFactory':getInstance()),
    put({This, screenCapture}, 'ScreenCaptureFactory':getInstance()),
    put({This, basicMotionGesturesHandler}, 'BasicMotionGesturesHandler':getInstance()),
    put({This, gameKeyEventHandler}, 'GameKeyEventHandler':getInstance()),
    put({This, gameBehavior}, undefined),
    put({This, menuBehavior}, undefined),
    put({This, progressPaintable}, 'ProgressCanvasFactory':getLazyInstance()),
    put({This, fontHeightP}, 0),
    put({This, gameCanvasStartListener}, get({'NullDemoPaintable', 'NULL_DEMO_PAINTABLE'})),
    put({This, rawGameInputProcessor}, 'GameCanvasInputProcessor':new(This)),
    put({This, rawInputProcessor}, 'FormInputProcessor':new(This)),
    put({This, inputProcessor}, (get({This, '$class'})):getRawGameInputProcessor(This)),
    put({This, 'YIELD_SLEEP'}, 100),
    ok.


new(CommandListener, GameLayerManager, HighScoresFactoryInterface, GameInitializationInterfaceFactoryInterface, Buffered) when is_boolean(Buffered) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CommandListener, GameLayerManager, HighScoresFactoryInterface, GameInitializationInterfaceFactoryInterface, Buffered),
    This.

init(This, CommandListener, GameLayerManager, HighScoresFactoryInterface, GameInitializationInterfaceFactoryInterface, Buffered) when is_boolean(Buffered) ->
        'RunnableCanvas':init(This, CommandListener, get({'CanvasStrings':getInstance(), 'EMPTY_CHILD_NAME_LIST'}), true),
        init_fields(This),
        put({This, highScoresHelper}, (get({HighScoresFactoryInterface, '$class'})):createHighScoresHelper(HighScoresFactoryInterface)),
        put({This, gameInitializationInterfaceFactoryInterface}, GameInitializationInterfaceFactoryInterface),
        (get({This, '$class'})):init(This, GameLayerManager, Buffered),
        put({This, highScoresFactoryInterface}, HighScoresFactoryInterface),
        case (((fun(Target_N73101) -> (get({Target_N73101, '$class'})):getGameType(Target_N73101) end)((get({get({This, gameLayerManager}), '$class'})):getGameInfo(get({This, gameLayerManager}))) =:= get({get({This, gameTypeFactory}), 'BOT'})) orelse ((fun(Target_N73152) -> (get({Target_N73152, '$class'})):getGameType(Target_N73152) end)((get({get({This, gameLayerManager}), '$class'})):getGameInfo(get({This, gameLayerManager}))) =:= get({get({This, gameTypeFactory}), 'NONE'}))) of
            true ->
            put({This, gameBehavior}, 'DemoGameBehavior':getInstance()),
            put({This, menuBehavior}, 'BaseMenuBehavior':getInstance());
            false ->
            put({This, gameBehavior}, 'BaseGameBehavior':getInstance()),
            put({This, menuBehavior}, (get({This, '$class'})):getInGameMenuBehavior(This))
        end,
        (get({This, '$class'})):initPopupMenu(This),
        (get({This, '$class'})):initMenu(This),
        (get({This, '$class'})):initSpecialPaint(This),
        (fun(Target_N73402) -> (get({Target_N73402, '$class'})):addListenerInterface(Target_N73402, This) end)('DisplayChangeEventHandler':getInstance()).

updateMeasurement(This, Graphics) ->
        try
            Font = (get({Graphics, '$class'})):getFont(Graphics),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N73666) -> (get({Target_N73666, '$class'})):toString(Target_N73666) end)((fun(Target_N73673) -> (get({Target_N73673, '$class'})):appendint(Target_N73673, trunc((get({Font, '$class'})):getHeight(Font))) end)((fun(Target_N73680) -> (get({Target_N73680, '$class'})):append(Target_N73680, get({get({This, canvasStrings}), 'FD_HEIGHT'})) end)((fun(Target_N73687) -> (get({Target_N73687, '$class'})):appendint(Target_N73687, trunc('MyFontProcessor':defaultCharWidth(Font))) end)((fun(Target_N73694) -> (get({Target_N73694, '$class'})):append(Target_N73694, get({get({This, canvasStrings}), 'FD_WIDTH'})) end)((fun(Target_N73701) -> (get({Target_N73701, '$class'})):append(Target_N73701, get({get({This, commonStrings}), 'START'})) end)('StringMaker':new())))))), This, get({get({This, canvasStrings}), 'UPDATE_MEASUREMENT'})),
            put({This, fontHeightP}, (get({Font, '$class'})):getHeight(Font)),
            (get({get({This, myFormUtil}), '$class'})):updateMeasurement(get({This, myFormUtil}), Graphics),
            PopupMenuRectangle = (get({get({This, myFormUtil}), '$class'})):getPopupMenuRectangle(get({This, myFormUtil})),
            BasicPopupMenuPaintable = ((get({This, '$class'})):getOpenMenuPaintable(This)),
            (get({BasicPopupMenuPaintable, '$class'})):init(BasicPopupMenuPaintable, PopupMenuRectangle),
            case ((get({This, '$class'})):getPopupMenuInputProcessor(This) =/= 'NoMenuInputProcessor':getInstance()) of
                true ->
                PopupMenuInputProcessor = ((get({This, '$class'})):getPopupMenuInputProcessor(This)),
                (get({PopupMenuInputProcessor, '$class'})):init(PopupMenuInputProcessor, PopupMenuRectangle);
                false -> ok
            end,
            put({This, myFontProcessor}, 'MyFontProcessor':getInstance())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, canvasStrings}), 'ON_DISPLAY_CHANGE_EVENT'}), E)
        end.

getInGameMenuBehavior(This) ->
        'InGameMenuBehavior':getInstance().

setCurrentThread(This) ->
        case 'J2MEUtil':isHTML() of
            true ->
            'RunnableCanvas':setCurrentThreadFake(This);
            false ->
            'RunnableCanvas':setCurrentThread(This)
        end.

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

onDisplayChangeEvent(This, DisplayChangeEvent) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N74722) -> (get({Target_N74722, '$class'})):toString(Target_N74722) end)((fun(Target_N74729) -> (get({Target_N74729, '$class'})):append(Target_N74729, (fun(Target_N74780) -> (get({Target_N74780, '$class'})):toString(Target_N74780) end)('DisplayInfoSingleton':getInstance())) end)((fun(Target_N74736) -> (get({Target_N74736, '$class'})):append(Target_N74736, get({get({This, commonStrings}), 'START'})) end)('StringMaker':new()))), This, get({get({This, canvasStrings}), 'UPDATE_MEASUREMENT'})),
            put({This, myFontProcessor}, get({This, updateMyFontProcessor})),
            (get({get({This, menuBehavior}), '$class'})):onDisplayChangeEvent(get({This, menuBehavior}), This, DisplayChangeEvent)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, canvasStrings}), 'ON_DISPLAY_CHANGE_EVENT'}), E)
        end.

% throws Exception
updateMenuFromEvent(This, DisplayChangeEvent) ->
        FormType = (fun(Target_N75090) -> (get({Target_N75090, '$class'})):getFormType(Target_N75090) end)('FormTypeFactory':getInstance()),
        Rectangle = (get({get({This, formUtil}), '$class'})):createFormRectangle(get({This, formUtil})),
        (get({get({This, menuForm}), '$class'})):init(get({This, menuForm}), Rectangle, FormType),
        case (get({This, currentTouchInputFactory}) =/= 'NoButtonsTouchInputFactory':getInstance()) of
            true ->
            (get({get({This, touchButtonFactory}), '$class'})):toggle(get({This, touchButtonFactory}), (get({This, '$class'})):isPaused(This), (get({get({This, currentTouchInputFactory}), '$class'})):getList(get({This, currentTouchInputFactory})));
            false -> ok
        end,
        put({This, myFontProcessor}, get({This, updateMyFontProcessor})).

% throws Exception
processSleep(This) ->
        'RunnableCanvas':processSleep(This),
        case 'AllBinaryMediaManager':update() of
            true ->
            case (not (get({get({This, primaryPlayerQueue}), '$class'})):process(get({This, primaryPlayerQueue}))) of
                true ->
                (get({get({This, secondaryPlayerQueue}), '$class'})):process(get({This, secondaryPlayerQueue}));
                false -> ok
            end;
            false -> ok
        end,
        case ((get({get({This, menuInputProcessor}), '$class'})):processInputList(get({This, menuInputProcessor})) =/= (-1)) of
            true ->
            (get({get({This, runnableCanvasRefreshHelper}), '$class'})):process(get({This, runnableCanvasRefreshHelper}));
            false -> ok
        end.

% throws Exception
initPopupMenu(This) ->
        case (get({This, popupMenuInputProcessor}) =:= 'NoMenuInputProcessor':getInstance()) of
            true ->
            Features = 'Features':getInstance(),
            PopupMenuRectangle = (get({get({This, myFormUtil}), '$class'})):getPopupMenuRectangle(get({This, myFormUtil})),
            case (get({Features, '$class'})):isFeature(Features, get({get({This, touchFeatureFactory}), 'TOUCH_ENABLED'})) of
                true ->
                (get({This, '$class'})):setOpenMenuPaintable(This, 'BasicPopupMenuPaintable':new(PopupMenuRectangle, (get({get({This, gameLayerManager}), '$class'})):getBackgroundBasicColor(get({This, gameLayerManager})), (get({get({This, gameLayerManager}), '$class'})):getForegroundBasicColor(get({This, gameLayerManager})))),
                (get({This, '$class'})):setPopupMenuInputProcessor(This, 'PopupMenuInputProcessor':new('BasicArrayListD':new(), (-1), This, PopupMenuRectangle));
                false -> ok
            end;
            false ->
            ok
        end.

initMenu(This) ->
        try
            (get({get({This, menuBehavior}), '$class'})):initMenu(get({This, menuBehavior}), This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "initMenu", E)
        end.

% throws Exception
initMenu2(This) ->
        (get({This, '$class'})):closeMenu(This),
        FormType = (fun(Target_N76243) -> (get({Target_N76243, '$class'})):getFormType(Target_N76243) end)('FormTypeFactory':getInstance()),
        GameLimitedCommandTextItemArrayFactory = 'GameLimitedCommandTextItemArrayFactory':getInstance(),
        CommandTextItemArrayFactory = (get({GameLimitedCommandTextItemArrayFactory, '$class'})):getCommandTextItemArrayFactory(GameLimitedCommandTextItemArrayFactory),
        Items = (get({CommandTextItemArrayFactory, '$class'})):getInstance(CommandTextItemArrayFactory, (get({This, '$class'})):getCommandStack(This), (get({get({This, gameLayerManager}), '$class'})):getBackgroundBasicColor(get({This, gameLayerManager})), (get({get({This, gameLayerManager}), '$class'})):getForegroundBasicColor(get({This, gameLayerManager}))),
        Rectangle = (get({get({This, formUtil}), '$class'})):createFormRectangle(get({This, formUtil})),
        (get({This, '$class'})):setMenuForm(This, 'CommandCurrentSelectionFormFactory':getInstance(get({'StringUtil':getInstance(), 'EMPTY_STRING'}), Items, Rectangle, FormType, 25, false, (get({get({This, gameLayerManager}), '$class'})):getBackgroundBasicColor(get({This, gameLayerManager})), (get({get({This, gameLayerManager}), '$class'})):getForegroundBasicColor(get({This, gameLayerManager})))),
        ScrollSelectionForm = (get({This, '$class'})):getMenuForm(This),
        Features = 'Features':getInstance(),
        case (get({Features, '$class'})):isFeature(Features, get({get({This, touchFeatureFactory}), 'TOUCH_ENABLED'})) of
            true ->
            put({This, mainMenuInputProcessor}, 'PopupCommandFormInputProcessor':new('BasicArrayListD':new(), (-1), This, ScrollSelectionForm, (get({This, '$class'})):getPopupMenuInputProcessor(This)));
            false ->
            ok
        end,
        (get({This, '$class'})):setMenuInputProcessor(This, (get({This, '$class'})):getPopupMenuInputProcessor(This)),
        case (ScrollSelectionForm =/= 'ScrollSelectionFormNoneFactory':getInstance()) of
            true ->
            (get({This, '$class'})):setFormPaintable(This, 'FormPaintable':new(ScrollSelectionForm));
            false ->
            ok
        end,
        (get({This, '$class'})):closeMenu(This).

updateMenu(This) ->
        try
            (get({get({This, menuBehavior}), '$class'})):updateMenu(get({This, menuBehavior}), This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "initMenu", E)
        end.

% throws Exception
updateMenu2(This) ->
        ScrollSelectionForm = (get({This, '$class'})):getMenuForm(This),
        (get({ScrollSelectionForm, '$class'})):deleteAll(ScrollSelectionForm),
        GameLimitedCommandTextItemArrayFactory = 'GameLimitedCommandTextItemArrayFactory':getInstance(),
        CommandTextItemArrayFactory = (get({GameLimitedCommandTextItemArrayFactory, '$class'})):getCommandTextItemArrayFactory(GameLimitedCommandTextItemArrayFactory),
        Items = (get({CommandTextItemArrayFactory, '$class'})):getInstance(CommandTextItemArrayFactory, (get({This, '$class'})):getCommandStack(This), (get({get({This, gameLayerManager}), '$class'})):getBackgroundBasicColor(get({This, gameLayerManager})), (get({get({This, gameLayerManager}), '$class'})):getForegroundBasicColor(get({This, gameLayerManager}))),
        Size = array:size(Items),
        lists:foreach(fun(Index) ->
            (get({ScrollSelectionForm, '$class'})):append(ScrollSelectionForm, array:get(Index, Items))
        end, lists:seq(0, Size - 1)),
        FormType = (fun(Target_N77696) -> (get({Target_N77696, '$class'})):getFormType(Target_N77696) end)('FormTypeFactory':getInstance()),
        Rectangle = (get({get({This, formUtil}), '$class'})):createFormRectangle(get({This, formUtil})),
        (get({ScrollSelectionForm, '$class'})):init(ScrollSelectionForm, Rectangle, FormType).

pause(This) ->
        (get({get({This, gameBehavior}), '$class'})):pause(get({This, gameBehavior}), This),
        (get({This, '$class'})):closeMenu(This),
        'RunnableCanvas':pause(This),
        (get({get({This, touchButtonFactory}), '$class'})):toggle(get({This, touchButtonFactory}), (get({This, '$class'})):isPaused(This), (fun(Target_N77961) -> (get({Target_N77961, '$class'})):getImmutableInstance(Target_N77961) end)('BasicArrayListUtil':getInstance())),
        (get({get({This, tsUtil}), '$class'})):gc(get({This, tsUtil})).

unPause(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, gameStrings}), 'UNPAUSE'})),
        (get({This, '$class'})):closeMenu(This),
        (get({get({This, tsUtil}), '$class'})):gc(get({This, tsUtil})),
        'RunnableCanvas':unPause(This),
        (get({get({This, touchButtonFactory}), '$class'})):toggle(get({This, touchButtonFactory}), (get({This, '$class'})):isPaused(This), (fun(Target_N78209) -> (get({Target_N78209, '$class'})):getImmutableInstance(Target_N78209) end)('BasicArrayListUtil':getInstance())),
        (get({get({This, gameBehavior}), '$class'})):unPause(get({This, gameBehavior}), This).

isPausable(This) ->
        try
        case ((fun(Target_N78312) -> (get({Target_N78312, '$class'})):getUsedRunnable(Target_N78312) end)('CurrentDisplayableFactory':getInstance()) =:= 'NullWaitGameRunnable':getInstance()) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
popupMenu(This) ->
        (get({get({This, menuBehavior}), '$class'})):popupMenu(get({This, menuBehavior}), This).

% throws Exception
popupMenu2(This) ->
        (get({get({This, primaryPlayerQueue}), '$class'})):add(get({This, primaryPlayerQueue}), 'SelectSound':getInstance()),
        (get({This, '$class'})):setMenuPaintable(This, (get({This, '$class'})):getFormPaintable(This)),
        (get({This, '$class'})):setMenuInputProcessor(This, get({This, mainMenuInputProcessor})),
        (get({get({This, basicMotionGesturesHandler}), '$class'})):addListenerInterface(get({This, basicMotionGesturesHandler}), get({This, mainMenuInputProcessor})),
        (get({get({This, gameKeyEventHandler}), '$class'})):addListener(get({This, gameKeyEventHandler}), get({This, mainMenuInputProcessor})).

% throws Exception
toggleMenu(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, gameStrings}), 'TOGGLE_MENU'})),
        case ((get({This, '$class'})):getMenuPaintable(This) =:= (get({This, '$class'})):getOpenMenuPaintable(This)) of
            true ->
            (get({This, '$class'})):pause(This),
            (get({This, '$class'})):updateMenu(This),
            (get({This, '$class'})):popupMenu(This);
            false ->
            case ((get({This, '$class'})):getMenuPaintable(This) =:= (get({This, '$class'})):getFormPaintable(This)) of
            true ->
            (get({get({This, primaryPlayerQueue}), '$class'})):add(get({This, primaryPlayerQueue}), 'SelectSound':getInstance()),
            (get({This, '$class'})):unPause(This);
            false -> ok
        end
        end.

closeMenu(This) ->
        (get({get({This, menuBehavior}), '$class'})):closeMenu(get({This, menuBehavior}), This).

closeMenu2(This) ->
        (get({This, '$class'})):setMenuPaintable(This, (get({This, '$class'})):getOpenMenuPaintable(This)),
        (get({get({This, basicMotionGesturesHandler}), '$class'})):removeListener(get({This, basicMotionGesturesHandler}), get({This, mainMenuInputProcessor})),
        (get({get({This, gameKeyEventHandler}), '$class'})):removeListener(get({This, gameKeyEventHandler}), get({This, mainMenuInputProcessor})),
        (get({This, '$class'})):setMenuInputProcessor(This, (get({This, '$class'})):getPopupMenuInputProcessor(This)).

open(This) ->
        (get({get({This, basicMotionGesturesHandler}), '$class'})):addListenerInterface(get({This, basicMotionGesturesHandler}), get({This, menuInputProcessor})),
        (get({get({This, gameKeyEventHandler}), '$class'})):addListener(get({This, gameKeyEventHandler}), get({This, menuInputProcessor})).

close(This) ->
        (get({get({This, basicMotionGesturesHandler}), '$class'})):removeListener(get({This, basicMotionGesturesHandler}), get({This, menuInputProcessor})),
        (get({get({This, gameKeyEventHandler}), '$class'})):removeListener(get({This, gameKeyEventHandler}), get({This, menuInputProcessor})),
        (get({get({This, primaryPlayerQueue}), '$class'})):clear(get({This, primaryPlayerQueue})),
        (get({get({This, secondaryPlayerQueue}), '$class'})):clear(get({This, secondaryPlayerQueue})).

% throws Exception
processorInit(This) ->
        (get({This, '$class'})):setMainStateProcessor(This, 'Processor':getInstance()),
        (get({This, '$class'})):setProcessGameProcessorInit(This).

setProcessGameProcessorInit(This) ->
        (get({This, '$class'})):setProcessGameProcessor(This, 'GameProcessor':new(This)).

initSpecialPaint(This) ->
        (get({get({This, menuBehavior}), '$class'})):initSpecialPaint(get({This, menuBehavior}), This).

% throws Exception
init(This, GameLayerManager, Buffered) when is_boolean(Buffered) ->
        (get({get({This, gameStateTimeHelper}), '$class'})):setStartTimeTNT(get({This, gameStateTimeHelper})),
        (get({This, '$class'})):setHighScoreSubmitted(This, false),
        (get({This, '$class'})):setLayerManager(This, GameLayerManager),
        case (not Buffered) of
            true ->
            BUFF_MESSAGE = "XXX Not Buffering Causes Concurrency Issues XXX",
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), BUFF_MESSAGE, This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false ->
            erlang:error({'Exception', "Buffering is disabled"})
        end,
        (get({This, '$class'})):setGameInputProcessor(This, 'Processor':getInstance()),
        Features = 'Features':getInstance(),
        case (get({Features, '$class'})):isFeature(Features, get({'GameFeatureFactory':getInstance(), 'CHEATING'})) of
            true ->
            put({This, isCheating}, true),
            put({This, cheatProcessor}, 'CheatGameInputProcessor':new(This)),
            (get({get({This, gameKeyEventHandler}), '$class'})):addListener(get({This, gameKeyEventHandler}), get({This, cheatProcessor}));
            false ->
            put({This, isCheating}, false),
            put({This, cheatProcessor}, 'NoPlayerGameInput':getInstance())
        end,
        put({This, realEndGameProcessor}, 'EndGameProcessor':new(This)),
        (get({This, '$class'})):setEndGameProcessor(This, 'Processor':getInstance()),
        put({This, realStartIntermissionProcessor}, 'StartIntermissionProcessor':new(This)),
        put({This, startIntermissionProcessor}, 'Processor':getInstance()),
        (get({This, '$class'})):setEndGameStatePaintable(This, 'EndGamePaintable':new(This)),
        (get({This, '$class'})):setEndGamePaintable(This, 'NullPaintable':getInstance()),
        (get({This, '$class'})):setIntermissionPaintable(This, 'NullPaintable':getInstance()),
        (fun(Target_N80495) -> (get({Target_N80495, '$class'})):setListener(Target_N80495, This) end)((get({This, '$class'})):getStartIntermissionInterface(This)).

notifyIntermission(This, Enable) when is_boolean(Enable) ->
        case Enable of
            true ->
            put({This, startIntermissionProcessor}, get({This, realStartIntermissionProcessor}));
            false ->
            put({This, startIntermissionProcessor}, 'Processor':getInstance())
        end,
        case Enable of
            true ->
            (get({This, '$class'})):setIntermissionPaintable(This, (get({This, '$class'})):getStartIntermissionPaintable(This));
            false ->
            (get({This, '$class'})):setIntermissionPaintable(This, 'NullPaintable':getInstance())
        end.

% throws Exception
mediaInit(This) ->
        'ForcedLogUtil':log(get({get({This, commonStrings}), 'NOT_IMPLEMENTED'}), This).

% throws Exception
initConfigurable(This, AbeClientInformation) ->
        ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
        (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, 50, "Setting Configurables"),
        (fun(Target_N80989) -> (get({Target_N80989, '$class'})):initGame(Target_N80989, AbeClientInformation, This, get({This, gameInitializationInterfaceFactoryInterface})) end)('GameInitializationUtil':getInstance()),
        GameFeatureFactory = 'GameFeatureFactory':getInstance(),
        ChangedGameFeatureListener = 'ChangedGameFeatureListener':getInstance(),
        case (get({ChangedGameFeatureListener, '$class'})):isChangedFeature(ChangedGameFeatureListener, get({GameFeatureFactory, 'SOUND'})) of
            true ->
            Features = 'Features':getInstance(),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N81255) -> (get({Target_N81255, '$class'})):toString(Target_N81255) end)((fun(Target_N81262) -> (get({Target_N81262, '$class'})):appendboolean(Target_N81262, (get({Features, '$class'})):isFeature(Features, get({GameFeatureFactory, 'SOUND'}))) end)((fun(Target_N81269) -> (get({Target_N81269, '$class'})):append(Target_N81269, "Sound Changing To: ") end)('StringMaker':new()))), This, "initConfigurable"),
            (get({This, '$class'})):mediaInit(This),
            (get({ChangedGameFeatureListener, '$class'})):remove(ChangedGameFeatureListener, get({GameFeatureFactory, 'SOUND'}));
            false -> ok
        end,
        SensorFeatureFactory = 'SensorFeatureFactory':getInstance(),
        case (((get({ChangedGameFeatureListener, '$class'})):isChangedFeature(ChangedGameFeatureListener, get({SensorFeatureFactory, 'ORIENTATION_SENSORS'})) orelse (get({ChangedGameFeatureListener, '$class'})):isChangedFeature(ChangedGameFeatureListener, get({SensorFeatureFactory, 'NO_ORIENTATION'}))) orelse (get({ChangedGameFeatureListener, '$class'})):isChangedFeature(ChangedGameFeatureListener, get({SensorFeatureFactory, 'SIMULATED_ORIENTATION_SENSORS'}))) of
            true ->
            (get({ChangedGameFeatureListener, '$class'})):remove(ChangedGameFeatureListener, get({SensorFeatureFactory, 'NO_ORIENTATION'})),
            (get({ChangedGameFeatureListener, '$class'})):remove(ChangedGameFeatureListener, get({SensorFeatureFactory, 'ORIENTATION_SENSORS'})),
            (get({ChangedGameFeatureListener, '$class'})):remove(ChangedGameFeatureListener, get({SensorFeatureFactory, 'SIMULATED_ORIENTATION_SENSORS'}));
            false -> ok
        end,
        ResourceLoadingLevelFactory = 'ResourceLoadingLevelFactory':getInstance(),
        (get({This, '$class'})):loadResourceLoadingLevel(This, get({ResourceLoadingLevelFactory, 'LOAD_GAME'})).

% throws Exception
initApp(This, AbeClientInformation) ->
        (get({This, '$class'})):initConfigurable(This, AbeClientInformation),
        (get({This, '$class'})):processorInit(This),
        (get({get({This, sensorGameUpdateProcessor}), '$class'})):process(get({This, sensorGameUpdateProcessor}), get({This, gameLayerManager})),
        (get({get({This, sensorGameUpdateProcessor}), '$class'})):sendNotifications(get({This, sensorGameUpdateProcessor}), get({This, gameLayerManager})),
        (get({This, '$class'})):initTouch(This).

% throws Exception
initTouch(This) ->
        GameInitializedEvent = get({'GameInitializationUtil':getInstance(), 'EVENT'}),
        ResourceLoadingLevelFactory = 'ResourceLoadingLevelFactory':getInstance(),
        (get({GameInitializedEvent, '$class'})):setResourceLoadingLevel(GameInitializedEvent, get({ResourceLoadingLevelFactory, 'LOAD_TOUCH'})),
        (fun(Target_N82198) -> (get({Target_N82198, '$class'})):fireEvent(Target_N82198, GameInitializedEvent) end)('GameInitializedEventHandler':getInstance()),
        (get({get({This, touchButtonFactory}), '$class'})):defaultList(get({This, touchButtonFactory})),
        (get({This, '$class'})):updateTouch(This),
        (get({This, '$class'})):postInitTouch(This).

% throws Exception
updateCurrentTouchInputFactory(This, NextTouchInput) ->
        case (NextTouchInput =/= get({This, currentTouchInputFactory})) of
            true ->
            put({This, currentTouchInputFactory}, NextTouchInput),
            'PreLogUtil':put((get({get({This, currentTouchInputFactory}), '$class'})):toString(get({This, currentTouchInputFactory})), This, get({get({This, gameInputStrings}), 'UDPATE_CURRENT_TOUCH_INPUT_FACTORY'})),
            (get({get({This, touchButtonFactory}), '$class'})):toggle(get({This, touchButtonFactory}), (get({This, '$class'})):isPaused(This), (get({get({This, currentTouchInputFactory}), '$class'})):getList(get({This, currentTouchInputFactory})));
            false -> ok
        end.

% throws Exception
updateTouch(This) ->
        (get({get({This, gameBehavior}), '$class'})):updateTouch(get({This, gameBehavior}), This).

% throws Exception
updateTouch2(This) ->
        Features = 'Features':getInstance(),
        case (get({Features, '$class'})):isFeature(Features, get({get({This, touchFeatureFactory}), 'AUTO_HIDE_SHOW_SCREEN_BUTTONS'})) of
            true ->
            case (((fun(Target_N82745) -> (get({Target_N82745, '$class'})):getCurrentLevel(Target_N82745) end)((get({get({This, gameLayerManager}), '$class'})):getGameInfo(get({This, gameLayerManager}))) - (get({This, '$class'})):getStartLevel(This)) =:= 1) of
                true ->
                (get({This, '$class'})):setTouchPaintableP(This, 'NullPaintable':getInstance());
                false -> ok
            end;
            false -> ok
        end.

% throws Exception
postInitTouch(This) ->
        (get({This, '$class'})):setTouchButtonsPaintable(This, 'TouchButtonsPaintableFactory':getInstance((get({get({This, gameLayerManager}), '$class'})):getForegroundBasicColor(get({This, gameLayerManager})))),
        (get({This, '$class'})):updateScreenButtonPaintable(This).

initCommands(This, CmdListener) ->
        (get({This, '$class'})):removeAllCommands(This),
        (get({This, '$class'})):addCommands(This),
        (get({This, '$class'})):setCommandListener(This, CmdListener).

addCommands(This) ->
        GameCommandsFactory = 'GameCommandsFactory':getInstance(),
        MyCommandsFactory = 'MyCommandsFactory':getInstance(),
        case ('DebugFactory':getInstance() =/= 'NoDebug':getInstance()) of
            true ->
            (get({This, '$class'})):addCommand(This, get({GameCommandsFactory, 'START_TRACE'}));
            false -> ok
        end,
        (get({This, '$class'})):addCommand(This, get({GameCommandsFactory, 'RESTART_COMMAND'})),
        (get({This, '$class'})):addCommand(This, get({MyCommandsFactory, 'PAUSE_COMMAND'})),
        (get({This, '$class'})):addCommand(This, get({GameCommandsFactory, 'QUIT_COMMAND'})),
        IsOverScan = (fun(Target_N83391) -> (get({Target_N83391, '$class'})):isOverScan(Target_N83391) end)((fun(Target_N83398) -> (get({Target_N83398, '$class'})):getOperatingSystemInstance(Target_N83398) end)('OperatingSystemFactory':getInstance())),
        case 'J2MEUtil':isHTML() of
            true ->
            ok;
            false ->
            case get({'SWTUtil', isSWT}) of
            true ->
            ok;
            false ->
            case (not IsOverScan) of
            true ->
            case ((fun(Target_N83501) -> (get({Target_N83501, '$class'})):isTouch(Target_N83501) end)('TouchScreenFactory':getInstance()) andalso (fun(Target_N83525) -> (get({Target_N83525, '$class'})):isAny(Target_N83525) end)('InGameFeatures':new())) of
                true ->
                (get({This, '$class'})):addCommand(This, get({'InGameOptionsForm', 'DISPLAY'}));
                false -> ok
            end,
            (get({This, '$class'})):addCommand(This, get({GameCommandsFactory, 'SAVE'})),
            (get({This, '$class'})):addCommand(This, get({GameCommandsFactory, 'DISPLAY_LOAD_FORM'}));
            false -> ok
        end
        end
        end.

itemStateChanged(This, Item) ->
        try
            ItemLabel = (get({Item, '$class'})):getLabel(Item),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N83781) -> (get({Target_N83781, '$class'})):toString(Target_N83781) end)((fun(Target_N83788) -> (get({Target_N83788, '$class'})):append(Target_N83788, ItemLabel) end)((fun(Target_N83795) -> (get({Target_N83795, '$class'})):append(Target_N83795, get({get({This, commonLabels}), 'ITEM_LABEL'})) end)('StringMaker':new()))), This, "itemStateChanged"),
            case allbinary_java:instance_of(Item, 'ChoiceGroup') of
                true ->
                GameFeatureUtil = 'GameFeatureUtil':getInstance(),
                case (get({GameFeatureUtil, '$class'})):isExclusive(GameFeatureUtil, ItemLabel) of
                    true ->
                    (get({GameFeatureUtil, '$class'})):updateExclusiveForChoiceGroup(GameFeatureUtil, Item);
                    false ->
                    (get({GameFeatureUtil, '$class'})):updateMultiple(GameFeatureUtil, Item)
                end;
                false -> ok
            end,
            (get({get({This, sensorGameUpdateProcessor}), '$class'})):process(get({This, sensorGameUpdateProcessor}), get({This, gameLayerManager})),
            (get({This, '$class'})):updateTouch(This),
            (get({This, '$class'})):updateScreenButtonPaintable(This),
            (get({get({This, sensorGameUpdateProcessor}), '$class'})):sendNotifications(get({This, sensorGameUpdateProcessor}), get({This, gameLayerManager}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "itemStateChanged", E)
        end.

% throws Exception
updateScreenButtonPaintable(This) ->
        (get({get({This, gameBehavior}), '$class'})):updateScreenButtonPaintable(get({This, gameBehavior}), This).

updateScreenButtonPaintable2(This) ->
        Features = 'Features':getInstance(),
        case (get({Features, '$class'})):isFeature(Features, get({get({This, touchFeatureFactory}), 'AUTO_HIDE_SHOW_SCREEN_BUTTONS'})) of
            true ->
            (get({This, '$class'})):setTouchPaintableP(This, (get({This, '$class'})):getTouchButtonsPaintable(This)),
            (get({This, '$class'})):setStartLevel(This, (fun(Target_N84753) -> (get({Target_N84753, '$class'})):getCurrentLevel(Target_N84753) end)((get({get({This, gameLayerManager}), '$class'})):getGameInfo(get({This, gameLayerManager}))));
            false ->
            case (get({Features, '$class'})):isFeature(Features, get({get({This, touchFeatureFactory}), 'SHOW_SCREEN_BUTTONS'})) of
            true ->
            (get({This, '$class'})):setTouchPaintableP(This, (get({This, '$class'})):getTouchButtonsPaintable(This));
            false ->
            case (get({Features, '$class'})):isFeature(Features, get({get({This, touchFeatureFactory}), 'HIDE_SCREEN_BUTTONS'})) of
            true ->
            (get({This, '$class'})):setTouchPaintableP(This, 'NullPaintable':getInstance());
            false ->
            (get({This, '$class'})):setTouchPaintableP(This, 'NullPaintable':getInstance())
        end
        end
        end.

getLayerManager(This) ->
        get({This, gameLayerManager}).

setLayerManager(This, LayerManager) ->
        put({This, gameLayerManager}, LayerManager).

isGameOver(This) ->
        get({This, gameOver}).

setGameOver(This, GameOver) when is_boolean(GameOver) ->
        put({This, gameOver}, GameOver).

% throws Exception
processGameOver(This) ->
        'PreLogUtil':put(get({get({This, commonStrings}), 'START'}), This, get({get({This, gameStrings}), 'SET_GAME_OVER'})),
        (get({This, '$class'})):setGameOver(This, true),
        (get({This, '$class'})):removePauseCommand(This),
        (get({This, '$class'})):setGameState(This, get({get({This, gameStateFactory}), 'SHOW_END_RESULT_GAME_STATE'})),
        (get({This, '$class'})):setEndGamePaintable(This, (get({This, '$class'})):getEndGameStatePaintable(This)).

isHighScoreSubmitted(This) ->
        get({This, highScoreSubmitted}).

% throws Exception
setHighScoreSubmitted(This, HighScoreSubmitted) when is_boolean(HighScoreSubmitted) ->
        put({This, highScoreSubmitted}, HighScoreSubmitted),
        case HighScoreSubmitted of
            true ->
            (get({get({This, highScoresHelper}), '$class'})):setSelectedHighScores(get({This, highScoresHelper}), 'NullHighScoresSingletonFactory':getInstance());
            false -> ok
        end,
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N85455) -> (get({Target_N85455, '$class'})):toString(Target_N85455) end)((fun(Target_N85462) -> (get({Target_N85462, '$class'})):appendboolean(Target_N85462, HighScoreSubmitted) end)((fun(Target_N85469) -> (get({Target_N85469, '$class'})):append(Target_N85469, "isHighScoreSubmitted: ") end)('StringMaker':new()))), This, "setHighScoreSubmitted").

getGameState(This) ->
        get({This, gameState}).

% throws Exception
setGameState(This, GameState) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N85661) -> (get({Target_N85661, '$class'})):toString(Target_N85661) end)((fun(Target_N85668) -> (get({Target_N85668, '$class'})):append(Target_N85668, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), GameState)) end)((fun(Target_N85675) -> (get({Target_N85675, '$class'})):append(Target_N85675, get({get({This, gameStrings}), 'GAME_STATE'})) end)('StringMaker':new()))), This, get({get({This, gameStrings}), 'SET_GAME_STATE'})),
        put({This, gameState}, GameState),
        (get({get({This, gameStateTimeHelper}), '$class'})):setStartTimeTNT(get({This, gameStateTimeHelper})),
        (get({This, '$class'})):updateEndGameProcessor(This),
        (get({This, '$class'})):updateGameKeyEventProcessor(This),
        (get({get({This, gameBehavior}), '$class'})):setGameState(get({This, gameBehavior}), This).

% throws Exception
updateGameState(This) ->
        GameAdState = (get({get({This, gameAdStateFactory}), '$class'})):getCurrentInstance(get({This, gameAdStateFactory})),
        (get({GameAdState, '$class'})):processAdState(GameAdState, get({This, gameState}), (fun(Target_N86049) -> (get({Target_N86049, '$class'})):getGameType(Target_N86049) end)((get({get({This, gameLayerManager}), '$class'})):getGameInfo(get({This, gameLayerManager})))),
        case (get({This, gameState}) =/= get({get({This, gameStateFactory}), 'PLAYING_GAME_STATE'})) of
            true ->
            (get({GameAdState, '$class'})):processPageAdState(GameAdState);
            false -> ok
        end.

updateGameKeyEventProcessor(This) ->
        case (((get({This, '$class'})):getGameState(This) =/= get({get({This, gameStateFactory}), 'PLAYING_GAME_STATE'})) orelse get({This, isCheating})) of
            true ->
            ok;
            false ->
            ok
        end.

removeAllGameKeyInputListenersOnBuild(This) ->
        (get({This, '$class'})):removeAllGameKeyInputListeners(This).

removeAllGameKeyInputListeners(This) ->
        (get({get({This, gameBehavior}), '$class'})):removeAllGameKeyInputListeners(get({This, gameBehavior}), This).

removeAllGameKeyInputListeners2(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Remove PlayerInput Listeners", This, "removeAllGameKeyInputListeners"),
        lists:foreach(fun(Index) ->
            PlayerGameInput = (get({get({This, localPlayerGameInputList}), '$class'})):get(get({This, localPlayerGameInputList}), Index),
            (get({This, '$class'})):removeKeyInputListener(This, PlayerGameInput),
            (get({PlayerGameInput, '$class'})):removeNonAIInputGameKeyEvents(PlayerGameInput)
        end, lists:seq(((get({get({This, localPlayerGameInputList}), '$class'})):size(get({This, localPlayerGameInputList})) - 1), 0, -1)).

removeKeyInputListener(This, PlayerGameInput) ->
        (get({get({This, gameKeyEventHandler}), '$class'})):removeListener(get({This, gameKeyEventHandler}), PlayerGameInput).

% throws Exception
updateEndGameProcessor(This) ->
        (get({get({This, gameBehavior}), '$class'})):updateEndGameProcessor(get({This, gameBehavior}), This).

% throws Exception
updateEndGameProcessor2(This) ->
        case (((get({This, '$class'})):getGameState(This) =:= get({get({This, gameStateFactory}), 'SHOW_END_RESULT_GAME_STATE'})) orelse ((get({This, '$class'})):getGameState(This) =:= get({get({This, gameStateFactory}), 'SHOW_HIGH_SCORE_GAME_STATE'}))) of
            true ->
            (get({This, '$class'})):setEndGameProcessor(This, get({This, realEndGameProcessor}));
            false ->
            (get({This, '$class'})):setEndGameProcessor(This, 'Processor':getInstance())
        end.

% throws Exception
buildGameInit(This, IsPortion) when is_boolean(IsPortion) ->
        ok.

% throws Exception
cleanupGame(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CLEANUP'})),
        ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
        (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, 10, "Cleaning Up"),
        (get({get({This, primaryPlayerQueue}), '$class'})):clear(get({This, primaryPlayerQueue})),
        (get({get({This, secondaryPlayerQueue}), '$class'})):clear(get({This, secondaryPlayerQueue})),
        (fun(Target_N87235) -> (get({Target_N87235, '$class'})):clear(Target_N87235) end)('GameLevelDisplayChangeEventListenersFactory':getInstance()).

% throws Exception
loadResourceLoadingLevel(This, ResourceLoadingLevel) ->
        GameInitializedEvent = get({'GameInitializationUtil':getInstance(), 'EVENT'}),
        (get({GameInitializedEvent, '$class'})):setResourceLoadingLevel(GameInitializedEvent, ResourceLoadingLevel),
        (fun(Target_N87388) -> (get({Target_N87388, '$class'})):fireEvent(Target_N87388, GameInitializedEvent) end)('GameInitializedEventHandler':getInstance()).

% throws Exception
loadResources(This, Level) when is_integer(Level) ->
        GameInitializedEvent = get({'GameInitializationUtil':getInstance(), 'EVENT'}),
        (get({GameInitializedEvent, '$class'})):setLevel(GameInitializedEvent, Level),
        (fun(Target_N87579) -> (get({Target_N87579, '$class'})):fireEvent(Target_N87579, GameInitializedEvent) end)('GameInitializedEventHandler':getInstance()).

% throws Exception
updateColor(This) ->
        ok.

% throws Exception
buildGame(This, Portion) when is_integer(Portion) ->
        try
        (get({get({This, screenCapture}), '$class'})):endRecording(get({This, screenCapture})),
        (get({get({This, screenCapture}), '$class'})):startRecording(get({This, screenCapture})),
        ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
        Features = 'Features':getInstance(),
        (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, Portion, "Generic Build"),
        (get({This, '$class'})):removeAllGameKeyInputListenersOnBuild(This),
        (get({This, '$class'})):updateTouch(This),
        (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, Portion, "High Scores"),
        (get({get({This, highScoresFactoryInterface}), '$class'})):fetchHighScores(get({This, highScoresFactoryInterface}), (get({get({This, gameLayerManager}), '$class'})):getGameInfo(get({This, gameLayerManager})), get({This, highScoresHelper})),
        (get({This, '$class'})):setHighScoresPaintable(This, 'NullPaintable':getInstance()),
        (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, Portion, "Finishing."),
        (fun(Target_N88080) -> (get({Target_N88080, '$class'})):update(Target_N88080, (fun(Target_N88100) -> (get({Target_N88100, '$class'})):getGameInfo(Target_N88100) end)((get({This, '$class'})):getLayerManager(This)), This) end)((get({This, '$class'})):getEndGameInfoP(This)),
        put({This, isSingleKeyRepeatableProcessing}, (get({Features, '$class'})):isFeature(Features, get({'InputFeatureFactory':getInstance(), 'SINGLE_KEY_REPEAT_PRESS'}))),
        (get({This, '$class'})):setGameOver(This, false),
        (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, Portion, "Finishing.."),
        (get({This, '$class'})):updateColor(This),
        (fun(Target_N88267) -> (get({Target_N88267, '$class'})):update(Target_N88267) end)((get({This, '$class'})):getStartIntermissionPaintable(This)),
        case (not (get({This, '$class'})):isRunningInAnotherThread(This)) of
            true ->
            throw({'$return', ok});
            false -> ok
        end,
        (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, Portion, "Finishing..."),
        case ((get({This, '$class'})):isMainCanvas(This) orelse (not (get({This, '$class'})):isInitialized(This))) of
            true ->
            case (get({Features, '$class'})):isFeature(Features, get({'MainFeatureFactory':getInstance(), 'LOAD_ONDEMAND'})) of
                true ->
                case ((get({This, '$class'})):getCustomCommandListener(This) =/= undefined) of
                    true ->
                    (get({ProgressCanvas, '$class'})):'end'(ProgressCanvas);
                    false -> ok
                end;
                false ->
                (get({ProgressCanvas, '$class'})):'end'(ProgressCanvas)
            end,
            (get({This, '$class'})):setInitialized(This, true);
            false -> ok
        end,
        case ((get({This, '$class'})):getCustomCommandListener(This) =:= get({'NullCommandListener', 'NULL_COMMAND_LISTENER'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Show Game Paintable in DemoCanvas Thread", This, get({This, 'BUILD_GAME'})),
            (get({get({This, gameCanvasStartListener}), '$class'})):showGamePaintable(get({This, gameCanvasStartListener}));
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "No GameCanvasStartListener", This, get({This, 'BUILD_GAME'}))
        end,
        (get({get({This, colorFillPaintable}), '$class'})):setBasicColorP(get({This, colorFillPaintable}), (get({get({This, gameLayerManager}), '$class'})):getBackgroundBasicColor(get({This, gameLayerManager}))),
        (get({get({This, gameBehavior}), '$class'})):buildGame(get({This, gameBehavior}), This)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

buildGame2(This) ->
        'PreLogUtil':put((fun(Target_N88870) -> (get({Target_N88870, '$class'})):toString(Target_N88870) end)((fun(Target_N88877) -> (get({Target_N88877, '$class'})):appendint(Target_N88877, (get({get({This, localPlayerGameInputList}), '$class'})):size(get({This, localPlayerGameInputList}))) end)((fun(Target_N88884) -> (get({Target_N88884, '$class'})):append(Target_N88884, get({get({This, gameInputStrings}), 'ENABLE_PLAYER_GAME_INPUTS'})) end)('StringMaker':new()))), This, get({This, 'BUILD_GAME'})),
        put({local, playerGameInput}, undefined),
        lists:foreach(fun(Index) ->
            put({local, playerGameInput}, (get({get({This, localPlayerGameInputList}), '$class'})):get(get({This, localPlayerGameInputList}), Index)),
            'PreLogUtil':put((fun(Target_N89085) -> (get({Target_N89085, '$class'})):toString(Target_N89085) end)((fun(Target_N89092) -> (get({Target_N89092, '$class'})):append(Target_N89092, (get({get({local, playerGameInput}), '$class'})):toString(get({local, playerGameInput}))) end)((fun(Target_N89099) -> (get({Target_N89099, '$class'})):append(Target_N89099, get({get({This, gameInputStrings}), 'ENABLE_PLAYER_GAME_INPUT'})) end)('StringMaker':new()))), This, get({This, 'BUILD_GAME'})),
            (get({get({local, playerGameInput}), '$class'})):removeNonAIInputGameKeyEvents(get({local, playerGameInput})),
            (get({This, '$class'})):addKeyInputListener(This, get({local, playerGameInput}))
        end, lists:seq(((get({get({This, localPlayerGameInputList}), '$class'})):size(get({This, localPlayerGameInputList})) - 1), 0, -1)).

addKeyInputListener(This, PlayerGameInput) ->
        (fun(Target_N89339) -> (get({Target_N89339, '$class'})):addListenerForPlayer(Target_N89339, PlayerGameInput, (get({PlayerGameInput, '$class'})):getPlayerInputId(PlayerGameInput)) end)('GameKeyEventHandler':getInstance()).

setGameCanvasStartListener(This, GameCanvasStartListener) ->
        put({This, gameCanvasStartListener}, GameCanvasStartListener).

% throws Exception
loadState(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'LOAD'})),
        Hashtable = (get({This, '$class'})):getLoadStateHashtable(This),
        case ((Hashtable =/= undefined) andalso ((get({Hashtable, '$class'})):size(Hashtable) > 0)) of
            true ->
            LevelAsString = (get({Hashtable, '$class'})):get(Hashtable, get({'GameInfo', 'LEVEL_NAME'})),
            Level = (fun(Target_N89851) -> (get({Target_N89851, '$class'})):intValue(Target_N89851) end)(allbinary_java:to_string(LevelAsString)),
            GameInfo = (get({get({This, gameLayerManager}), '$class'})):getGameInfo(get({This, gameLayerManager})),
            (get({GameInfo, '$class'})):setCurrentLevel(GameInfo, Level);
            false -> ok
        end.

% throws Exception
getLoadStateHashtable(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N90044) -> (get({Target_N90044, '$class'})):toString(Target_N90044) end)((fun(Target_N90051) -> (get({Target_N90051, '$class'})):append(Target_N90051, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), get({This, hashtable}))) end)((fun(Target_N90058) -> (get({Target_N90058, '$class'})):append(Target_N90058, get({get({This, commonLabels}), 'START_LABEL'})) end)('StringMaker':new()))), This, "getLoadStateHashtable"),
        get({This, hashtable}).

setLoadStateHashtable(This, Hashtable) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N90257) -> (get({Target_N90257, '$class'})):toString(Target_N90257) end)((fun(Target_N90264) -> (get({Target_N90264, '$class'})):append(Target_N90264, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), Hashtable)) end)((fun(Target_N90271) -> (get({Target_N90271, '$class'})):append(Target_N90271, get({get({This, commonLabels}), 'START_LABEL'})) end)('StringMaker':new()))), This, "setLoadStateHashtable"),
        put({This, hashtable}, Hashtable).

getCurrentStateHashtable(This) ->
        Hashtable = (get({get({This, stdUtil}), '$class'})):createHashtable(get({This, stdUtil})),
        Level = (fun(Target_N90558) -> (get({Target_N90558, '$class'})):getCurrentLevel(Target_N90558) end)((get({get({This, gameLayerManager}), '$class'})):getGameInfo(get({This, gameLayerManager}))),
        (get({Hashtable, '$class'})):put(Hashtable, (get({get({'GameInfo', 'LEVEL_NAME'}), '$class'})):toString(get({'GameInfo', 'LEVEL_NAME'})), allbinary_java:to_string(Level)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N90694) -> (get({Target_N90694, '$class'})):toString(Target_N90694) end)((fun(Target_N90701) -> (get({Target_N90701, '$class'})):append(Target_N90701, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), Hashtable)) end)((fun(Target_N90708) -> (get({Target_N90708, '$class'})):append(Target_N90708, "End: ") end)('StringMaker':new()))), This, "getCurrentStateHashtable"),
        Hashtable.

paintGameOver(This, Graphics) ->
        'ForcedLogUtil':log(get({get({This, commonStrings}), 'NOT_IMPLEMENTED'}), This).

draw(This, Graphics) ->
        (get({get({This, colorFillPaintable}), '$class'})):paint(get({This, colorFillPaintable}), Graphics),
        (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP(get({This, basicSetColorUtil}), Graphics, (get({get({This, gameLayerManager}), '$class'})):getForegroundBasicColor(get({This, gameLayerManager}))),
        (get({get({This, gameSpecificPaintable}), '$class'})):paint(get({This, gameSpecificPaintable}), Graphics).

clear(This, Graphics) ->
        (get({get({This, colorFillPaintable}), '$class'})):paint(get({This, colorFillPaintable}), Graphics).

paint(This, Graphics) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        (get({get({This, baseGameStatistics}), '$class'})):nextRefresh(get({This, baseGameStatistics})),
        (get({This, '$class'})):draw(This, Graphics),
        (get({get({This, menuPaintable}), '$class'})):paint(get({This, menuPaintable}), Graphics),
        (get({get({This, progressPaintable}), '$class'})):paint(get({This, progressPaintable}), Graphics).

paintThreed(This, Graphics) ->
        ok.

% throws Exception
processEndLevelIntermissionGameState(This) ->
        ok.

nonBotPaint(This, Graphics) ->
        (get({get({This, endGamePaintable}), '$class'})):paint(get({This, endGamePaintable}), Graphics),
        (get({get({This, intermissionPaintable}), '$class'})):paint(get({This, intermissionPaintable}), Graphics),
        (get({This, '$class'})):paintIntermission(This, Graphics),
        (get({get({This, touchPaintable}), '$class'})):paint(get({This, touchPaintable}), Graphics).

paintIntermission(This, Graphics) ->
        ok.

keyPressed(This, KeyCode) when is_integer(KeyCode) ->
        (get({This, '$class'})):keyPressedByDevice(This, KeyCode, 0).

keyReleased(This, KeyCode) when is_integer(KeyCode) ->
        (get({This, '$class'})):keyReleasedByDevice(This, KeyCode, 0).

keyRepeated(This, KeyCode) when is_integer(KeyCode) ->
        (get({This, '$class'})):keyRepeatedByDevice(This, KeyCode, 0).

keyPressedByDevice(This, KeyCode, DeviceId) when is_integer(KeyCode), is_integer(DeviceId) ->
        (get({get({This, inputProcessor}), '$class'})):keyPressedByDevice(get({This, inputProcessor}), KeyCode, DeviceId).

keyRepeatedByDevice(This, KeyCode, DeviceId) when is_integer(KeyCode), is_integer(DeviceId) ->
        case get({This, isSingleKeyRepeatableProcessing}) of
            true ->
            (get({get({This, inputProcessor}), '$class'})):keyPressedByDevice(get({This, inputProcessor}), KeyCode, DeviceId);
            false -> ok
        end.

keyReleasedByDevice(This, KeyCode, DeviceId) when is_integer(KeyCode), is_integer(DeviceId) ->
        (get({get({This, inputProcessor}), '$class'})):keyReleasedByDevice(get({This, inputProcessor}), This, KeyCode, DeviceId).

% throws Exception
handleRawKey(This, KeyCode, DeviceId, Repeated) when is_integer(KeyCode), is_integer(DeviceId), is_boolean(Repeated) ->
        ok.

endProgress(This, IsProgress) when is_boolean(IsProgress) ->
        put({local, portion}, 30),
        case (IsProgress andalso (get({This, '$class'})):isMainCanvas(This)) of
            true ->
            MyCommandsFactory = 'MyCommandsFactory':getInstance(),
            ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
            (get({ProgressCanvas, '$class'})):start(ProgressCanvas),
            (fun(Target_N92796) -> (get({Target_N92796, '$class'})):commandAction(Target_N92796, get({MyCommandsFactory, 'SET_DISPLAYABLE'}), ProgressCanvas) end)((get({This, '$class'})):getCustomCommandListener(This)),
            put({local, portion}, 4);
            false -> ok
        end,
        get({local, portion}).

% throws Exception
processPlayingGame(This) ->
        (get({get({This, cheatProcessor}), '$class'})):update(get({This, cheatProcessor})),
        (fun(Target_N92955) -> (get({Target_N92955, '$class'})):update(Target_N92955) end)((get({get({This, sensorGameUpdateProcessor}), '$class'})):getInputSensor(get({This, sensorGameUpdateProcessor}))),
        (get({get({This, gameInputProcessor}), '$class'})):process(get({This, gameInputProcessor})),
        (get({get({This, gameLayerManager}), '$class'})):process(get({This, gameLayerManager})),
        (get({get({This, startIntermissionProcessor}), '$class'})):process(get({This, startIntermissionProcessor})).

% throws Exception
threadInit(This) ->
        ok.

% throws Exception
processGame(This) ->
        'RunnableCanvas':process(This),
        case 'AllBinaryMediaManager':update() of
            true ->
            case (not (get({get({This, primaryPlayerQueue}), '$class'})):process(get({This, primaryPlayerQueue}))) of
                true ->
                (get({get({This, secondaryPlayerQueue}), '$class'})):process(get({This, secondaryPlayerQueue}));
                false -> ok
            end;
            false -> ok
        end,
        (get({get({This, mainStateProcessor}), '$class'})):process(get({This, mainStateProcessor})),
        (get({get({This, menuInputProcessor}), '$class'})):processInputList(get({This, menuInputProcessor})),
        (get({get({This, endGameProcessor}), '$class'})):process(get({This, endGameProcessor})),
        (get({get({This, baseGameStatistics}), '$class'})):nextFrame(get({This, baseGameStatistics})).

notifyDonePainting(This) ->
        begin % synchronized
            (get({get({This, threadObjectUtil}), '$class'})):notifyObject(get({This, threadObjectUtil}), This)
        end.

% throws Exception
shouldWait(This) ->
        Features = 'Features':getInstance(),
        case 'AndroidUtil':isAndroid() of
            true ->
            ok;
            false ->
            case (get({Features, '$class'})):isFeature(Features, get({get({This, openGLFeatureFactory}), 'OPENGL_2D'})) of
            true ->
            ok;
            false ->
            case (get({Features, '$class'})):isDefault(Features, get({get({This, openGLFeatureFactory}), 'OPENGL'})) of
                true ->
                OpenGLImageSpecificFactory = 'OpenGLImageSpecificFactory':getInstance(),
                (fun Loop() -> case get({OpenGLImageSpecificFactory, updating}) of true ->
                    timer:sleep(get({This, 'YIELD_SLEEP'})),
                    Loop();
                false -> ok end end)();
                false -> ok
            end
        end
        end.

run(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START_RUNNABLE'}), This, get({get({This, commonStrings}), 'RUN'})),
            ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
            (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, 50, "Game Thread"),
            (get({This, '$class'})):setCurrentThread(This),
            (get({This, '$class'})):setRunning(This, true),
            case ((get({This, '$class'})):getCustomCommandListener(This) =:= get({'NullCommandListener', 'NULL_COMMAND_LISTENER'})) of
                true ->
                timer:sleep(get({This, 'YIELD_SLEEP'}));
                false -> ok
            end,
            (get({This, '$class'})):shouldWait(This),
            (get({This, '$class'})):threadInit(This),
            case ((get({This, '$class'})):getCustomCommandListener(This) =:= get({'NullCommandListener', 'NULL_COMMAND_LISTENER'})) of
                true ->
                timer:sleep(get({This, 'YIELD_SLEEP'}));
                false -> ok
            end,
            (get({This, '$class'})):open(This),
            GameAdState = (get({get({This, gameAdStateFactory}), '$class'})):getCurrentInstance(get({This, gameAdStateFactory})),
            (get({GameAdState, '$class'})):init(GameAdState),
            (get({GameAdState, '$class'})):setGameIsReady(GameAdState, true),
            (get({get({This, gameBehavior}), '$class'})):run(get({This, gameBehavior}), This),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END_RUNNABLE'}), This, get({get({This, commonStrings}), 'RUN'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'RUN'}), E)
        end.

% throws Exception
run2(This) ->
        Features = 'Features':getInstance(),
        case ((get({Features, '$class'})):isDefault(Features, get({get({This, openGLFeatureFactory}), 'OPENGL_AS_GAME_THREAD'})) orelse 'J2MEUtil':isHTML()) of
            true ->
            case (get({Features, '$class'})):isDefault(Features, get({get({This, openGLFeatureFactory}), 'OPENGL_AS_GAME_THREAD'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({get({This, openGLFeatureFactory}), 'OPENGL_AS_GAME_THREAD'}), '$class'})):getName(get({get({This, openGLFeatureFactory}), 'OPENGL_AS_GAME_THREAD'})), This, get({get({This, commonStrings}), 'RUN'}));
                false -> ok
            end,
            case 'J2MEUtil':isHTML() of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({'GraphicsStrings':getInstance(), 'HTML'}), This, get({get({This, commonStrings}), 'RUN'}));
                false -> ok
            end,
            CurrentDisplayableFactory = 'CurrentDisplayableFactory':getInstance(),
            (get({CurrentDisplayableFactory, '$class'})):setRunnable(CurrentDisplayableFactory, get({This, gameRunnable})),
            (get({CurrentDisplayableFactory, '$class'})):setDisplayable(CurrentDisplayableFactory, This),
            (fun(Target_N95284) -> (get({Target_N95284, '$class'})):onResume(Target_N95284) end)('OpenGLThreadUtil':getInstance());
            false ->
            case (get({Features, '$class'})):isDefault(Features, get({get({This, openGLFeatureFactory}), 'OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({get({This, openGLFeatureFactory}), 'OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS'}), '$class'})):getName(get({get({This, openGLFeatureFactory}), 'OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS'})), This, get({get({This, commonStrings}), 'RUN'})),
            (fun(Target_N94863) -> (get({Target_N94863, '$class'})):onResume(Target_N94863) end)('OpenGLThreadUtil':getInstance()),
            (fun Loop() -> case (get({This, '$class'})):isRunning(This) of true ->
                (get({This, '$class'})):run3(This),
                Loop();
            false -> ok end end)(),
            (get({This, '$class'})):'end'(This);
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "this thread", This, get({get({This, commonStrings}), 'RUN'})),
            (fun Loop() -> case (get({This, '$class'})):isRunning(This) of true ->
                (get({This, '$class'})):run3(This),
                Loop();
            false -> ok end end)(),
            (get({This, '$class'})):'end'(This)
        end
        end.

% throws Exception
run3(This) ->
        (get({get({This, loopTimeHelper}), '$class'})):setStartTime(get({This, loopTimeHelper}), (get({get({This, gameTickTimeDelayHelper}), '$class'})):setStartTime(get({This, gameTickTimeDelayHelper}))),
        (get({get({This, gameTickDisplayInfoSingleton}), '$class'})):update(get({This, gameTickDisplayInfoSingleton})),
        (get({This, '$class'})):processGame(This),
        (get({This, '$class'})):processLoopSleep(This).

setRunning(This, Running) when is_boolean(Running) ->
        'RunnableCanvas':setRunning(This, Running),
        try
            Features = 'Features':getInstance(),
            case Running of
                true ->
                ok;
                false ->
                case ((get({Features, '$class'})):isDefault(Features, get({get({This, openGLFeatureFactory}), 'OPENGL'})) orelse get({'SWTUtil', isSWT})) of
                    true ->
                    case ((fun(Target_N95664) -> (get({Target_N95664, '$class'})):getGameType(Target_N95664) end)((get({get({This, gameLayerManager}), '$class'})):getGameInfo(get({This, gameLayerManager}))) =/= get({get({This, gameTypeFactory}), 'BOT'})) of
                        true ->
                        CurrentDisplayableFactory = 'CurrentDisplayableFactory':getInstance(),
                        (get({CurrentDisplayableFactory, '$class'})):clearRunnable(CurrentDisplayableFactory);
                        false -> ok
                    end,
                    (get({This, '$class'})):'end'(This);
                    false -> ok
                end
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({This, 'SET_RUNNING'}), E)
        end.

% throws Exception
'end'(This) ->
        (get({get({This, screenCapture}), '$class'})):endRecording(get({This, screenCapture})),
        (get({get({This, baseGameStatistics}), '$class'})):add(get({This, baseGameStatistics}), (fun(Target_N96020) -> (get({Target_N96020, '$class'})):toString(Target_N96020) end)((fun(Target_N96027) -> (get({Target_N96027, '$class'})):append(Target_N96027, get({'CommonSeps':getInstance(), 'NEW_LINE'})) end)((fun(Target_N96034) -> (get({Target_N96034, '$class'})):append(Target_N96034, (get({get({This, baseGameStatistics}), '$class'})):toString(get({This, baseGameStatistics}))) end)('StringMaker':new())))),
        (get({get({This, baseGameStatistics}), '$class'})):init(get({This, baseGameStatistics})),
        (get({get({This, gameKeyEventHandler}), '$class'})):removeListener(get({This, gameKeyEventHandler}), get({This, cheatProcessor})),
        (get({This, '$class'})):close(This),
        (get({This, '$class'})):removeAllGameKeyInputListeners(This),
        (get({This, '$class'})):endGameThread(This).

% throws Exception
endGameThread(This) ->
        (fun(Target_N96252) -> (get({Target_N96252, '$class'})):removeListener(Target_N96252, This) end)('DisplayChangeEventHandler':getInstance()),
        (fun(Target_N96286) -> (get({Target_N96286, '$class'})):clear(Target_N96286) end)('GameLevelDisplayChangeEventListenersFactory':getInstance()),
        GameAdState = (get({get({This, gameAdStateFactory}), '$class'})):getCurrentInstance(get({This, gameAdStateFactory})),
        (get({GameAdState, '$class'})):notPlayingAdState(GameAdState).

createHighScore(This, Score) when is_integer(Score) ->
        GameInfo = (get({get({This, gameLayerManager}), '$class'})):getGameInfo(get({This, gameLayerManager})),
        'HighScore':new(0, "NONE", 'GameInfo':new((get({GameInfo, '$class'})):getGameType(GameInfo), (get({GameInfo, '$class'})):getGameMode(GameInfo), get({'PlayerTypesFactory':getInstance(), 'PLAYER_TYPE_ONE'}), 0, 0), Score).

% throws Exception
setHighScore(This, AbeClientInformation, Name, Score, AutoSubmit, IsLast) when (is_list(Name) orelse Name =:= undefined), is_integer(Score), is_boolean(AutoSubmit), is_boolean(IsLast) ->
        (get({get({This, gameBehavior}), '$class'})):setHighScore(get({This, gameBehavior}), AbeClientInformation, This, Name, Score, AutoSubmit, IsLast).

% throws Exception
setHighScore2(This, AbeClientInformation, Name, Score, AutoSubmit, IsLast) when (is_list(Name) orelse Name =:= undefined), is_integer(Score), is_boolean(AutoSubmit), is_boolean(IsLast) ->
        HighScore = (get({This, '$class'})):createHighScore(This, Score),
        TextBox = 'HighScoreTextBox':new(get({This, highScoresFactoryInterface}), get({This, highScoresHelper}), AbeClientInformation, (get({get({This, gameLayerManager}), '$class'})):getGameInfo(get({This, gameLayerManager})), (get({This, '$class'})):getCustomCommandListener(This), Name, HighScore, (get({get({This, gameLayerManager}), '$class'})):getBackgroundBasicColor(get({This, gameLayerManager})), (get({get({This, gameLayerManager}), '$class'})):getForegroundBasicColor(get({This, gameLayerManager}))),
        case IsLast of
            true ->
            (fun(Target_N97092) -> (get({Target_N97092, '$class'})):commandAction(Target_N97092, get({'GameCommandsFactory':getInstance(), 'SET_MENU_DISPLAYABLE'}), TextBox) end)((get({This, '$class'})):getCustomCommandListener(This));
            false -> ok
        end,
        case AutoSubmit of
            true ->
            ok % Java nested type SaveHighScoreRunnable: move it to its own module
,
            (fun(Target_N97571) -> (get({Target_N97571, '$class'})):runTask(Target_N97571, 'SaveHighScoreRunnable':new()) end)('SecondaryThreadPool':getInstance());
            false -> ok
        end.

getGameStateTimeHelper(This) ->
        get({This, gameStateTimeHelper}).

setInitialized(This, Initialized) when is_boolean(Initialized) ->
        put({This, initialized}, Initialized).

isInitialized(This) ->
        get({This, initialized}).

getSourceId(This) ->
        get({'AllBinaryGameCanvas', id}).

setProgressPaintable(This, Paintable) ->
        put({This, progressPaintable}, Paintable).

getStartIntermissionInterface(This) ->
        get({This, startIntermissionInterface}).

getEndLevelIntermissionInterface(This) ->
        get({This, endLevelIntermissionInterface}).

setTouchPaintableP(This, Paintable) ->
        put({This, touchPaintable}, Paintable).

getTouchPaintableP(This) ->
        get({This, touchPaintable}).

setEndGamePaintable(This, EndGamePaintable) ->
        put({This, endGamePaintable}, EndGamePaintable).

getEndGamePaintable(This) ->
        get({This, endGamePaintable}).

setIntermissionPaintable(This, IntermissionPaintable) ->
        put({This, intermissionPaintable}, IntermissionPaintable).

getIntermissionPaintable(This) ->
        get({This, intermissionPaintable}).

getEndGameInfoP(This) ->
        get({This, endGameInfo}).

setHighScoresPaintable(This, HighScoresPaintable) ->
        put({This, highScoresPaintable}, HighScoresPaintable).

getHighScoresPaintable(This) ->
        get({This, highScoresPaintable}).

getRealHighScoresPaintable(This) ->
        get({This, realHighScoresPaintable}).

clearPlayerGameInputList(This) ->
        put({local, playerGameInput}, undefined),
        lists:foreach(fun(Index) ->
            put({local, playerGameInput}, (get({get({This, localPlayerGameInputList}), '$class'})):get(get({This, localPlayerGameInputList}), Index)),
            (get({get({This, gameKeyEventHandler}), '$class'})):removeListener(get({This, gameKeyEventHandler}), get({local, playerGameInput}))
        end, lists:seq(((get({get({This, localPlayerGameInputList}), '$class'})):size(get({This, localPlayerGameInputList})) - 1), 0, -1)),
        (get({get({This, localPlayerGameInputList}), '$class'})):clear(get({This, localPlayerGameInputList})).

addPlayerGameInput(This, PlayerGameInput) ->
        (get({get({This, localPlayerGameInputList}), '$class'})):add(get({This, localPlayerGameInputList}), PlayerGameInput).

setMenuInputProcessor(This, MenuInputProcessor) ->
        put({This, menuInputProcessor}, MenuInputProcessor).

getMenuInputProcessor(This) ->
        get({This, menuInputProcessor}).

getMenuForm(This) ->
        get({This, menuForm}).

setMenuForm(This, MenuForm) ->
        put({This, menuForm}, MenuForm).

getStartLevel(This) ->
        get({This, startLevel}).

setStartLevel(This, StartLevel) when is_integer(StartLevel) ->
        put({This, startLevel}, StartLevel).

setTouchButtonsPaintable(This, TouchButtonsPaintable) ->
        put({This, touchButtonsPaintable}, TouchButtonsPaintable).

getTouchButtonsPaintable(This) ->
        get({This, touchButtonsPaintable}).

setGameInputProcessor(This, GameInputProcessor) ->
        put({This, gameInputProcessor}, GameInputProcessor).

getGameInputProcessor(This) ->
        get({This, gameInputProcessor}).

setEndGameProcessor(This, EndGameProcessor) ->
        put({This, endGameProcessor}, EndGameProcessor).

getEndGameProcessor(This) ->
        get({This, endGameProcessor}).

setEndGameStatePaintable(This, EndGameStatePaintable) ->
        put({This, endGameStatePaintable}, EndGameStatePaintable).

getEndGameStatePaintable(This) ->
        get({This, endGameStatePaintable}).

setNonBotPaintableP(This, NonBotPaintable) ->
        put({This, nonBotPaintable}, NonBotPaintable).

getNonBotPaintableP(This) ->
        get({This, nonBotPaintable}).

setStartIntermissionPaintable(This, StartIntermissionPaintable) ->
        put({This, startIntermissionPaintable}, StartIntermissionPaintable).

getStartIntermissionPaintable(This) ->
        get({This, startIntermissionPaintable}).

setMainStateProcessor(This, MainStateProcessor) ->
        put({This, mainStateProcessor}, MainStateProcessor).

getMainStateProcessor(This) ->
        get({This, mainStateProcessor}).

setProcessGameProcessor(This, ProcessGameProcessor) ->
        put({This, processGameProcessor}, ProcessGameProcessor).

getProcessGameProcessor(This) ->
        get({This, processGameProcessor}).

setOpenMenuPaintable(This, OpenMenuPaintable) ->
        put({This, openMenuPaintable}, OpenMenuPaintable).

getOpenMenuPaintable(This) ->
        get({This, openMenuPaintable}).

setPopupMenuInputProcessor(This, PopupMenuInputProcessor) ->
        put({This, popupMenuInputProcessor}, PopupMenuInputProcessor).

getPopupMenuInputProcessor(This) ->
        get({This, popupMenuInputProcessor}).

getSensorGameUpdateProcessor(This) ->
        get({This, sensorGameUpdateProcessor}).

getRawGameInputProcessor(This) ->
        get({This, rawGameInputProcessor}).

getRawInputProcessor(This) ->
        get({This, rawInputProcessor}).

setInputProcessor(This, InputProcessor) ->
        put({This, inputProcessor}, InputProcessor).

getInputProcessor(This) ->
        get({This, inputProcessor}).

setMenuPaintable(This, MenuPaintable) ->
        put({This, menuPaintable}, MenuPaintable).

getMenuPaintable(This) ->
        get({This, menuPaintable}).

setFormPaintable(This, FormPaintable) ->
        put({This, formPaintable}, FormPaintable).

getFormPaintable(This) ->
        get({This, formPaintable}).

setGameSpecificPaintableP(This, GameSpecificPaintable) ->
        put({This, gameSpecificPaintable}, GameSpecificPaintable).

getGameSpecificPaintableP(This) ->
        get({This, gameSpecificPaintable}).

isSingleThread(This) ->
        ((fun(Target_N101420) -> (get({Target_N101420, '$class'})):isAnyThreed(Target_N101420) end)('OpenGLFeatureUtil':getInstance()) orelse get({'SWTUtil', isSWT})).

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

getType(This) ->
        get({'AllBinaryGameCanvas', 'TYPE'}).

