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
% package org.allbinary.game.state
% import org.allbinary.logic.NullUtil

-module('GameStateFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, index}, 0),
    put({This, 'NO_GAME_STATE'}, (get({This, '$class'})):createGameState(This, "NO_GAME_STATE")),
    put({This, 'PLAYING_GAME_STATE'}, (get({This, '$class'})):createGameState(This, "PLAYING_GAME_STATE")),
    put({This, 'SHOW_END_RESULT_GAME_STATE'}, (get({This, '$class'})):createGameState(This, "SHOW_END_RESULT_GAME_STATE")),
    put({This, 'SHOW_HIGH_SCORE_GAME_STATE'}, (get({This, '$class'})):createGameState(This, "SHOW_HIGH_SCORE_GAME_STATE")),
    ok.


getInstance() ->
        case (get({'GameStateFactory', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'GameStateFactory', instance}, 'GameStateFactory':new());
            false -> ok
        end,
        get({'GameStateFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

createGameState(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        'GameState':new(Name, allbinary_java:first(get({This, index}), put({This, index}, get({This, index}) + 1))).

