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
% package org.allbinary.game.input
% import org.allbinary.logic.NullUtil

-module('GameKeyMappingFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, intKeyToGameKey}, array:new(get({'InputFactory':getInstance(), 'MAX'}), {default, undefined})),
    ok.


getInstance() ->
        case (get({'GameKeyMappingFactory', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'GameKeyMappingFactory', instance}, 'GameKeyMappingFactory':new());
            false -> ok
        end,
        get({'GameKeyMappingFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        GameKeyFactory = 'GameKeyFactory':getInstance(),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'NONE'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'UP'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'DOWN'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'LEFT'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'RIGHT'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'KEY_POUND'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'KEY_STAR'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'KEY_NUM0'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'KEY_NUM1'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'KEY_NUM2'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'KEY_NUM3'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'KEY_NUM4'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'KEY_NUM5'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'KEY_NUM6'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'KEY_NUM7'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'KEY_NUM8'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'KEY_NUM9'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'GAME_A'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'GAME_B'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'GAME_C'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'GAME_D'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'FIRE'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'LEVEL_DOWN'})),
        (get({This, '$class'})):setGameKey(This, get({GameKeyFactory, 'LEVEL_UP'})).

getGameKey(This, Key) when is_integer(Key) ->
        array:get(Key, get({This, intKeyToGameKey})).

setGameKey(This, GameKey) ->
        put({This, intKeyToGameKey}, array:set((get({GameKey, '$class'})):getId(GameKey), GameKey, get({This, intKeyToGameKey}))).

