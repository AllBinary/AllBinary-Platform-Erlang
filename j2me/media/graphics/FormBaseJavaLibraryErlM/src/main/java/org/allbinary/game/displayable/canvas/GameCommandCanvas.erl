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
% import javax.microedition.lcdui.CommandListener
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.NullCommandListener
% import org.allbinary.canvas.Processor
% import org.allbinary.game.commands.GameCommandsFactory
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.InputFeatureFactory
% import org.allbinary.game.displayable.RepaintBehavior
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
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.displayable.CanvasStrings
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.displayable.MyCanvas
% import org.allbinary.graphics.displayable.event.DisplayChangeEvent
% import org.allbinary.graphics.displayable.event.DisplayChangeEventHandler
% import org.allbinary.graphics.displayable.event.DisplayChangeEventListener
% import org.allbinary.graphics.displayable.screen.ScreenRepaintProcessorFactory
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.graphics.form.CommandCurrentSelectionFormFactory
% import org.allbinary.graphics.form.FormPaintable
% import org.allbinary.graphics.form.FormTypeFactory
% import org.allbinary.graphics.form.PaintableForm
% import org.allbinary.graphics.form.ScrollSelectionForm
% import org.allbinary.graphics.form.ScrollSelectionFormNoneFactory
% import org.allbinary.graphics.form.item.CommandTextItemArrayFactory
% import org.allbinary.graphics.form.item.ABCustomItem
% import org.allbinary.graphics.form.item.validation.AllCommandsVisitor
% import org.allbinary.graphics.paint.NullPaintable
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.string.CommonSeps
% import org.allbinary.util.BasicArrayListD

-module('GameCommandCanvas').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements MenuListener
% implements DisplayChangeEventListener
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('MyCanvas', Function, Arguments).

static_init() ->
    put({?MODULE, id}, 0),
    ok.

init_fields(This) ->
    put({This, repaintProcessor}, (fun(Target_N67235) -> (get({Target_N67235, '$class'})):create(Target_N67235, This) end)('ScreenRepaintProcessorFactory':getInstance())),
    put({This, gameInputStrings}, 'GameInputStrings':getInstance()),
    put({This, foregroundBasicColor}, undefined),
    put({This, backgroundBasicColor}, undefined),
    put({This, inputToGameKeyMapping}, (fun(Target_N67455) -> (get({Target_N67455, '$class'})):getInputMapping(Target_N67455) end)((fun(Target_N67462) -> (get({Target_N67462, '$class'})):getPersistentInputMappingInstance(Target_N67462) end)('PlatformInputMappingFactory':getInstance()))),
    put({This, gameKeyFactory}, 'GameKeyFactory':getInstance()),
    put({This, gameKeyEventFactory}, 'GameKeyEventFactory':getInstance()),
    put({This, downGameKeyEventHandler}, 'DownGameKeyEventHandler':getInstance()),
    put({This, upGameKeyEventHandler}, 'UpGameKeyEventHandler':getInstance()),
    put({This, repaintBehavior}, undefined),
    put({This, updateMyFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, myFontProcessor}, get({This, updateMyFontProcessor})),
    put({This, foregroundColor}, 0),
    put({This, backgroundColor}, 0),
    put({This, menuInputProcessor}, 'NoMenuInputProcessor':getInstance()),
    put({This, menuPaintable}, 'NullPaintable':getInstance()),
    put({This, menuForm}, 'PaintableForm':getNullPaintableForm()),
    put({This, isSingleKeyRepeatableProcessing}, (fun(Target_N68034) -> (get({Target_N68034, '$class'})):isFeature(Target_N68034, get({'InputFeatureFactory':getInstance(), 'SINGLE_KEY_REPEAT_PRESS'})) end)('Features':getInstance())),
    put({This, fontHeight}, 0),
    ok.


new(CmdListener, Name, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CmdListener, Name, BackgroundBasicColor, ForegroundBasicColor),
    This.

