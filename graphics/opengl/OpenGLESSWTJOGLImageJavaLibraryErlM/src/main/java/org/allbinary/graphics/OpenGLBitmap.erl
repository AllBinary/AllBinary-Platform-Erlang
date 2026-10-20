% Generated Code Do Not Modify
% package org.allbinary.graphics
% import javax.microedition.lcdui.Image
% import org.allbinary.DisposalUtil
% import org.allbinary.platform.graphics.PlatformBitmapBase
% import org.microemu.device.swt.SwtImmutableImage
% import org.microemu.device.swt.SwtMutableImage

-module('OpenGLBitmap').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PlatformBitmapBase', Function, Arguments).

init_fields(This) ->
    put({This, image}, undefined),
    ok.


new(Bitmap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Bitmap),
    This.

'$init'(This, Bitmap) ->
    'PlatformBitmapBase':'$init'(This),
    init_fields(This),
        put({This, image}, Bitmap).

getImage(This) ->
        get({This, image}).

getDepth(This) ->
        try
        case (get({get({This, image}), '$class'})):isMutable(get({This, image})) of
            true ->
            MutableImage = get({This, image}),
            throw({'$return', (get({MutableImage, '$class'})):getDepth(MutableImage)});
            false ->
            ImmutableImage = get({This, image}),
            throw({'$return', (get({ImmutableImage, '$class'})):getDepth(ImmutableImage)})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getPixels(This, Pixels, Offset, Stride, X, Y, Width, Height) when (is_tuple(Pixels) orelse Pixels =:= undefined), is_integer(Offset), is_integer(Stride), is_integer(X), is_integer(Y), is_integer(Width), is_integer(Height) ->
        case (get({get({This, image}), '$class'})):isMutable(get({This, image})) of
            true ->
            MutableImage = get({This, image}),
            (get({MutableImage, '$class'})):getRGB(MutableImage, Pixels, Offset, Stride, X, Y, Width, Height);
            false ->
            ImmutableImage = get({This, image}),
            (get({ImmutableImage, '$class'})):getRGB(ImmutableImage, Pixels, Offset, Stride, X, Y, Width, Height)
        end.

setPixels(This, Pixels, Offset, Stride, X, Y, Width, Height) when (is_tuple(Pixels) orelse Pixels =:= undefined), is_integer(Offset), is_integer(Stride), is_integer(X), is_integer(Y), is_integer(Width), is_integer(Height) ->
        (get({get({This, image}), '$class'})):setRGB2(get({This, image}), Pixels, Offset, Height, X, Y, Width, Height).

getWidth(This) ->
        (get({get({This, image}), '$class'})):getWidth(get({This, image})).

getHeight(This) ->
        (get({get({This, image}), '$class'})):getHeight(get({This, image})).

recycle(This) ->
        (fun(Target_N66879) -> (get({Target_N66879, '$class'})):disposeImage(Target_N66879, get({This, image})) end)('DisposalUtil':getInstance()).

