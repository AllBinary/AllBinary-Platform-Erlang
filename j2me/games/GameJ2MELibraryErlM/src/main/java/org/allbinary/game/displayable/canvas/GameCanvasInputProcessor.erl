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
% import javax.microedition.lcdui.Canvas
% import org.allbinary.game.input.GameKey
% import org.allbinary.game.input.GameKeyEventSourceInterface
% import org.allbinary.game.input.GameKeyFactory
% import org.allbinary.game.input.InputProcessor
% import org.allbinary.game.input.PlatformInputMappingFactory
% import org.allbinary.game.input.event.DownGameKeyEventHandler
% import org.allbinary.game.input.event.DownKeyEventHandler
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.game.input.event.GameKeyEventFactory
% import org.allbinary.game.input.event.UpGameKeyEventHandler
% import org.allbinary.game.input.mapping.InputToGameKeyMapping
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.logic.string.StringMaker

-module('GameCanvasInputProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('InputProcessor', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, allBinaryGameCanvas}, undefined),
    put({This, downGameKeyEventHandler}, 'DownGameKeyEventHandler':getInstance()),
    put({This, upGameKeyEventHandler}, 'UpGameKeyEventHandler':getInstance()),
    put({This, downKeyEventHandler}, 'DownKeyEventHandler':getInstance()),
    put({This, smallIntegerSingletonFactory}, 'SmallIntegerSingletonFactory':getInstance()),
    put({This, inputToGameKeyMapping}, (fun(Target_N66382) -> (get({Target_N66382, '$class'})):getInputMapping(Target_N66382) end)((fun(Target_N66389) -> (get({Target_N66389, '$class'})):getPersistentInputMappingInstance(Target_N66389) end)('PlatformInputMappingFactory':getInstance()))),
    put({This, 'NONE'}, get({'GameKeyFactory':getInstance(), 'NONE'})),
    put({This, gameKeyEventFactory}, 'GameKeyEventFactory':getInstance()),
    ok.


new(AllBinaryGameCanvas) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AllBinaryGameCanvas),
    This.

'$init'(This, AllBinaryGameCanvas) ->
    'InputProcessor':'$init'(This),
    init_fields(This),
        put({This, allBinaryGameCanvas}, AllBinaryGameCanvas),
        (get({get({This, inputToGameKeyMapping}), '$class'})):init(get({This, inputToGameKeyMapping}), get({This, allBinaryGameCanvas})).

keyPressedByDevice(This, KeyCode, DeviceId) when is_integer(KeyCode), is_integer(DeviceId) ->
        try
            GameKey = (get({get({This, inputToGameKeyMapping}), '$class'})):getInstanceForCanvas(get({This, inputToGameKeyMapping}), get({This, allBinaryGameCanvas}), KeyCode),
            case (GameKey =/= get({This, 'NONE'})) of
                true ->
                GameKeyEvent = (get({get({This, gameKeyEventFactory}), '$class'})):getInstanceForInput(get({This, gameKeyEventFactory}), get({This, allBinaryGameCanvas}), GameKey),
                (get({get({This, downGameKeyEventHandler}), '$class'})):fireEvent(get({This, downGameKeyEventHandler}), GameKeyEvent),
                (fun(Target_N67018) -> (get({Target_N67018, '$class'})):fireEvent(Target_N67018, GameKeyEvent) end)((get({get({This, downGameKeyEventHandler}), '$class'})):getInstanceForDevice(get({This, downGameKeyEventHandler}), DeviceId));
                false ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66801) -> (get({Target_N66801, '$class'})):toString(Target_N66801) end)((fun(Target_N66808) -> (get({Target_N66808, '$class'})):appendint(Target_N66808, KeyCode) end)((fun(Target_N66815) -> (get({Target_N66815, '$class'})):append(Target_N66815, get({get({This, gameInputStrings}), 'NO_KEY'})) end)('StringMaker':new()))), This, get({get({This, gameInputStrings}), 'ADD_KEY_EVENT'}))
            end,
            KeyCodeAsInteger = (get({get({This, smallIntegerSingletonFactory}), '$class'})):getAtNoThrow(get({This, smallIntegerSingletonFactory}), KeyCode),
            (get({get({This, downKeyEventHandler}), '$class'})):fireEventI(get({This, downKeyEventHandler}), KeyCodeAsInteger),
            (fun(Target_N67172) -> (get({Target_N67172, '$class'})):fireEventI(Target_N67172, KeyCodeAsInteger) end)((get({get({This, downKeyEventHandler}), '$class'})):getInstanceForDevice(get({This, downKeyEventHandler}), DeviceId))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Key Event Error", This, get({get({This, gameInputStrings}), 'ADD_KEY_EVENT'}), E)
        end.

keyReleasedByDevice(This, Canvas, KeyCode, DeviceId) when is_integer(KeyCode), is_integer(DeviceId) ->
        (get({This, '$class'})):removeGameKeyEvent(This, Canvas, KeyCode, DeviceId, false).

removeGameKeyEvent(This, Canvas, KeyCode, DeviceId, Repeated) when is_integer(KeyCode), is_integer(DeviceId), is_boolean(Repeated) ->
        try
            GameKey = (get({get({This, inputToGameKeyMapping}), '$class'})):getInstanceForCanvas(get({This, inputToGameKeyMapping}), Canvas, KeyCode),
            case (GameKey =/= get({This, 'NONE'})) of
                true ->
                GameKeyEventSourceInterface = Canvas,
                GameKeyEvent = (get({get({This, gameKeyEventFactory}), '$class'})):getInstanceForInput(get({This, gameKeyEventFactory}), GameKeyEventSourceInterface, GameKey),
                (get({get({This, upGameKeyEventHandler}), '$class'})):fireEvent(get({This, upGameKeyEventHandler}), GameKeyEvent),
                (fun(Target_N67959) -> (get({Target_N67959, '$class'})):fireEvent(Target_N67959, GameKeyEvent) end)((get({get({This, upGameKeyEventHandler}), '$class'})):getInstanceForDevice(get({This, upGameKeyEventHandler}), DeviceId));
                false ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67687) -> (get({Target_N67687, '$class'})):toString(Target_N67687) end)((fun(Target_N67694) -> (get({Target_N67694, '$class'})):appendint(Target_N67694, KeyCode) end)((fun(Target_N67701) -> (get({Target_N67701, '$class'})):append(Target_N67701, get({get({This, gameInputStrings}), 'NO_KEY'})) end)('StringMaker':new()))), This, get({get({This, gameInputStrings}), 'REMOVE_KEY_EVENT'}))
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Key Event Error", This, get({get({This, gameInputStrings}), 'REMOVE_KEY_EVENT'}), E)
        end.

