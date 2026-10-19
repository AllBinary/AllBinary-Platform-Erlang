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
% package org.allbinary.graphics.displayable
% import javax.microedition.lcdui.Canvas
% import javax.microedition.lcdui.Command
% import javax.microedition.lcdui.CommandListener
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.NullCommandListener
% import org.allbinary.graphics.displayable.command.MyCommandInterface
% import org.allbinary.graphics.displayable.command.MyCommandsFactory
% import org.allbinary.input.TouchJ2ME
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.media.audio.Sound
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.logic.StdUtil
% import org.allbinary.util.ABStack

-module('MyCanvas').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DisplayableInterface
% implements MyCommandInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Canvas', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, canvasStrings}, 'CanvasStrings':getInstance()),
    put({This, stringUtil}, 'StringUtil':getInstance()),
    put({This, displayInfo}, 'DisplayInfoSingleton':getInstance()),
    put({This, name}, undefined),
    put({This, childNameList}, undefined),
    put({This, commandStack}, undefined),
    put({This, commandListener}, get({'NullCommandListener', 'NULL_COMMAND_LISTENER'})),
    put({This, paused}, false),
    put({This, touchME}, 'TouchJ2ME':new()),
    ok.


new(Name, ChildNameList) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, ChildNameList),
    This.

init(This, Name, ChildNameList) when (is_list(Name) orelse Name =:= undefined) ->
    'Canvas':init(This),
    init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'CONSTRUCTOR'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        (get({get({This, displayInfo}), '$class'})):update(get({This, displayInfo}), This, get({get({This, canvasStrings}), 'CONSTRUCTOR'})),
        put({This, name}, Name),
        put({This, childNameList}, ChildNameList),
        put({This, commandStack}, (fun(Target_N66668) -> (get({Target_N66668, '$class'})):createStack(Target_N66668) end)('StdUtil':getInstance())).

setFullScreenMode(This, Mode) when is_boolean(Mode) ->
        'Canvas':setFullScreenMode(This, Mode),
        (get({get({This, displayInfo}), '$class'})):update(get({This, displayInfo}), This, get({get({This, canvasStrings}), 'SET_FULL_SCREEN_MODE'})).

sizeChanged(This, W, H) when is_integer(W), is_integer(H) ->
        (get({get({This, displayInfo}), '$class'})):update(get({This, displayInfo}), This, get({get({This, canvasStrings}), 'SIZE_CHANGED'})).

getCommandStack(This) ->
        get({This, commandStack}).

isCommand(This, Command) ->
        (get({get({This, commandStack}), '$class'})):contains(get({This, commandStack}), Command).

addCommand(This, Command) ->
        case (not (get({get({This, commandStack}), '$class'})):contains(get({This, commandStack}), Command)) of
            true ->
            (get({get({This, commandStack}), '$class'})):push(get({This, commandStack}), Command),
            'Canvas':addCommand(This, Command);
            false -> ok
        end.

removeCommand(This, Command) ->
        (get({get({This, commandStack}), '$class'})):removeElement(get({This, commandStack}), Command),
        'Canvas':removeCommand(This, Command).

removeAllCommands(This) ->
        Size = (get({get({This, commandStack}), '$class'})):size(get({This, commandStack})),
        lists:foreach(fun(Index) ->
            'Canvas':removeCommand(This, (get({get({This, commandStack}), '$class'})):pop(get({This, commandStack})))
        end, lists:seq(0, Size - 1)).

setCommandListener(This, L) ->
        'Canvas':setCommandListener(This, L),
        put({This, commandListener}, L).

getCustomCommandListener(This) ->
        get({This, commandListener}).

isPaused(This) ->
        get({This, paused}).

removePauseCommand(This) ->
        (get({This, '$class'})):removeCommand(This, get({'MyCommandsFactory':getInstance(), 'PAUSE_COMMAND'})).

pause(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, canvasStrings}), 'PAUSE'})),
        (get({This, '$class'})):removePauseCommand(This),
        (get({This, '$class'})):addCommand(This, get({'MyCommandsFactory':getInstance(), 'RESUME_COMMAND'})),
        (get({This, '$class'})):setPaused(This, true).

unPause(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, canvasStrings}), 'UN_PAUSE'})),
        (get({This, '$class'})):removeCommand(This, get({'MyCommandsFactory':getInstance(), 'RESUME_COMMAND'})),
        (get({This, '$class'})):addCommand(This, get({'MyCommandsFactory':getInstance(), 'PAUSE_COMMAND'})),
        (get({This, '$class'})):setPaused(This, false).

% throws Exception
process(This) ->
        (get({get({This, displayInfo}), '$class'})):process(get({This, displayInfo})).

paint(This, Graphics) ->
        ok.

draw(This, Graphics) ->
        ok.

hasChild(This, Displayable) ->
        (get({get({This, childNameList}), '$class'})):contains(get({This, childNameList}), get({Displayable, name})).

destroy(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Destroyed MyCanvas", This, "destroy").

setPaused(This, IsPaused) when is_boolean(IsPaused) ->
        put({This, paused}, IsPaused).

keyPressedByDevice(This, KeyCode, DeviceId) when is_integer(KeyCode), is_integer(DeviceId) ->
        ok.

keyRepeatedByDevice(This, KeyCode, DeviceId) when is_integer(KeyCode), is_integer(DeviceId) ->
        ok.

keyReleasedByDevice(This, KeyCode, DeviceId) when is_integer(KeyCode), is_integer(DeviceId) ->
        ok.

pointerDragged(This, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, touchME}), '$class'})):pointerDragged(get({This, touchME}), X, Y).

pointerPressed(This, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, touchME}), '$class'})):pointerPressed(get({This, touchME}), X, Y).

pointerReleased(This, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, touchME}), '$class'})):pointerReleased(get({This, touchME}), X, Y).

nextSong(This, NextSongSound, LeftVolume, RightVolume) when is_integer(LeftVolume), is_integer(RightVolume) ->
        ok.

