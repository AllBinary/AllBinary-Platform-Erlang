% Generated Code Do Not Modify
% package org.allbinary.graphics.form

-module('ScreenInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ScreenInfo':new()),
    ok.

init_fields(This) ->
    put({This, 'SMALL_WIDTH'}, 320),
    put({This, 'SMALL_HEIGHT'}, 240),
    put({This, 'MEDIUM_WIDTH'}, 800),
    put({This, 'MEDIUM_HEIGHT'}, 600),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'ScreenInfo', instance}).

