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
% package org.allbinary.animation.image
% import javax.microedition.khronos.opengles.GL
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Image
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.animation.IndexedAnimation
% import org.allbinary.animation.NullRotationAnimationFactory
% import org.allbinary.animation.RotationAnimation
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.image.ImageCache
% import org.allbinary.image.ImageCacheFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.math.AngleFactory
% import org.allbinary.math.AngleInfo
% import org.allbinary.string.CommonSeps
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.media.ScaleProperties
% import org.allbinary.util.CircularIndexUtil

-module('LazyImageRotationAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RotationAnimation', Function, Arguments).

static_init() ->
    put({?MODULE, 'SET_REAL_ANIMATION'}, "setRealAnimation"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, layoutIndex}, 0),
    put({This, instanceId}, 0),
    put({This, animationInterfaceFactoryInterface}, undefined),
    put({This, 'NULL_INDEX_ANIMATION'}, undefined),
    put({This, animation}, undefined),
    put({This, scaleProperties}, get({'ScaleProperties', instance})),
    ok.


new(LayoutIndex, InstanceId, ScaleProperties, AnimationInterfaceFactoryInterface, AnimationBehavior) when is_integer(LayoutIndex), is_integer(InstanceId) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, LayoutIndex, InstanceId, ScaleProperties, AnimationInterfaceFactoryInterface, AnimationBehavior),
    This.

init(This, LayoutIndex, InstanceId, ScaleProperties, AnimationInterfaceFactoryInterface, AnimationBehavior) when is_integer(LayoutIndex), is_integer(InstanceId) ->
        'RotationAnimation':init(This, 'AngleInfo':getInstance(get({'AngleFactory':getInstance(), 'QUARTER_TOTAL_ANGLE'})), 'CircularIndexUtil':createInstance(4), AnimationBehavior),
        init_fields(This),
        put({This, layoutIndex}, LayoutIndex),
        put({This, instanceId}, InstanceId),
        put({This, animationInterfaceFactoryInterface}, AnimationInterfaceFactoryInterface),
        ImageCache = 'ImageCacheFactory':getInstance(),
        (get({ImageCache, '$class'})):add(ImageCache, This),
        put({This, scaleProperties}, ScaleProperties),
        put({This, 'NULL_INDEX_ANIMATION'}, (fun(Target_N66601) -> (get({Target_N66601, '$class'})):getInstance(Target_N66601, 0) end)('NullRotationAnimationFactory':getFactoryInstance())),
        ok % Java nested type ActualRotationAnimation: move it to its own module
,
        put({This, animation}, 'ActualRotationAnimation':new(This)).

setRealAnimation(This) ->
        try
            Animation = get({This, animation}),
            (get({get({This, animationInterfaceFactoryInterface}), '$class'})):setInitialScale(get({This, animationInterfaceFactoryInterface}), get({This, scaleProperties})),
            put({This, animation}, (get({get({This, animationInterfaceFactoryInterface}), '$class'})):getInstance(get({This, animationInterfaceFactoryInterface}), get({This, instanceId}))),
            (get({get({This, animation}), '$class'})):setState(get({This, animation}), Animation)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({'LazyImageRotationAnimation', 'SET_REAL_ANIMATION'}), E)
        end.

setScale(This, ScaleX, ScaleY) when is_number(ScaleX), is_number(ScaleY) ->
        (get({get({This, animation}), '$class'})):setScale(get({This, animation}), ScaleX, ScaleY).

getAnimationBehavior(This) ->
        (get({get({This, animation}), '$class'})):getAnimationBehavior(get({This, animation})).

% throws Exception
set(This, Gl) ->
        (get({get({This, animation}), '$class'})):set(get({This, animation}), Gl).

setAlpha(This, Alpha) when is_integer(Alpha) ->
        (get({get({This, animation}), '$class'})):setAlpha(get({This, animation}), Alpha).

setDx(This, Dx) when is_integer(Dx) ->
        (get({get({This, animation}), '$class'})):setDx(get({This, animation}), Dx).

setDy(This, Dy) when is_integer(Dy) ->
        (get({get({This, animation}), '$class'})):setDy(get({This, animation}), Dy).

setMaxScale(This, MaxScaleX, MaxScaleY) when is_number(MaxScaleX), is_number(MaxScaleY) ->
        (get({get({This, animation}), '$class'})):setMaxScale(get({This, animation}), MaxScaleX, MaxScaleY).

nextRotation(This) ->
        RotationAnimation = (get({This, animation})),
        (get({RotationAnimation, '$class'})):nextRotation(RotationAnimation).

previousRotation(This) ->
        RotationAnimation = (get({This, animation})),
        (get({RotationAnimation, '$class'})):previousRotation(RotationAnimation).

