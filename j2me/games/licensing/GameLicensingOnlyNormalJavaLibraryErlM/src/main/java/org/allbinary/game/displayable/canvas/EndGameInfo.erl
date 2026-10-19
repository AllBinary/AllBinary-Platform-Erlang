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
% import org.allbinary.game.GameInfo
% import org.allbinary.graphics.displayable.MyCanvas
% import org.allbinary.logic.string.StringUtil

-module('EndGameInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, 'NORMAL_GAME_OVER'}, "Game Over"),
    put({This, 'NORMAL_GAME_OVER_WIN'}, "You Won"),
    put({This, gameOverStr}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, winStr}, get({This, gameOverStr})),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

update(This, GameInfo, MyCanvas) ->
        (get({This, '$class'})):setGameOverStr(This, get({This, 'NORMAL_GAME_OVER'})),
        (get({This, '$class'})):setWinStr(This, get({This, 'NORMAL_GAME_OVER_WIN'})).

getGameOverStr(This) ->
        get({This, gameOverStr}).

setGameOverStr(This, GameOverStr) when (is_list(GameOverStr) orelse GameOverStr =:= undefined) ->
        put({This, gameOverStr}, GameOverStr).

getWinStr(This) ->
        get({This, winStr}).

setWinStr(This, WinStr) when (is_list(WinStr) orelse WinStr =:= undefined) ->
        put({This, winStr}, WinStr).

