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
% import javax.microedition.lcdui.ItemStateListener
% import org.allbinary.game.state.GameStateCompositeInterface
% import org.allbinary.graphics.paint.PaintableInterface
% import org.allbinary.thread.RunnableInterface
% import org.allbinary.util.ABHashtable

-module('GameCanvasRunnableInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('RunnableInterface', Function, Arguments).


getTitle(This) ->
    erlang:error({abstract_method, getTitle}).

isInitialized(This) ->
    erlang:error({abstract_method, isInitialized}).

isPaused(This) ->
    erlang:error({abstract_method, isPaused}).

unPause(This) ->
    erlang:error({abstract_method, unPause}).

pause(This) ->
    erlang:error({abstract_method, pause}).

isHighScoreSubmitted(This) ->
    erlang:error({abstract_method, isHighScoreSubmitted}).

% throws Exception
setHighScoreSubmitted(This, HighScoreSubmitted) when is_boolean(HighScoreSubmitted) ->
    erlang:error({abstract_method, setHighScoreSubmitted}).

% throws Exception
processGameOver(This) ->
    erlang:error({abstract_method, processGameOver}).

isGameOver(This) ->
    erlang:error({abstract_method, isGameOver}).

initCommands(This, CmdListener) ->
    erlang:error({abstract_method, initCommands}).

% throws Exception
getCurrentStateHashtable(This) ->
    erlang:error({abstract_method, getCurrentStateHashtable}).

% throws Exception
getLoadStateHashtable(This) ->
    erlang:error({abstract_method, getLoadStateHashtable}).

% throws Exception
setLoadStateHashtable(This, Hashtable) ->
    erlang:error({abstract_method, setLoadStateHashtable}).

getType(This) ->
    erlang:error({abstract_method, getType}).

