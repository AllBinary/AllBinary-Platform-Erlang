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
% import javax.microedition.khronos.opengles.GL
% import javax.microedition.khronos.opengles.GL10
% import javax.microedition.lcdui.Image
% import javax.microedition.lcdui.NullImage
% import javax.microedition.lcdui.OpenGLESPostLoadPlatformImage
% import javax.microedition.lcdui.PostLoadImageProcessor
% import org.allbinary.graphics.GraphicsStrings
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.platform.graphics.PlatformBitmapBase
% import org.allbinary.platform.graphics.PlatformBitmapBaseFactory
% import org.allbinary.platform.opengles.PlatformTextureBaseFactory
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('OpenGLESImage').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements OpenGLSurfaceChangedInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Image', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_OPENGL_IMAGE'}, 'OpenGLESImage':new(get({'NullImage', 'NULL_IMAGE'}), get({'PlatformBitmapBaseFactory', 'NULL_PLATFORM_BITMAP_BASE_FACTORY'}), get({'PlatformTextureBaseFactory', 'NULL_PLATFORM_TEXTURE_BASE_FACTORY'}))),
    put({?MODULE, texture2dList}, 'BasicArrayListD':new()),
    put({?MODULE, 'TYPE'}, 4),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, textureFactory}, undefined),
    put({This, openGLBitmap}, undefined),
    put({This, imageProcessor}, 'OpenGLESImageProcessor':getInstance()),
    put({This, openGLESImageTranslate}, 'OpenGLESImageTranslate':getInstance()),
    put({This, openGLESImageProperties}, 'OpenGLESImageProperties':new()),
    ok.


new(Image, BitmapFactory, TextureFactory) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Image, BitmapFactory, TextureFactory),
    This.

init(This, Image, BitmapFactory, TextureFactory) ->
        'Image':init(This, (get({Image, '$class'})):getName(Image), get({'PostLoadImageProcessor', 'NULL_POST_LOAD_IMAGE_PROCESSOR'})),
        init_fields(This),
        put({This, openGLBitmap}, (get({BitmapFactory, '$class'})):createBitmap(BitmapFactory, Image)),
        put({This, textureFactory}, TextureFactory),
        (fun(Target_N66611) -> (get({Target_N66611, '$class'})):init(Target_N66611, This) end)('OpenGLImageCacheFactory':getInstance()),
        put({This, platformImage}, 'OpenGLESPostLoadPlatformImage':getInstance()).

getHeight(This) ->
        trunc((((get({get({This, openGLBitmap}), '$class'})):getHeight(get({This, openGLBitmap})) * get({get({This, openGLESImageProperties}), scaleY2})))).

getWidth(This) ->
        trunc((((get({get({This, openGLBitmap}), '$class'})):getWidth(get({This, openGLBitmap})) * get({get({This, openGLESImageProperties}), scaleX2})))).

% throws Exception
set(This, Gl) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

initTexture(This, Gl) ->
        try
        case (not (get({get({'OpenGLESImage', texture2dList}), '$class'})):contains(get({'OpenGLESImage', texture2dList}), This)) of
            true ->
            (get({get({'OpenGLESImage', texture2dList}), '$class'})):add(get({'OpenGLESImage', texture2dList}), This),
            Textures = array:new(1, {default, 0}),
            (get({Gl, '$class'})):glEnable(Gl, get({get({'OpenGLESImage', 'GL10'}), 'GL_TEXTURE_2D'})),
            case (get({get({This, openGLESImageProperties}), textureID}) =/= (-1)) of
                true ->
                array:set(0, get({get({This, openGLESImageProperties}), textureID}), Textures),
                (get({Gl, '$class'})):glDeleteTextures(Gl, 1, Textures, 0);
                false -> ok
            end,
            (get({Gl, '$class'})):glGenTextures(Gl, 1, Textures, 0),
            put({get({This, openGLESImageProperties}), textureID}, array:get(0, Textures)),
            (get({Gl, '$class'})):glBindTexture(Gl, get({get({'OpenGLESImage', 'GL10'}), 'GL_TEXTURE_2D'}), get({get({This, openGLESImageProperties}), textureID})),
            (get({Gl, '$class'})):glTexParameterf(Gl, get({get({'OpenGLESImage', 'GL10'}), 'GL_TEXTURE_2D'}), get({get({'OpenGLESImage', 'GL10'}), 'GL_TEXTURE_MIN_FILTER'}), get({get({'OpenGLESImage', 'GL10'}), 'GL_NEAREST'})),
            (get({Gl, '$class'})):glTexParameterf(Gl, get({get({'OpenGLESImage', 'GL10'}), 'GL_TEXTURE_2D'}), get({get({'OpenGLESImage', 'GL10'}), 'GL_TEXTURE_WRAP_S'}), get({get({'OpenGLESImage', 'GL10'}), 'GL_CLAMP_TO_EDGE'})),
            (get({Gl, '$class'})):glTexParameterf(Gl, get({get({'OpenGLESImage', 'GL10'}), 'GL_TEXTURE_2D'}), get({get({'OpenGLESImage', 'GL10'}), 'GL_TEXTURE_WRAP_T'}), get({get({'OpenGLESImage', 'GL10'}), 'GL_CLAMP_TO_EDGE'})),
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

drawRegion(This, Gl, ViewHeight, X_src, Y_src, Width, Height, X, Y, Z) when is_integer(ViewHeight), is_number(X_src), is_number(Y_src), is_number(Width), is_number(Height), is_integer(X), is_integer(Y), is_integer(Z) ->
        ok.

draw(This, Gl, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        ok.

getType(This) ->
        get({'OpenGLESImage', 'TYPE'}).

toString(This) ->
        GraphicsStrings = 'GraphicsStrings':getInstance(),
        (fun(Target_N68153) -> (get({Target_N68153, '$class'})):toString(Target_N68153) end)((fun(Target_N68160) -> (get({Target_N68160, '$class'})):appendfloat(Target_N68160, float(get({get({This, openGLESImageProperties}), alphaf}))) end)((fun(Target_N68167) -> (get({Target_N68167, '$class'})):append(Target_N68167, get({GraphicsStrings, 'OPACITY'})) end)((fun(Target_N68174) -> (get({Target_N68174, '$class'})):append(Target_N68174, 'Image':toString(This)) end)((fun(Target_N68181) -> (get({Target_N68181, '$class'})):append(Target_N68181, (get({This, '$class'})):getName(This)) end)('StringMaker':new()))))).

