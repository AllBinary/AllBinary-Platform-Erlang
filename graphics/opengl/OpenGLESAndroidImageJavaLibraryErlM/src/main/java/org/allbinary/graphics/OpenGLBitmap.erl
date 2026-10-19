% Generated Code Do Not Modify
% package org.allbinary.graphics
% import android.graphics.Bitmap
% import org.allbinary.platform.graphics.PlatformBitmapBase

-module('OpenGLBitmap').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PlatformBitmapBase', Function, Arguments).

init_fields(This) ->
    put({This, bitmap}, undefined),
    ok.


new(Bitmap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Bitmap),
    This.

init(This, Bitmap) ->
    'PlatformBitmapBase':init(This),
    init_fields(This),
        put({This, bitmap}, Bitmap).

getPixels(This, Pixels, Offset, Stride, X, Y, Width, Height) when (is_tuple(Pixels) orelse Pixels =:= undefined), is_integer(Offset), is_integer(Stride), is_integer(X), is_integer(Y), is_integer(Width), is_integer(Height) ->
        (get({get({This, bitmap}), '$class'})):getPixels(get({This, bitmap}), Pixels, Offset, Stride, X, Y, Width, Height).

setPixels(This, Pixels, Offset, Stride, X, Y, Width, Height) when (is_tuple(Pixels) orelse Pixels =:= undefined), is_integer(Offset), is_integer(Stride), is_integer(X), is_integer(Y), is_integer(Width), is_integer(Height) ->
        (get({get({This, bitmap}), '$class'})):setPixels(get({This, bitmap}), Pixels, Offset, Stride, X, Y, Width, Height).

getWidth(This) ->
        (get({get({This, bitmap}), '$class'})):getWidth(get({This, bitmap})).

getHeight(This) ->
        (get({get({This, bitmap}), '$class'})):getHeight(get({This, bitmap})).

recycle(This) ->
        (get({get({This, bitmap}), '$class'})):recycle(get({This, bitmap})).

