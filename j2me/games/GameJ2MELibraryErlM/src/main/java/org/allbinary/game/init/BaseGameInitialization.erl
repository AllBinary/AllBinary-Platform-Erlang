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
% package org.allbinary.game.init
% import javax.microedition.lcdui.CommandListener
% import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory
% import org.allbinary.game.configuration.GameConfigurationCentral
% import org.allbinary.game.configuration.event.ChangedGameFeatureListener
% import org.allbinary.game.configuration.feature.InputFeatureFactory
% import org.allbinary.game.configuration.feature.MainFeatureFactory
% import org.allbinary.game.input.PlatformInputMappingFactory
% import org.allbinary.game.input.event.GameKeyEventFactory
% import org.allbinary.game.resource.FeaturedResourceRelativeRelationshipFactory
% import org.allbinary.game.resource.ResourceInitialization
% import org.allbinary.game.resource.ResourceLoadingLevelFactory
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
% import org.allbinary.image.GameFeatureImageCacheFactory
% import org.allbinary.input.motion.CompleteMotionGestureInputToGameMotionGestureInput
% import org.allbinary.input.motion.button.BasicTouchInputFactory
% import org.allbinary.input.motion.button.CancelTouchButtonInputFactory
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface

-module('BaseGameInitialization').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements GameInitializationInterface

static_init() ->
    put({?MODULE, 'NULL_BASE_GAME_INITIALIZATION'}, 'BaseGameInitialization':new(array:new(0, {default, undefined}), 0)),
    ok.

init_fields(This) ->
    put({This, resourceInitializationArray}, undefined),
    put({This, portion}, 0),
    put({This, initialized}, false),
    put({This, 'EARLY_RESOURCES'}, 0),
    put({This, 'GAME_RESOURCES'}, 1),
    put({This, 'EARLY_CHANGABLE_RESOURCES'}, 2),
    put({This, 'GAME_CHANGABLE_RESOURCES'}, 3),
    put({This, gameInitialized}, false),
    put({This, allLoaded}, false),
    ok.


new(ResourceInitializationArray, Portion) when (is_tuple(ResourceInitializationArray) orelse ResourceInitializationArray =:= undefined), is_integer(Portion) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ResourceInitializationArray, Portion),
    This.

'$init'(This, ResourceInitializationArray, Portion) when (is_tuple(ResourceInitializationArray) orelse ResourceInitializationArray =:= undefined), is_integer(Portion) ->
    init_fields(This),
        put({This, resourceInitializationArray}, ResourceInitializationArray),
        put({This, portion}, Portion).

% throws Exception
initKey(This, Portion) when is_integer(Portion) ->
        ok.

% throws Exception
initKeyMapping(This, AbeClientInformation, Portion) when is_integer(Portion) ->
        case (fun(Target_N66683) -> (get({Target_N66683, '$class'})):isChangedFeature(Target_N66683, get({'InputFeatureFactory':getInstance(), 'INPUT_MAPPING'})) end)('ChangedGameFeatureListener':getInstance()) of
            true ->
            (fun(Target_N66742) -> (get({Target_N66742, '$class'})):init(Target_N66742, AbeClientInformation) end)((fun(Target_N66749) -> (get({Target_N66749, '$class'})):getPersistentInputMappingInstance(Target_N66749) end)('PlatformInputMappingFactory':getInstance())),
            (fun(Target_N66789) -> (get({Target_N66789, '$class'})):addNormalPortion(Target_N66789, 50, "Game Keys") end)('ProgressCanvasFactory':getInstance()),
            (fun(Target_N66828) -> (get({Target_N66828, '$class'})):remove(Target_N66828, get({'InputFeatureFactory':getInstance(), 'INPUT_MAPPING'})) end)('ChangedGameFeatureListener':getInstance());
            false -> ok
        end.

