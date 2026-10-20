% Generated Code Do Not Modify
% package org.platform.opengl
% import javax.microedition.khronos.opengles.GL10
% import javax.microedition.lcdui.Image
% import org.allbinary.platform.opengles.PlatformTextureBaseFactory

-module('OpenGLTextureFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PlatformTextureBaseFactory', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'OpenGLTextureFactory':new()),
    ok.

init_fields(This) ->
    put({This, gluUtils}, 'OpenGLGLUUtils':getInstance()),
    ok.


getInstance() ->
        get({'OpenGLTextureFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'PlatformTextureBaseFactory':'$init'(This),
    init_fields(This),
        ok.

load(This, Gl, Target, Level, Image, Border, Flip) when is_integer(Target), is_integer(Level), is_integer(Border), is_boolean(Flip) ->
        erlang:error({'RuntimeException'}).

