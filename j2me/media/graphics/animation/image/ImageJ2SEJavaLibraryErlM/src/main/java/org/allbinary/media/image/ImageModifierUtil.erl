% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% import java.awt.image.BufferedImage
% import java.awt.image.ColorModel
% import java.awt.image.WritableRaster
% import javax.microedition.lcdui.Image
% import org.allbinary.graphics.Anchor
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.string.CommonStrings

-module('ImageModifierUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageModifierUtil':new()),
    ok.

init_fields(This) ->
    put({This, imageUtil}, 'ImageUtil':getInstance()),
    put({This, colorArray}, array:new(1, {default, 0})),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstanceOrCreate() ->
        get({'ImageModifierUtil', instance}).

setBasicColorP(This, BasicColor) ->
        ok.

setColor(This, UnusedOriginalImage, Image, ImageIndex, BasicColor) when is_integer(ImageIndex) ->
        NewBufferedImage = (get({get({This, imageUtil}), '$class'})):getBufferedImage(get({This, imageUtil}), Image),
        R = get({BasicColor, red}),
        G = get({BasicColor, green}),
        B = get({BasicColor, blue}),
        Width = (get({Image, '$class'})):getWidth(Image),
        Height = (get({Image, '$class'})):getHeight(Image),
        put({local, colorModel}, undefined),
        put({local, dataElements}, undefined),
        put({local, ax}, 0),
        put({local, rx}, 0),
        put({local, gx}, 0),
        put({local, bx}, 0),
        lists:foreach(fun(Index) ->
            lists:foreach(fun(Index2) ->
                put({local, colorModel}, (get({NewBufferedImage, '$class'})):getColorModel(NewBufferedImage)),
                put({local, dataElements}, (fun(Target_N66586) -> (get({Target_N66586, '$class'})):getDataElements(Target_N66586, Index, Index2, undefined) end)((get({NewBufferedImage, '$class'})):getRaster(NewBufferedImage))),
                put({local, ax}, (get({get({local, colorModel}), '$class'})):getAlpha(get({local, colorModel}), get({local, dataElements}))),
                put({local, rx}, (get({get({local, colorModel}), '$class'})):getRed(get({local, colorModel}), get({local, dataElements}))),
                put({local, gx}, (get({get({local, colorModel}), '$class'})):getGreen(get({local, colorModel}), get({local, dataElements}))),
                put({local, bx}, (get({get({local, colorModel}), '$class'})):getBlue(get({local, colorModel}), get({local, dataElements}))),
                case (((get({local, rx}) =/= 0) orelse (get({local, gx}) =/= 0)) orelse (get({local, bx}) =/= 0)) of
                    true ->
                    (get({NewBufferedImage, '$class'})):setRGB(NewBufferedImage, Index, Index2, (((((get({local, ax}) bsl 24)) bor ((R bsl 16))) bor ((G bsl 8))) bor (B)));
                    false -> ok
                end
            end, lists:seq(0, Height - 1))
        end, lists:seq(0, Width - 1)).

