% 
% AllBinary Open License Version 1 
% Copyright (c) 2006 AllBinary 
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
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.game.input.RTSPlayerGameInput
% import org.allbinary.game.layer.AdvancedRTSGameLayer
% import org.allbinary.game.layer.AdvancedRTSPlayerLayerInterface
% import org.allbinary.game.layer.RTSGameStrings
% import org.allbinary.game.layer.RTSLayer
% import org.allbinary.game.layer.RTSLayerEvent
% import org.allbinary.game.layer.RTSLayerUtil
% import org.allbinary.game.layer.RTSPlayerLayerInterface
% import org.allbinary.game.layer.capital.Capital
% import org.allbinary.game.layer.waypoint.WaypointCellPositionHistory
% import org.allbinary.game.layer.waypoint.WaypointLayer
% import org.allbinary.game.layer.waypoint.event.WaypointEventHandlerFactory
% import org.allbinary.graphics.form.item.ABCustomItem
% import org.allbinary.util.BasicArrayList
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.game.identification.Group
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.game.layer.GeographicMapCellPositionAreaBase
% import org.allbinary.game.layer.NullPathFindingLayer
% import org.allbinary.game.layer.NullRTSLayer
% import org.allbinary.game.layer.PathFindingLayerInterface
% import org.allbinary.game.layer.hud.event.GameNotificationEvent
% import org.allbinary.game.layer.hud.event.GameNotificationEventHandler
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.layer.Layer
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.media.audio.ErrorSound
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCellType
% import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface
% import org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellTypeFactory

-module('WaypointRTSFormInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RTSFormInput', Function, Arguments).

init_fields(This) ->
    put({This, 'WAYPOINT_EVENT'}, 'RTSLayerEvent':new(get({'NullRTSLayer', 'NULL_RTS_LAYER'}))),
    put({This, dragToSpotGameNotificationEvent}, undefined),
    put({This, spotTakenGameNotificationEvent}, undefined),
    put({This, buildingCollisionGameNotificationEvent}, undefined),
    put({This, roadCollisionGameNotificationEvent}, undefined),
    put({This, newWaypointGameNotificationEvent}, undefined),
    put({This, noMoneyGameNotificationEvent}, undefined),
    put({This, isPrimaryWaypointCreator}, false),
    put({This, stickyAssociatedRtsLayer}, get({'NullPathFindingLayer', 'NULL_PATH_FINDING_LAYER'})),
    ok.


new(GroupInterface, IsPrimaryWaypointCreator) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), is_boolean(IsPrimaryWaypointCreator) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GroupInterface, IsPrimaryWaypointCreator),
    This.

init(This, GroupInterface, IsPrimaryWaypointCreator) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), is_boolean(IsPrimaryWaypointCreator) ->
        'RTSFormInput':init(This, GroupInterface),
        init_fields(This),
        put({This, isPrimaryWaypointCreator}, IsPrimaryWaypointCreator),
        SmallIntegerSingletonFactory = 'SmallIntegerSingletonFactory':getInstance(),
        BasicColorFactory = 'BasicColorFactory':getInstance(),
        put({This, dragToSpotGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'DRAG_TO_SPOT'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), get({BasicColorFactory, 'WHITE'}), get({'BooleanFactory':getInstance(), 'FALSE'}))),
        put({This, spotTakenGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'SPOT_TAKEN'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), get({BasicColorFactory, 'WHITE'}), get({'BooleanFactory':getInstance(), 'FALSE'}))),
        put({This, buildingCollisionGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'BUILDING_COLLISION'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), get({BasicColorFactory, 'WHITE'}), get({'BooleanFactory':getInstance(), 'FALSE'}))),
        put({This, roadCollisionGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'ROAD_COLLISION'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), get({BasicColorFactory, 'WHITE'}), get({'BooleanFactory':getInstance(), 'FALSE'}))),
        put({This, newWaypointGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'NEW_WAYPOINT'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), get({BasicColorFactory, 'WHITE'}), get({'BooleanFactory':getInstance(), 'FALSE'}))),
        put({This, noMoneyGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'NO_MONEY'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), get({BasicColorFactory, 'WHITE'}), get({'BooleanFactory':getInstance(), 'FALSE'}))).

