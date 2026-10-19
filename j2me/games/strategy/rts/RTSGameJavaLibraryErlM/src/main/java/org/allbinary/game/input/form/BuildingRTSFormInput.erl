% 
% AllBinary Open License Version 1 
% Copyright (c) 2003 AllBinary 
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
% package org.allbinary.game.input.form
% import org.allbinary.game.input.RTSPlayerGameInput
% import org.allbinary.game.layer.DemoLockedWithCostLayerInterfaceFactoryInterface
% import org.allbinary.game.layer.GeographicMapCellPositionAreaBase
% import org.allbinary.game.layer.RTSGameStrings
% import org.allbinary.game.layer.RTSLayer
% import org.allbinary.game.layer.RTSPlayerLayerInterface
% import org.allbinary.game.layer.capital.Capital
% import org.allbinary.game.layer.item.LayerInterfaceFactoryImageItem
% import org.allbinary.graphics.form.item.ABCustomItem
% import org.allbinary.media.audio.BuildingSound
% import org.allbinary.util.BasicArrayList
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.logic.system.security.licensing.LockedFeatureNotificationUtil
% import org.allbinary.logic.system.security.licensing.LockedUtil
% import org.allbinary.game.identification.Group
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.hud.event.GameNotificationEvent
% import org.allbinary.game.layer.hud.event.GameNotificationEventHandler
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.media.audio.ErrorSound
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCellType
% import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface
% import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory
% import org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellTypeFactory

-module('BuildingRTSFormInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RTSFormInput', Function, Arguments).

init_fields(This) ->
    put({This, isUnitProducer}, false),
    put({This, buildOnPathGameNotificationEvent}, undefined),
    put({This, spotTakenGameNotificationEvent}, undefined),
    put({This, selectBuildSpotGameNotificationEvent}, undefined),
    put({This, roadCollisionGameNotificationEvent}, undefined),
    put({This, noMoneyGameNotificationEvent}, undefined),
    put({This, buildingCollisionGameNotificationEvent}, undefined),
    put({This, structureToCloseCollisionGameNotificationEvent}, undefined),
    put({This, buildingGameNotificationEvent}, undefined),
    put({This, mapEdgeGameNotificationEvent}, undefined),
    put({This, dropCellPositionHistory}, 'DropCellPositionHistory':getInstance()),
    ok.


new(GroupInterface, IsUnitProducer) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), is_boolean(IsUnitProducer) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GroupInterface, IsUnitProducer),
    This.

init(This, GroupInterface, IsUnitProducer) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), is_boolean(IsUnitProducer) ->
        'RTSFormInput':init(This, GroupInterface),
        init_fields(This),
        put({This, isUnitProducer}, IsUnitProducer),
        SmallIntegerSingletonFactory = 'SmallIntegerSingletonFactory':getInstance(),
        BasicColorFactory = 'BasicColorFactory':getInstance(),
        put({This, buildOnPathGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'BUILD_ON_PATH'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), get({BasicColorFactory, 'PINK'}), get({'BooleanFactory':getInstance(), 'FALSE'}))),
        put({This, spotTakenGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'SPOT_TAKEN'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), get({BasicColorFactory, 'PINK'}), get({'BooleanFactory':getInstance(), 'FALSE'}))),
        put({This, selectBuildSpotGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'SELECT_BUILD_SPOT'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), get({BasicColorFactory, 'PINK'}), get({'BooleanFactory':getInstance(), 'FALSE'}))),
        put({This, roadCollisionGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'ROAD_COLLISION'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), get({BasicColorFactory, 'PINK'}), get({'BooleanFactory':getInstance(), 'FALSE'}))),
        put({This, noMoneyGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'NO_MONEY'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), get({BasicColorFactory, 'PINK'}), get({'BooleanFactory':getInstance(), 'FALSE'}))),
        put({This, buildingCollisionGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'BUILDING_COLLISION'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), get({BasicColorFactory, 'PINK'}), get({'BooleanFactory':getInstance(), 'FALSE'}))),
        put({This, structureToCloseCollisionGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'STRUCTURE_TO_CLOSE'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), get({BasicColorFactory, 'PINK'}), get({'BooleanFactory':getInstance(), 'FALSE'}))),
        put({This, buildingGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'BUILDING'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), get({BasicColorFactory, 'PINK'}), get({'BooleanFactory':getInstance(), 'FALSE'}))),
        put({This, mapEdgeGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'MAP_EDGE'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), get({BasicColorFactory, 'PINK'}), get({'BooleanFactory':getInstance(), 'FALSE'}))).

