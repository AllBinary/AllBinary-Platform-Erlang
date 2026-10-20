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
% package org.allbinary.input.motion.button
% import javax.microedition.lcdui.Image
% import org.allbinary.animation.AnimationBehaviorFactory
% import org.allbinary.animation.NullAnimationFactory
% import org.allbinary.animation.image.sprite.OneRowSpriteIndexedAnimationFactory
% import org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.resource.ResourceLoadingLevelFactory
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
% import org.allbinary.graphics.opengles.OpenGLFeatureFactory
% import org.allbinary.image.ImageCache
% import org.allbinary.image.ImageCacheFactory
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.os.OperatingSystemFactory
% import org.allbinary.media.image.ImageCompleteUtil

-module('TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseResourceAnimationInterfaceFactoryInterfaceFactory', Function, Arguments).

init_fields(This) ->
    ok.


createFactory() ->
        'TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory':new("TouchButton Animations").

new(Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name),
    This.

'$init'(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        'BaseResourceAnimationInterfaceFactoryInterfaceFactory':'$init'(This, Name, (fun(Target_N66163) -> (get({Target_N66163, '$class'})):createHashtable(Target_N66163) end)('StdUtil':getInstance()), (fun(Target_N66187) -> (get({Target_N66187, '$class'})):createHashtable(Target_N66187) end)('StdUtil':getInstance()), (fun(Target_N66211) -> (get({Target_N66211, '$class'})):createHashtable(Target_N66211) end)('StdUtil':getInstance())).

% throws Exception
init(This, Level) when is_integer(Level) ->
        (get({This, '$class'})):initImageCache(This, 'ImageCacheFactory':getInstance(), Level).

% throws Exception
initImageCache(This, ImageCache, Level) when is_integer(Level) ->
        try
        case (get({This, '$class'})):isInitialized(This) of
            true ->
            throw({'$return', ok});
            false -> ok
        end,
        Portion = 140,
        LoadingString = (fun(Target_N66479) -> (get({Target_N66479, '$class'})):toString(Target_N66479) end)((fun(Target_N66486) -> (get({Target_N66486, '$class'})):append(Target_N66486, " Loading: ") end)((fun(Target_N66493) -> (get({Target_N66493, '$class'})):append(Target_N66493, (get({This, '$class'})):toString(This)) end)('StringMaker':new()))),
        put({local, index}, 0),
        ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
        (get({ProgressCanvas, '$class'})):addPortion(ProgressCanvas, Portion, LoadingString, allbinary_java:first(get({local, index}), put({local, index}, get({local, index}) + 1))),
        TouchButtonBlankResource = 'TouchButtonBlankResource':getInstance(),
        TouchButtonGenericActionResource = 'TouchButtonGenericActionResource':getInstance(),
        TouchButtonStartResource = 'TouchButtonStartResource':getInstance(),
        TouchButtonUpResource = 'TouchButtonUpResource':getInstance(),
        TouchButtonDownResource = 'TouchButtonDownResource':getInstance(),
        TouchButtonTurnLeftResource = 'TouchButtonTurnLeftResource':getInstance(),
        TouchButtonTurnRightResource = 'TouchButtonTurnRightResource':getInstance(),
        TouchButtonStrafeLeftResource = 'TouchButtonStrafeLeftResource':getInstance(),
        TouchButtonStrafeRightResource = 'TouchButtonStrafeRightResource':getInstance(),
        TouchButtonBlankResourceImage = (get({ImageCache, '$class'})):getWithKey(ImageCache, get({TouchButtonBlankResource, 'RESOURCE'})),
        TouchButtonGenericActionResourceImage = (get({ImageCache, '$class'})):getWithKey(ImageCache, get({TouchButtonGenericActionResource, 'RESOURCE'})),
        TouchButtonStartResourceImage = (get({ImageCache, '$class'})):getWithKey(ImageCache, get({TouchButtonStartResource, 'RESOURCE'})),
        TouchButtonUpResourceImage = (get({ImageCache, '$class'})):getWithKey(ImageCache, get({TouchButtonUpResource, 'RESOURCE'})),
        TouchButtonDownResourceImage = (get({ImageCache, '$class'})):getWithKey(ImageCache, get({TouchButtonDownResource, 'RESOURCE'})),
        TouchButtonTurnLeftResourceImage = (get({ImageCache, '$class'})):getWithKey(ImageCache, get({TouchButtonTurnLeftResource, 'RESOURCE'})),
        TouchButtonTurnRightResourceImage = (get({ImageCache, '$class'})):getWithKey(ImageCache, get({TouchButtonTurnRightResource, 'RESOURCE'})),
        TouchButtonStrafeLeftResourceImage = (get({ImageCache, '$class'})):getWithKey(ImageCache, get({TouchButtonStrafeLeftResource, 'RESOURCE'})),
        TouchButtonStrafeRightResourceImage = (get({ImageCache, '$class'})):getWithKey(ImageCache, get({TouchButtonStrafeRightResource, 'RESOURCE'})),
        NullAnimationFactory = 'NullAnimationFactory':getFactoryInstance(),
        case (fun(Target_N67809) -> (get({Target_N67809, '$class'})):isOverScan(Target_N67809) end)((fun(Target_N67816) -> (get({Target_N67816, '$class'})):getOperatingSystemInstance(Target_N67816) end)('OperatingSystemFactory':getInstance())) of
            true ->
            (get({ImageCache, '$class'})):getWithKey(ImageCache, get({'TouchButtonStartResource':getInstance(), 'HINT'}));
            false -> ok
        end,
        (get({ProgressCanvas, '$class'})):addPortion(ProgressCanvas, Portion, LoadingString, allbinary_java:first(get({local, index}), put({local, index}, get({local, index}) + 1))),
        ImageCompleteUtil = 'ImageCompleteUtil':getInstance(),
        (get({ProgressCanvas, '$class'})):addPortion(ProgressCanvas, Portion, LoadingString, allbinary_java:first(get({local, index}), put({local, index}, get({local, index}) + 1))),
        (get({ImageCompleteUtil, '$class'})):waitForImage(ImageCompleteUtil, TouchButtonBlankResourceImage, get({TouchButtonBlankResource, 'RESOURCE'})),
        (get({This, '$class'})):add(This, get({TouchButtonBlankResource, 'RESOURCE'}), 'OneRowSpriteIndexedAnimationFactory':createFactory(TouchButtonBlankResourceImage, 'AnimationBehaviorFactory':getInstance())),
        (get({This, '$class'})):add(This, get({TouchButtonBlankResource, 'HINT'}), NullAnimationFactory),
        (get({ProgressCanvas, '$class'})):addPortion(ProgressCanvas, Portion, LoadingString, allbinary_java:first(get({local, index}), put({local, index}, get({local, index}) + 1))),
        (get({ImageCompleteUtil, '$class'})):waitForImage(ImageCompleteUtil, TouchButtonGenericActionResourceImage, get({TouchButtonGenericActionResource, 'RESOURCE'})),
        (get({This, '$class'})):add(This, get({TouchButtonGenericActionResource, 'RESOURCE'}), 'OneRowSpriteIndexedAnimationFactory':createFactory(TouchButtonGenericActionResourceImage, 'AnimationBehaviorFactory':getInstance())),
        (get({This, '$class'})):add(This, get({TouchButtonGenericActionResource, 'HINT'}), NullAnimationFactory),
        (get({ProgressCanvas, '$class'})):addPortion(ProgressCanvas, Portion, LoadingString, allbinary_java:first(get({local, index}), put({local, index}, get({local, index}) + 1))),
        (get({ImageCompleteUtil, '$class'})):waitForImage(ImageCompleteUtil, TouchButtonStartResourceImage, get({TouchButtonStartResource, 'RESOURCE'})),
        (get({This, '$class'})):add(This, get({TouchButtonStartResource, 'RESOURCE'}), 'OneRowSpriteIndexedAnimationFactory':createFactory(TouchButtonStartResourceImage, 'AnimationBehaviorFactory':getInstance())),
        (get({ProgressCanvas, '$class'})):addPortion(ProgressCanvas, Portion, LoadingString, allbinary_java:first(get({local, index}), put({local, index}, get({local, index}) + 1))),
        (get({ImageCompleteUtil, '$class'})):waitForImage(ImageCompleteUtil, TouchButtonUpResourceImage, get({TouchButtonUpResource, 'RESOURCE'})),
        (get({This, '$class'})):add(This, get({TouchButtonUpResource, 'RESOURCE'}), 'OneRowSpriteIndexedAnimationFactory':createFactory(TouchButtonUpResourceImage, 'AnimationBehaviorFactory':getInstance())),
        (get({This, '$class'})):add(This, get({TouchButtonUpResource, 'HINT'}), NullAnimationFactory),
        (get({ProgressCanvas, '$class'})):addPortion(ProgressCanvas, Portion, LoadingString, allbinary_java:first(get({local, index}), put({local, index}, get({local, index}) + 1))),
        (get({ImageCompleteUtil, '$class'})):waitForImage(ImageCompleteUtil, TouchButtonDownResourceImage, get({TouchButtonDownResource, 'RESOURCE'})),
        (get({This, '$class'})):add(This, get({TouchButtonDownResource, 'RESOURCE'}), 'OneRowSpriteIndexedAnimationFactory':createFactory(TouchButtonDownResourceImage, 'AnimationBehaviorFactory':getInstance())),
        (get({This, '$class'})):add(This, get({TouchButtonDownResource, 'HINT'}), NullAnimationFactory),
        (get({ProgressCanvas, '$class'})):addPortion(ProgressCanvas, Portion, LoadingString, allbinary_java:first(get({local, index}), put({local, index}, get({local, index}) + 1))),
        (get({ImageCompleteUtil, '$class'})):waitForImage(ImageCompleteUtil, TouchButtonTurnLeftResourceImage, get({TouchButtonTurnLeftResource, 'RESOURCE'})),
        (get({This, '$class'})):add(This, get({TouchButtonTurnLeftResource, 'RESOURCE'}), 'OneRowSpriteIndexedAnimationFactory':createFactory(TouchButtonTurnLeftResourceImage, 'AnimationBehaviorFactory':getInstance())),
        (get({This, '$class'})):add(This, get({TouchButtonTurnLeftResource, 'HINT'}), NullAnimationFactory),
        (get({ProgressCanvas, '$class'})):addPortion(ProgressCanvas, Portion, LoadingString, allbinary_java:first(get({local, index}), put({local, index}, get({local, index}) + 1))),
        (get({ImageCompleteUtil, '$class'})):waitForImage(ImageCompleteUtil, TouchButtonTurnRightResourceImage, get({TouchButtonTurnRightResource, 'RESOURCE'})),
        (get({This, '$class'})):add(This, get({TouchButtonTurnRightResource, 'RESOURCE'}), 'OneRowSpriteIndexedAnimationFactory':createFactory(TouchButtonTurnRightResourceImage, 'AnimationBehaviorFactory':getInstance())),
        (get({This, '$class'})):add(This, get({TouchButtonTurnRightResource, 'HINT'}), NullAnimationFactory),
        (get({ProgressCanvas, '$class'})):addPortion(ProgressCanvas, Portion, LoadingString, allbinary_java:first(get({local, index}), put({local, index}, get({local, index}) + 1))),
        (get({ImageCompleteUtil, '$class'})):waitForImage(ImageCompleteUtil, TouchButtonStrafeLeftResourceImage, get({TouchButtonStrafeLeftResource, 'RESOURCE'})),
        (get({This, '$class'})):add(This, get({TouchButtonStrafeLeftResource, 'RESOURCE'}), 'OneRowSpriteIndexedAnimationFactory':createFactory(TouchButtonStrafeLeftResourceImage, 'AnimationBehaviorFactory':getInstance())),
        (get({This, '$class'})):add(This, get({TouchButtonStrafeLeftResource, 'HINT'}), NullAnimationFactory),
        (get({ProgressCanvas, '$class'})):addPortion(ProgressCanvas, Portion, LoadingString, allbinary_java:first(get({local, index}), put({local, index}, get({local, index}) + 1))),
        (get({ImageCompleteUtil, '$class'})):waitForImage(ImageCompleteUtil, TouchButtonStrafeRightResourceImage, get({TouchButtonStrafeRightResource, 'RESOURCE'})),
        (get({This, '$class'})):add(This, get({TouchButtonStrafeRightResource, 'RESOURCE'}), 'OneRowSpriteIndexedAnimationFactory':createFactory(TouchButtonStrafeRightResourceImage, 'AnimationBehaviorFactory':getInstance())),
        (get({This, '$class'})):add(This, get({TouchButtonStrafeRightResource, 'HINT'}), NullAnimationFactory),
        case (fun(Target_N69921) -> (get({Target_N69921, '$class'})):isOverScan(Target_N69921) end)((fun(Target_N69928) -> (get({Target_N69928, '$class'})):getOperatingSystemInstance(Target_N69928) end)('OperatingSystemFactory':getInstance())) of
            true ->
            TouchButtonStartHintResource = (get({ImageCache, '$class'})):getWithKey(ImageCache, get({'TouchButtonStartResource':getInstance(), 'HINT'})),
            (get({This, '$class'})):add(This, get({TouchButtonStartResource, 'HINT'}), 'OneRowSpriteIndexedAnimationFactory':createFactory(TouchButtonStartHintResource, 'AnimationBehaviorFactory':getInstance()));
            false ->
            (get({This, '$class'})):add(This, get({TouchButtonStartResource, 'HINT'}), NullAnimationFactory)
        end,
        'BaseResourceAnimationInterfaceFactoryInterfaceFactory':init(This, Level)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isLoadingLevel(This, Level) when is_integer(Level) ->
        try
        ResourceLoadingLevelFactory = 'ResourceLoadingLevelFactory':getInstance(),
        case (Level =:= (get({get({ResourceLoadingLevelFactory, 'LOAD_TOUCH'}), '$class'})):getLevel(get({ResourceLoadingLevelFactory, 'LOAD_TOUCH'}))) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', 'BaseResourceAnimationInterfaceFactoryInterfaceFactory':isLoadingLevel(This, Level)})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isFeature(This) ->
        try
        case (not (fun(Target_N70490) -> (get({Target_N70490, '$class'})):isDefault(Target_N70490, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'})) end)('Features':getInstance())) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

