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
% import org.allbinary.math.AngleInfo

-module('ImageArrayRotationAnimationInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, imageArray}, undefined),
    put({This, angleIncrement}, 0),
    put({This, totalAngle}, 0),
    put({This, dx}, 0),
    put({This, dy}, 0),
    ok.


new(ImageArray, AngleIncrement, TotalAngle, Dx, Dy) when (is_tuple(ImageArray) orelse ImageArray =:= undefined), is_integer(AngleIncrement), is_integer(TotalAngle), is_integer(Dx), is_integer(Dy) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ImageArray, AngleIncrement, TotalAngle, Dx, Dy),
    This.

init(This, ImageArray, AngleIncrement, TotalAngle, Dx, Dy) when (is_tuple(ImageArray) orelse ImageArray =:= undefined), is_integer(AngleIncrement), is_integer(TotalAngle), is_integer(Dx), is_integer(Dy) ->
    init_fields(This),
        put({This, imageArray}, ImageArray),
        put({This, angleIncrement}, AngleIncrement),
        put({This, totalAngle}, TotalAngle),
        put({This, dx}, Dx),
        put({This, dy}, Dy).

setImageArray(This, ImageArray) when (is_tuple(ImageArray) orelse ImageArray =:= undefined) ->
        put({This, imageArray}, ImageArray).

getImageArray(This) ->
        get({This, imageArray}).

getAngleInfoP(This) ->
        'AngleInfo':getInstance(get({This, angleIncrement})).

setTotalAngle(This, TotalAngle) when is_integer(TotalAngle) ->
        put({This, totalAngle}, TotalAngle).

getTotalAngle(This) ->
        get({This, totalAngle}).

setDx(This, Dx) when is_integer(Dx) ->
        put({This, dx}, Dx).

getDx(This) ->
        get({This, dx}).

setDy(This, Dy) when is_integer(Dy) ->
        put({This, dy}, Dy).

getDy(This) ->
        get({This, dy}).

