% Generated Code Do Not Modify
% package org.allbinary.game.configuration.feature

-module('MultiPlayerGameFeatureFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'MultiPlayerGameFeatureFactory':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'MultiPlayerGameFeatureFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

addCommands(This, AnyType) ->
        ok.

