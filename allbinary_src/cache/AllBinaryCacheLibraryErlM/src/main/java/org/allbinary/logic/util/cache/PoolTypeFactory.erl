% Generated Code Do Not Modify
% package org.allbinary.logic.util.cache

-module('PoolTypeFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PoolTypeFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'VECTOR_POOL'}, 'PoolType':new(get({'CacheTypeFactory':getInstance(), 'NO_CACHE'}))),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'PoolTypeFactory', instance}).