init(This, CmdListener, Name, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Name) orelse Name =:= undefined) ->
        'MyCanvas':init(This, Name, get({'CanvasStrings':getInstance(), 'EMPTY_CHILD_NAME_LIST'})),
        init_fields(This),
        put({This, repaintBehavior}, 'RepaintBehavior':getInstance()),
        put({This, foregroundBasicColor}, ForegroundBasicColor),
        put({This, backgroundBasicColor}, BackgroundBasicColor),
        put({This, foregroundColor}, (get({get({This, foregroundBasicColor}), '$class'})):intValue(get({This, foregroundBasicColor}))),
        put({This, backgroundColor}, (get({get({This, backgroundBasicColor}), '$class'})):intValue(get({This, backgroundBasicColor}))),
        (get({This, '$class'})):initCommands(This, CmdListener),
        case (CmdListener =/= get({'NullCommandListener', 'NULL_COMMAND_LISTENER'})) of
            true ->
            try
                (get({This, '$class'})):initMenu(This),
                (get({get({This, repaintProcessor}), '$class'})):process(get({This, repaintProcessor}))
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                erlang:error({'RuntimeException'})
            end;
            false -> ok
        end.

updateMeasurement(This, Graphics) ->
        try
            Font = (get({Graphics, '$class'})):getFont(Graphics),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68716) -> (get({Target_N68716, '$class'})):toString(Target_N68716) end)((fun(Target_N68723) -> (get({Target_N68723, '$class'})):appendint(Target_N68723, trunc((get({Font, '$class'})):getHeight(Font))) end)((fun(Target_N68730) -> (get({Target_N68730, '$class'})):append(Target_N68730, get({get({This, canvasStrings}), 'FD_HEIGHT'})) end)((fun(Target_N68737) -> (get({Target_N68737, '$class'})):appendint(Target_N68737, trunc('MyFontProcessor':defaultCharWidth(Font))) end)((fun(Target_N68744) -> (get({Target_N68744, '$class'})):append(Target_N68744, get({get({This, canvasStrings}), 'FD_WIDTH'})) end)((fun(Target_N68751) -> (get({Target_N68751, '$class'})):append(Target_N68751, get({get({This, commonStrings}), 'START'})) end)('StringMaker':new())))))), This, get({get({This, canvasStrings}), 'UPDATE_MEASUREMENT'})),
            put({This, fontHeight}, (get({Font, '$class'})):getHeight(Font)),
            Rectangle = (get({This, '$class'})):createRectangle(This, (get({get({This, menuForm}), '$class'})):size(get({This, menuForm}))),
            (get({get({This, menuForm}), '$class'})):init(get({This, menuForm}), Rectangle, get({'FormTypeFactory':getInstance(), 'VERTICAL_CENTER_FORM'})),
            (get({This, '$class'})):update(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, canvasStrings}), 'ON_DISPLAY_CHANGE_EVENT'}), E)
        end,
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

onDisplayChangeEvent(This, DisplayChangeEvent) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69440) -> (get({Target_N69440, '$class'})):toString(Target_N69440) end)((fun(Target_N69447) -> (get({Target_N69447, '$class'})):append(Target_N69447, (fun(Target_N69498) -> (get({Target_N69498, '$class'})):toString(Target_N69498) end)('DisplayInfoSingleton':getInstance())) end)((fun(Target_N69454) -> (get({Target_N69454, '$class'})):append(Target_N69454, get({get({This, commonStrings}), 'START'})) end)('StringMaker':new()))), This, get({get({This, canvasStrings}), 'ON_DISPLAY_CHANGE_EVENT'})),
        put({This, myFontProcessor}, get({This, updateMyFontProcessor})).

initCommands(This, CmdListener) ->
        (get({This, '$class'})):removeAllCommands(This),
        (get({This, '$class'})):addCommand(This, get({'GameCommandsFactory':getInstance(), 'CLOSE_AND_SHOW_GAME_CANVAS'})),
        (get({This, '$class'})):setCommandListener(This, CmdListener).

% throws Exception
initMenu(This) ->
        Form = (get({This, '$class'})):createForm(This),
        put({This, menuForm}, Form),
        case (Form =/= 'ScrollSelectionFormNoneFactory':getInstance()) of
            true ->
            (get({This, '$class'})):setMenuInputProcessor(This, 'ImmediateCommandFormInputProcessor':new('BasicArrayListD':new(), (-1), This, Form)),
            put({This, menuPaintable}, 'FormPaintable':new(Form));
            false -> ok
        end,
        (get({get({This, repaintBehavior}), '$class'})):onChangeRepaint(get({This, repaintBehavior}), This).

