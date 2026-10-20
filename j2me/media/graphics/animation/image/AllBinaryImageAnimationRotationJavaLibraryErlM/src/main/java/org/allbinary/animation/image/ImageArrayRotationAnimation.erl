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
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.math.AngleInfo

-module('ImageArrayRotationAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ImageArrayBaseRotationAnimation', Function, Arguments).

init_fields(This) ->
    put({This, expectedTotalFrames}, 0),
    ok.


% throws Exception
createAnimation(AnyType, AnimationBehavior) ->
        ImageRotationAnimationInfo = AnyType,
        'ImageArrayRotationAnimation':new((get({ImageRotationAnimationInfo, '$class'})):getImageArray(ImageRotationAnimationInfo), (get({ImageRotationAnimationInfo, '$class'})):getAngleInfoP(ImageRotationAnimationInfo), (get({ImageRotationAnimationInfo, '$class'})):getTotalAngle(ImageRotationAnimationInfo), AnimationBehavior).

new(ImageArray, AngleInfo, TotalAngle, AnimationBehavior) when (is_tuple(ImageArray) orelse ImageArray =:= undefined), is_integer(TotalAngle) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ImageArray, AngleInfo, TotalAngle, AnimationBehavior),
    This.

'$init'(This, ImageArray, AngleInfo, TotalAngle, AnimationBehavior) when (is_tuple(ImageArray) orelse ImageArray =:= undefined), is_integer(TotalAngle) ->
        'ImageArrayBaseRotationAnimation':'$init'(This, ImageArray, AngleInfo, AnimationBehavior),
        init_fields(This),
        (get({This, '$class'})):init(This, ImageArray, AngleInfo, TotalAngle).

% throws Exception
init(This, ImageArray, AngleInfo, TotalAngle) when (is_tuple(ImageArray) orelse ImageArray =:= undefined), is_integer(TotalAngle) ->
        put({This, expectedTotalFrames}, (TotalAngle / (fun(Target_N66173) -> (get({Target_N66173, '$class'})):getAngleIncrement(Target_N66173) end)((get({get({This, angleInfo}), '$class'})):getAngleIncrementInfo(get({This, angleInfo}))))),
        (get({get({This, angleInfo}), '$class'})):adjustAngle(get({This, angleInfo}), 0),
        case (get({This, expectedTotalFrames}) =/= (get({This, '$class'})):getSize(This)) of
            true ->
            erlang:error({'Exception', "Wrong Number of Frames"});
            false -> ok
        end.

setImageArray(This, ImageArray) when (is_tuple(ImageArray) orelse ImageArray =:= undefined) ->
        'ImageArrayBaseRotationAnimation':setImageArray(This, ImageArray),
        (get({get({This, angleInfo}), '$class'})):adjustAngle(get({This, angleInfo}), 0).

