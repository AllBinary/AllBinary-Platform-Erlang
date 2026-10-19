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
% import org.allbinary.animation.VectorAnimation
% import org.allbinary.game.configuration.GameConfigurationCentral
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.image.AnimationFrameToImageUtil
% import org.allbinary.logic.math.PrimitiveIntUtil
% import org.allbinary.math.AngleFactory
% import org.allbinary.math.AngleInfo
% import org.allbinary.media.ScaleProperties
% import org.allbinary.media.image.ImageToRotationImageArrayUtil
% import org.allbinary.vector.VectorInfo

-module('VectorToImageArrayRotationAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseImageAnimationFactory', Function, Arguments).

init_fields(This) ->
    put({This, imageArray}, get({'NullImage', 'NULL_IMAGE_ARRAY'})),
    put({This, angleIncrement}, 0),
    ok.


new(VectorInfo, BasicColor, AnimationBehaviorFactory) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, VectorInfo, BasicColor, AnimationBehaviorFactory),
    This.

init(This, VectorInfo, BasicColor, AnimationBehaviorFactory) ->
        'BaseImageAnimationFactory':init(This, (fun(Target_N66055) -> (get({Target_N66055, '$class'})):getInstanceTranslate(Target_N66055, (get({VectorInfo, '$class'})):getWidth(VectorInfo), (get({VectorInfo, '$class'})):getHeight(VectorInfo), 'VectorAnimation':createVectorAnimation((get({VectorInfo, '$class'})):getPoints(VectorInfo), BasicColor, (get({AnimationBehaviorFactory, '$class'})):getOrCreateInstance(AnimationBehaviorFactory))) end)('AnimationFrameToImageUtil':getInstance()), 'PrimitiveIntUtil':getArrayInstance(), 0, 0, 0, 0, AnimationBehaviorFactory),
        init_fields(This),
        (get({This, '$class'})):init(This).

% throws Exception
init(This) ->
        AngleFactory = 'AngleFactory':getInstance(),
        put({This, angleIncrement}, (get({AngleFactory, 'TOTAL_ANGLE'}) / (fun(Target_N66430) -> (get({Target_N66430, '$class'})):getGameControlFidelity(Target_N66430) end)('GameConfigurationCentral':getInstance()))),
        put({This, imageArray}, (fun(Target_N66475) -> (get({Target_N66475, '$class'})):generate(Target_N66475, (get({This, '$class'})):getImage(This), (get({This, '$class'})):getAngleIncrement(This), trunc(get({AngleFactory, 'TOTAL_ANGLE'}))) end)('ImageToRotationImageArrayUtil':getInstance())).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        try
        case ((get({get({This, animationFactoryInitializationVisitor}), dx}) =/= 0) orelse (get({get({This, animationFactoryInitializationVisitor}), dy}) =/= 0)) of
            true ->
            throw({'$return', 'AdjustedImageArrayRotationAnimation':new(get({This, imageArray}), 'AngleInfo':getInstance((get({This, '$class'})):getAngleIncrement(This)), trunc(get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'})), get({get({This, animationFactoryInitializationVisitor}), dx}), get({get({This, animationFactoryInitializationVisitor}), dy}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory})))});
            false ->
            throw({'$return', 'AdjustedImageArrayRotationAnimation':createAnimation(get({This, imageArray}), 'AngleInfo':getInstance(get({This, angleIncrement})), trunc(get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'})), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory})))})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getAngleIncrement(This) ->
        get({This, angleIncrement}).

setInitialScale(This, ScaleProperties) ->
        ok.

