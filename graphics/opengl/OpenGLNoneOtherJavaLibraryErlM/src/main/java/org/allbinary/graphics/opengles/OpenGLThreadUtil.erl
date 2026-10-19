% Generated Code Do Not Modify
% package org.allbinary.graphics.opengles

-module('OpenGLThreadUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OpenGLThreadUtil':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'OpenGLThreadUtil', instance}).

set(This, GlSurfaceView) ->
        ok.

onPause(This) ->
        ok.

onResume(This) ->
        ok.

