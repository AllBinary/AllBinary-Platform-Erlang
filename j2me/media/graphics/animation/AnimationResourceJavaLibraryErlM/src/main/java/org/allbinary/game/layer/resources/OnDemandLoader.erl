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
% package org.allbinary.game.layer.resources
% import org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.MainFeatureFactory
% import org.allbinary.game.layer.GameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory
% import org.allbinary.game.layer.LayerPlacementInterfaceBasicArrayListFactoryInterface
% import org.allbinary.game.resource.ResourceLoadingLevelFactory
% import org.allbinary.image.ImageCache
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonStrings

-module('OnDemandLoader').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, onDemandResourcesFactory}, undefined),
    put({This, gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory}, undefined),
    put({This, resourceAnimationInterfaceFactoryInterfaceFactory}, undefined),
    ok.


new(OnDemandResourcesFactory, GameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory, ResourceAnimationInterfaceFactoryInterfaceFactory) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, OnDemandResourcesFactory, GameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory, ResourceAnimationInterfaceFactoryInterfaceFactory),
    This.

'$init'(This, OnDemandResourcesFactory, GameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory, ResourceAnimationInterfaceFactoryInterfaceFactory) ->
    init_fields(This),
        put({This, onDemandResourcesFactory}, OnDemandResourcesFactory),
        put({This, gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory}, GameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory),
        put({This, resourceAnimationInterfaceFactoryInterfaceFactory}, ResourceAnimationInterfaceFactoryInterfaceFactory).

% throws Exception
init(This, ImageCache, Level, LoadingString) when is_integer(Level), (is_list(LoadingString) orelse LoadingString =:= undefined) ->
        try
        ResourceLoadingLevelFactory = 'ResourceLoadingLevelFactory':getInstance(),
        case (fun(Target_N66220) -> (get({Target_N66220, '$class'})):isFeature(Target_N66220, get({'MainFeatureFactory':getInstance(), 'LOAD_ALL'})) end)('Features':getInstance()) of
            true ->
            case (get({get({This, resourceAnimationInterfaceFactoryInterfaceFactory}), '$class'})):isInitialized(get({This, resourceAnimationInterfaceFactoryInterfaceFactory})) of
                true ->
                throw({'$return', ok});
                false -> ok
            end,
            (get({This, '$class'})):initAll(This, ImageCache, LoadingString);
            false ->
            case (Level =/= (get({get({ResourceLoadingLevelFactory, 'LOAD_ALL'}), '$class'})):getLevel(get({ResourceLoadingLevelFactory, 'LOAD_ALL'}))) of
            true ->
            LayerPlacementInterfaceBasicArrayListFactoryInterface = (get({get({This, gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory}), '$class'})):getInstance(get({This, gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory}), Level),
            (get({This, '$class'})):initLevel(This, LayerPlacementInterfaceBasicArrayListFactoryInterface, ImageCache, Level, LoadingString);
            false -> ok
        end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
initAll(This, ImageCache, LoadingString) when (is_list(LoadingString) orelse LoadingString =:= undefined) ->
        put({local, index}, 0),
        Portion = 120,
        put({local, onDemandResources}, undefined),
        put({local, onDemandIndex}, (get({get({This, onDemandResourcesFactory}), '$class'})):size(get({This, onDemandResourcesFactory}))),
        (fun Loop() -> case (begin put({local, onDemandIndex}, get({local, onDemandIndex}) - 1), get({local, onDemandIndex}) end >= 0) of true ->
            put({local, onDemandResources}, (get({get({This, onDemandResourcesFactory}), '$class'})):remove(get({This, onDemandResourcesFactory}), get({local, onDemandIndex}))),
            case (get({local, onDemandResources}) =/= get({'OnDemandResources', 'NULL_ON_DEMAND_RESOURCES'})) of
                true ->
                put({local, index}, (get({get({local, onDemandResources}), '$class'})):initAt(get({local, onDemandResources}), ImageCache, get({This, resourceAnimationInterfaceFactoryInterfaceFactory}), Portion, LoadingString, get({local, index})));
                false -> ok
            end,
            Loop();
        false -> ok end end)().

% throws Exception
initLevel(This, LayerPlacementInterfaceBasicArrayListFactoryInterface, ImageCache, Level, LoadingString) when is_integer(Level), (is_list(LoadingString) orelse LoadingString =:= undefined) ->
        CommonStrings = 'CommonStrings':getInstance(),
        Portion = 120,
        put({local, index}, 0),
        OnDemandArray = (get({LayerPlacementInterfaceBasicArrayListFactoryInterface, '$class'})):getOnDemandResources(LayerPlacementInterfaceBasicArrayListFactoryInterface),
        'PreLogUtil':put((fun(Target_N67216) -> (get({Target_N67216, '$class'})):toString(Target_N67216) end)((fun(Target_N67223) -> (get({Target_N67223, '$class'})):appendint(Target_N67223, array:size(OnDemandArray)) end)((fun(Target_N67230) -> (get({Target_N67230, '$class'})):append(Target_N67230, get({CommonStrings, 'START'})) end)('StringMaker':new()))), This, "initLevel"),
        put({local, onDemandResources}, undefined),
        put({local, onDemandIndex}, array:size(OnDemandArray)),
        (fun Loop() -> case (begin put({local, onDemandIndex}, get({local, onDemandIndex}) - 1), get({local, onDemandIndex}) end >= 0) of true ->
            put({local, onDemandResources}, (get({get({This, onDemandResourcesFactory}), '$class'})):remove(get({This, onDemandResourcesFactory}), array:get(get({local, onDemandIndex}), OnDemandArray))),
            case (get({local, onDemandResources}) =/= get({'OnDemandResources', 'NULL_ON_DEMAND_RESOURCES'})) of
                true ->
                put({local, index}, (get({get({local, onDemandResources}), '$class'})):initAt(get({local, onDemandResources}), ImageCache, get({This, resourceAnimationInterfaceFactoryInterfaceFactory}), Portion, LoadingString, get({local, index})));
                false -> ok
            end,
            Loop();
        false -> ok end end)().

