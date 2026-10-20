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
% import org.allbinary.graphics.opengles.OpenGLLogUtil
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.opengles.GLUtil
% import org.allbinary.platform.graphics.PlatformBitmapBaseFactory
% import org.allbinary.platform.opengles.PlatformTextureBaseFactory

-module('OpenGLESGL11VBOImage').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('OpenGLESImage', Function, Arguments).

init_fields(This) ->
    put({This, glUtil}, 'GLUtil':getInstance()),
    put({This, textureVertexFloatBuffer}, (fun(Target_N65957) -> (get({Target_N65957, '$class'})):asFloatBuffer(Target_N65957) end)((fun(Target_N65964) -> (get({Target_N65964, '$class'})):order(Target_N65964, 'ByteOrder':nativeOrder()) end)('ByteBuffer':allocateDirect(((4 * 4) * 2))))),
    put({This, regionRectangleFloatArray}, array:from_list([0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])),
    put({This, regionRectangleVertexFloatBuffer}, (fun(Target_N67005) -> (get({Target_N67005, '$class'})):asFloatBuffer(Target_N67005) end)((fun(Target_N67012) -> (get({Target_N67012, '$class'})):order(Target_N67012, 'ByteOrder':nativeOrder()) end)('ByteBuffer':allocateDirect(((4 * 4) * 3))))),
    put({This, regionTextureRectangleFloatArray}, array:new(8, {default, 0.0})),
    put({This, regionTextureVertexFloatBuffer}, (fun(Target_N67169) -> (get({Target_N67169, '$class'})):asFloatBuffer(Target_N67169) end)((fun(Target_N67176) -> (get({Target_N67176, '$class'})):order(Target_N67176, 'ByteOrder':nativeOrder()) end)('ByteBuffer':allocateDirect(((4 * 4) * 2))))),
    ok.


new(Image, BitmapFactory, TextureFactory) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Image, BitmapFactory, TextureFactory),
    This.

