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
% package org.allbinary.animation.image
% import javax.microedition.lcdui.Image
% import org.allbinary.animation.Animation
% import org.allbinary.animation.AnimationBehaviorFactory
% import org.allbinary.animation.AnimationInterfaceFactoryInterface
% import org.allbinary.game.configuration.GameConfigurationCentral
% import org.allbinary.logic.NullUtil
% import org.allbinary.math.AngleFactory
% import org.allbinary.media.ScaleProperties
% import org.allbinary.media.image.ImageToRotationImageArrayUtil

-module('PooledImageArrayRotationAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AnimationInterfaceFactoryInterface

init_fields(This) ->
    put({This, allBinaryImageRotationAnimationInfo}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    put({This, animationBehaviorFactory}, undefined),
    ok.


% throws Exception
createFactory(Image, AnimationBehaviorFactory) ->
        TotalAngle = trunc(get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'})),
        AngleIncrement = ((TotalAngle / (fun(Target_N65936) -> (get({Target_N65936, '$class'})):getGameControlFidelity(Target_N65936) end)('GameConfigurationCentral':getInstance()))),
        'PooledImageArrayRotationAnimationFactory':new(Image, (get({Image, '$class'})):getWidth(Image), (get({Image, '$class'})):getHeight(Image), (-(((get({Image, '$class'})):getWidth(Image) bsr 2))), (-(((get({Image, '$class'})):getHeight(Image) bsr 2))), AngleIncrement, AnimationBehaviorFactory).

% throws Exception
createDXY(Image, Dx, Dy, AnimationBehaviorFactory) when is_integer(Dx), is_integer(Dy) ->
        TotalAngle = trunc(get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'})),
        AngleIncrement = ((TotalAngle / (fun(Target_N66308) -> (get({Target_N66308, '$class'})):getGameControlFidelity(Target_N66308) end)('GameConfigurationCentral':getInstance()))),
        'PooledImageArrayRotationAnimationFactory':new(Image, (get({Image, '$class'})):getWidth(Image), (get({Image, '$class'})):getHeight(Image), Dx, Dy, AngleIncrement, AnimationBehaviorFactory).

new(Image, Width, Height, Dx, Dy, AngleIncrement, AnimationBehaviorFactory) when is_integer(Width), is_integer(Height), is_integer(Dx), is_integer(Dy), is_integer(AngleIncrement) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Image, Width, Height, Dx, Dy, AngleIncrement, AnimationBehaviorFactory),
    This.

init(This, Image, Width, Height, Dx, Dy, AngleIncrement, AnimationBehaviorFactory) when is_integer(Width), is_integer(Height), is_integer(Dx), is_integer(Dy), is_integer(AngleIncrement) ->
    init_fields(This),
        put({This, animationBehaviorFactory}, AnimationBehaviorFactory),
        TotalAngle = trunc(get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'})),
        ImageArray = (fun(Target_N66773) -> (get({Target_N66773, '$class'})):generate(Target_N66773, Image, AngleIncrement, TotalAngle) end)('ImageToRotationImageArrayUtil':getInstance()),
        put({This, allBinaryImageRotationAnimationInfo}, 'ImageArrayRotationAnimationInfo':new(ImageArray, AngleIncrement, TotalAngle, Dx, Dy)).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        'AdjustedImageArrayRotationAnimation':createAdjustedImageArrayRotationAnimationInfo(get({This, allBinaryImageRotationAnimationInfo}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory}))).

setInitialScale(This, ScaleProperties) ->
        ok.

