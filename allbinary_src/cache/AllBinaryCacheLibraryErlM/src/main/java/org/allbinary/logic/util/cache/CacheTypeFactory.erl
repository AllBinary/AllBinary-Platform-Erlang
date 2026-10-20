% Generated Code Do Not Modify
% package org.allbinary.logic.util.cache
% import org.allbinary.logic.string.StringUtil

-module('CacheTypeFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'CacheTypeFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'NO_CACHE'}, 'CacheType':new(get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}))),
    put({This, 'CACHE'}, 'CacheType':new(get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}))),
    put({This, 'SET'}, 'CacheType':new(get({'StringUtil':getInstance(), 'EMPTY_STRING'}), "Set")),
    put({This, 'CACHE_VECTOR'}, 'CacheType':new(get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}))),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'CacheTypeFactory', instance}).

