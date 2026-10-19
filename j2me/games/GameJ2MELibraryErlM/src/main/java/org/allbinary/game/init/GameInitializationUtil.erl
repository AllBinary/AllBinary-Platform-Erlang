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
% import org.allbinary.game.configuration.event.ChangedGameFeatureListener
% import org.allbinary.game.configuration.event.GameInitializedEvent
% import org.allbinary.game.configuration.event.GameInitializedEventHandler
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.MainFeatureFactory
% import org.allbinary.game.resource.ResourceLoadingLevelFactory
% import org.allbinary.graphics.displayable.MyCanvas
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface

-module('GameInitializationUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GameInitializationUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'EVENT'}, 'GameInitializedEvent':new(This)),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


% throws Exception
initDemo(This, AbeClientInformation, Canvas, GameInitializationInterfaceFactoryInterface) ->
        MainFeatureFactory = 'MainFeatureFactory':getInstance(),
        case (fun(Target_N66021) -> (get({Target_N66021, '$class'})):isChangedFeature(Target_N66021, get({MainFeatureFactory, 'STATIC'})) end)('ChangedGameFeatureListener':getInstance()) of
            true ->
            GameInitializationInterface = (get({GameInitializationInterfaceFactoryInterface, '$class'})):getInstance(GameInitializationInterfaceFactoryInterface),
            Features = 'Features':getInstance(),
            case (get({Features, '$class'})):isFeature(Features, get({MainFeatureFactory, 'LOAD_ALL'})) of
                true ->
                (get({This, '$class'})):initGame(This, AbeClientInformation, Canvas, GameInitializationInterfaceFactoryInterface);
                false ->
                case (get({Features, '$class'})):isFeature(Features, get({MainFeatureFactory, 'LOAD_ONDEMAND'})) of
                true ->
                ResourceLoadingLevelFactory = 'ResourceLoadingLevelFactory':getInstance(),
                (get({GameInitializationInterface, '$class'})):init(GameInitializationInterface, AbeClientInformation, (get({Canvas, '$class'})):getCustomCommandListener(Canvas), (get({get({ResourceLoadingLevelFactory, 'LOAD_EARLY'}), '$class'})):getLevel(get({ResourceLoadingLevelFactory, 'LOAD_EARLY'}))),
                (get({get({This, 'EVENT'}), '$class'})):setResourceLoadingLevel(get({This, 'EVENT'}), get({ResourceLoadingLevelFactory, 'LOAD_EARLY'}));
                false ->
                erlang:error({'Exception', "No Loading Feature Available"})
            end
            end,
            (fun(Target_N66482) -> (get({Target_N66482, '$class'})):fireEvent(Target_N66482, get({This, 'EVENT'})) end)('GameInitializedEventHandler':getInstance());
            false -> ok
        end.

% throws Exception
initGame(This, AbeClientInformation, Canvas, GameInitializationInterfaceFactoryInterface) ->
        case (fun(Target_N66642) -> (get({Target_N66642, '$class'})):isChangedFeature(Target_N66642, get({'MainFeatureFactory':getInstance(), 'STATIC'})) end)('ChangedGameFeatureListener':getInstance()) of
            true ->
            GameInitializationInterface = (get({GameInitializationInterfaceFactoryInterface, '$class'})):getInstance(GameInitializationInterfaceFactoryInterface),
            ResourceLoadingLevelFactory = 'ResourceLoadingLevelFactory':getInstance(),
            (get({GameInitializationInterface, '$class'})):init(GameInitializationInterface, AbeClientInformation, (get({Canvas, '$class'})):getCustomCommandListener(Canvas), (get({get({ResourceLoadingLevelFactory, 'LOAD_ALL'}), '$class'})):getLevel(get({ResourceLoadingLevelFactory, 'LOAD_ALL'}))),
            (get({get({This, 'EVENT'}), '$class'})):setResourceLoadingLevel(get({This, 'EVENT'}), get({ResourceLoadingLevelFactory, 'LOAD_ALL'})),
            (fun(Target_N66900) -> (get({Target_N66900, '$class'})):fireEvent(Target_N66900, get({This, 'EVENT'})) end)('GameInitializedEventHandler':getInstance()),
            (fun(Target_N66942) -> (get({Target_N66942, '$class'})):remove(Target_N66942, get({'MainFeatureFactory':getInstance(), 'STATIC'})) end)('ChangedGameFeatureListener':getInstance());
            false -> ok
        end.

getInstance() ->
        get({'GameInitializationUtil', instance}).

