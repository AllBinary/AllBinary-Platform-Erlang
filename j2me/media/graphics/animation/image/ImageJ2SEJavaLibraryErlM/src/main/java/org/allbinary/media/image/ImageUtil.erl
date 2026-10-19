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
% import java.awt.Graphics2D
% import java.awt.GraphicsConfiguration
% import java.awt.GraphicsDevice
% import java.awt.GraphicsEnvironment
% import java.awt.Transparency
% import java.awt.geom.AffineTransform
% import java.awt.image.BufferedImage
% import javax.microedition.lcdui.Image
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.microemu.device.j2se.J2SEImmutableImage
% import org.microemu.device.j2se.J2SEMutableImage

-module('ImageUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageUtil':new()),
    ok.

init_fields(This) ->
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
        ok.

getDefaultConfiguration(This) ->
        Ge = 'GraphicsEnvironment':getLocalGraphicsEnvironment(),
        Gd = (get({Ge, '$class'})):getDefaultScreenDevice(Ge),
        (get({Gd, '$class'})):getDefaultConfiguration(Gd).

create(This, Width, Height) when is_integer(Width), is_integer(Height) ->
        GraphicsConfiguration = (get({This, '$class'})):getDefaultConfiguration(This),
        (get({GraphicsConfiguration, '$class'})):createCompatibleImage(GraphicsConfiguration, Width, Height, get({'Transparency', 'TRANSLUCENT'})).

% throws Exception
createBufferedImageForResize(This, BufferedImageArray, Percent, Scale) when (is_tuple(BufferedImageArray) orelse BufferedImageArray =:= undefined), is_integer(Percent), is_boolean(Scale) ->
        Size = array:size(BufferedImageArray),
        ScaledBufferedImageArray = array:new(Size, {default, undefined}),
        put({local, bufferedImage}, undefined),
        lists:foreach(fun(Index) ->
            put({local, bufferedImage}, array:get(Index, BufferedImageArray)),
            NewWidth = trunc(((((get({get({local, bufferedImage}), '$class'})):getWidth(get({local, bufferedImage})) * Percent) / 100))),
            NewHeight = trunc(((((get({get({local, bufferedImage}), '$class'})):getHeight(get({local, bufferedImage})) * Percent) / 100))),
            array:set(Index, (get({This, '$class'})):createBufferedImage(This, get({local, bufferedImage}), NewWidth, NewHeight, Scale), ScaledBufferedImageArray)
        end, lists:seq(0, Size - 1)),
        ScaledBufferedImageArray.

% throws Exception
createBufferedImage2(This, BufferedImageArray, Percent, Scale) when (is_tuple(BufferedImageArray) orelse BufferedImageArray =:= undefined), is_number(Percent), is_boolean(Scale) ->
        Size = array:size(BufferedImageArray),
        ScaledBufferedImageArray = array:new(Size, {default, undefined}),
        put({local, bufferedImage}, undefined),
        lists:foreach(fun(Index) ->
            put({local, bufferedImage}, array:get(Index, BufferedImageArray)),
            NewWidth = trunc((((get({get({local, bufferedImage}), '$class'})):getWidth(get({local, bufferedImage})) * Percent))),
            NewHeight = trunc((((get({get({local, bufferedImage}), '$class'})):getHeight(get({local, bufferedImage})) * Percent))),
            array:set(Index, (get({This, '$class'})):createBufferedImage(This, get({local, bufferedImage}), NewWidth, NewHeight, Scale), ScaledBufferedImageArray)
        end, lists:seq(0, Size - 1)),
        ScaledBufferedImageArray.

% throws Exception
createBufferedImage3(This, BufferedImageArray, Width, Height, Scale) when (is_tuple(BufferedImageArray) orelse BufferedImageArray =:= undefined), is_integer(Width), is_integer(Height), is_boolean(Scale) ->
        Size = array:size(BufferedImageArray),
        ScaledBufferedImageArray = array:new(Size, {default, undefined}),
        lists:foreach(fun(Index) ->
            array:set(Index, (get({This, '$class'})):createBufferedImage(This, array:get(Index, BufferedImageArray), Width, Height, Scale), ScaledBufferedImageArray)
        end, lists:seq(0, Size - 1)),
        ScaledBufferedImageArray.

% throws Exception
createBufferedImageForSave(This, BufferedImage, NewWidth, NewHeight) when is_integer(NewWidth), is_integer(NewHeight) ->
        (get({This, '$class'})):createBufferedImage(This, BufferedImage, NewWidth, NewHeight, true).

