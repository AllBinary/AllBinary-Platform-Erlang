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
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, textureFactory}, undefined),
    put({This, openGLBitmap}, undefined),
    put({This, openGLESImageProperties}, 'OpenGLESImageProperties':new()),
    put({This, imageProcessor}, 'OpenGLESImageProcessor':getInstance()),
    put({This, openGLESImageTranslate}, 'OpenGLESImageTranslate':getInstance()),
    ok.


new(Image, BitmapFactory, TextureFactory) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Image, BitmapFactory, TextureFactory),
    This.

'$init'(This, Image, BitmapFactory, TextureFactory) ->
    'Image':'$init'(This),
    init_fields(This),
        put({This, openGLBitmap}, (get({BitmapFactory, '$class'})):createBitmap(BitmapFactory, Image)),
        put({This, textureFactory}, TextureFactory).

% throws Exception
set(This, Gl) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

initTexture(This, Gl) ->
        false.

drawRegion(This, Gl, ViewHeight, X_src, Y_src, Width, Height, X, Y, Z) when is_integer(ViewHeight), is_number(X_src), is_number(Y_src), is_number(Width), is_number(Height), is_integer(X), is_integer(Y), is_integer(Z) ->
        ok.

draw(This, Gl, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        ok.

getType(This) ->
        get({'OpenGLESImage', 'TYPE'}).

