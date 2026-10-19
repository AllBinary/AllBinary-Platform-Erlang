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
% import org.allbinary.animation.NullAnimationFactory
% import org.allbinary.image.AnimationFactoryImageScaleUtil
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.media.ScaleProperties
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps

-module('BaseImageAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AnimationInterfaceFactoryInterface

init_fields(This) ->
    put({This, animationFactoryImageScaleUtil}, 'AnimationFactoryImageScaleUtil':getInstance()),
    put({This, image}, undefined),
    put({This, animationBehaviorFactory}, undefined),
    put({This, sequenceArray}, undefined),
    put({This, animationFactoryInitializationVisitor}, undefined),
    put({This, scaleProperties}, get({'ScaleProperties', instance})),
    ok.


% throws Exception
createFactoryBase(Image, SequenceArray, Width, Height, AnimationBehaviorFactory) when (is_tuple(SequenceArray) orelse SequenceArray =:= undefined), is_integer(Width), is_integer(Height) ->
        'BaseImageAnimationFactory':new(Image, SequenceArray, Width, Height, 0, 0, AnimationBehaviorFactory).

new(Image, SequenceArray, Width, Height, Dx, Dy, AnimationBehaviorFactory) when (is_tuple(SequenceArray) orelse SequenceArray =:= undefined), is_integer(Width), is_integer(Height), is_integer(Dx), is_integer(Dy) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Image, SequenceArray, Width, Height, Dx, Dy, AnimationBehaviorFactory),
    This.

init(This, Image, SequenceArray, Width, Height, Dx, Dy, AnimationBehaviorFactory) when (is_tuple(SequenceArray) orelse SequenceArray =:= undefined), is_integer(Width), is_integer(Height), is_integer(Dx), is_integer(Dy) ->
    init_fields(This),
        put({This, animationFactoryInitializationVisitor}, 'AnimationFactoryInitializationVisitor':new()),
        put({This, image}, Image),
        put({get({This, animationFactoryInitializationVisitor}), width}, Width),
        put({get({This, animationFactoryInitializationVisitor}), height}, Height),
        put({This, animationBehaviorFactory}, AnimationBehaviorFactory),
        put({This, sequenceArray}, SequenceArray),
        put({get({This, animationFactoryInitializationVisitor}), dx}, Dx),
        put({get({This, animationFactoryInitializationVisitor}), dy}, Dy).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        (fun(Target_N66809) -> (get({Target_N66809, '$class'})):getInstance(Target_N66809, InstanceId) end)('NullAnimationFactory':getFactoryInstance()).

getImage(This) ->
        get({This, image}).

getSequenceArray(This) ->
        get({This, sequenceArray}).

setInitialScale(This, ScaleProperties) ->
        put({This, scaleProperties}, ScaleProperties),
        case get({get({This, scaleProperties}), shouldScale}) of
            true ->
            put({get({This, scaleProperties}), scaleWidth}, trunc(((get({get({This, animationFactoryInitializationVisitor}), width}) * get({get({This, scaleProperties}), scaleX}))))),
            put({get({This, scaleProperties}), scaleHeight}, trunc(((get({get({This, animationFactoryInitializationVisitor}), height}) * get({get({This, scaleProperties}), scaleY})))));
            false ->
            ok
        end.

getAnimationFactoryInitializationVisitorP(This) ->
        get({This, animationFactoryInitializationVisitor}).

getScalePropertiesP(This) ->
        get({This, scaleProperties}).

toString(This) ->
        CommonSeps = 'CommonSeps':getInstance(),
        CommonLabels = 'CommonLabels':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, '':toString(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonLabels, 'HEIGHT_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((get({get({This, image}), '$class'})):getHeight(get({This, image})))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, animationFactoryInitializationVisitor}), '$class'})):toString(get({This, animationFactoryInitializationVisitor}))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

