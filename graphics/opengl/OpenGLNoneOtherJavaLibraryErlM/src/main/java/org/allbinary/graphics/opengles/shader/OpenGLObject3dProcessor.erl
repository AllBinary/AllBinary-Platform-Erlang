% Generated Code Do Not Modify
% package org.allbinary.graphics.opengles.shader
% import javax.microedition.khronos.opengles.GL10
% import org.allbinary.string.CommonStrings

-module('OpenGLObject3dProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


process(This, Gl, Object3d) ->
        ok.

process(This, Gl, Object3d, Index) when is_integer(Index) ->
        ok.