% throws Exception
createForm(This) ->
        Items = (fun(Target_N70091) -> (get({Target_N70091, '$class'})):getInstance(Target_N70091, (get({This, '$class'})):getCommandStack(This), get({This, backgroundBasicColor}), get({This, foregroundBasicColor})) end)('CommandTextItemArrayFactory':new('AllCommandsVisitor':new())),
        Rectangle = (get({This, '$class'})):createRectangle(This, array:size(Items)),
        'CommandCurrentSelectionFormFactory':getInstance(get({'StringUtil':getInstance(), 'EMPTY_STRING'}), Items, Rectangle, get({'FormTypeFactory':getInstance(), 'VERTICAL_CENTER_FORM'}), 15, false, get({This, backgroundBasicColor}), get({This, foregroundBasicColor})).

createRectangle(This, Size) when is_integer(Size) ->
        Height = (Size * get({This, fontHeight})),
        StartY = (((((get({get({This, displayInfo}), '$class'})):getLastHeight(get({This, displayInfo})) * 2) / 3)) - Height),
        PointFactory = 'PointFactory':getInstance(),
        Rectangle = 'Rectangle':new((get({PointFactory, '$class'})):createXY(PointFactory, 30, StartY), ((get({get({This, displayInfo}), '$class'})):getLastWidth(get({This, displayInfo})) - 30), StartY),
        Rectangle.

open(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "open"),
        (fun(Target_N70837) -> (get({Target_N70837, '$class'})):addListenerInterface(Target_N70837, (get({This, '$class'})):getMenuInputProcessor(This)) end)('BasicMotionGesturesHandler':getInstance()),
        (fun(Target_N70879) -> (get({Target_N70879, '$class'})):addListener(Target_N70879, (get({This, '$class'})):getMenuInputProcessor(This)) end)('GameKeyEventHandler':getInstance()),
        (fun(Target_N70921) -> (get({Target_N70921, '$class'})):addListenerInterface(Target_N70921, This) end)('DisplayChangeEventHandler':getInstance()).

% throws Exception
close(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CLOSE'})),
        (fun(Target_N71058) -> (get({Target_N71058, '$class'})):removeListener(Target_N71058, (get({This, '$class'})):getMenuInputProcessor(This)) end)('BasicMotionGesturesHandler':getInstance()),
        (fun(Target_N71100) -> (get({Target_N71100, '$class'})):removeListener(Target_N71100, (get({This, '$class'})):getMenuInputProcessor(This)) end)('GameKeyEventHandler':getInstance()),
        (fun(Target_N71142) -> (get({Target_N71142, '$class'})):removeListener(Target_N71142, This) end)('DisplayChangeEventHandler':getInstance()).

% throws Exception
update(This) ->
        (get({get({This, repaintProcessor}), '$class'})):process(get({This, repaintProcessor})).

getSourceId(This) ->
        get({'GameCommandCanvas', id}).

keyPressed(This, KeyCode) when is_integer(KeyCode) ->
        (get({This, '$class'})):keyPressedByDevice(This, KeyCode, 0).

keyReleased(This, KeyCode) when is_integer(KeyCode) ->
        (get({This, '$class'})):keyReleasedByDevice(This, KeyCode, 0).

keyRepeated(This, KeyCode) when is_integer(KeyCode) ->
        (get({This, '$class'})):keyRepeatedByDevice(This, KeyCode, 0).

keyPressedByDevice(This, KeyCode, DeviceId) when is_integer(KeyCode), is_integer(DeviceId) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N71626) -> (get({Target_N71626, '$class'})):toString(Target_N71626) end)((fun(Target_N71633) -> (get({Target_N71633, '$class'})):appendint(Target_N71633, KeyCode) end)((fun(Target_N71640) -> (get({Target_N71640, '$class'})):append(Target_N71640, get({'CommonSeps':getInstance(), 'SPACE'})) end)('StringMaker':new()))), This, get({get({This, gameInputStrings}), 'KEY_PRESSED'})),
        (get({This, '$class'})):addGameKeyEvent(This, KeyCode, 0, false).

keyReleasedByDevice(This, KeyCode, DeviceId) when is_integer(KeyCode), is_integer(DeviceId) ->
        (get({This, '$class'})):removeGameKeyEvent(This, KeyCode, DeviceId, false).

