% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Item
% import org.allbinary.game.state.GameState
% import org.allbinary.game.state.GameStateFactory
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.util.ABHashtable

-module('NullGameCanvasRunnable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements GameCanvasRunnableInterface

static_init() ->
    put({?MODULE, 'NULL_GAME_CANVAS_RUNNABLE'}, 'NullGameCanvasRunnable':new()),
    ok.

init_fields(This) ->
    put({This, gameStateFactory}, 'GameStateFactory':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getTitle(This) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

isInitialized(This) ->
        false.

isPaused(This) ->
        false.

unPause(This) ->
        ok.

pause(This) ->
        ok.

isHighScoreSubmitted(This) ->
        false.

% throws Exception
setHighScoreSubmitted(This, HighScoreSubmitted) when is_boolean(HighScoreSubmitted) ->
        ok.

% throws Exception
processGameOver(This) ->
        ok.

isGameOver(This) ->
        false.

initCommands(This, CmdListener) ->
        ok.

% throws Exception
getCurrentStateHashtable(This) ->
        get({'StdUtil':getInstance(), 'NULL_TABLE'}).

% throws Exception
getLoadStateHashtable(This) ->
        get({'StdUtil':getInstance(), 'NULL_TABLE'}).

% throws Exception
setLoadStateHashtable(This, Hashtable) ->
        ok.

getType(This) ->
        (-1).

% throws Exception
setGameState(This, GameState) ->
        ok.

getGameState(This) ->
        get({get({This, gameStateFactory}), 'NO_GAME_STATE'}).

itemStateChanged(This, Item) ->
        ok.

paint(This, Graphics) ->
        ok.

paintThreed(This, Graphics) ->
        ok.

isRunning(This) ->
        false.

setRunning(This, IsRunning) when is_boolean(IsRunning) ->
        ok.

% throws Exception
setThread(This, Thread) ->
        ok.

run(This) ->
        ok.

