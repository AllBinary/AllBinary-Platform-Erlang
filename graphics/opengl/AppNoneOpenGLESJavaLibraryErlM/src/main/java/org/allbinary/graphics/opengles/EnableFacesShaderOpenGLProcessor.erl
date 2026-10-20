% Generated Code Do Not Modify
% package org.allbinary.graphics.opengles
% import javax.microedition.khronos.opengles.GL10
% import org.allbinary.graphics.threed.min3d.renderer.processor.ObjectThreedOpenGLProcessor

-module('EnableFacesShaderOpenGLProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ObjectThreedOpenGLProcessor', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'EnableFacesShaderOpenGLProcessor':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'EnableFacesShaderOpenGLProcessor', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'ObjectThreedOpenGLProcessor':'$init'(This),
    init_fields(This),
        ok.

process(This, Gl, AnyType) ->
        ok.