% throws Exception
setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager) ->
        'RTSFormInput':setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager),
        GeographicMapCompositeInterface = AllBinaryGameLayerManager,
        GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
        (get({get({This, buildOnPathGameNotificationEvent}), '$class'})):setBasicColorP(get({This, buildOnPathGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)),
        (get({get({This, spotTakenGameNotificationEvent}), '$class'})):setBasicColorP(get({This, spotTakenGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)),
        (get({get({This, selectBuildSpotGameNotificationEvent}), '$class'})):setBasicColorP(get({This, selectBuildSpotGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)),
        (get({get({This, roadCollisionGameNotificationEvent}), '$class'})):setBasicColorP(get({This, roadCollisionGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)),
        (get({get({This, noMoneyGameNotificationEvent}), '$class'})):setBasicColorP(get({This, noMoneyGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)),
        (get({get({This, buildingCollisionGameNotificationEvent}), '$class'})):setBasicColorP(get({This, buildingCollisionGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)),
        (get({get({This, structureToCloseCollisionGameNotificationEvent}), '$class'})):setBasicColorP(get({This, structureToCloseCollisionGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)),
        (get({get({This, buildingGameNotificationEvent}), '$class'})):setBasicColorP(get({This, buildingGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)),
        (get({get({This, mapEdgeGameNotificationEvent}), '$class'})):setBasicColorP(get({This, mapEdgeGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)).

% throws Exception
processGameSpecific(This, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, Item, ItemIndex) when is_integer(ItemIndex) ->
        'RTSFormInput':process(This, LayerManager),
        (get({This, '$class'})):buildFromMotionInput(This, RtsPlayerLayerInterface, LayerManager, Item, ItemIndex).

isPositionBlocked(This) ->
        (get({get({This, dropCellPositionHistory}), '$class'})):isCellPositionWithDrop(get({This, dropCellPositionHistory}), (get({This, '$class'})):getSelectedGeographicCellPosition(This)).

isDemoLocked(This, Item) ->
        try
        FactoryItem = Item,
        LayerInterfaceFactoryInterface = (get({FactoryItem, '$class'})):getLayerInterfaceFactoryInterface(FactoryItem),
        case ((fun(Target_N69510) -> (get({Target_N69510, '$class'})):isLocked(Target_N69510) end)('LockedUtil':getInstance()) andalso (get({LayerInterfaceFactoryInterface, '$class'})):isDemoLocked(LayerInterfaceFactoryInterface)) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
buildFromMotionInput(This, RtsPlayerLayerInterface, LayerManager, Item, ItemIndex) when is_integer(ItemIndex) ->
        try
        CommonStrings = 'CommonStrings':getInstance(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({CommonStrings, 'START'}), This, "buildFromMotionInput"),
        case (LayerManager =:= undefined) of
            true ->
            erlang:error({'RuntimeException'});
            false -> ok
        end,
        GeographicMapCompositeInterface = LayerManager,
        GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
        case (get({This, '$class'})):isDemoLocked(This, Item) of
            true ->
            (get({RtsPlayerLayerInterface, '$class'})):add(RtsPlayerLayerInterface, 'ErrorSound':getInstance()),
            (fun(Target_N69961) -> (get({Target_N69961, '$class'})):fireWithColor(Target_N69961, (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)) end)('LockedFeatureNotificationUtil':getInstance()),
            throw({'$return', ok});
            false -> ok
        end,
        GeographicMapCellPosition = (get({This, '$class'})):getSelectedGeographicCellPosition(This),
        case (GeographicMapCellPosition =/= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) of
            true ->
            case (not (get({This, '$class'})):isPositionBlocked(This)) of
                true ->
                GeographicMapCellType = (get({GeographicMapInterface, '$class'})):getCellTypeAt(GeographicMapInterface, GeographicMapCellPosition),
                RaceTrackGeographicMapCellTypeFactory = (get({GeographicMapInterface, '$class'})):getGeographicMapCellTypeFactory(GeographicMapInterface),
                case (not (get({RaceTrackGeographicMapCellTypeFactory, '$class'})):isPath(RaceTrackGeographicMapCellTypeFactory, GeographicMapCellType)) of
                    true ->
                    case (array:get(ItemIndex, get({This, newUnconstructedRTSLayerInterfaceArray})) =:= 'CollidableDestroyableDamageableLayer':getNullInstance()) of
                        true ->
                        put({This, newUnconstructedRTSLayerInterfaceArray}, array:set(ItemIndex, (get({This, '$class'})):getInstance(This, LayerManager, Item, GeographicMapCellPosition), get({This, newUnconstructedRTSLayerInterfaceArray})));
                        false ->
                        put({local, rtsLayer}, array:get(ItemIndex, get({This, newUnconstructedRTSLayerInterfaceArray}))),
                        CellPoint = (get({GeographicMapCellPosition, '$class'})):getPoint(GeographicMapCellPosition),
                        (get({get({local, rtsLayer}), '$class'})):setPosition(get({local, rtsLayer}), (get({CellPoint, '$class'})):getX(CellPoint), (get({CellPoint, '$class'})):getY(CellPoint), (get({CellPoint, '$class'})):getZ(CellPoint)),
                        (get({get({get({local, rtsLayer}), geographicMapCellPositionAreaBase}), '$class'})):update(get({get({local, rtsLayer}), geographicMapCellPositionAreaBase}), GeographicMapInterface)
                    end,
                    put({local, rtsLayer}, array:get(ItemIndex, get({This, newUnconstructedRTSLayerInterfaceArray}))),
                    (get({This, '$class'})):attemptBuild(This, RtsPlayerLayerInterface, LayerManager, get({local, rtsLayer}), ItemIndex);
                    false ->
                    (get({RtsPlayerLayerInterface, '$class'})):add(RtsPlayerLayerInterface, 'ErrorSound':getInstance()),
                    case (not (get({RtsPlayerLayerInterface, '$class'})):implmentsArtificialIntelligenceCompositeInterface(RtsPlayerLayerInterface)) of
                        true ->
                        (fun(Target_N70595) -> (get({Target_N70595, '$class'})):fireEvent(Target_N70595, get({This, buildOnPathGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
                        false -> ok
                    end
                end;
                false ->
                (get({RtsPlayerLayerInterface, '$class'})):add(RtsPlayerLayerInterface, 'ErrorSound':getInstance()),
                case (not (get({RtsPlayerLayerInterface, '$class'})):implmentsArtificialIntelligenceCompositeInterface(RtsPlayerLayerInterface)) of
                    true ->
                    (fun(Target_N70312) -> (get({Target_N70312, '$class'})):fireEvent(Target_N70312, get({This, spotTakenGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
                    false -> ok
                end
            end;
            false ->
            (get({RtsPlayerLayerInterface, '$class'})):add(RtsPlayerLayerInterface, 'ErrorSound':getInstance()),
            case (not (get({RtsPlayerLayerInterface, '$class'})):implmentsArtificialIntelligenceCompositeInterface(RtsPlayerLayerInterface)) of
                true ->
                (fun(Target_N70168) -> (get({Target_N70168, '$class'})):fireEvent(Target_N70168, get({This, selectBuildSpotGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
                false -> ok
            end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
attemptBuild(This, RtsPlayerLayerInterface, LayerManager, LayerInterface, ItemIndex) when is_integer(ItemIndex) ->
        try
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N71295) -> (get({Target_N71295, '$class'})):toString(Target_N71295) end)((fun(Target_N71302) -> (get({Target_N71302, '$class'})):append(Target_N71302, (fun(Target_N71338) -> (get({Target_N71338, '$class'})):toString(Target_N71338, LayerInterface) end)('StringUtil':getInstance())) end)((fun(Target_N71309) -> (get({Target_N71309, '$class'})):append(Target_N71309, "Layer: ") end)('StringMaker':new()))), This, "attemptBuild"),
        GeographicMapCellPositionArea = get({LayerInterface, geographicMapCellPositionAreaBase}),
        OccupyList = (get({GeographicMapCellPositionArea, '$class'})):getOccupyingGeographicMapCellPositionList(GeographicMapCellPositionArea),
        case (not (get({This, '$class'})):isBuildAttemptValid(This, RtsPlayerLayerInterface, LayerInterface)) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        put({local, geographicMapCellType}, undefined),
        lists:foreach(fun(Index) ->
            GeographicMapCompositeInterface = LayerManager,
            GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
            put({local, geographicMapCellType}, (get({GeographicMapInterface, '$class'})):getCellTypeAt(GeographicMapInterface, (get({OccupyList, '$class'})):get(OccupyList, Index))),
            RaceTrackGeographicMapCellTypeFactory = (get({GeographicMapInterface, '$class'})):getGeographicMapCellTypeFactory(GeographicMapInterface),
            case (get({RaceTrackGeographicMapCellTypeFactory, '$class'})):isPath(RaceTrackGeographicMapCellTypeFactory, get({local, geographicMapCellType})) of
                true ->
                (get({RtsPlayerLayerInterface, '$class'})):add(RtsPlayerLayerInterface, 'ErrorSound':getInstance()),
                case (not (get({RtsPlayerLayerInterface, '$class'})):implmentsArtificialIntelligenceCompositeInterface(RtsPlayerLayerInterface)) of
                    true ->
                    (fun(Target_N71934) -> (get({Target_N71934, '$class'})):fireEvent(Target_N71934, get({This, roadCollisionGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
                    false -> ok
                end,
                throw({'$return', false});
                false -> ok
            end
        end, lists:seq(((get({OccupyList, '$class'})):size(OccupyList) - 1), 0, -1)),
        Cost = (get({LayerInterface, '$class'})):getCost(LayerInterface),
        Capital = (get({RtsPlayerLayerInterface, '$class'})):getCapital(RtsPlayerLayerInterface),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Trying to Build: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({LayerInterface, '$class'})):getName(LayerInterface)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " for: $"),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Cost),
        (get({StringBuffer, '$class'})):append(StringBuffer, " with "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((get({Capital, '$class'})):getTotalMoney(Capital))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "attemptBuild"),
        case (Cost =< (get({Capital, '$class'})):getTotalMoney(Capital)) of
            true ->
            (get({LayerInterface, '$class'})):construct(LayerInterface, RtsPlayerLayerInterface),
            put({This, newUnconstructedRTSLayerInterfaceArray}, array:set(ItemIndex, 'CollidableDestroyableDamageableLayer':getNullInstance(), get({This, newUnconstructedRTSLayerInterfaceArray}))),
            (get({Capital, '$class'})):removeMoney(Capital, Cost),
            (get({This, '$class'})):add(This, RtsPlayerLayerInterface, LayerManager, LayerInterface),
            throw({'$return', true});
            false ->
            (get({RtsPlayerLayerInterface, '$class'})):add(RtsPlayerLayerInterface, 'ErrorSound':getInstance()),
            case (not (get({RtsPlayerLayerInterface, '$class'})):implmentsArtificialIntelligenceCompositeInterface(RtsPlayerLayerInterface)) of
                true ->
                (fun(Target_N72559) -> (get({Target_N72559, '$class'})):fireEvent(Target_N72559, get({This, noMoneyGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
                false -> ok
            end,
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
isBuildAttemptValid(This, RtsPlayerLayerInterface, LayerInterface) ->
        try
        GeographicMapCellPositionArea = get({LayerInterface, geographicMapCellPositionAreaBase}),
        OccupyList = (get({GeographicMapCellPositionArea, '$class'})):getOccupyingGeographicMapCellPositionList(GeographicMapCellPositionArea),
        case (get({get({This, dropCellPositionHistory}), '$class'})):anyCellPositionWithDrop(get({This, dropCellPositionHistory}), OccupyList) of
            true ->
            (get({RtsPlayerLayerInterface, '$class'})):add(RtsPlayerLayerInterface, 'ErrorSound':getInstance()),
            case (not (get({RtsPlayerLayerInterface, '$class'})):implmentsArtificialIntelligenceCompositeInterface(RtsPlayerLayerInterface)) of
                true ->
                (fun(Target_N73120) -> (get({Target_N73120, '$class'})):fireEvent(Target_N73120, get({This, buildingCollisionGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
                false -> ok
            end,
            throw({'$return', false});
            false -> ok
        end,
        case (get({This, isUnitProducer}) andalso (get({get({This, dropCellPositionHistory}), '$class'})):anyCellPositionWithDrop(get({This, dropCellPositionHistory}), (get({GeographicMapCellPositionArea, '$class'})):getSurroundingGeographicMapCellPositionList(GeographicMapCellPositionArea))) of
            true ->
            (get({RtsPlayerLayerInterface, '$class'})):add(RtsPlayerLayerInterface, 'ErrorSound':getInstance()),
            case (not (get({RtsPlayerLayerInterface, '$class'})):implmentsArtificialIntelligenceCompositeInterface(RtsPlayerLayerInterface)) of
                true ->
                (fun(Target_N73467) -> (get({Target_N73467, '$class'})):fireEvent(Target_N73467, get({This, structureToCloseCollisionGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
                false -> ok
            end,
            throw({'$return', false});
            false ->
            case (get({This, '$class'})):isSurroundingCellsOffMap(This, LayerInterface) of
                true ->
                (get({RtsPlayerLayerInterface, '$class'})):add(RtsPlayerLayerInterface, 'ErrorSound':getInstance()),
                case (not (get({RtsPlayerLayerInterface, '$class'})):implmentsArtificialIntelligenceCompositeInterface(RtsPlayerLayerInterface)) of
                    true ->
                    (fun(Target_N73336) -> (get({Target_N73336, '$class'})):fireEvent(Target_N73336, get({This, mapEdgeGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
                    false -> ok
                end,
                throw({'$return', false});
                false -> ok
            end
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
add(This, RtsPlayerLayerInterface, LayerManager, LayerInterface) ->
        GeographicMapCellPositionArea = get({LayerInterface, geographicMapCellPositionAreaBase}),
        OccupyList = (get({GeographicMapCellPositionArea, '$class'})):getOccupyingGeographicMapCellPositionList(GeographicMapCellPositionArea),
        (get({get({This, dropCellPositionHistory}), '$class'})):addAll(get({This, dropCellPositionHistory}), OccupyList, LayerInterface),
        RtsPlayerGameInput = (get({RtsPlayerLayerInterface, '$class'})):getPlayerGameInput(RtsPlayerLayerInterface),
        (get({RtsPlayerGameInput, '$class'})):setSelectedRTSLayer(RtsPlayerGameInput, LayerInterface, (get({This, '$class'})):getSelectedGeographicCellPosition(This)),
        (get({LayerManager, '$class'})):append(LayerManager, LayerInterface),
        (get({RtsPlayerLayerInterface, '$class'})):add(RtsPlayerLayerInterface, 'BuildingSound':getInstance()),
        case (not (get({RtsPlayerLayerInterface, '$class'})):implmentsArtificialIntelligenceCompositeInterface(RtsPlayerLayerInterface)) of
            true ->
            (fun(Target_N73964) -> (get({Target_N73964, '$class'})):fireEvent(Target_N73964, get({This, buildingGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
            false -> ok
        end.

isSurroundingCellsOffMap(This, LayerInterface) ->
        try
        GeographicMapCellPositionArea = get({LayerInterface, geographicMapCellPositionAreaBase}),
        OccupyList = (get({GeographicMapCellPositionArea, '$class'})):getOccupyingGeographicMapCellPositionList(GeographicMapCellPositionArea),
        SurroundList = (get({GeographicMapCellPositionArea, '$class'})):getSurroundingGeographicMapCellPositionList(GeographicMapCellPositionArea),
        OccupySize = (get({OccupyList, '$class'})):size(OccupyList),
        SurroundSize = (get({SurroundList, '$class'})):size(SurroundList),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "occupySize: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, OccupySize),
        (get({StringBuffer, '$class'})):append(StringBuffer, " surroundSize: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, SurroundSize),
        (get({StringBuffer, '$class'})):append(StringBuffer, " surroundList: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N74537) -> (get({Target_N74537, '$class'})):toString(Target_N74537, SurroundList) end)('StringUtil':getInstance())),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "isSurroundingCellsOffMap"),
        put({local, isSurroundOffMap}, false),
        case ((OccupySize =:= 1) andalso (SurroundSize =/= 8)) of
            true ->
            put({local, isSurroundOffMap}, true);
            false ->
            case ((OccupySize =:= 4) andalso (SurroundSize =/= 12)) of
            true ->
            put({local, isSurroundOffMap}, true);
            false -> ok
        end
        end,
        case ((OccupySize =:= 0) orelse get({local, isSurroundOffMap})) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

