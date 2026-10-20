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
    put({This, 'NORMAL_GAME_OVER_WIN'}, "You Won"),
    put({This, 'TEASER_DEMO_GAME_END_LAST_LEVEL'}, "End of Demo."),
    put({This, 'TEASER_DEMO_GAME_END'}, "Demo Game Over."),
    put({This, gameOverStr}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, winStr}, get({This, gameOverStr})),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


update(This, GameInfo, MyCanvas) ->
        case (get({GameInfo, '$class'})):isLastLevel(GameInfo) of
            true ->
            (get({This, '$class'})):setWinStr(This, get({This, 'TEASER_DEMO_GAME_END_LAST_LEVEL'})),
            (get({This, '$class'})):setGameOverStr(This, get({This, 'TEASER_DEMO_GAME_END_LAST_LEVEL'}));
            false ->
            (get({This, '$class'})):setWinStr(This, get({This, 'NORMAL_GAME_OVER_WIN'})),
            (get({This, '$class'})):setGameOverStr(This, get({This, 'TEASER_DEMO_GAME_END'}))
        end.

getGameOverStr(This) ->
        get({This, gameOverStr}).

setGameOverStr(This, GameOverStr) when (is_list(GameOverStr) orelse GameOverStr =:= undefined) ->
        put({This, gameOverStr}, GameOverStr).

getWinStr(This) ->
        get({This, winStr}).

setWinStr(This, WinStr) when (is_list(WinStr) orelse WinStr =:= undefined) ->
        put({This, winStr}, WinStr).

