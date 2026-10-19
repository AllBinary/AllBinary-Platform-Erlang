% Generated Code Do Not Modify
% package org.allbinary.image.opengles

-module('OpenGLStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OpenGLStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'GL_ERROR_LABEL'}, "GLError: "),
    put({This, 'SET'}, "set(GL10)"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'OpenGLStrings', instance}).

