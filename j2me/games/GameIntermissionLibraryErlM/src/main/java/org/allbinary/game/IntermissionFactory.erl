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
% package org.allbinary.game
% import org.allbinary.game.state.GameState
% import org.allbinary.game.state.GameStateFactory

-module('IntermissionFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'IntermissionFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'START_LEVEL_INTERMISSION_GAME_STATE'}, (fun(Target_N65761) -> (get({Target_N65761, '$class'})):createGameState(Target_N65761, "START_LEVEL_INTERMISSION_GAME_STATE") end)('GameStateFactory':getInstance())),
    put({This, 'WAIT_LEVEL_INTERMISSION_GAME_STATE'}, (fun(Target_N65826) -> (get({Target_N65826, '$class'})):createGameState(Target_N65826, "WAIT_LEVEL_INTERMISSION_GAME_STATE") end)('GameStateFactory':getInstance())),
    put({This, 'SHOW_RESULTS_LEVEL_INTERMISSION_GAME_STATE'}, (fun(Target_N65891) -> (get({Target_N65891, '$class'})):createGameState(Target_N65891, "SHOW_RESULTS_LEVEL_INTERMISSION_GAME_STATE") end)('GameStateFactory':getInstance())),
    put({This, 'SHOW_HIGH_SCORE_LEVEL_INTERMISSION_GAME_STATE'}, (fun(Target_N65956) -> (get({Target_N65956, '$class'})):createGameState(Target_N65956, "SHOW_HIGH_SCORE_LEVEL_INTERMISSION_GAME_STATE") end)('GameStateFactory':getInstance())),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'IntermissionFactory', instance}).

