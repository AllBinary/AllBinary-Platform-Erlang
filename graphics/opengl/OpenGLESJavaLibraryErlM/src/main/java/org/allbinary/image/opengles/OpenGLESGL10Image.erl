%
% AllBinary Open License Version 1
% Copyright (c) 2011 AllBinary
% 
% By agreeing to this license you and any business entity you represent are
% legally bound to the AllBinary Open License Version 1 legal agreement.
% 
% You may obtain the AllBinary Open License Version 1 legal agreement from
% AllBinary or the root directory of AllBinary's AllBinary Platform repository.
% 
% Created By: Travis Berthelot
%  
% Generated Code Do Not Modify
% package org.allbinary.image.opengles
% import java.nio.ByteBuffer
% import java.nio.ByteOrder
% import java.nio.FloatBuffer
% import javax.microedition.khronos.opengles.GL
% import javax.microedition.khronos.opengles.GL10
% import javax.microedition.lcdui.Image
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.opengles.OpenGLLogUtil
% import org.allbinary.opengles.GLUtil
% import org.allbinary.platform.graphics.PlatformBitmapBaseFactory
% import org.allbinary.platform.opengles.PlatformTextureBaseFactory

-module('OpenGLESGL10Image').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('OpenGLESImage', Function, Arguments).

init_fields(This) ->
    put({This, textureVertexFloatBuffer}, (fun(Target_N65907) -> (get({Target_N65907, '$class'})):asFloatBuffer(Target_N65907) end)((fun(Target_N65914) -> (get({Target_N65914, '$class'})):order(Target_N65914, 'ByteOrder':nativeOrder()) end)('ByteBuffer':allocateDirect(((4 * 4) * 2))))),
    put({This, realOpenGLESImageDraw}, 'OpenGLESImageDraw':new() % Java anonymous class body: implement it as a module
%         put({This, glUtil}, 'GLUtil':getInstance())
%         put({This, displayInfoSingleton}, 'DisplayInfoSingleton':getInstance())
%         put({This, textureVertexFloatBuffer}, get({This, textureVertexFloatBuffer}))
%         put({This, regionTextureRectangleFloatArray}, array:new(8, {default, 0.0}))
%         put({This, regionTextureVertexFloatBuffer}, (fun(Target_N66253) -> (get({Target_N66253, '$class'})):asFloatBuffer(Target_N66253) end)((fun(Target_N66260) -> (get({Target_N66260, '$class'})):order(Target_N66260, 'ByteOrder':nativeOrder()) end)('ByteBuffer':allocateDirect(((4 * 4) * 2)))))
%         put({This, regionRectangleFloatArray}, array:from_list([0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]))
%         put({This, regionRectangleVertexFloatBuffer}, (fun(Target_N66465) -> (get({Target_N66465, '$class'})):asFloatBuffer(Target_N66465) end)((fun(Target_N66472) -> (get({Target_N66472, '$class'})):order(Target_N66472, 'ByteOrder':nativeOrder()) end)('ByteBuffer':allocateDirect(((4 * 4) * 3)))))
%         put({This, openGLESImageProperties}, get({This, openGLESImageProperties}))
%         ok % drawRegion
%         ok % draw
),
    put({This, openGLESImageDraw}, 'OpenGLESImageDraw':getInstance()),
    ok.


new(Image, BitmapFactory, TextureFactory) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Image, BitmapFactory, TextureFactory),
    This.

init(This, Image, BitmapFactory, TextureFactory) ->
        'OpenGLESImage':init(This, Image, BitmapFactory, TextureFactory),
        init_fields(This),
        (get({This, '$class'})):initVertices(This).

initVertices(This) ->
        (get({get({This, textureVertexFloatBuffer}), '$class'})):put(get({This, textureVertexFloatBuffer}), 0.0),
        (get({get({This, textureVertexFloatBuffer}), '$class'})):put(get({This, textureVertexFloatBuffer}), 1.0),
        (get({get({This, textureVertexFloatBuffer}), '$class'})):put(get({This, textureVertexFloatBuffer}), 1.0),
        (get({get({This, textureVertexFloatBuffer}), '$class'})):put(get({This, textureVertexFloatBuffer}), 1.0),
        (get({get({This, textureVertexFloatBuffer}), '$class'})):put(get({This, textureVertexFloatBuffer}), 0.0),
        (get({get({This, textureVertexFloatBuffer}), '$class'})):put(get({This, textureVertexFloatBuffer}), 0.0),
        (get({get({This, textureVertexFloatBuffer}), '$class'})):put(get({This, textureVertexFloatBuffer}), 1.0),
        (get({get({This, textureVertexFloatBuffer}), '$class'})):put(get({This, textureVertexFloatBuffer}), 0.0),
        (get({get({This, textureVertexFloatBuffer}), '$class'})):rewind(get({This, textureVertexFloatBuffer})).

set(This, Gl) ->
        Gl10 = Gl,
        case 'OpenGLESImage':initTexture(This, Gl10) of
            true ->
            (get({get({This, textureFactory}), '$class'})):load(get({This, textureFactory}), Gl10, get({get({'OpenGLESGL10Image', 'GL10'}), 'GL_TEXTURE_2D'}), 0, This, 0, true),
            (get({Gl10, '$class'})):glDisable(Gl10, get({get({'OpenGLESGL10Image', 'GL10'}), 'GL_TEXTURE_2D'})),
            put({This, openGLESImageDraw}, get({This, realOpenGLESImageDraw})),
            (fun(Target_N71584) -> (get({Target_N71584, '$class'})):logError(Target_N71584, Gl10, This) end)('OpenGLLogUtil':getInstance());
            false -> ok
        end.

drawRegion(This, Gl, ViewHeight, X_src, Y_src, Width, Height, X, Y, Z) when is_integer(ViewHeight), is_number(X_src), is_number(Y_src), is_number(Width), is_number(Height), is_integer(X), is_integer(Y), is_integer(Z) ->
        (get({get({This, openGLESImageDraw}), '$class'})):drawRegion(get({This, openGLESImageDraw}), Gl, ViewHeight, X_src, Y_src, Width, Height, X, Y, Z).

draw(This, Gl, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        (get({get({This, openGLESImageDraw}), '$class'})):draw(get({This, openGLESImageDraw}), Gl, X, Y, Z).

