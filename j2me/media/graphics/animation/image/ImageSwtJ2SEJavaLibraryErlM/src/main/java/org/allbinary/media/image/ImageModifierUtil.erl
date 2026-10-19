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
% import javax.microedition.lcdui.Image
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.opengles.OpenGLFeatureFactory
% import org.allbinary.image.opengles.ModifierOpenGLESImageProcessor
% import org.allbinary.image.opengles.OpenGLESImage
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.eclipse.swt.graphics.ImageData
% import org.microemu.device.swt.SwtImmutableImage
% import org.microemu.device.swt.SwtMutableImage

-module('ImageModifierUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageModifierUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, imageCopyUtil}, 'ImageCopyUtil':getInstance()),
    put({This, features}, 'Features':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstanceOrCreate() ->
        get({'ImageModifierUtil', instance}).

setBasicColorP(This, BasicColor) ->
        ok.

setColor(This, UnusedOriginalImage, Image, ImageIndex, BasicColor) when is_integer(ImageIndex) ->
        put({local, newBufferedImage}, undefined),
        case (get({Image, '$class'})):isMutable(Image) of
            true ->
            put({local, swtImage}, Image),
            put({local, newBufferedImage}, (get({get({local, swtImage}), '$class'})):getImage(get({local, swtImage})));
            false ->
            put({local, swtImage}, Image),
            put({local, newBufferedImage}, (get({get({local, swtImage}), '$class'})):getImage(get({local, swtImage})))
        end,
        R = get({BasicColor, red}),
        G = get({BasicColor, green}),
        B = get({BasicColor, blue}),
        Width = (get({Image, '$class'})):getWidth(Image),
        Height = (get({Image, '$class'})):getHeight(Image),
        ImageData = (get({get({local, newBufferedImage}), '$class'})):getImageData(get({local, newBufferedImage})),
        case (get({ImageData, depth}) =:= 24) of
            true ->
            put({local, rx}, 0),
            put({local, gx}, 0),
            put({local, bx}, 0),
            put({local, index3}, 0),
            lists:foreach(fun(Index) ->
                lists:foreach(fun(Index2) ->
                    put({local, index3}, (((Index2 * get({ImageData, bytesPerLine}))) + ((Index * 4)))),
                    put({local, rx}, (((array:get(get({local, index3}), get({ImageData, data})) band 16#FF)) bsl 16)),
                    put({local, gx}, (((array:get((get({local, index3}) + 1), get({ImageData, data})) band 16#FF)) bsl 8)),
                    put({local, bx}, ((array:get((get({local, index3}) + 2), get({ImageData, data})) band 16#FF))),
                    case (((get({local, rx}) =/= 0) orelse (get({local, gx}) =/= 0)) orelse (get({local, bx}) =/= 0)) of
                        true ->
                        put({ImageData, data}, array:set(get({local, index3}), R, get({ImageData, data}))),
                        put({ImageData, data}, array:set((get({local, index3}) + 1), G, get({ImageData, data}))),
                        put({ImageData, data}, array:set((get({local, index3}) + 2), B, get({ImageData, data})));
                        false -> ok
                    end
                end, lists:seq(0, Height - 1))
            end, lists:seq(0, Width - 1));
            false -> ok
        end.

changeColor(This, UnusedOriginalImage, Image, ImageIndex, BasicColor) when is_integer(ImageIndex) ->
        try
        case (get({get({This, features}), '$class'})):isFeature(get({This, features}), get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'})) of
            true ->
            case ((get({Image, '$class'})):getType(Image) >= get({'OpenGLESImage', 'TYPE'})) of
                true ->
                OpenGLESImage = (Image),
                put({OpenGLESImage, imageProcessor}, 'ModifierOpenGLESImageProcessor':getInstance()),
                put({get({OpenGLESImage, openGLESImageProperties}), redf}, (get({BasicColor, '$class'})):getRedComponent(BasicColor)),
                put({get({OpenGLESImage, openGLESImageProperties}), greenf}, (get({BasicColor, '$class'})):getGreenComponent(BasicColor)),
                put({get({OpenGLESImage, openGLESImageProperties}), bluef}, (get({BasicColor, '$class'})):getBlueComponent(BasicColor)),
                throw({'$return', ok});
                false -> ok
            end;
            false -> ok
        end,
        put({local, newBufferedImage}, undefined),
        case (get({Image, '$class'})):isMutable(Image) of
            true ->
            put({local, swtImage}, Image),
            put({local, newBufferedImage}, (get({get({local, swtImage}), '$class'})):getImage(get({local, swtImage})));
            false ->
            put({local, swtImage}, Image),
            put({local, newBufferedImage}, (get({get({local, swtImage}), '$class'})):getImage(get({local, swtImage})))
        end,
        MAX = 255.0,
        R = ((float(get({BasicColor, red}))) / MAX),
        G = ((float(get({BasicColor, green}))) / MAX),
        B = ((float(get({BasicColor, blue}))) / MAX),
        put({local, rx}, 0),
        put({local, gx}, 0),
        put({local, bx}, 0),
        ImageData = (get({get({local, newBufferedImage}), '$class'})):getImageData(get({local, newBufferedImage})),
        case (get({ImageData, depth}) =:= 24) of
            true ->
            Size = array:size(get({ImageData, data})),
            lists:foreach(fun(Index) ->
                put({local, rx}, (((array:get(Index, get({ImageData, data})) band 16#FF)) bsl 16)),
                put({local, gx}, (((array:get((Index + 1), get({ImageData, data})) band 16#FF)) bsl 8)),
                put({local, bx}, ((array:get((Index + 2), get({ImageData, data})) band 16#FF))),
                put({local, rx}, trunc((get({local, rx}) * R))),
                put({local, gx}, trunc((get({local, gx}) * G))),
                put({local, bx}, trunc((get({local, bx}) * B))),
                put({ImageData, data}, array:set(Index, get({local, rx}), get({ImageData, data}))),
                put({ImageData, data}, array:set((Index + 1), get({local, gx}), get({ImageData, data}))),
                put({ImageData, data}, array:set((Index + 2), get({local, bx}), get({ImageData, data})))
            end, lists:seq(0, Size - 1, 4));
            false -> ok
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setAlpha(This, UnusedOriginalImage, Image, ImageIndex, AlphaInt) when is_integer(ImageIndex), is_integer(AlphaInt) ->
        try
        case (get({get({This, features}), '$class'})):isFeature(get({This, features}), get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'})) of
            true ->
            case ((get({Image, '$class'})):getType(Image) >= get({'OpenGLESImage', 'TYPE'})) of
                true ->
                OpenGLESImage = (Image),
                put({OpenGLESImage, imageProcessor}, 'ModifierOpenGLESImageProcessor':getInstance()),
                put({get({OpenGLESImage, openGLESImageProperties}), alphaf}, ((float(AlphaInt)) / 255.0)),
                throw({'$return', ok});
                false -> ok
            end;
            false -> ok
        end,
        (get({This, '$class'})):setAlphaSWT(This, Image, AlphaInt)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setAlphaSWT(This, Image, AlphaInt) when is_integer(AlphaInt) ->
        Alpha = AlphaInt,
        put({local, newBufferedImage}, undefined),
        case (get({Image, '$class'})):isMutable(Image) of
            true ->
            put({local, swtImage}, Image),
            put({local, newBufferedImage}, (get({get({local, swtImage}), '$class'})):getImage(get({local, swtImage})));
            false ->
            put({local, swtImage}, Image),
            put({local, newBufferedImage}, (get({get({local, swtImage}), '$class'})):getImage(get({local, swtImage})))
        end,
        put({(get({get({local, newBufferedImage}), '$class'})):getImageData(get({local, newBufferedImage})), alpha}, Alpha).

getImageArray(This, OriginalImageArray) when (is_tuple(OriginalImageArray) orelse OriginalImageArray =:= undefined) ->
        try
            NewImageArray = array:new(array:size(OriginalImageArray), {default, undefined}),
            Size = array:size(NewImageArray),
            put({local, originalImage}, undefined),
            lists:foreach(fun(Index) ->
                put({local, originalImage}, array:get(Index, OriginalImageArray)),
                Image = (get({get({This, imageCopyUtil}), '$class'})):createImage(get({This, imageCopyUtil}), get({local, originalImage})),
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

