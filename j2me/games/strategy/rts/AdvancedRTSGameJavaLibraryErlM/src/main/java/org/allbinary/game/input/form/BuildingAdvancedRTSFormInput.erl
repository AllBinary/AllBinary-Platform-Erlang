% 
% AllBinary Open License Version 1 
% Copyright (c) 2002 AllBinary 
%  
% By agreeing to this license you and any business entity you represent are 
% legally bound to the AllBinary Open License Version 1 legal agreement. 
%  
% You may obtain the AllBinary Open License Version 1 legal agreement from 
% AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
%  
% Created By: Travis Berthelot  
% Generated Code Do Not Modify
% package org.allbinary.game.input.form
% import org.allbinary.game.layer.AdvancedPlayerOwnedRTSLayers
% import org.allbinary.game.layer.AdvancedRTSPlayerLayerInterface
% import org.allbinary.game.layer.RTSLayer
% import org.allbinary.game.layer.RTSLayerEvent
% import org.allbinary.game.layer.RTSPlayerLayerInterface
% import org.allbinary.game.layer.building.event.BuildingEventHandler
% import org.allbinary.game.layer.building.event.LocalPlayerBuildingEventHandler
% import org.allbinary.game.layer.waypoint.WaypointCellPositionHistory
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.game.identification.Group
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.NullPathFindingLayer
% import org.allbinary.game.layer.hud.event.GameNotificationEvent
% import org.allbinary.game.layer.hud.event.GameNotificationEventHandler
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.media.audio.ErrorSound
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface
% import org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory

-module('BuildingAdvancedRTSFormInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BuildingRTSFormInput', Function, Arguments).

init_fields(This) ->
    put({This, atLeastOneHouseGameNotificationEvent}, undefined),
    put({This, 'BUILD_BUILDING_RTS_LAYER_EVENT'}, 'RTSLayerEvent':new(get({'NullPathFindingLayer', 'NULL_PATH_FINDING_LAYER'}))),
    ok.


new(GroupInterface, IsUnitProducer) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), is_boolean(IsUnitProducer) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GroupInterface, IsUnitProducer),
    This.

init(This, GroupInterface, IsUnitProducer) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), is_boolean(IsUnitProducer) ->
        'BuildingRTSFormInput':init(This, GroupInterface, IsUnitProducer),
        init_fields(This),
        BasicColorFactory = 'BasicColorFactory':getInstance(),
        put({This, atLeastOneHouseGameNotificationEvent}, 'GameNotificationEvent':new(This, "Build At Least One House First", (fun(Target_N66467) -> (get({Target_N66467, '$class'})):getAt(Target_N66467, 2) end)('SmallIntegerSingletonFactory':getInstance()), get({BasicColorFactory, 'WHITE'}), get({'BooleanFactory':getInstance(), 'FALSE'}))).

% throws Exception
setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager) ->
        'BuildingRTSFormInput':setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager),
        GeographicMapCompositeInterface = AllBinaryGameLayerManager,
        GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
        (get({get({This, atLeastOneHouseGameNotificationEvent}), '$class'})):setBasicColorP(get({This, atLeastOneHouseGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)).

isPositionBlocked(This) ->
        try
        case ((fun(Target_N66888) -> (get({Target_N66888, '$class'})):isCellPositionWithDrop(Target_N66888, (get({This, '$class'})):getSelectedGeographicCellPosition(This)) end)('DropCellPositionHistory':getInstance()) orelse (fun(Target_N66926) -> (get({Target_N66926, '$class'})):isCellPositionWithDrop(Target_N66926, (get({This, '$class'})):getSelectedGeographicCellPosition(This)) end)('WaypointCellPositionHistory':getInstance())) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
isBuildAttemptValid(This, RtsPlayerLayerInterface, LayerInterface) ->
        try
        AdvancedRTSPlayerLayerInterface = RtsPlayerLayerInterface,
        AdvancedPlayerOwnedRTSLayers = (get({AdvancedRTSPlayerLayerInterface, '$class'})):getAdvancedPlayerOwnedRTSLayers(AdvancedRTSPlayerLayerInterface),
        TotalHouses = (fun(Target_N67134) -> (get({Target_N67134, '$class'})):size(Target_N67134) end)((get({AdvancedPlayerOwnedRTSLayers, '$class'})):getHouseList(AdvancedPlayerOwnedRTSLayers)),
        case ((TotalHouses < 1) andalso ((fun(Target_N67198) -> (get({Target_N67198, '$class'})):indexOf(Target_N67198, " House") end)((get({LayerInterface, '$class'})):getName(LayerInterface)) < 0)) of
            true ->
            (get({RtsPlayerLayerInterface, '$class'})):add(RtsPlayerLayerInterface, 'ErrorSound':getInstance()),
            case (not (get({RtsPlayerLayerInterface, '$class'})):implmentsArtificialIntelligenceCompositeInterface(RtsPlayerLayerInterface)) of
                true ->
                (fun(Target_N67311) -> (get({Target_N67311, '$class'})):fireEvent(Target_N67311, get({This, atLeastOneHouseGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
                false -> ok
            end,
            throw({'$return', false});
            false -> ok
        end,
        'BuildingRTSFormInput':isBuildAttemptValid(This, RtsPlayerLayerInterface, LayerInterface)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
add(This, RtsPlayerLayerInterface, LayerManager, LayerInterface) ->
        (get({get({This, 'BUILD_BUILDING_RTS_LAYER_EVENT'}), '$class'})):setRtsLayer(get({This, 'BUILD_BUILDING_RTS_LAYER_EVENT'}), LayerInterface),
        (fun(Target_N67593) -> (get({Target_N67593, '$class'})):fireEvent(Target_N67593, get({This, 'BUILD_BUILDING_RTS_LAYER_EVENT'})) end)('BuildingEventHandler':getInstance()),
        case (get({(RtsPlayerLayerInterface), '$class'})):isLocalPlayer((RtsPlayerLayerInterface)) of
            true ->
            (fun(Target_N67675) -> (get({Target_N67675, '$class'})):fireEvent(Target_N67675, get({This, 'BUILD_BUILDING_RTS_LAYER_EVENT'})) end)('LocalPlayerBuildingEventHandler':getInstance());
            false -> ok
        end,
        'BuildingRTSFormInput':add(This, RtsPlayerLayerInterface, LayerManager, LayerInterface).