changeColor(This, UnusedOriginalImage, Image, ImageIndex, BasicColor) when is_integer(ImageIndex) ->
        NewBufferedImage = (get({get({This, imageUtil}), '$class'})):getBufferedImage(get({This, imageUtil}), Image),
        MAX = 255.0,
        R = ((float(get({BasicColor, red}))) / MAX),
        G = ((float(get({BasicColor, green}))) / MAX),
        B = ((float(get({BasicColor, blue}))) / MAX),
        Width = (get({Image, '$class'})):getWidth(Image),
        Height = (get({Image, '$class'})):getHeight(Image),
        put({local, colorModel}, undefined),
        put({local, dataElements}, undefined),
        put({local, ax}, 0),
        put({local, rx}, 0),
        put({local, gx}, 0),
        put({local, bx}, 0),
        lists:foreach(fun(Index) ->
            lists:foreach(fun(Index2) ->
                put({local, colorModel}, (get({NewBufferedImage, '$class'})):getColorModel(NewBufferedImage)),
                put({local, dataElements}, (fun(Target_N67880) -> (get({Target_N67880, '$class'})):getDataElements(Target_N67880, Index, Index2, undefined) end)((get({NewBufferedImage, '$class'})):getRaster(NewBufferedImage))),
                put({local, ax}, (get({get({local, colorModel}), '$class'})):getAlpha(get({local, colorModel}), get({local, dataElements}))),
                put({local, rx}, (get({get({local, colorModel}), '$class'})):getRed(get({local, colorModel}), get({local, dataElements}))),
                put({local, gx}, (get({get({local, colorModel}), '$class'})):getGreen(get({local, colorModel}), get({local, dataElements}))),
                put({local, bx}, (get({get({local, colorModel}), '$class'})):getBlue(get({local, colorModel}), get({local, dataElements}))),
                put({local, rx}, trunc((get({local, rx}) * R))),
                put({local, gx}, trunc((get({local, gx}) * G))),
                put({local, bx}, trunc((get({local, bx}) * B))),
                (get({NewBufferedImage, '$class'})):setRGB(NewBufferedImage, Index, Index2, (((((get({local, ax}) bsl 24)) bor ((get({local, rx}) bsl 16))) bor ((get({local, gx}) bsl 8))) bor (get({local, bx}))))
            end, lists:seq(0, Height - 1))
        end, lists:seq(0, Width - 1)).

setAlpha(This, UnusedOriginalImage, Image, ImageIndex, AlphaInt) when is_integer(ImageIndex), is_integer(AlphaInt) ->
        Alpha = AlphaInt,
        NewBufferedImage = (get({get({This, imageUtil}), '$class'})):getBufferedImage(get({This, imageUtil}), Image),
        Width = (get({Image, '$class'})):getWidth(Image),
        Height = (get({Image, '$class'})):getHeight(Image),
        Raster = (get({NewBufferedImage, '$class'})):getAlphaRaster(NewBufferedImage),
        lists:foreach(fun(Index) ->
            lists:foreach(fun(Index2) ->
                (get({Raster, '$class'})):getPixel(Raster, Index, Index2, get({This, colorArray})),
                put({This, colorArray}, array:set(0, (Alpha band array:get(0, get({This, colorArray}))), get({This, colorArray}))),
                (get({Raster, '$class'})):setPixel(Raster, Index, Index2, get({This, colorArray}))
            end, lists:seq(0, Height - 1))
        end, lists:seq(0, Width - 1)).

getImageArray(This, OriginalImageArray) when (is_tuple(OriginalImageArray) orelse OriginalImageArray =:= undefined) ->
        try
            NewImageArray = array:new(array:size(OriginalImageArray), {default, undefined}),
            Size = array:size(NewImageArray),
            put({local, originalImage}, undefined),
            lists:foreach(fun(Index) ->
                put({local, originalImage}, array:get(Index, OriginalImageArray)),
                Image = (fun(Target_N69459) -> (get({Target_N69459, '$class'})):createImageWH(Target_N69459, (get({get({local, originalImage}), '$class'})):getWidth(get({local, originalImage})), (get({get({local, originalImage}), '$class'})):getHeight(get({local, originalImage}))) end)('ImageCreationUtil':getInstance()),
                (fun(Target_N69537) -> (get({Target_N69537, '$class'})):drawImage(Target_N69537, get({local, originalImage}), 0, 0, get({'Anchor', 'TOP_LEFT'})) end)((get({Image, '$class'})):getGraphics(Image)),
                array:set(Index, Image, NewImageArray)
            end, lists:seq(0, Size - 1)),
            NewImageArray
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            'PreLogUtil':putOE(get({CommonStrings, 'EXCEPTION'}), This, "getImageArray", E),
            OriginalImageArray
        end.

handleImage(This, ImageArray, Index, Image) when (is_tuple(ImageArray) orelse ImageArray =:= undefined), is_integer(Index) ->
        ok.

reset(This) ->
        ok.

