% Generated Code Do Not Modify
% package org.allbinary.graphics.opengles.shader
% import javax.microedition.khronos.opengles.GL10
% import org.allbinary.graphics.opengles.OpenGLProcessor

-module('ShaderOpenGLProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('OpenGLProcessor', Function, Arguments).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'OpenGLProcessor':init(This),
    init_fields(This),
        ok.

process0(This, Gl) ->
        ok.

process1(This, Gl) ->
        ok.

process(This, Gl) ->
        ok.

process2(This, Gl) ->
        ok.

process3(This, Gl) ->
        ok.

