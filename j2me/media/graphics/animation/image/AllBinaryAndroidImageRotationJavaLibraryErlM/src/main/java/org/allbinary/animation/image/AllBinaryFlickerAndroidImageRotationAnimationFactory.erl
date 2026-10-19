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
% import javax.microedition.lcdui.NullImage
% import org.allbinary.animation.Animation
% import org.allbinary.animation.AnimationBehaviorFactory
% import org.allbinary.animation.AnimationInterfaceFactoryInterface
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.media.image.ImageCopyUtil
% import org.allbinary.math.AngleFactory
% import org.allbinary.math.AngleInfo
% import org.allbinary.media.ScaleProperties

-module('AllBinaryFlickerAndroidImageRotationAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AnimationInterfaceFactoryInterface

init_fields(This) ->
    put({This, image}, get({'NullImage', 'NULL_IMAGE'})),
    put({This, angleIncrement}, 0),
    put({This, animationBehaviorFactory}, undefined),
    ok.


new(Image, Width, Height, AngleIncrement, AnimationBehaviorFactory) when is_integer(Width), is_integer(Height), is_integer(AngleIncrement) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Image, Width, Height, AngleIncrement, AnimationBehaviorFactory),
    This.

init(This, Image, Width, Height, AngleIncrement, AnimationBehaviorFactory) when is_integer(Width), is_integer(Height), is_integer(AngleIncrement) ->
    init_fields(This),
        (get({This, '$class'})):setImage(This, Image),
        put({This, angleIncrement}, AngleIncrement),
        put({This, animationBehaviorFactory}, AnimationBehaviorFactory).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        Image = (fun(Target_N66225) -> (get({Target_N66225, '$class'})):createImage(Target_N66225, (get({This, '$class'})):getImage(This)) end)('ImageCopyUtil':getInstance()),
        'AllBinaryFlickerAndroidImageRotationAnimation':new((get({This, '$class'})):getImage(This), Image, 'AngleInfo':getInstance(get({This, angleIncrement})), get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory}))).

getAngleIncrement(This) ->
        get({This, angleIncrement}).

setImage(This, Image) ->
        put({This, image}, Image).

getImage(This) ->
        get({This, image}).

setInitialScale(This, ScaleProperties) ->
        ok.

