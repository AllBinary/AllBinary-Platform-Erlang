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
% package org.allbinary.image
% import javax.microedition.lcdui.Image
% import org.allbinary.animation.image.AnimationFactoryInitializationVisitor
% import org.allbinary.animation.image.BaseImageAnimationFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.media.ScaleProperties
% import org.allbinary.media.image.ImageJ2MEScaleUtil
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings

-module('AnimationFactoryImageScaleUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AnimationFactoryImageScaleUtil':new()),
    ok.

init_fields(This) ->
    put({This, imageScaleUtil}, 'ImageJ2MEScaleUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'AnimationFactoryImageScaleUtil', instance}).

% throws Exception
createImage(This, Image, Width, Height, ScaleWidth, ScaleHeight) when is_integer(Width), is_integer(Height), is_integer(ScaleWidth), is_integer(ScaleHeight) ->
        put({local, scaledImage}, undefined),
        case ((ScaleWidth =/= 0) andalso (ScaleHeight =/= 0)) of
            true ->
            ScaleX = ((float(ScaleWidth)) / (float(Width))),
            ScaleY = ((float(ScaleHeight)) / (float(Height))),
            case ((((ScaleX =:= 1.0) andalso (ScaleY =:= 1.0))) orelse (((ScaleX =:= 0.0) orelse (ScaleY =:= 0.0)))) of
                true ->
                put({local, scaledImage}, Image);
                false ->
                ScaledWidth = trunc(((ScaleX * float(Width)))),
                ScaledHeight = trunc(((ScaleY * float(Height)))),
                put({local, scaledImage}, (get({get({This, imageScaleUtil}), '$class'})):scale(get({This, imageScaleUtil}), Image, ScaledWidth, ScaledHeight))
            end;
            false ->
            put({local, scaledImage}, Image)
        end,
        get({local, scaledImage}).

% throws Exception
processAdjust(This, BaseImageAnimationFactory) ->
        ScaleProperties = (get({BaseImageAnimationFactory, '$class'})):getScalePropertiesP(BaseImageAnimationFactory),
        case ((get({ScaleProperties, scaleWidth}) =/= 0) andalso (get({ScaleProperties, scaleHeight}) =/= 0)) of
            true ->
            AnimationFactoryInitializationVisitor = (get({BaseImageAnimationFactory, '$class'})):getAnimationFactoryInitializationVisitorP(BaseImageAnimationFactory),
            ScaleX = ((float(get({ScaleProperties, scaleWidth}))) / (float(get({AnimationFactoryInitializationVisitor, width})))),
            ScaleY = ((float(get({ScaleProperties, scaleHeight}))) / (float(get({AnimationFactoryInitializationVisitor, height})))),
            case ((((ScaleX =:= 1.0) andalso (ScaleY =:= 1.0))) orelse (((ScaleX =:= 0.0) orelse (ScaleY =:= 0.0)))) of
                true ->
                ok;
                false ->
                put({AnimationFactoryInitializationVisitor, dx}, trunc(((get({AnimationFactoryInitializationVisitor, originalDx}) * ScaleX)))),
                put({AnimationFactoryInitializationVisitor, dy}, trunc(((get({AnimationFactoryInitializationVisitor, originalDy}) * ScaleY))))
            end;
            false ->
            ok
        end.

