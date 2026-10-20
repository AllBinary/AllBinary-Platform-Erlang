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
% import org.allbinary.game.input.Input
% import org.allbinary.game.input.InputFactory
% import org.allbinary.game.input.InputProcessor
% import org.allbinary.game.input.PlatformKeyFactory
% import org.allbinary.game.input.event.DownKeyEventHandler
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.game.input.event.GameKeyEventFactory
% import org.allbinary.game.input.event.UpGameKeyEventHandler
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('FormInputProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('InputProcessor', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, gameKeyEventFactory}, 'GameKeyEventFactory':getInstance()),
    put({This, downKeyEventHandler}, 'DownKeyEventHandler':getInstance()),
    put({This, upGameKeyEventHandler}, 'UpGameKeyEventHandler':getInstance()),
    put({This, inputFactory}, 'InputFactory':getInstance()),
    put({This, platformKeyFactory}, 'PlatformKeyFactory':getInstance()),
    put({This, allBinaryGameCanvas}, undefined),
    ok.


new(AllBinaryGameCanvas) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AllBinaryGameCanvas),
    This.

'$init'(This, AllBinaryGameCanvas) ->
    'InputProcessor':'$init'(This),
    init_fields(This),
        put({This, allBinaryGameCanvas}, AllBinaryGameCanvas).

keyPressedByDevice(This, KeyCode, DeviceId) when is_integer(KeyCode), is_integer(DeviceId) ->
        try
            'PreLogUtil':put((fun(Target_N66618) -> (get({Target_N66618, '$class'})):toString(Target_N66618) end)((fun(Target_N66625) -> (get({Target_N66625, '$class'})):appendint(Target_N66625, DeviceId) end)((fun(Target_N66632) -> (get({Target_N66632, '$class'})):append(Target_N66632, get({get({This, inputFactory}), 'DEVICE_ID_LABEL'})) end)((fun(Target_N66639) -> (get({Target_N66639, '$class'})):append(Target_N66639, get({'CommonSeps':getInstance(), 'SPACE'})) end)((fun(Target_N66646) -> (get({Target_N66646, '$class'})):appendint(Target_N66646, KeyCode) end)((fun(Target_N66653) -> (get({Target_N66653, '$class'})):append(Target_N66653, get({get({This, inputFactory}), 'KEY_CODE_LABEL'})) end)('StringMaker':new())))))), This, get({get({This, gameInputStrings}), 'KEY_PRESSED'})),
            Input = (get({get({This, inputFactory}), '$class'})):getInstanceById(get({This, inputFactory}), KeyCode),
            GameKeyEvent = (get({get({This, gameKeyEventFactory}), '$class'})):getInstanceForInput(get({This, gameKeyEventFactory}), get({This, allBinaryGameCanvas}), Input),
            (get({get({This, downKeyEventHandler}), '$class'})):fireEventForGameKeyEvent(get({This, downKeyEventHandler}), GameKeyEvent)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, gameInputStrings}), 'ADD_KEY_EVENT'}), E)
        end.

keyReleasedByDevice(This, Canvas, KeyCode, DeviceId) when is_integer(KeyCode), is_integer(DeviceId) ->
        try
            Input = (get({get({This, inputFactory}), '$class'})):getInstanceById(get({This, inputFactory}), KeyCode),
            case (get({get({This, platformKeyFactory}), '$class'})):isEnter(get({This, platformKeyFactory}), Input) of
                true ->
                'PreLogUtil':put((fun(Target_N67291) -> (get({Target_N67291, '$class'})):toString(Target_N67291) end)((fun(Target_N67298) -> (get({Target_N67298, '$class'})):appendint(Target_N67298, DeviceId) end)((fun(Target_N67305) -> (get({Target_N67305, '$class'})):append(Target_N67305, get({get({This, inputFactory}), 'DEVICE_ID_LABEL'})) end)((fun(Target_N67312) -> (get({Target_N67312, '$class'})):append(Target_N67312, get({'CommonSeps':getInstance(), 'SPACE'})) end)((fun(Target_N67319) -> (get({Target_N67319, '$class'})):appendint(Target_N67319, KeyCode) end)((fun(Target_N67326) -> (get({Target_N67326, '$class'})):append(Target_N67326, get({get({This, inputFactory}), 'KEY_CODE_LABEL'})) end)('StringMaker':new())))))), This, get({get({This, gameInputStrings}), 'KEY_RELEASED'})),
                GameKey = get({'GameKeyFactory':getInstance(), 'KEY_NUM0'}),
                GameKeyEventSourceInterface = Canvas,
                GameKeyEvent = (get({get({This, gameKeyEventFactory}), '$class'})):getInstanceForInput(get({This, gameKeyEventFactory}), GameKeyEventSourceInterface, GameKey),
                (get({get({This, upGameKeyEventHandler}), '$class'})):fireEvent(get({This, upGameKeyEventHandler}), GameKeyEvent),
                (fun(Target_N67694) -> (get({Target_N67694, '$class'})):fireEvent(Target_N67694, GameKeyEvent) end)((get({get({This, upGameKeyEventHandler}), '$class'})):getInstanceForDevice(get({This, upGameKeyEventHandler}), DeviceId));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, gameInputStrings}), 'ADD_KEY_EVENT'}), E)
        end.