nextRotationX(This) ->
        RotationAnimation = (get({This, animation})),
        (get({RotationAnimation, '$class'})):nextRotationX(RotationAnimation).

previousRotationX(This) ->
        RotationAnimation = (get({This, animation})),
        (get({RotationAnimation, '$class'})):previousRotationX(RotationAnimation).

nextRotationZ(This) ->
        RotationAnimation = (get({This, animation})),
        (get({RotationAnimation, '$class'})):nextRotationZ(RotationAnimation).

previousRotationZ(This) ->
        RotationAnimation = (get({This, animation})),
        (get({RotationAnimation, '$class'})):previousRotationZ(RotationAnimation).

changeBasicColor(This, BasicColor) ->
        (get({get({This, animation}), '$class'})):changeBasicColor(get({This, animation}), BasicColor).

getBasicColorP(This) ->
        (get({get({This, animation}), '$class'})):getBasicColorP(get({This, animation})).

getChangeBasicColor(This) ->
        (get({get({This, animation}), '$class'})):getChangeBasicColor(get({This, animation})).

getChangeColor(This) ->
        (get({get({This, animation}), '$class'})):getChangeColor(get({This, animation})).

getColor(This) ->
        (get({get({This, animation}), '$class'})):getColor(get({This, animation})).

getDx(This) ->
        (get({get({This, animation}), '$class'})):getDx(get({This, animation})).

getDy(This) ->
        (get({get({This, animation}), '$class'})):getDy(get({This, animation})).

isThreed(This) ->
        (get({get({This, animation}), '$class'})):isThreed(get({This, animation})).

% throws Exception
nextFrame(This) ->
        (get({get({This, animation}), '$class'})):nextFrame(get({This, animation})).

reset(This) ->
        (get({get({This, animation}), '$class'})):reset(get({This, animation})).

setFrame(This, Index) when is_integer(Index) ->
        (get({get({This, animation}), '$class'})):setFrame(get({This, animation}), Index).

getFrame(This) ->
        (get({get({This, animation}), '$class'})):getFrame(get({This, animation})).

% throws Exception
getAnimationSize(This) ->
        (get({get({This, animation}), '$class'})):getAnimationSize(get({This, animation})).

getSize(This) ->
        (get({get({This, animation}), '$class'})):getSize(get({This, animation})).

previousFrame(This) ->
        (get({get({This, animation}), '$class'})):previousFrame(get({This, animation})).

isLastFrame(This) ->
        (get({get({This, animation}), '$class'})):isLastFrame(get({This, animation})).

setSequence(This, Sequence) when (is_tuple(Sequence) orelse Sequence =:= undefined) ->
        (get({get({This, animation}), '$class'})):setSequence(get({This, animation}), Sequence).

getSequence(This) ->
        (get({get({This, animation}), '$class'})):getSequence(get({This, animation})).

getWidth(This) ->
        (get({get({This, animation}), '$class'})):getWidth(get({This, animation})).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        try
            (get({get({This, animation}), '$class'})):paintXY(get({This, animation}), Graphics, X, Y)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'PROCESS'}), E)
        end.

paintThreedXYZ(This, Graphics, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        try
            (get({get({This, animation}), '$class'})):paintThreedXYZ(get({This, animation}), Graphics, X, Y, Z)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'PROCESS'}), E)
        end.

toString(This) ->
        CommonSeps = 'CommonSeps':getInstance(),
        Image = (get({get({This, animationInterfaceFactoryInterface}), '$class'})):getImage(get({This, animationInterfaceFactoryInterface})),
        (fun(Target_N71648) -> (get({Target_N71648, '$class'})):toString(Target_N71648) end)((fun(Target_N71655) -> (get({Target_N71655, '$class'})):appendint(Target_N71655, trunc((get({Image, '$class'})):getHeight(Image))) end)((fun(Target_N71662) -> (get({Target_N71662, '$class'})):append(Target_N71662, get({CommonSeps, 'SPACE'})) end)((fun(Target_N71669) -> (get({Target_N71669, '$class'})):appendint(Target_N71669, trunc((get({Image, '$class'})):getWidth(Image))) end)((fun(Target_N71676) -> (get({Target_N71676, '$class'})):append(Target_N71676, get({CommonSeps, 'SPACE'})) end)((fun(Target_N71683) -> (get({Target_N71683, '$class'})):append(Target_N71683, (get({Image, '$class'})):getName(Image)) end)((fun(Target_N71690) -> (get({Target_N71690, '$class'})):append(Target_N71690, get({CommonSeps, 'SPACE'})) end)((fun(Target_N71697) -> (get({Target_N71697, '$class'})):append(Target_N71697, 'RotationAnimation':toString(This)) end)('StringMaker':new())))))))).

