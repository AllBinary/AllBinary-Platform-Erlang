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
% import javax.microedition.lcdui.Image
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.GameFeatureFactory
% import org.allbinary.image.ImageCache
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('ImageScaleUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageScaleUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, imageCopyUtil}, 'ImageCopyUtil':getInstance()),
    put({This, gameFeatureFactory}, 'GameFeatureFactory':getInstance()),
    put({This, features}, 'Features':getInstance()),
    put({This, 'NO_COPY'}, "SWT should not copy images after initial loading as the alpha is not honored"),
    ok.


getInstance() ->
        get({'ImageScaleUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
createImage2(This, ImageCache, OriginalImage, ScaleNominatorX, ScaleDenominatorX, ScaleNominatorY, ScaleDenominatorY, Cached) when is_number(ScaleNominatorX), is_number(ScaleDenominatorX), is_number(ScaleNominatorY), is_number(ScaleDenominatorY), is_boolean(Cached) ->
        (get({This, '$class'})):createImage3(This, ImageCache, OriginalImage, ScaleNominatorX, ScaleDenominatorX, ScaleNominatorY, ScaleDenominatorY, Cached, true).

% throws Exception
createImage3(This, ImageCache, OriginalImage, ScaleNominatorX, ScaleDenominatorX, ScaleNominatorY, ScaleDenominatorY, Cached, Mutable) when is_number(ScaleNominatorX), is_number(ScaleDenominatorX), is_number(ScaleNominatorY), is_number(ScaleDenominatorY), is_boolean(Cached), is_boolean(Mutable) ->
        try
        case (not (get({get({This, features}), '$class'})):isFeature(get({This, features}), get({get({This, gameFeatureFactory}), 'POST_IMAGE_LOADING_MODIFICATION'}))) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({This, 'NO_COPY'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
            throw({'$return', OriginalImage});
            false -> ok
        end,
        Width = (get({OriginalImage, '$class'})):getWidth(OriginalImage),
        Height = (get({OriginalImage, '$class'})):getHeight(OriginalImage),
        ScaleX = (ScaleNominatorX / ScaleDenominatorX),
        ScaleY = (ScaleNominatorY / ScaleDenominatorY),
        ScaledImage = (get({get({This, imageCopyUtil}), '$class'})):createImageWH(get({This, imageCopyUtil}), OriginalImage, trunc(((ScaleX * float(Width)))), trunc(((ScaleY * float(Height)))), Mutable),
        ScaledImage
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
scale2(This, OriginalImage, OriginalImageArray, XimageToShowArray, Unused, ScaleX, ScaleY, MaxScaleX, MaxScaleY) when (is_tuple(OriginalImageArray) orelse OriginalImageArray =:= undefined), (is_tuple(XimageToShowArray) orelse XimageToShowArray =:= undefined), is_integer(Unused), is_number(ScaleX), is_number(ScaleY), is_number(MaxScaleX), is_number(MaxScaleY) ->
        (get({This, '$class'})):scale(This, OriginalImage, OriginalImageArray, XimageToShowArray, Unused, ScaleX, ScaleY, MaxScaleX, MaxScaleY, true).

% throws Exception
scale(This, OriginalImage, OriginalImageArray, XimageToShowArray, Unused, ScaleX, ScaleY, MaxScaleX, MaxScaleY, Mutable) when (is_tuple(OriginalImageArray) orelse OriginalImageArray =:= undefined), (is_tuple(XimageToShowArray) orelse XimageToShowArray =:= undefined), is_integer(Unused), is_number(ScaleX), is_number(ScaleY), is_number(MaxScaleX), is_number(MaxScaleY), is_boolean(Mutable) ->
        Width = (get({OriginalImage, '$class'})):getWidth(OriginalImage),
        Height = (get({OriginalImage, '$class'})):getHeight(OriginalImage),
        ScaledImage = (get({get({This, imageCopyUtil}), '$class'})):createImageWH(get({This, imageCopyUtil}), OriginalImage, trunc(((ScaleX * float(Width)))), trunc(((ScaleY * float(Height)))), Mutable),
        array:set(0, ScaledImage, OriginalImageArray).