'$init'(This, Image, BitmapFactory, TextureFactory) ->
        'OpenGLESImage':'$init'(This, Image, BitmapFactory, TextureFactory),
        init_fields(This),
        (get({This, '$class'})):initVertices(This),
        (get({get({This, regionRectangleVertexFloatBuffer}), '$class'})):put(get({This, regionRectangleVertexFloatBuffer}), 'FloatBuffer':wrap(get({This, regionRectangleFloatArray}))),
        (get({get({This, regionTextureVertexFloatBuffer}), '$class'})):put(get({This, regionTextureVertexFloatBuffer}), 'FloatBuffer':wrap(get({This, regionTextureRectangleFloatArray}))).

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
            (get({get({This, textureFactory}), '$class'})):load(get({This, textureFactory}), Gl10, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_TEXTURE_2D'}), 0, This, 0, true),
            (get({Gl10, '$class'})):glDisable(Gl10, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_TEXTURE_2D'})),
            (fun(Target_N66799) -> (get({Target_N66799, '$class'})):logError(Target_N66799, Gl10, This) end)('OpenGLLogUtil':getInstance());
            false -> ok
        end.

drawRegion(This, Gl, ViewHeight, X_src, Y_src, Width, Height, X, Y, Z) when is_integer(ViewHeight), is_number(X_src), is_number(Y_src), is_number(Width), is_number(Height), is_integer(X), is_integer(Y), is_integer(Z) ->
        put({This, regionRectangleFloatArray}, array:set(0, float(X), get({This, regionRectangleFloatArray}))),
        put({This, regionRectangleFloatArray}, array:set(7, float((ViewHeight - Y)), get({This, regionRectangleFloatArray}))),
        put({This, regionRectangleFloatArray}, array:set(1, (array:get(7, get({This, regionRectangleFloatArray})) - Height), get({This, regionRectangleFloatArray}))),
        put({This, regionRectangleFloatArray}, array:set(3, (float(X) + Width), get({This, regionRectangleFloatArray}))),
        put({This, regionRectangleFloatArray}, array:set(4, array:get(1, get({This, regionRectangleFloatArray})), get({This, regionRectangleFloatArray}))),
        put({This, regionRectangleFloatArray}, array:set(6, float(X), get({This, regionRectangleFloatArray}))),
        put({This, regionRectangleFloatArray}, array:set(9, array:get(3, get({This, regionRectangleFloatArray})), get({This, regionRectangleFloatArray}))),
        put({This, regionRectangleFloatArray}, array:set(10, array:get(7, get({This, regionRectangleFloatArray})), get({This, regionRectangleFloatArray}))),
        put({This, regionTextureRectangleFloatArray}, array:set(0, (X_src / (get({This, '$class'})):getWidth(This)), get({This, regionTextureRectangleFloatArray}))),
        put({This, regionTextureRectangleFloatArray}, array:set(1, (((Y_src + Height)) / (get({This, '$class'})):getHeight(This)), get({This, regionTextureRectangleFloatArray}))),
        put({This, regionTextureRectangleFloatArray}, array:set(2, (((X_src + Width)) / (get({This, '$class'})):getWidth(This)), get({This, regionTextureRectangleFloatArray}))),
        put({This, regionTextureRectangleFloatArray}, array:set(3, array:get(1, get({This, regionTextureRectangleFloatArray})), get({This, regionTextureRectangleFloatArray}))),
        put({This, regionTextureRectangleFloatArray}, array:set(4, array:get(0, get({This, regionTextureRectangleFloatArray})), get({This, regionTextureRectangleFloatArray}))),
        put({This, regionTextureRectangleFloatArray}, array:set(5, (Y_src / (get({This, '$class'})):getHeight(This)), get({This, regionTextureRectangleFloatArray}))),
        put({This, regionTextureRectangleFloatArray}, array:set(6, array:get(2, get({This, regionTextureRectangleFloatArray})), get({This, regionTextureRectangleFloatArray}))),
        put({This, regionTextureRectangleFloatArray}, array:set(7, array:get(5, get({This, regionTextureRectangleFloatArray})), get({This, regionTextureRectangleFloatArray}))),
        (get({get({This, glUtil}), '$class'})):position(get({This, glUtil}), get({This, regionRectangleVertexFloatBuffer}), 0),
        (get({Gl, '$class'})):glVertexPointer(Gl, 3, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_FLOAT'}), 0, get({This, regionRectangleVertexFloatBuffer})),
        (get({Gl, '$class'})):glEnableClientState(Gl, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_VERTEX_ARRAY'})),
        (get({Gl, '$class'})):glEnable(Gl, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_TEXTURE_2D'})),
        (get({Gl, '$class'})):glBindTexture(Gl, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_TEXTURE_2D'}), get({get({This, openGLESImageProperties}), textureID})),
        (get({Gl, '$class'})):glEnableClientState(Gl, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_TEXTURE_COORD_ARRAY'})),
        (get({get({This, glUtil}), '$class'})):position(get({This, glUtil}), get({This, regionTextureVertexFloatBuffer}), 0),
        (get({Gl, '$class'})):glTexCoordPointer(Gl, 2, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_FLOAT'}), 0, get({This, regionTextureVertexFloatBuffer})),
        (get({Gl, '$class'})):glDrawArrays(Gl, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_TRIANGLE_STRIP'}), 0, 4),
        (get({Gl, '$class'})):glDisableClientState(Gl, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_VERTEX_ARRAY'})),
        (get({Gl, '$class'})):glDisableClientState(Gl, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_TEXTURE_COORD_ARRAY'})),
        (get({Gl, '$class'})):glDisable(Gl, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_TEXTURE_2D'})).

draw(This, Gl, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        put({This, regionRectangleFloatArray}, array:set(0, float(X), get({This, regionRectangleFloatArray}))),
        put({This, regionRectangleFloatArray}, array:set(7, float((((fun(Target_N68917) -> (get({Target_N68917, '$class'})):getLastHeight(Target_N68917) end)('DisplayInfoSingleton':getInstance()) - Y))), get({This, regionRectangleFloatArray}))),
        put({This, regionRectangleFloatArray}, array:set(1, (array:get(7, get({This, regionRectangleFloatArray})) - (get({This, '$class'})):getHeight(This)), get({This, regionRectangleFloatArray}))),
        put({This, regionRectangleFloatArray}, array:set(3, float(((X + (get({This, '$class'})):getWidth(This)))), get({This, regionRectangleFloatArray}))),
        put({This, regionRectangleFloatArray}, array:set(4, array:get(1, get({This, regionRectangleFloatArray})), get({This, regionRectangleFloatArray}))),
        put({This, regionRectangleFloatArray}, array:set(6, float(X), get({This, regionRectangleFloatArray}))),
        put({This, regionRectangleFloatArray}, array:set(9, array:get(3, get({This, regionRectangleFloatArray})), get({This, regionRectangleFloatArray}))),
        put({This, regionRectangleFloatArray}, array:set(10, array:get(7, get({This, regionRectangleFloatArray})), get({This, regionRectangleFloatArray}))),
        (get({get({This, glUtil}), '$class'})):position(get({This, glUtil}), get({This, regionRectangleVertexFloatBuffer}), 0),
        (get({Gl, '$class'})):glVertexPointer(Gl, 3, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_FLOAT'}), 0, get({This, regionRectangleVertexFloatBuffer})),
        (get({Gl, '$class'})):glEnableClientState(Gl, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_VERTEX_ARRAY'})),
        (get({Gl, '$class'})):glEnable(Gl, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_TEXTURE_2D'})),
        (get({Gl, '$class'})):glBindTexture(Gl, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_TEXTURE_2D'}), get({get({This, openGLESImageProperties}), textureID})),
        (get({Gl, '$class'})):glEnableClientState(Gl, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_TEXTURE_COORD_ARRAY'})),
        (get({get({This, glUtil}), '$class'})):position(get({This, glUtil}), get({This, textureVertexFloatBuffer}), 0),
        (get({Gl, '$class'})):glTexCoordPointer(Gl, 2, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_FLOAT'}), 0, get({This, textureVertexFloatBuffer})),
        (get({Gl, '$class'})):glDrawArrays(Gl, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_TRIANGLE_STRIP'}), 0, 4),
        (get({Gl, '$class'})):glDisableClientState(Gl, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_VERTEX_ARRAY'})),
        (get({Gl, '$class'})):glDisableClientState(Gl, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_TEXTURE_COORD_ARRAY'})),
        (get({Gl, '$class'})):glDisable(Gl, get({get({'OpenGLESGL11VBOImage', 'GL10'}), 'GL_TEXTURE_2D'})).

