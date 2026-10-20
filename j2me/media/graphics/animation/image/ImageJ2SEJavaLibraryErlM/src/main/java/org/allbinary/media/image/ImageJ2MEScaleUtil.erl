%
% AllBinary Open License Version 1
% Copyright (c) 2023 AllBinary
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

-module('ImageJ2MEScaleUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageJ2MEScaleUtil':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'ImageJ2MEScaleUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
scaleArray(This, Images, Width, Height) when (is_tuple(Images) orelse Images =:= undefined), is_integer(Width), is_integer(Height) ->
        ScaledImages = array:new(array:size(Images), {default, undefined}),
        put({local, index}, array:size(Images)),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            array:set(get({local, index}), (get({This, '$class'})):scale(This, array:get(get({local, index}), Images), Width, Height), ScaledImages),
            Loop();
        false -> ok end end)(),
        ScaledImages.

% throws Exception
scale(This, Image, Width, Height) when is_integer(Width), is_integer(Height) ->
        SourceWidth = (get({Image, '$class'})):getWidth(Image),
        SourceHeight = (get({Image, '$class'})):getHeight(Image),
        OriginalData = array:new(((get({Image, '$class'})):getWidth(Image) * (get({Image, '$class'})):getHeight(Image)), {default, 0}),
        (get({Image, '$class'})):getRGB(Image, OriginalData, 0, (get({Image, '$class'})):getWidth(Image), 0, 0, (get({Image, '$class'})):getWidth(Image), (get({Image, '$class'})):getHeight(Image)),
        ScaledData = array:new((Width * Height), {default, 0}),
        HeightRatioFactor = (((8 * SourceHeight)) div Height),
        WidthRatioFactor = (((8 * SourceWidth)) div Width),
        put({local, scaledIndex}, (array:size(ScaledData) - 1)),
        put({local, dx}, 0),
        put({local, dy}, 0),
        put({local, index}, Height),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, dy}, (((get({local, index}) * HeightRatioFactor)) bsr 3)),
            put({local, index2}, Width),
            (fun Loop() -> case (begin put({local, index2}, get({local, index2}) - 1), get({local, index2}) end >= 0) of true ->
                put({local, dx}, (((get({local, index2}) * WidthRatioFactor)) bsr 3)),
                array:set(allbinary_java:first(get({local, scaledIndex}), put({local, scaledIndex}, get({local, scaledIndex}) - 1)), array:get((((SourceWidth * get({local, dy}))) + get({local, dx})), OriginalData), ScaledData),
                Loop();
            false -> ok end end)(),
            Loop();
        false -> ok end end)(),
        ScaledImage = 'Image':createRGBImage(ScaledData, Width, Height, true),
        ScaledImage.

