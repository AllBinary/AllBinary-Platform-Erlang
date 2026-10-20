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
% import javax.microedition.lcdui.NullCanvas
% import org.allbinary.canvas.RunnableCanvas
% import org.allbinary.game.commands.GameCommandsFactory
% import org.allbinary.game.input.GameInputStrings
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.util.BasicArrayList

-module('DemoCanvasBasicStartInputProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicMenuInputProcessor', Function, Arguments).

init_fields(This) ->
    ok.


new(GameKeyEventList, GameCanvas) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GameKeyEventList, GameCanvas),
    This.

'$init'(This, GameKeyEventList, GameCanvas) ->
        'BasicMenuInputProcessor':'$init'(This, GameKeyEventList, (-1), GameCanvas).

% throws Exception
processInputList(This) ->
        List = (get({This, '$class'})):getGameKeyEventList(This),
        Size = (get({List, '$class'})):size(List),
        put({local, gameKeyEvent}, undefined),
        lists:foreach(fun(Index) ->
            put({local, gameKeyEvent}, array:get(Index, get({List, objectArray}))),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66121) -> (get({Target_N66121, '$class'})):toString(Target_N66121) end)((fun(Target_N66128) -> (get({Target_N66128, '$class'})):append(Target_N66128, (fun(Target_N66164) -> (get({Target_N66164, '$class'})):toString(Target_N66164, get({local, gameKeyEvent})) end)('StringUtil':getInstance())) end)((fun(Target_N66135) -> (get({Target_N66135, '$class'})):append(Target_N66135, "Start GameKey: ") end)('StringMaker':new()))), This, get({'GameInputStrings':getInstance(), 'PROCESS_INPUT'}))
        end, lists:seq(0, Size - 1)),
        (fun(Target_N66301) -> (get({Target_N66301, '$class'})):commandAction(Target_N66301, get({'GameCommandsFactory':getInstance(), 'START_COMMAND'}), get({'NullCanvas', 'NULL_CANVAS'})) end)((fun(Target_N66308) -> (get({Target_N66308, '$class'})):getCustomCommandListener(Target_N66308) end)((get({This, '$class'})):getCanvas(This))),
        Size.