% throws Exception
init(This, AbeClientInformation, CommandListener, Level) when is_integer(Level) ->
        ResourceLoadingLevelFactory = 'ResourceLoadingLevelFactory':getInstance(),
        case ((not (get({This, '$class'})):isInitialized(This)) andalso (((Level =:= (get({get({ResourceLoadingLevelFactory, 'LOAD_ALL'}), '$class'})):getLevel(get({ResourceLoadingLevelFactory, 'LOAD_ALL'}))) orelse (Level =:= (get({get({ResourceLoadingLevelFactory, 'LOAD_EARLY'}), '$class'})):getLevel(get({ResourceLoadingLevelFactory, 'LOAD_EARLY'})))))) of
            true ->
            put({local, localPortion}, 40),
            case (Level =:= (get({get({ResourceLoadingLevelFactory, 'LOAD_EARLY'}), '$class'})):getLevel(get({ResourceLoadingLevelFactory, 'LOAD_EARLY'}))) of
                true ->
                put({local, localPortion}, 8);
                false -> ok
            end,
            (get({This, '$class'})):setInitialized(This, true),
            (get({This, '$class'})):initKey(This, (get({This, '$class'})):getPortion(This)),
            (get({This, '$class'})):initKeyMapping(This, AbeClientInformation, (get({This, '$class'})):getPortion(This)),
            (fun(Target_N67312) -> (get({Target_N67312, '$class'})):init(Target_N67312) end)('GameKeyEventFactory':getInstance()),
            ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
            (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, get({local, localPortion}), "Game Key Events"),
            (fun(Target_N67425) -> (get({Target_N67425, '$class'})):init(Target_N67425, (fun(Target_N67450) -> (get({Target_N67450, '$class'})):getInputMapping(Target_N67450) end)((fun(Target_N67457) -> (get({Target_N67457, '$class'})):getPersistentInputMappingInstance(Target_N67457) end)('PlatformInputMappingFactory':getInstance()))) end)('BasicTouchInputFactory':getInstance()),
            'CancelTouchButtonInputFactory':getInstance(),
            (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, get({local, localPortion}), "Touch Input"),
            (fun(Target_N67551) -> (get({Target_N67551, '$class'})):init(Target_N67551) end)('CompleteMotionGestureInputToGameMotionGestureInput':getInstance()),
            (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, get({local, localPortion}), "Motion Input"),
            'GameFeatureImageCacheFactory':init(),
            (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, get({local, localPortion}), "Image Cache"),
            (fun(Target_N67669) -> (get({Target_N67669, '$class'})):init(Target_N67669) end)(array:get(get({This, 'EARLY_RESOURCES'}), get({This, resourceInitializationArray})));
            false -> ok
        end.

% throws Exception
resourceInitialization(This, Level) when is_integer(Level) ->
        ResourceLoadingLevelFactory = 'ResourceLoadingLevelFactory':getInstance(),
        case ((get({This, '$class'})):resourceAnimationChange(This) andalso (Level =:= (get({get({ResourceLoadingLevelFactory, 'LOAD_EARLY'}), '$class'})):getLevel(get({ResourceLoadingLevelFactory, 'LOAD_EARLY'})))) of
            true ->
            (get({This, '$class'})):clearResources(This),
            (fun(Target_N68007) -> (get({Target_N68007, '$class'})):init(Target_N68007) end)(array:get(get({This, 'EARLY_CHANGABLE_RESOURCES'}), get({This, resourceInitializationArray})));
            false -> ok
        end,
        case ((get({This, '$class'})):resourceAnimationChange(This) andalso (Level =:= (get({get({ResourceLoadingLevelFactory, 'LOAD_ALL'}), '$class'})):getLevel(get({ResourceLoadingLevelFactory, 'LOAD_ALL'})))) of
            true ->
            case get({This, allLoaded}) of
                true ->
                (get({This, '$class'})):clearResources(This);
                false -> ok
            end,
            case ((fun(Target_N68150) -> (get({Target_N68150, '$class'})):size(Target_N68150) end)((fun(Target_N68157) -> (get({Target_N68157, '$class'})):getList(Target_N68157) end)('FeaturedAnimationInterfaceFactoryInterfaceFactory':getInstance())) =:= 0) of
                true ->
                (fun(Target_N68195) -> (get({Target_N68195, '$class'})):init(Target_N68195) end)(array:get(get({This, 'EARLY_CHANGABLE_RESOURCES'}), get({This, resourceInitializationArray})));
                false -> ok
            end,
            (fun(Target_N68240) -> (get({Target_N68240, '$class'})):init(Target_N68240) end)(array:get(get({This, 'GAME_CHANGABLE_RESOURCES'}), get({This, resourceInitializationArray}))),
            put({This, allLoaded}, true);
            false -> ok
        end.

resourceAnimationChange(This) ->
        try
        ChangedGameFeatureListener = 'ChangedGameFeatureListener':getInstance(),
        GameConfigurationCentral = 'GameConfigurationCentral':getInstance(),
        case (get({ChangedGameFeatureListener, '$class'})):isChangedGameConfiguration(ChangedGameFeatureListener, get({GameConfigurationCentral, 'SCALE'})) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        case (fun(Target_N68497) -> (get({Target_N68497, '$class'})):isChangedFeature(Target_N68497, get({'MainFeatureFactory':getInstance(), 'STATIC'})) end)('ChangedGameFeatureListener':getInstance()) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

clearResources(This) ->
        put({This, allLoaded}, false),
        'GameFeatureImageCacheFactory':releaseAll(),
        FeaturedAnimationInterfaceFactoryInterfaceFactory = 'FeaturedAnimationInterfaceFactoryInterfaceFactory':getInstance(),
        (get({FeaturedAnimationInterfaceFactoryInterfaceFactory, '$class'})):clear(FeaturedAnimationInterfaceFactoryInterfaceFactory),
        (fun(Target_N68712) -> (get({Target_N68712, '$class'})):clear(Target_N68712) end)('FeaturedResourceRelativeRelationshipFactory':getInstance()).

setGameInitialized(This, GameInitialized) when is_boolean(GameInitialized) ->
        put({This, gameInitialized}, GameInitialized).

isGameInitialized(This) ->
        get({This, gameInitialized}).

getPortion(This) ->
        get({This, portion}).

setInitialized(This, Initialized) when is_boolean(Initialized) ->
        put({This, initialized}, Initialized).

isInitialized(This) ->
        get({This, initialized}).

