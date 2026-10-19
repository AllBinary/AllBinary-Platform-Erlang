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
% package org.allbinary.game.state
% import org.allbinary.logic.NullUtil

-module('RaceGameStateFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, 'START_GAME_STATE'}, (fun(Target_N65848) -> (get({Target_N65848, '$class'})):createGameState(Target_N65848, "START_GAME_STATE") end)('GameStateFactory':getInstance())),
    put({This, 'YELLOW_LIGHT_GAME_STATE'}, (fun(Target_N65913) -> (get({Target_N65913, '$class'})):createGameState(Target_N65913, "YELLOW_LIGHT_GAME_STATE") end)('GameStateFactory':getInstance())),
    put({This, 'RED_LIGHT_GAME_STATE'}, (fun(Target_N65978) -> (get({Target_N65978, '$class'})):createGameState(Target_N65978, "RED_LIGHT_GAME_STATE") end)('GameStateFactory':getInstance())),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        case (get({'RaceGameStateFactory', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'RaceGameStateFactory', instance}, 'RaceGameStateFactory':new());
            false -> ok
        end,
        get({'RaceGameStateFactory', instance}).

