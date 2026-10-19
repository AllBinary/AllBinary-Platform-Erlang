% Generated Code Do Not Modify
% package org.allbinary.game.midlet
% import org.allbinary.game.state.GameState
% import org.allbinary.game.state.GameStateFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonLabels

-module('GameMidletStateFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'INSTANCE'}, 'GameMidletStateFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, currentGameState}, get({'GameStateFactory':getInstance(), 'NO_GAME_STATE'})),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getInstance() ->
        get({'GameMidletStateFactory', 'INSTANCE'}).

getCurrentGameState(This) ->
        get({This, currentGameState}).

setCurrentGameState(This, CurrentGameState) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66065) -> (get({Target_N66065, '$class'})):toString(Target_N66065) end)((fun(Target_N66072) -> (get({Target_N66072, '$class'})):append(Target_N66072, (fun(Target_N66143) -> (get({Target_N66143, '$class'})):toString(Target_N66143, CurrentGameState) end)('StringUtil':getInstance())) end)((fun(Target_N66079) -> (get({Target_N66079, '$class'})):append(Target_N66079, " GameState: ") end)((fun(Target_N66086) -> (get({Target_N66086, '$class'})):append(Target_N66086, get({'CommonLabels':getInstance(), 'CURRENT'})) end)('StringMaker':new())))), This, "setCurrentGameState"),
        put({This, currentGameState}, CurrentGameState).

