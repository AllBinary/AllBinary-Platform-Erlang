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
% package org.allbinary.game.input.mapping
% import org.allbinary.game.input.GameKey
% import org.allbinary.logic.string.StringUtil

-module('GameInputMapping').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, name}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, gameKey}, get({'GameKey', 'NULL_GAME_KEY'})),
    ok.


new(Name, GameKey) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, GameKey),
    This.

init(This, Name, GameKey) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):setName(This, Name),
        (get({This, '$class'})):setGameKey(This, GameKey).

setGameKey(This, GameKey) ->
        put({This, gameKey}, GameKey).

getGameKey(This) ->
        get({This, gameKey}).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({This, name}, Name).

getName(This) ->
        get({This, name}).

