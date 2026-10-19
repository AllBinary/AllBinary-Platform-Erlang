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
% package org.allbinary.animation.text
% import javax.microedition.lcdui.Font
% import org.allbinary.animation.Animation
% import org.allbinary.animation.AnimationBehaviorFactory
% import org.allbinary.animation.AnimationInterfaceFactoryInterface
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.media.ScaleProperties

-module('CustomTextAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AnimationInterfaceFactoryInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, animationBehaviorFactory}, undefined),
    put({This, basicColor}, get({'BasicColorFactory':getInstance(), 'BLACK'})),
    put({This, text}, undefined),
    put({This, initScaleHeight}, 0),
    put({This, dx}, 0),
    put({This, dy}, 0),
    put({This, font}, undefined),
    put({This, scaleProperties}, undefined),
    ok.


createDXY(Text, FontSize, Dx, Dy, AnimationBehaviorFactory) when (is_list(Text) orelse Text =:= undefined), is_integer(FontSize), is_integer(Dx), is_integer(Dy) ->
        CustomTextAnimationFactory = 'CustomTextAnimationFactory':new(Text, FontSize, AnimationBehaviorFactory),
        put({CustomTextAnimationFactory, dx}, Dx),
        put({CustomTextAnimationFactory, dy}, Dy),
        CustomTextAnimationFactory.

new(Text, FontSize, AnimationBehaviorFactory) when (is_list(Text) orelse Text =:= undefined), is_integer(FontSize) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Text, FontSize, AnimationBehaviorFactory),
    This.

init(This, Text, FontSize, AnimationBehaviorFactory) when (is_list(Text) orelse Text =:= undefined), is_integer(FontSize) ->
    init_fields(This),
        put({This, scaleProperties}, 'ScaleProperties':new()),
        put({This, text}, Text),
        put({get({This, scaleProperties}), scaleHeight}, (FontSize - ((FontSize div 4)))),
        put({This, initScaleHeight}, get({get({This, scaleProperties}), scaleHeight})),
        put({This, animationBehaviorFactory}, AnimationBehaviorFactory),
        put({This, font}, 'Font':getFont(get({'Font', 'FACE_SYSTEM'}), get({'Font', 'STYLE_PLAIN'}), get({This, initScaleHeight}))).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        put({local, customTextAnimation}, undefined),
        case ((get({This, dx}) =/= 0) orelse (get({This, dy}) =/= 0)) of
            true ->
            put({local, customTextAnimation}, 'AdjustCustomTextAnimation':new(get({This, text}), get({get({This, scaleProperties}), scaleHeight}), get({This, dx}), get({This, dy}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory}))));
            false ->
            put({local, customTextAnimation}, 'CustomTextAnimation':new(get({This, text}), get({get({This, scaleProperties}), scaleHeight}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory}))))
        end,
        (get({get({local, customTextAnimation}), '$class'})):setBasicColorP(get({local, customTextAnimation}), get({This, basicColor})),
        get({local, customTextAnimation}).

setInitialScale(This, ScaleProperties) ->
        ok.

getWidth(This) ->
        (get({get({This, font}), '$class'})):stringWidth(get({This, font}), get({This, text})).

getHeight(This) ->
        (get({get({This, font}), '$class'})):getHeight(get({This, font})).