% throws Exception
setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager) ->
        'RTSFormInput':setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager),
        GeographicMapCompositeInterface = AllBinaryGameLayerManager,
        GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
        (get({get({This, dragToSpotGameNotificationEvent}), '$class'})):setBasicColorP(get({This, dragToSpotGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)),
        (get({get({This, spotTakenGameNotificationEvent}), '$class'})):setBasicColorP(get({This, spotTakenGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)),
        (get({get({This, buildingCollisionGameNotificationEvent}), '$class'})):setBasicColorP(get({This, buildingCollisionGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)),
        (get({get({This, roadCollisionGameNotificationEvent}), '$class'})):setBasicColorP(get({This, roadCollisionGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)),
        (get({get({This, newWaypointGameNotificationEvent}), '$class'})):setBasicColorP(get({This, newWaypointGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)),
        (get({get({This, noMoneyGameNotificationEvent}), '$class'})):setBasicColorP(get({This, noMoneyGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)).

% throws Exception
processAtPoint(This, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, Point) ->
        'RTSFormInput':process(This, LayerManager),
        case ((get({This, '$class'})):isStickyItemSelected(This) orelse (AssociatedRtsLayer =:= 'CollidableDestroyableDamageableLayer':getNullInstance())) of
            true ->
            case ((get({This, '$class'})):isStickyItemSelected(This) andalso (AssociatedRtsLayer =:= 'CollidableDestroyableDamageableLayer':getNullInstance())) of
                true ->
                GeographicMapCompositeInterface = LayerManager,
                GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
                AllBinaryTiledLayer = (get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface),
                X = ((get({Point, '$class'})):getX(Point) + (get({AllBinaryTiledLayer, '$class'})):getXP(AllBinaryTiledLayer)),
                Y = ((get({Point, '$class'})):getY(Point) + (get({AllBinaryTiledLayer, '$class'})):getYP(AllBinaryTiledLayer)),
                GeographicMapCellPosition = (get({GeographicMapInterface, '$class'})):getCellPositionAtXY(GeographicMapInterface, X, Y),
                (get({This, '$class'})):processCellPosition(This, RtsPlayerLayerInterface, LayerManager, GeographicMapCellPosition);
                false ->
                case (not (get({RtsPlayerLayerInterface, '$class'})):implmentsArtificialIntelligenceCompositeInterface(RtsPlayerLayerInterface)) of
                    true ->
                    (fun(Target_N68879) -> (get({Target_N68879, '$class'})):fireEvent(Target_N68879, get({This, dragToSpotGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
                    false -> ok
                end
            end;
            false ->
            case (not (get({RtsPlayerLayerInterface, '$class'})):implmentsArtificialIntelligenceCompositeInterface(RtsPlayerLayerInterface)) of
                true ->
                (fun(Target_N68745) -> (get({Target_N68745, '$class'})):fireEvent(Target_N68745, get({This, spotTakenGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
                false -> ok
            end
        end.

% throws Exception
processCellPosition(This, RtsPlayerLayerInterface, LayerManager, GeographicMapCellPosition) ->
        ItemIndex = (get({This, '$class'})):getSelectedStickyItemIndex(This),
        case (array:get(ItemIndex, get({This, newUnconstructedRTSLayerInterfaceArray})) =:= 'CollidableDestroyableDamageableLayer':getNullInstance()) of
            true ->
            put({This, newUnconstructedRTSLayerInterfaceArray}, array:set(ItemIndex, (get({This, '$class'})):getInstance(This, LayerManager, (get({This, '$class'})):getSelectedStickyItem(This), GeographicMapCellPosition), get({This, newUnconstructedRTSLayerInterfaceArray})));
            false ->
            CellPoint = (get({GeographicMapCellPosition, '$class'})):getPoint(GeographicMapCellPosition),
            RtsLayer = array:get(ItemIndex, get({This, newUnconstructedRTSLayerInterfaceArray})),
            (get({RtsLayer, '$class'})):setPosition(RtsLayer, (get({CellPoint, '$class'})):getX(CellPoint), (get({CellPoint, '$class'})):getY(CellPoint), (get({RtsLayer, '$class'})):getZP(RtsLayer)),
            GeographicMapCompositeInterface = get({RtsLayer, allBinaryGameLayerManagerP}),
            GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
            (get({get({RtsLayer, geographicMapCellPositionAreaBase}), '$class'})):update(get({RtsLayer, geographicMapCellPositionAreaBase}), GeographicMapInterface)
        end,
        (get({This, '$class'})):attemptBuild(This, RtsPlayerLayerInterface, LayerManager, array:get(ItemIndex, get({This, newUnconstructedRTSLayerInterfaceArray})), ItemIndex).

% throws Exception
processStickyGameSpecific(This, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, Item, Index) when is_integer(Index) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Set Sticking Item: ", Item]), This, "processSticky"),
        (get({This, '$class'})):setSelectedStickyItem(This, Item),
        (get({This, '$class'})):setSelectedStickyItemIndex(This, Index),
        (get({This, '$class'})):setStickyItemSelected(This, true),
        put({This, stickyAssociatedRtsLayer}, AssociatedRtsLayer),
        (fun(Target_N70350) -> (get({Target_N70350, '$class'})):put(Target_N70350, get({'Layer', 'ID'}), AssociatedRtsLayer) end)((get({This, '$class'})):getHashtable(This)).

% throws Exception
attemptBuild(This, RtsPlayerLayerInterface, LayerManager, LayerInterface, ItemIndex) when is_integer(ItemIndex) ->
        try
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Layer: ", LayerInterface]), This, "attemptBuild"),
        case (LayerInterface =:= undefined) of
            true ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Layer was null", This, "attemptBuild", {'Exception'}),
            throw({'$return', false});
            false -> ok
        end,
        GeographicMapCellPositionArea = get({LayerInterface, geographicMapCellPositionAreaBase}),
        List = (get({GeographicMapCellPositionArea, '$class'})):getOccupyingGeographicMapCellPositionList(GeographicMapCellPositionArea),
        case ((fun(Target_N70776) -> (get({Target_N70776, '$class'})):anyCellPositionWithDrop(Target_N70776, List) end)('DropCellPositionHistory':getInstance()) orelse (fun(Target_N70811) -> (get({Target_N70811, '$class'})):anyCellPositionWithDrop(Target_N70811, List) end)('WaypointCellPositionHistory':getInstance())) of
            true ->
            (get({RtsPlayerLayerInterface, '$class'})):add(RtsPlayerLayerInterface, 'ErrorSound':getInstance()),
            case (not (get({RtsPlayerLayerInterface, '$class'})):implmentsArtificialIntelligenceCompositeInterface(RtsPlayerLayerInterface)) of
                true ->
                (fun(Target_N70923) -> (get({Target_N70923, '$class'})):fireEvent(Target_N70923, get({This, buildingCollisionGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
                false -> ok
            end,
            throw({'$return', false});
            false -> ok
        end,
        GeographicMapCompositeInterface = LayerManager,
        GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
        RaceTrackGeographicMapCellTypeFactory = (get({GeographicMapInterface, '$class'})):getGeographicMapCellTypeFactory(GeographicMapInterface),
        put({local, geographicMapCellType}, undefined),
        put({local, index}, (get({List, '$class'})):size(List)),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, geographicMapCellType}, (get({GeographicMapInterface, '$class'})):getCellTypeAt(GeographicMapInterface, (get({List, '$class'})):get(List, get({local, index})))),
            case (get({RaceTrackGeographicMapCellTypeFactory, '$class'})):isPath(RaceTrackGeographicMapCellTypeFactory, get({local, geographicMapCellType})) of
                true ->
                (get({RtsPlayerLayerInterface, '$class'})):add(RtsPlayerLayerInterface, 'ErrorSound':getInstance()),
                case (not (get({RtsPlayerLayerInterface, '$class'})):implmentsArtificialIntelligenceCompositeInterface(RtsPlayerLayerInterface)) of
                    true ->
                    (fun(Target_N71374) -> (get({Target_N71374, '$class'})):fireEvent(Target_N71374, get({This, roadCollisionGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
                    false -> ok
                end,
                throw({'$return', false});
                false -> ok
            end,
            Loop();
        false -> ok end end)(),
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
            (fun(Target_N72135) -> (get({Target_N72135, '$class'})):addList(Target_N72135, List, LayerInterface) end)('WaypointCellPositionHistory':getInstance()),
            GeographicMapCellPosition = (get({GeographicMapInterface, '$class'})):getCellPositionAtXY(GeographicMapInterface, (get({LayerInterface, '$class'})):getXP(LayerInterface), (get({LayerInterface, '$class'})):getYP(LayerInterface)),
            WaypointLayer = LayerInterface,
            (get({This, '$class'})):addWayPoint(This, WaypointLayer),
            RtsPlayerGameInput = (get({RtsPlayerLayerInterface, '$class'})):getPlayerGameInput(RtsPlayerLayerInterface),
            (get({RtsPlayerGameInput, '$class'})):setSelectedRTSLayer(RtsPlayerGameInput, LayerInterface, GeographicMapCellPosition),
            AdvancedRTSPlayerLayerInterface = RtsPlayerLayerInterface,
            (fun(Target_N72502) -> (get({Target_N72502, '$class'})):addWaypoint(Target_N72502, LayerInterface) end)((get({AdvancedRTSPlayerLayerInterface, '$class'})):getAdvancedPlayerOwnedRTSLayers(AdvancedRTSPlayerLayerInterface)),
            (get({LayerManager, '$class'})):append(LayerManager, LayerInterface),
            WaypointAvancedRTSGameLayer = WaypointLayer,
            (get({RtsPlayerLayerInterface, '$class'})):add(RtsPlayerLayerInterface, (fun(Target_N72647) -> (get({Target_N72647, '$class'})):getSound(Target_N72647) end)((fun(Target_N72654) -> (get({Target_N72654, '$class'})):getWaypoint(Target_N72654) end)((get({WaypointAvancedRTSGameLayer, '$class'})):getWaypointBehavior(WaypointAvancedRTSGameLayer)))),
            case (not (get({RtsPlayerLayerInterface, '$class'})):implmentsArtificialIntelligenceCompositeInterface(RtsPlayerLayerInterface)) of
                true ->
                (fun(Target_N72714) -> (get({Target_N72714, '$class'})):fireEvent(Target_N72714, get({This, newWaypointGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
                false -> ok
            end,
            throw({'$return', true});
            false ->
            (get({RtsPlayerLayerInterface, '$class'})):add(RtsPlayerLayerInterface, 'ErrorSound':getInstance()),
            case (not (get({RtsPlayerLayerInterface, '$class'})):implmentsArtificialIntelligenceCompositeInterface(RtsPlayerLayerInterface)) of
                true ->
                (fun(Target_N71965) -> (get({Target_N71965, '$class'})):fireEvent(Target_N71965, get({This, noMoneyGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
                false -> ok
            end,
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
addWayPoint(This, LayerInterface) ->
        StickyAssociatedAdvandedRtsLayer = get({This, stickyAssociatedRtsLayer}),
        List = (fun(Target_N72974) -> (get({Target_N72974, '$class'})):getOwnedWaypointList(Target_N72974) end)((get({StickyAssociatedAdvandedRtsLayer, '$class'})):getWaypointBehavior(StickyAssociatedAdvandedRtsLayer)),
        (fun(Target_N73021) -> (get({Target_N73021, '$class'})):destroyAndClear(Target_N73021, List) end)('RTSLayerUtil':getInstance()),
        (get({List, '$class'})):add(List, LayerInterface),
        case get({This, isPrimaryWaypointCreator}) of
            true ->
            (fun(Target_N73114) -> (get({Target_N73114, '$class'})):setWaypointLayer(Target_N73114, LayerInterface) end)('PrimaryWaypointHelper':getInstance());
            false -> ok
        end,
        (get({get({This, 'WAYPOINT_EVENT'}), '$class'})):setRtsLayer(get({This, 'WAYPOINT_EVENT'}), LayerInterface),
        (fun(Target_N73190) -> (get({Target_N73190, '$class'})):fireEvent(Target_N73190, get({This, 'WAYPOINT_EVENT'})) end)('WaypointEventHandlerFactory':getInstance(array:get(0, (get({LayerInterface, '$class'})):getGroupInterface(LayerInterface)))).

