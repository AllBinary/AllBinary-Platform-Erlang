% Generated Code Do Not Modify
% package org.allbinary.graphics
% import java.io.InputStream
% import javax.microedition.lcdui.Image
% import android.graphics.Bitmap
% import android.graphics.BitmapFactory
% import java.io.IOException
% import org.allbinary.platform.graphics.PlatformBitmapBaseFactory
% import org.allbinary.platform.graphics.PlatformBitmapBase
% import org.microemu.android.device.AndroidImageInterface

-module('OpenGLBitmapFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PlatformBitmapBaseFactory', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'OpenGLBitmapFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'ARGB_8888'}, 'Config':new(get({get({'Bitmap', 'Config'}), 'ARGB_8888'}))),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'PlatformBitmapBaseFactory':'$init'(This),
    init_fields(This).


getInstance() ->
        get({'OpenGLBitmapFactory', instance}).

createBitmap(This, Width, Height, Config) when is_integer(Width), is_integer(Height) ->
        'OpenGLBitmap':new('Bitmap':createBitmap(Width, Height, get({Config, bitmapConfig}))).

% throws IOException
decodeStream(This, InputStream) ->
        'OpenGLBitmap':new('BitmapFactory':decodeStream(InputStream)).

createBitmap(This, Image) ->
        'OpenGLBitmap':new((get({(Image), '$class'})):getBitmap((Image))).
% Java nested class Config: move it to its own module 'Config'

