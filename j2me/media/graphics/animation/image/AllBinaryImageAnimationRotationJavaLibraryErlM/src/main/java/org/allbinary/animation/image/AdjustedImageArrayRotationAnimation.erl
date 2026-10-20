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
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Image
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.math.AngleInfo

-module('AdjustedImageArrayRotationAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ImageArrayRotationAnimation', Function, Arguments).

init_fields(This) ->
    put({This, dx}, 0),
    put({This, dy}, 0),
    ok.


% throws Exception
createAdjustedImageArrayRotationAnimationInfo(AnyType, AnimationBehavior) ->
        ImageRotationAnimationInfo = AnyType,
        'AdjustedImageArrayRotationAnimation':new((get({ImageRotationAnimationInfo, '$class'})):getImageArray(ImageRotationAnimationInfo), (get({ImageRotationAnimationInfo, '$class'})):getAngleInfoP(ImageRotationAnimationInfo), (get({ImageRotationAnimationInfo, '$class'})):getTotalAngle(ImageRotationAnimationInfo), (get({ImageRotationAnimationInfo, '$class'})):getDx(ImageRotationAnimationInfo), (get({ImageRotationAnimationInfo, '$class'})):getDy(ImageRotationAnimationInfo), AnimationBehavior).

% throws Exception
createAnimation(ImageArray, AngleInfo, TotalAngle, AnimationBehavior) when (is_tuple(ImageArray) orelse ImageArray =:= undefined), is_integer(TotalAngle) ->
        'AdjustedImageArrayRotationAnimation':new(ImageArray, AngleInfo, TotalAngle, (-(((fun(Target_N66018) -> (get({Target_N66018, '$class'})):getWidth(Target_N66018) end)(array:get(0, ImageArray)) bsr 2))), (-(((fun(Target_N66060) -> (get({Target_N66060, '$class'})):getHeight(Target_N66060) end)(array:get(0, ImageArray)) bsr 2))), AnimationBehavior).

new(ImageArray, AngleInfo, TotalAngle, Dx, Dy, AnimationBehavior) when (is_tuple(ImageArray) orelse ImageArray =:= undefined), is_integer(TotalAngle), is_integer(Dx), is_integer(Dy) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ImageArray, AngleInfo, TotalAngle, Dx, Dy, AnimationBehavior),
    This.

'$init'(This, ImageArray, AngleInfo, TotalAngle, Dx, Dy, AnimationBehavior) when (is_tuple(ImageArray) orelse ImageArray =:= undefined), is_integer(TotalAngle), is_integer(Dx), is_integer(Dy) ->
        'ImageArrayRotationAnimation':'$init'(This, ImageArray, AngleInfo, TotalAngle, AnimationBehavior),
        init_fields(This),
        (get({This, '$class'})):init(This, Dx, Dy).

% throws Exception
init(This, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        (get({This, '$class'})):setDx(This, Dx),
        (get({This, '$class'})):setDy(This, Dy).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        'ImageArrayRotationAnimation':paintXY(This, Graphics, (X + get({This, dx})), (Y + get({This, dy}))).

setDx(This, Dx) when is_integer(Dx) ->
        put({This, dx}, Dx).

getDx(This) ->
        get({This, dx}).

setDy(This, Dy) when is_integer(Dy) ->
        put({This, dy}, Dy).

getDy(This) ->
        get({This, dy}).

