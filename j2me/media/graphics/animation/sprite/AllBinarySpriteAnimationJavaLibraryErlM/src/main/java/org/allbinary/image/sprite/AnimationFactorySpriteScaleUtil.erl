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
% package org.allbinary.image.sprite
% import javax.microedition.lcdui.Image
% import javax.microedition.lcdui.game.Sprite
% import org.allbinary.game.layer.SpriteFactory
% import org.allbinary.graphics.opengles.OpenGLUtil
% import org.allbinary.image.ImageCache
% import org.allbinary.image.ImageCacheFactory
% import org.allbinary.image.opengles.OpenGLESImageExclusionUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.math.J2SEMath
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.media.image.ImageScaleUtil
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings

-module('AnimationFactorySpriteScaleUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AnimationFactorySpriteScaleUtil':new()),
    ok.

init_fields(This) ->
    put({This, imageCache}, 'ImageCacheFactory':getInstance()),
    put({This, imageScaleUtil}, 'ImageScaleUtil':getInstance()),
    put({This, openGLUtil}, 'OpenGLUtil':getInstance()),
    put({This, j2seMath}, 'J2SEMath':getInstance()),
    put({This, openGLESImageExclusionUtil}, 'OpenGLESImageExclusionUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'AnimationFactorySpriteScaleUtil', instance}).

% throws Exception
createImage(This, Image, Width, Height, ScaleWidth, ScaleHeight) when is_integer(Width), is_integer(Height), is_integer(ScaleWidth), is_integer(ScaleHeight) ->
        SpriteFactory = 'SpriteFactory':getInstance(),
        put({local, sprite}, undefined),
        put({local, scaledImage}, undefined),
        case ((ScaleWidth =/= 0) andalso (ScaleHeight =/= 0)) of
            true ->
            put({local, scaleX}, ((float(ScaleWidth)) / (float(Width)))),
            put({local, scaleY}, ((float(ScaleHeight)) / (float(Height)))),
            case ((((get({local, scaleX}) =:= 1.0) andalso (get({local, scaleY}) =:= 1.0))) orelse (((get({local, scaleX}) =:= 0.0) orelse (get({local, scaleY}) =:= 0.0)))) of
                true ->
                put({local, scaledImage}, (get({get({This, openGLUtil}), '$class'})):addImage(get({This, openGLUtil}), Image)),
                put({local, sprite}, (get({SpriteFactory, '$class'})):createSprite(SpriteFactory, get({local, scaledImage}), Width, Height));
                false ->
                case (get({get({This, openGLESImageExclusionUtil}), '$class'})):isCustomScaling(get({This, openGLESImageExclusionUtil}), Image) of
                    true ->
                    Width2 = (get({get({This, j2seMath}), '$class'})):round(get({This, j2seMath}), (float((ScaleWidth)) - 0.5)),
                    Height2 = (get({get({This, j2seMath}), '$class'})):round(get({This, j2seMath}), (float((ScaleHeight)) - 0.5)),
                    MultiplesOf16Width = (Width2 div 16),
                    By16Width = (MultiplesOf16Width * 16),
                    put({local, scaleX}, ((float(By16Width)) / float(Width))),
                    MultiplesOf16Height = (Height2 div 16),
                    By16Height = (MultiplesOf16Height * 16),
                    put({local, scaleY}, ((float(By16Height)) / float(Height))),
                    case (ScaleWidth < Width) of
                        true ->
                        put({local, scaleX}, (get({local, scaleX}) * 2.35));
                        false -> ok
                    end,
                    case (ScaleHeight < Height) of
                        true ->
                        put({local, scaleY}, (get({local, scaleY}) * 2.35));
                        false -> ok
                    end;
                    false -> ok
                end,
                put({local, scaledImage}, (get({get({This, imageScaleUtil}), '$class'})):createImage2(get({This, imageScaleUtil}), get({This, imageCache}), Image, get({local, scaleX}), 1.0, get({local, scaleY}), 1.0, true)),
                put({local, sprite}, (get({SpriteFactory, '$class'})):createSprite(SpriteFactory, get({local, scaledImage}), trunc(((float(Width) * get({local, scaleX})))), trunc(((float(Height) * get({local, scaleY}))))))
            end;
            false ->
            put({local, scaledImage}, (get({get({This, openGLUtil}), '$class'})):addImage(get({This, openGLUtil}), Image)),
            put({local, sprite}, (get({SpriteFactory, '$class'})):createSprite(SpriteFactory, get({local, scaledImage}), Width, Height))
        end,
        get({local, sprite}).