% throws Exception
createBufferedImage(This, BufferedImage, NewWidth, NewHeight, Scale) when is_integer(NewWidth), is_integer(NewHeight), is_boolean(Scale) ->
        (get({This, '$class'})):createBufferedImageAllowTranslate(This, BufferedImage, NewWidth, NewHeight, Scale, false).

% throws Exception
createBufferedImageAllowTranslate(This, BufferedImage, NewWidth, NewHeight, Scale, AllowTranslate) when is_integer(NewWidth), is_integer(NewHeight), is_boolean(Scale), is_boolean(AllowTranslate) ->
        Width = (get({BufferedImage, '$class'})):getWidth(BufferedImage),
        Height = (get({BufferedImage, '$class'})):getHeight(BufferedImage),
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
        AffineTransform = 'AffineTransform':getScaleInstance(get({local, ratioX}), get({local, ratioY})),
        case ((not Scale) andalso AllowTranslate) of
            true ->
            Dx = (((float(NewWidth) - Width)) / 2.0),
            Dy = (((float(NewHeight) - Height)) / 2.0),
            (get({AffineTransform, '$class'})):translate(AffineTransform, Dx, Dy);
            false -> ok
        end,
        NewBufferedImage = 'BufferedImage':new(NewWidth, NewHeight, get({'BufferedImage', 'TYPE_INT_ARGB_PRE'})),
        Graphics = (get({NewBufferedImage, '$class'})):createGraphics(NewBufferedImage),
        (get({Graphics, '$class'})):drawRenderedImage(Graphics, BufferedImage, AffineTransform),
        NewBufferedImage.

% throws Exception
createBufferedImageWithLargerCanvas(This, BufferedImage, NewWidth, NewHeight) when is_integer(NewWidth), is_integer(NewHeight) ->
        Width = (get({BufferedImage, '$class'})):getWidth(BufferedImage),
        Height = (get({BufferedImage, '$class'})):getHeight(BufferedImage),
        D_newWidth = float(NewWidth),
        D_newHeight = float(NewHeight),
        WidthRatio = (D_newWidth / Width),
        HeightRatio = (D_newHeight / Height),
        Dx2 = trunc(((float(NewWidth) - Width))),
        Dy2 = trunc(((float(NewHeight) - Height))),
        Dx = (Dx2 div 2),
        Dy = (Dy2 div 2),
        Dx4 = (Dx2 div 4),
        Dy4 = (Dy2 div 4),
        NewBufferedImage = 'BufferedImage':new(NewWidth, NewHeight, get({'BufferedImage', 'TYPE_INT_ARGB_PRE'})),
        Graphics = (get({NewBufferedImage, '$class'})):createGraphics(NewBufferedImage),
        (get({Graphics, '$class'})):drawImage(Graphics, BufferedImage, Dx4, Dy4, undefined),
        NewBufferedImage.

convertToBufferedImage(This, ToolkitImage) ->
        try
        case (ToolkitImage =:= undefined) of
            true ->
            throw({'$return', undefined});
            false -> ok
        end,
        BufferedImage = 'BufferedImage':new((get({ToolkitImage, '$class'})):getWidth(ToolkitImage, undefined), (get({ToolkitImage, '$class'})):getHeight(ToolkitImage, undefined), get({'BufferedImage', 'TYPE_INT_ARGB'})),
        G2d = (get({BufferedImage, '$class'})):createGraphics(BufferedImage),
        (get({G2d, '$class'})):drawImage(G2d, ToolkitImage, 0, 0, undefined),
        (get({G2d, '$class'})):dispose(G2d),
        BufferedImage
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getBufferedImage(This, Image) ->
        put({local, bufferedImage}, undefined),
        case (get({Image, '$class'})):isMutable(Image) of
            true ->
            put({local, j2seImage}, Image),
            put({local, bufferedImage}, (get({get({local, j2seImage}), '$class'})):getImage(get({local, j2seImage})));
            false ->
            put({local, j2seImage}, Image),
            put({local, bufferedImage}, (get({get({local, j2seImage}), '$class'})):getImage(get({local, j2seImage})))
        end,
        get({local, bufferedImage}).

toString(This, BufferedImage) ->
        CommonLabels = 'CommonLabels':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, " BufferedImage -"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonLabels, 'WIDTH_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((get({BufferedImage, '$class'})):getWidth(BufferedImage))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonLabels, 'HEIGHT_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((get({BufferedImage, '$class'})):getHeight(BufferedImage))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Type: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((get({BufferedImage, '$class'})):getType(BufferedImage))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

