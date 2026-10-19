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
% import org.allbinary.image.GameFeatureImageCacheFactory
% import org.allbinary.animation.Animation
% import org.allbinary.animation.AnimationBehaviorFactory
% import org.allbinary.graphics.displayable.ScreenRelationalUtil
% import org.allbinary.logic.math.PrimitiveIntUtil
% import org.allbinary.media.image.ImageScaleUtil
% import org.microemu.android.device.AndroidImageInterface

-module('AllBinaryScreenRelationalImageAnimationInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseImageAnimationFactory', Function, Arguments).

init_fields(This) ->
    put({This, lastImage}, get({'NullImage', 'NULL_IMAGE'})),
    ok.


new(Image, AnimationBehaviorFactory) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Image, AnimationBehaviorFactory),
    This.

init(This, Image, AnimationBehaviorFactory) ->
        'BaseImageAnimationFactory':init(This, Image, 'PrimitiveIntUtil':getArrayInstance(), 0, 0, 0, 0, AnimationBehaviorFactory),
        init_fields(This),
        case (get({This, lastImage}) =/= get({'NullImage', 'NULL_IMAGE'})) of
            true ->
            AndroidImageInterface = get({This, lastImage}),
            (fun(Target_N66053) -> (get({Target_N66053, '$class'})):recycle(Target_N66053) end)((get({AndroidImageInterface, '$class'})):getBitmap(AndroidImageInterface));
            false -> ok
        end,
        Scale = (fun(Target_N66096) -> (get({Target_N66096, '$class'})):getScaleImage(Target_N66096, Image) end)('ScreenRelationalUtil':getInstance()),
        put({This, lastImage}, (fun(Target_N66161) -> (get({Target_N66161, '$class'})):createImage(Target_N66161, 'GameFeatureImageCacheFactory':getInstance(), (get({This, '$class'})):getImage(This), Scale, Scale, false) end)('ImageScaleUtil':getInstance())).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        'ImageAnimation':new(get({This, lastImage}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory}))).

