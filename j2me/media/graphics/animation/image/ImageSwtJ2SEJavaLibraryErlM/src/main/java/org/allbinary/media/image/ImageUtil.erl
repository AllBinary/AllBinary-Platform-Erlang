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
% package org.allbinary.media.image
% import org.eclipse.swt.SWT
% import org.eclipse.swt.widgets.Canvas
% import org.eclipse.swt.widgets.Composite
% import org.eclipse.swt.graphics.GC
% import org.eclipse.swt.graphics.ImageData
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels
% import org.eclipse.swt.events.PaintEvent
% import org.eclipse.swt.events.PaintListener
% import org.eclipse.swt.graphics.Transform
% import org.eclipse.swt.widgets.Display
% import org.microemu.app.BareMain

-module('ImageUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    put({This, 'IIOIMAGE_POOL_NAME'}, "IIOIMAGE_POOL_NAME"),
    put({This, 'CREATE_BUFFERED_IMAGE'}, "createBufferedImage"),
    ok.


getInstance() ->
        get({'ImageUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}), E)
        end.

create(This, Width, Height) when is_integer(Width), is_integer(Height) ->
        Display = (get({get({'BareMain', shell}), '$class'})):getDisplay(get({'BareMain', shell})),
        'Image':new(Display, Width, Height).

% throws Exception
createBufferedImage(This, BufferedImageArray, Percent, Scale) when (is_tuple(BufferedImageArray) orelse BufferedImageArray =:= undefined), is_integer(Percent), is_boolean(Scale) ->
        Size = array:size(BufferedImageArray),
        ScaledBufferedImageArray = array:new(Size, {default, undefined}),
        put({local, bufferedImage}, undefined),
        put({local, imageData}, undefined),
        lists:foreach(fun(Index) ->
            put({local, bufferedImage}, array:get(Index, BufferedImageArray)),
            put({local, imageData}, (get({get({local, bufferedImage}), '$class'})):getImageData(get({local, bufferedImage}))),
            NewWidth = trunc((((get({get({local, imageData}), width}) * Percent) / 100))),
            NewHeight = trunc((((get({get({local, imageData}), height}) * Percent) / 100))),
            array:set(Index, (get({This, '$class'})):createBufferedImage5(This, get({local, bufferedImage}), NewWidth, NewHeight, Scale), ScaledBufferedImageArray)
        end, lists:seq(0, Size - 1)),
        ScaledBufferedImageArray.

% throws Exception
createBufferedImage2(This, BufferedImageArray, Percent, Scale) when (is_tuple(BufferedImageArray) orelse BufferedImageArray =:= undefined), is_number(Percent), is_boolean(Scale) ->
        Size = array:size(BufferedImageArray),
        ScaledBufferedImageArray = array:new(Size, {default, undefined}),
        put({local, bufferedImage}, undefined),
        put({local, imageData}, undefined),
        lists:foreach(fun(Index) ->
            put({local, bufferedImage}, array:get(Index, BufferedImageArray)),
            put({local, imageData}, (get({get({local, bufferedImage}), '$class'})):getImageData(get({local, bufferedImage}))),
            NewWidth = trunc(((get({get({local, imageData}), width}) * Percent))),
            NewHeight = trunc(((get({get({local, imageData}), height}) * Percent))),
            array:set(Index, (get({This, '$class'})):createBufferedImage5(This, get({local, bufferedImage}), NewWidth, NewHeight, Scale), ScaledBufferedImageArray)
        end, lists:seq(0, Size - 1)),
        ScaledBufferedImageArray.

% throws Exception
createBufferedImage3(This, BufferedImageArray, Width, Height, Scale) when (is_tuple(BufferedImageArray) orelse BufferedImageArray =:= undefined), is_integer(Width), is_integer(Height), is_boolean(Scale) ->
        Size = array:size(BufferedImageArray),
        ScaledBufferedImageArray = array:new(Size, {default, undefined}),
        lists:foreach(fun(Index) ->
            array:set(Index, (get({This, '$class'})):createBufferedImage5(This, array:get(Index, BufferedImageArray), Width, Height, Scale), ScaledBufferedImageArray)
        end, lists:seq(0, Size - 1)),
        ScaledBufferedImageArray.

% throws Exception
createBufferedImage4(This, BufferedImage, NewWidth, NewHeight) when is_integer(NewWidth), is_integer(NewHeight) ->
        (get({This, '$class'})):createBufferedImage5(This, BufferedImage, NewWidth, NewHeight, true).

% throws Exception
createBufferedImage5(This, BufferedImage, NewWidth, NewHeight, Scale) when is_integer(NewWidth), is_integer(NewHeight), is_boolean(Scale) ->
        (get({This, '$class'})):createBufferedImage6(This, BufferedImage, NewWidth, NewHeight, Scale, false).

% throws Exception
createBufferedImage6(This, BufferedImage, NewWidth, NewHeight, Scale, AllowTranslate) when is_integer(NewWidth), is_integer(NewHeight), is_boolean(Scale), is_boolean(AllowTranslate) ->
        ImageData = (get({BufferedImage, '$class'})):getImageData(BufferedImage),
        Width = get({ImageData, width}),
        Height = get({ImageData, height}),
        D_newWidth = float(NewWidth),
        D_newHeight = float(NewHeight),
        WidthRatio = (D_newWidth / Width),
        HeightRatio = (D_newHeight / Height),
        put({local, ratioX}, 1.0),
        put({local, ratioY}, 1.0),
        case Scale of
            true ->
            put({local, ratioX}, WidthRatio),
            put({local, ratioY}, HeightRatio);
            false -> ok
        end,
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69918) -> (get({Target_N69918, '$class'})):toString(Target_N69918) end)((fun(Target_N69925) -> (get({Target_N69925, '$class'})):appendfloat(Target_N69925, HeightRatio) end)((fun(Target_N69932) -> (get({Target_N69932, '$class'})):append(Target_N69932, get({get({This, commonSeps}), 'FORWARD_SLASH'})) end)((fun(Target_N69939) -> (get({Target_N69939, '$class'})):appendfloat(Target_N69939, WidthRatio) end)((fun(Target_N69946) -> (get({Target_N69946, '$class'})):append(Target_N69946, get({get({This, commonSeps}), 'COLON'})) end)((fun(Target_N69953) -> (get({Target_N69953, '$class'})):appendint(Target_N69953, NewHeight) end)((fun(Target_N69960) -> (get({Target_N69960, '$class'})):append(Target_N69960, get({get({This, commonSeps}), 'FORWARD_SLASH'})) end)((fun(Target_N69967) -> (get({Target_N69967, '$class'})):appendint(Target_N69967, NewWidth) end)((fun(Target_N69974) -> (get({Target_N69974, '$class'})):append(Target_N69974, get({get({This, commonSeps}), 'COLON'})) end)((fun(Target_N69981) -> (get({Target_N69981, '$class'})):appendfloat(Target_N69981, Height) end)((fun(Target_N69988) -> (get({Target_N69988, '$class'})):append(Target_N69988, get({get({This, commonSeps}), 'FORWARD_SLASH'})) end)((fun(Target_N69995) -> (get({Target_N69995, '$class'})):appendfloat(Target_N69995, Width) end)('StringMaker':new())))))))))))), This, get({This, 'CREATE_BUFFERED_IMAGE'})),
        put({local, dx}, 0.0),
        put({local, dy}, 0.0),
        case ((not Scale) andalso AllowTranslate) of
            true ->
            put({local, dx}, (((float(NewWidth) - Width)) / 2.0)),
            put({local, dy}, (((float(NewHeight) - Height)) / 2.0)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N70432) -> (get({Target_N70432, '$class'})):toString(Target_N70432) end)((fun(Target_N70439) -> (get({Target_N70439, '$class'})):appendfloat(Target_N70439, get({local, dy})) end)((fun(Target_N70446) -> (get({Target_N70446, '$class'})):append(Target_N70446, " dy: ") end)((fun(Target_N70453) -> (get({Target_N70453, '$class'})):appendfloat(Target_N70453, get({local, dx})) end)((fun(Target_N70460) -> (get({Target_N70460, '$class'})):append(Target_N70460, "Translate dx: ") end)('StringMaker':new()))))), This, get({This, 'CREATE_BUFFERED_IMAGE'}));
            false -> ok
        end,
        NewBufferedImage = 'Image':new((get({get({'BareMain', shell}), '$class'})):getDisplay(get({'BareMain', shell})), NewWidth, NewHeight),
        Gc = 'GC':new(NewBufferedImage),
        AffineTransform = 'Transform':new((get({Gc, '$class'})):getDevice(Gc)),
        (get({AffineTransform, '$class'})):scale(AffineTransform, get({local, ratioX}), get({local, ratioY})),
        (get({AffineTransform, '$class'})):translate(AffineTransform, get({local, dx}), get({local, dy})),
        (get({Gc, '$class'})):setTransform(Gc, AffineTransform),
        (get({Gc, '$class'})):setAntialias(Gc, get({'SWT', 'ON'})),
        (get({Gc, '$class'})):setInterpolation(Gc, get({'SWT', 'HIGH'})),
        (get({Gc, '$class'})):drawImage(Gc, BufferedImage, 0, 0, get({(get({BufferedImage, '$class'})):getBounds(BufferedImage), width}), get({(get({BufferedImage, '$class'})):getBounds(BufferedImage), height}), 0, 0, NewWidth, NewHeight),
        (get({Gc, '$class'})):dispose(Gc),
        NewBufferedImage.

drawTransformedImage(This, Image, Parent, Dx, Dy, Width, Height) when is_integer(Dx), is_integer(Dy), is_integer(Width), is_integer(Height) ->
        ImageCanvas = 'Canvas':new(Parent, get({'SWT', 'NONE'})),
        (get({ImageCanvas, '$class'})):addPaintListener(ImageCanvas, 'PaintListener':new() % Java anonymous class body: implement it as a module
%             ok % paintControl
),
        ImageCanvas.

toString(This, BufferedImage) ->
        CommonLabels = 'CommonLabels':getInstance(),
        StringBuffer = 'StringMaker':new(),
        ImageData = (get({BufferedImage, '$class'})):getImageData(BufferedImage),
        (get({StringBuffer, '$class'})):append(StringBuffer, " org.eclipse.swt.graphics.Image: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonLabels, 'WIDTH_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({ImageData, width}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonLabels, 'HEIGHT_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({ImageData, height}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Type: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({ImageData, type}))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

