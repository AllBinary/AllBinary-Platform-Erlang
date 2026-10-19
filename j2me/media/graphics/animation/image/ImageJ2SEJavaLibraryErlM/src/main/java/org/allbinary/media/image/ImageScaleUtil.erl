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
% import java.awt.geom.AffineTransform
% import java.awt.image.BufferedImage
% import javax.microedition.lcdui.Image
% import org.allbinary.image.ImageCache

-module('ImageScaleUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageScaleUtil':new()),
    ok.

init_fields(This) ->
    put({This, imageUtil}, 'ImageUtil':getInstance()),
    put({This, imageJ2SEUtil}, 'ImageJ2SEUtil':getInstance()),
    put({This, imageCreationUtil}, 'ImageCreationUtil':getInstance()),
    ok.


getInstance() ->
        get({'ImageScaleUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
createImage2(This, ImageCache, OriginalImage, ScaleNominatorX, ScaleDenominatorX, ScaleNominatorY, ScaleDenominatorY, Cached) when is_number(ScaleNominatorX), is_number(ScaleDenominatorX), is_number(ScaleNominatorY), is_number(ScaleDenominatorY), is_boolean(Cached) ->
        (get({This, '$class'})):createImage3(This, ImageCache, OriginalImage, ScaleNominatorX, ScaleDenominatorX, ScaleNominatorY, ScaleDenominatorY, Cached, true).

% throws Exception
createImage3(This, ImageCache, OriginalImage, ScaleNominatorX, ScaleDenominatorX, ScaleNominatorY, ScaleDenominatorY, Cached, Mutable) when is_number(ScaleNominatorX), is_number(ScaleDenominatorX), is_number(ScaleNominatorY), is_number(ScaleDenominatorY), is_boolean(Cached), is_boolean(Mutable) ->
        Width = (get({OriginalImage, '$class'})):getWidth(OriginalImage),
        Height = (get({OriginalImage, '$class'})):getHeight(OriginalImage),
        ScaleX = (ScaleNominatorX / ScaleDenominatorX),
        ScaleY = (ScaleNominatorY / ScaleDenominatorY),
        put({local, image}, undefined),
        case Cached of
            true ->
            put({local, image}, (get({ImageCache, '$class'})):get(ImageCache, atom_to_list(get({This, '$class'})), trunc(((float(Width) * ScaleX))), trunc(((float(Height) * ScaleY)))));
            false ->
            put({local, image}, (get({ImageCache, '$class'})):get(ImageCache, "createImage", trunc(((float(Width) * ScaleX))), trunc(((float(Height) * ScaleY)))))
        end,
        (get({This, '$class'})):scale(This, OriginalImage, get({local, image}), ScaleX, ScaleY, true),
        get({local, image}).

% throws Exception
scale2(This, OriginalImage, OriginalImageArray, XimageToShowArray, Unused, ScaleX, ScaleY, MaxScaleX, MaxScaleY) when (is_tuple(OriginalImageArray) orelse OriginalImageArray =:= undefined), (is_tuple(XimageToShowArray) orelse XimageToShowArray =:= undefined), is_integer(Unused), is_number(ScaleX), is_number(ScaleY), is_number(MaxScaleX), is_number(MaxScaleY) ->
        case (((MaxScaleX * (get({OriginalImage, '$class'})):getWidth(OriginalImage)) > (fun(Target_N67061) -> (get({Target_N67061, '$class'})):getWidth(Target_N67061) end)(array:get(0, OriginalImageArray))) orelse ((MaxScaleY * (get({OriginalImage, '$class'})):getHeight(OriginalImage)) > (fun(Target_N67119) -> (get({Target_N67119, '$class'})):getHeight(Target_N67119) end)(array:get(0, OriginalImageArray)))) of
            true ->
            array:set(0, (get({get({This, imageCreationUtil}), '$class'})):createImage(get({This, imageCreationUtil}), (get({OriginalImage, '$class'})):getWidth(OriginalImage), (get({OriginalImage, '$class'})):getHeight(OriginalImage), MaxScaleX, MaxScaleY), OriginalImageArray);
            false -> ok
        end,
        (get({This, '$class'})):scale(This, OriginalImage, array:get(0, OriginalImageArray), ScaleX, ScaleY, false).

scale(This, OriginalImage, NewMaxSizeImage, ScaleX, ScaleY, Clear) when is_number(ScaleX), is_number(ScaleY), is_boolean(Clear) ->
        BufferedImage = (get({get({This, imageUtil}), '$class'})):getBufferedImage(get({This, imageUtil}), OriginalImage),
        NewBufferedImage = (get({get({This, imageUtil}), '$class'})):getBufferedImage(get({This, imageUtil}), NewMaxSizeImage),
        At = 'AffineTransform':getScaleInstance(ScaleX, ScaleY),
        G = (get({NewBufferedImage, '$class'})):createGraphics(NewBufferedImage),
        case Clear of
            true ->
            (get({G, '$class'})):setBackground(G, get({get({This, imageJ2SEUtil}), 'TRANSPARENT_COLOR'})),
            (get({G, '$class'})):clearRect(G, 0, 0, (get({NewBufferedImage, '$class'})):getWidth(NewBufferedImage), (get({NewBufferedImage, '$class'})):getHeight(NewBufferedImage));
            false -> ok
        end,
        (get({G, '$class'})):drawRenderedImage(G, BufferedImage, At),
        (get({G, '$class'})):dispose(G).