keyRepeatedByDevice(This, KeyCode, DeviceId) when is_integer(KeyCode), is_integer(DeviceId) ->
        case get({This, isSingleKeyRepeatableProcessing}) of
            true ->
            (get({This, '$class'})):addGameKeyEvent(This, KeyCode, DeviceId, true);
            false -> ok
        end.

addGameKeyEvent(This, KeyCode, DeviceId, Repeated) when is_integer(KeyCode), is_integer(DeviceId), is_boolean(Repeated) ->
        try
            GameKey = (get({get({This, inputToGameKeyMapping}), '$class'})):getInstanceForCanvas(get({This, inputToGameKeyMapping}), This, KeyCode),
            case (GameKey =/= get({get({This, gameKeyFactory}), 'NONE'})) of
                true ->
                GameKeyEvent = (get({get({This, gameKeyEventFactory}), '$class'})):getInstanceForInput(get({This, gameKeyEventFactory}), This, GameKey),
                (get({get({This, downGameKeyEventHandler}), '$class'})):fireEvent(get({This, downGameKeyEventHandler}), GameKeyEvent),
                (fun(Target_N72453) -> (get({Target_N72453, '$class'})):fireEvent(Target_N72453, GameKeyEvent) end)((get({get({This, downGameKeyEventHandler}), '$class'})):getInstanceForDevice(get({This, downGameKeyEventHandler}), DeviceId));
                false ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N72244) -> (get({Target_N72244, '$class'})):toString(Target_N72244) end)((fun(Target_N72251) -> (get({Target_N72251, '$class'})):appendint(Target_N72251, KeyCode) end)((fun(Target_N72258) -> (get({Target_N72258, '$class'})):append(Target_N72258, get({get({This, gameInputStrings}), 'NO_KEY'})) end)('StringMaker':new()))), This, get({get({This, gameInputStrings}), 'ADD_KEY_EVENT'}))
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Key Event Error", This, get({get({This, gameInputStrings}), 'ADD_KEY_EVENT'}), E)
        end.

removeGameKeyEvent(This, KeyCode, DeviceId, Repeated) when is_integer(KeyCode), is_integer(DeviceId), is_boolean(Repeated) ->
        try
            GameKey = (get({get({This, inputToGameKeyMapping}), '$class'})):getInstanceForCanvas(get({This, inputToGameKeyMapping}), This, KeyCode),
            case (GameKey =/= get({get({This, gameKeyFactory}), 'NONE'})) of
                true ->
                GameKeyEvent = (get({get({This, gameKeyEventFactory}), '$class'})):getInstanceForInput(get({This, gameKeyEventFactory}), This, GameKey),
                (get({get({This, upGameKeyEventHandler}), '$class'})):fireEvent(get({This, upGameKeyEventHandler}), GameKeyEvent),
                (fun(Target_N73043) -> (get({Target_N73043, '$class'})):fireEvent(Target_N73043, GameKeyEvent) end)((get({get({This, upGameKeyEventHandler}), '$class'})):getInstanceForDevice(get({This, upGameKeyEventHandler}), DeviceId));
                false ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N72834) -> (get({Target_N72834, '$class'})):toString(Target_N72834) end)((fun(Target_N72841) -> (get({Target_N72841, '$class'})):appendint(Target_N72841, KeyCode) end)((fun(Target_N72848) -> (get({Target_N72848, '$class'})):append(Target_N72848, get({get({This, gameInputStrings}), 'NO_KEY'})) end)('StringMaker':new()))), This, get({get({This, gameInputStrings}), 'REMOVE_KEY_EVENT'}))
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Key Event Error", This, get({get({This, gameInputStrings}), 'REMOVE_KEY_EVENT'}), E)
        end.

paint(This, Graphics) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        (get({get({This, menuPaintable}), '$class'})):paint(get({This, menuPaintable}), Graphics),
        (get({get({This, repaintBehavior}), '$class'})):repaint(get({This, repaintBehavior}), This).

setMenuInputProcessor(This, MenuInputProcessor) ->
        put({This, menuInputProcessor}, MenuInputProcessor).

getMenuInputProcessor(This) ->
        get({This, menuInputProcessor}).

