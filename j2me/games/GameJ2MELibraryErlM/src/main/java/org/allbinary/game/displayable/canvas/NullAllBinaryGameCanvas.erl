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
% import javax.microedition.lcdui.Command
% import javax.microedition.lcdui.CommandListener
% import org.allbinary.game.layer.AllBinaryGameLayerManager

-module('NullAllBinaryGameCanvas').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements AllBinaryGameCanvasInterface

static_init() ->
    put({?MODULE, 'NULL_ALLBINARY_GAME_CANVAS'}, 'NullAllBinaryGameCanvas':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getLayerManager(This) ->
        erlang:error({'RuntimeException'}).

addCommand(This, Cmd) ->
        erlang:error({'RuntimeException'}).

getHeight(This) ->
        erlang:error({'RuntimeException'}).

getWidth(This) ->
        erlang:error({'RuntimeException'}).

removeCommand(This, Cmd) ->
        erlang:error({'RuntimeException'}).

setCommandListener(This, L) ->
        erlang:error({'RuntimeException'}).

