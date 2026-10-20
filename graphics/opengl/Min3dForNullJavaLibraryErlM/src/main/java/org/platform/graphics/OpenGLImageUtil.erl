% Generated Code Do Not Modify
% package org.platform.graphics
% import org.allbinary.image.opengles.OpenGLImageUtilBase

-module('OpenGLImageUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('OpenGLImageUtilBase', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'OpenGLImageUtil':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'OpenGLImageUtilBase':'$init'(This),
    init_fields(This).


getInstance() ->
        get({'OpenGLImageUtil', instance}).

