% Generated Code Do Not Modify
% package org.allbinary
% import org.allbinary.game.testgamedemo.R

-module('AndroidResources').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AndroidResources':new()),
    ok.

init_fields(This) ->
    put({This, drawable}, 'drawable':new()),
    put({This, id}, 'id':new()),
    put({This, layout}, 'layout':new()),
    put({This, raw}, 'raw':new()),
    put({This, string}, 'string':new()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'AndroidResources', instance}).

