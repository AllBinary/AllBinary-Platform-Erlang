% Generated Code Do Not Modify
% package org.platform.opengl
% import java.nio.ByteBuffer
% import javax.microedition.khronos.opengles.GL10
% import org.allbinary.graphics.OpenGLBitmap
% import org.allbinary.image.opengles.OpenGLESImage

-module('OpenGLGLUUtils').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OpenGLGLUUtils':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'OpenGLGLUUtils', instance}).

makeByteBuffer(This, Bmp, Flip) when is_boolean(Flip) ->
        erlang:error({'RuntimeException'}).

texImage2D(This, Gl, GlVersion, Target, Level, GenerateMipMap, OpenGLESImage, Border, Flip) when (is_list(GlVersion) orelse GlVersion =:= undefined), is_integer(Target), is_integer(Level), is_boolean(GenerateMipMap), is_integer(Border), is_boolean(Flip) ->
        erlang:error({'RuntimeException'});
texImage2D(This, Gl, GlVersion, Target, Level, GenerateMipMap, Bitmap, Border, Flip) when (is_list(GlVersion) orelse GlVersion =:= undefined), is_integer(Target), is_integer(Level), is_boolean(GenerateMipMap), is_integer(Border), is_boolean(Flip) ->
        erlang:error({'RuntimeException'}).


