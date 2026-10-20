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
% package org.allbinary.game.layer.unit
% import javax.microedition.lcdui.Canvas
% import javax.microedition.lcdui.Graphics
% import org.allbinary.J2MEUtil
% import org.allbinary.ag.weapon.media.audio.ExplosionBasicSound
% import org.allbinary.animation.Animation
% import org.allbinary.animation.AnimationInterfaceFactoryInterface
% import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory
% import org.allbinary.animation.IndexedAnimation
% import org.allbinary.animation.NullAnimationFactory
% import org.allbinary.animation.NullIndexedAnimationFactory
% import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface
% import org.allbinary.animation.RotationAnimation
% import org.allbinary.animation.caption.CaptionAnimationHelper
% import org.allbinary.animation.caption.CaptionAnimationHelperBase
% import org.allbinary.animation.vector.AdjustedCircleAnimation
% import org.allbinary.direction.Direction
% import org.allbinary.game.combat.damage.DamageFloaters
% import org.allbinary.game.combat.damage.PtsDamageFloaters
% import org.allbinary.game.combat.weapon.WeaponProperties
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.GameFeatureFactory
% import org.allbinary.game.graphics.hud.BasicHudFactory
% import org.allbinary.game.health.Health
% import org.allbinary.game.health.HealthBar
% import org.allbinary.game.health.HealthBarTwodAnimation
% import org.allbinary.game.identification.Group
% import org.allbinary.game.identification.GroupCommonFactory
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.game.input.event.GameKeyEventFactory
% import org.allbinary.game.input.event.GameKeyEventUtil
% import org.allbinary.game.input.form.VisibleCellPositionsSingleton
% import org.allbinary.game.input.form.WaypointRTSFormInput
% import org.allbinary.game.layer.AdvancedRTSGameLayer
% import org.allbinary.game.layer.AdvancedRTSProperties
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.game.layer.CaptionResources
% import org.allbinary.game.layer.LinePathRelativeAnimation
% import org.allbinary.game.layer.PathAnimation
% import org.allbinary.game.layer.PathFindingLayerInterface
% import org.allbinary.game.layer.RTSLayer2LogHelper
% import org.allbinary.game.layer.RTSLayer2SelectedLogHelper
% import org.allbinary.game.layer.RTSLayerEvent
% import org.allbinary.game.layer.RTSLayerHudPaintable
% import org.allbinary.game.layer.RTSLayerLogHelper
% import org.allbinary.game.layer.RTSLayerSelectedLogHelper
% import org.allbinary.game.layer.RTSPlayerLayerInterface
% import org.allbinary.game.layer.SelectionHudPaintable
% import org.allbinary.game.layer.SensorActionFactory
% import org.allbinary.game.layer.SteeringVisitor
% import org.allbinary.game.layer.TiledLayerUtil
% import org.allbinary.game.layer.VehicleFrictionProperties
% import org.allbinary.game.layer.VehicleProperties
% import org.allbinary.game.layer.WaypointBehaviorBase
% import org.allbinary.game.layer.building.BuildingLayer
% import org.allbinary.game.layer.building.event.BuildingEventHandler
% import org.allbinary.game.layer.building.event.BuildingEventListenerInterface
% import org.allbinary.game.layer.capital.event.CapitalEvent
% import org.allbinary.game.layer.capital.event.CapitalEventHandlerFactory
% import org.allbinary.game.layer.geographic.map.LayerPartialCellPositionsUtil
% import org.allbinary.game.layer.special.SpecialDownGameInputProcessor
% import org.allbinary.game.layer.special.SpecialFireGameInputProcessor
% import org.allbinary.game.layer.special.SpecialLeftGameInputProcessor
% import org.allbinary.game.layer.special.SpecialRightGameInputProcessor
% import org.allbinary.game.layer.special.SpecialUpGameInputProcessor
% import org.allbinary.game.layer.waypoint.MultipassNoCacheWaypoint
% import org.allbinary.game.layer.waypoint.NoCacheWaypoint
% import org.allbinary.game.layer.waypoint.WaypointBase
% import org.allbinary.game.layer.waypoint.event.WaypointEventHandlerFactory
% import org.allbinary.game.multiplayer.layer.RemoteInfo
% import org.allbinary.game.part.weapon.BasicWeaponPart
% import org.allbinary.game.part.weapon.SalvoInterface
% import org.allbinary.game.physics.velocity.VelocityProperties
% import org.allbinary.game.tracking.TrackingEvent
% import org.allbinary.game.tracking.TrackingEventHandler
% import org.allbinary.game.tracking.TrackingEventListenerInterface
% import org.allbinary.graphics.CellPositionFactory
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.paint.NullPaintable
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.layer.Layer
% import org.allbinary.layer.LayerInterfaceFactoryInterface
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.math.BasicDecimal
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.math.AngleFactory
% import org.allbinary.math.AngleInfo
% import org.allbinary.math.FrameUtil
% import org.allbinary.math.LayerDistanceUtil
% import org.allbinary.math.NamedAngle
% import org.allbinary.media.audio.AttackSound
% import org.allbinary.media.audio.SecondaryPlayerQueueFactory
% import org.allbinary.media.audio.Sound
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface
% import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory
% import org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMap
% import org.allbinary.string.CommonPhoneStrings
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.util.BasicArrayListS
% import org.allbinary.view.ViewPositionBase

-module('UnitLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements BuildingEventListenerInterface
% implements TrackingEventListenerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AdvancedRTSGameLayer', Function, Arguments).

static_init() ->
    put({?MODULE, partialPositionList}, 'BasicArrayListS':new(4)),
    put({?MODULE, 'SENSOR_RANGE_MULTIPLIER'}, 6),
    put({?MODULE, 'MOVE'}, "Moving"),
    ok.

init_fields(This) ->
    put({This, basicColorFactory}, 'BasicColorFactory':getInstance()),
    put({This, groupCommonFactory}, 'GroupCommonFactory':getInstance()),
    put({This, layerPartialCellPositionsUtil}, 'LayerPartialCellPositionsUtil':getInstance()),
    put({This, layerDistanceUtil}, 'LayerDistanceUtil':getInstance()),
    put({This, angleFactory}, 'AngleFactory':getInstance()),
    put({This, cellPositionFactory}, 'CellPositionFactory':getInstance()),
    put({This, maxResourceLoad}, 0),
    put({This, vehicleProperties}, undefined),
    put({This, accelerationBasicDecimal}, 'BasicDecimal':new(1600)),
    put({This, decelerationBasicDecimal}, 'BasicDecimal':new((-1000))),
    put({This, trackingEvent}, undefined),
    put({This, damageFloaters}, undefined),
    put({This, damageFloatersPaintableInterface}, undefined),
    put({This, healthBar}, undefined),
    put({This, moveSoundInterface}, undefined),
    put({This, initResourceAnimation}, undefined),
    put({This, resourceAnimation}, (fun(Target_N69773) -> (get({Target_N69773, '$class'})):getInstance(Target_N69773, 0) end)('NullIndexedAnimationFactory':getFactoryInstance())),
    put({This, initPathAnimation}, undefined),
    put({This, pathAnimation}, (fun(Target_N69877) -> (get({Target_N69877, '$class'})):getInstance(Target_N69877, 0) end)('NullAnimationFactory':getFactoryInstance())),
    put({This, captionAnimationHelper}, 'CaptionAnimationHelper':new((fun(Target_N69955) -> (get({Target_N69955, '$class'})):getInstance(Target_N69955, 0) end)((fun(Target_N69962) -> (get({Target_N69962, '$class'})):get(Target_N69962, get({'CaptionResources':getInstance(), 'RESOURCE'})) end)('FeaturedAnimationInterfaceFactoryInterfaceFactory':getInstance())), (-23), (-25), 6, 0)),
    put({This, decalAnimation}, undefined),
    put({This, waypointLayerInterfaceFactoryInterface}, undefined),
    put({This, resourceLoad}, 0),
    put({This, weaponRange}, 0),
    put({This, rtsLogHelper}, 'RTSLayerLogHelper':getInstance()),
    put({This, rotationAnimationInterfaceP}, undefined),
    put({This, movementAngle}, get({get({This, angleFactory}), 'NOT_ANGLE'})),
    put({This, steeringInsideGeographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
    put({This, sensorGeographicMapCellPositionList}, 'BasicArrayListD':new()),
    put({This, 'CAPITAL_EVENT'}, 'CapitalEvent':new(This)),
    ok.


new(RemoteInfo, ParentLayer, AdvancedRTSProperties, GroupInterface, RootName, Name, VehicleProperties, HealthInterface, MaxResourceLoad, MoveSoundInterface, WaypointLayerInterfaceFactoryInterface, AnimationInterfaceFactoryInterface, EmptyAnimationInterfaceFactoryInterface, BaseAnimationInterfaceFactoryInterface, BuildAnimationInterfaceFactoryInterface, VerticleBuildAnimationInterfaceFactoryInterface, DecalAnimationInterfaceFactoryInterface, ResourceAnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, Direction, X, Y, Z, ViewPosition) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), (is_list(RootName) orelse RootName =:= undefined), (is_list(Name) orelse Name =:= undefined), is_integer(X), is_integer(Y), is_integer(Z) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, RemoteInfo, ParentLayer, AdvancedRTSProperties, GroupInterface, RootName, Name, VehicleProperties, HealthInterface, MaxResourceLoad, MoveSoundInterface, WaypointLayerInterfaceFactoryInterface, AnimationInterfaceFactoryInterface, EmptyAnimationInterfaceFactoryInterface, BaseAnimationInterfaceFactoryInterface, BuildAnimationInterfaceFactoryInterface, VerticleBuildAnimationInterfaceFactoryInterface, DecalAnimationInterfaceFactoryInterface, ResourceAnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, Direction, X, Y, Z, ViewPosition),
    This.

'$init'(This, RemoteInfo, ParentLayer, AdvancedRTSProperties, GroupInterface, RootName, Name, VehicleProperties, HealthInterface, MaxResourceLoad, MoveSoundInterface, WaypointLayerInterfaceFactoryInterface, AnimationInterfaceFactoryInterface, EmptyAnimationInterfaceFactoryInterface, BaseAnimationInterfaceFactoryInterface, BuildAnimationInterfaceFactoryInterface, VerticleBuildAnimationInterfaceFactoryInterface, DecalAnimationInterfaceFactoryInterface, ResourceAnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, Direction, X, Y, Z, ViewPosition) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), (is_list(RootName) orelse RootName =:= undefined), (is_list(Name) orelse Name =:= undefined), is_integer(X), is_integer(Y), is_integer(Z) ->
        'AdvancedRTSGameLayer':'$init'(This, RemoteInfo, ParentLayer, AdvancedRTSProperties, GroupInterface, RootName, Name, HealthInterface, 'WaypointRTSFormInput':new(GroupInterface, true), AnimationInterfaceFactoryInterface, EmptyAnimationInterfaceFactoryInterface, BaseAnimationInterfaceFactoryInterface, BuildAnimationInterfaceFactoryInterface, VerticleBuildAnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, X, Y, ViewPosition),
        init_fields(This),
        (get({This, '$class'})):setCollidableInferface(This, 'CollidableUnitBehavior':new(true)),
        put({This, waypointLayerInterfaceFactoryInterface}, WaypointLayerInterfaceFactoryInterface),
        put({This, maxResourceLoad}, (get({MaxResourceLoad, '$class'})):shortValue(MaxResourceLoad)),
        put({This, moveSoundInterface}, MoveSoundInterface),
        case (fun(Target_N70735) -> (get({Target_N70735, '$class'})):isFeature(Target_N70735, get({'GameFeatureFactory':getInstance(), 'DAMAGE_FLOATERS'})) end)('Features':getInstance()) of
            true ->
            put({This, damageFloaters}, 'PtsDamageFloaters':new(This)),
            put({This, damageFloatersPaintableInterface}, get({This, damageFloaters}));
            false ->
            put({This, damageFloatersPaintableInterface}, 'NullPaintable':getInstance()),
            put({This, damageFloaters}, 'DamageFloaters':new())
        end,
        case (fun(Target_N70941) -> (get({Target_N70941, '$class'})):isFeature(Target_N70941, get({'GameFeatureFactory':getInstance(), 'HEALTH_BARS'})) end)('Features':getInstance()) of
            true ->
            put({This, healthBar}, 'HealthBar':new(This, (get({This, '$class'})):getHealthInterface(This), 'HealthBarTwodAnimation':new(This, get({'BasicHudFactory':getInstance(), 'BOTTOMLEFT'})), (-1)));
            false ->
            put({This, healthBar}, 'NullPaintable':getInstance())
        end,
        put({This, decalAnimation}, (get({DecalAnimationInterfaceFactoryInterface, '$class'})):getInstance(DecalAnimationInterfaceFactoryInterface, 0)),
        put({This, initResourceAnimation}, (get({ResourceAnimationInterfaceFactoryInterface, '$class'})):getInstance(ResourceAnimationInterfaceFactoryInterface, 0)),
        (get({get({This, initResourceAnimation}), '$class'})):setFrameByDirection(get({This, initResourceAnimation}), Direction),
        (get({get({This, decalAnimation}), '$class'})):setFrameByDirection(get({This, decalAnimation}), Direction),
        put({This, rotationAnimationInterfaceP}, get({This, indexedButShouldBeRotationAnimationInterface})),
        (get({get({This, rotationAnimationInterfaceP}), '$class'})):setFrameByDirection(get({This, rotationAnimationInterfaceP}), Direction),
        (get({This, '$class'})):setMaxLevel(This, 12),
        put({This, vehicleProperties}, VehicleProperties),
        put({This, trackingEvent}, 'TrackingEvent':new(This)),
        put({This, initPathAnimation}, 'PathAnimation':new(This, 'LinePathRelativeAnimation':getInstance())).

% throws Exception
setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager) ->
        'AdvancedRTSGameLayer':setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager),
        (get({get({This, initPathAnimation}), '$class'})):setAllBinaryGameLayerManager(get({This, initPathAnimation}), AllBinaryGameLayerManager).

% throws Exception
updateWaypointBehavior(This, GeographicMapInterface) ->
        Hashtable = (fun(Target_N72345) -> (get({Target_N72345, '$class'})):createHashtable(Target_N72345) end)('StdUtil':getInstance()),
        (get({Hashtable, '$class'})):put(Hashtable, get({get({This, groupCommonFactory}), 'ID'}), (get({This, '$class'})):getGroupInterface(This)),
        (get({Hashtable, '$class'})):put(Hashtable, get({'Layer', 'ID'}), This),
        (get({Hashtable, '$class'})):put(Hashtable, get({'AllBinaryGameLayerManager', 'ID'}), get({This, allBinaryGameLayerManagerP})),
        (get({This, '$class'})):setWaypointBehavior(This, 'UnitWaypointBehavior2':new(This, (get({get({This, waypointLayerInterfaceFactoryInterface}), '$class'})):getNextInstance(get({This, waypointLayerInterfaceFactoryInterface}), Hashtable, get({This, x}), get({This, y}), get({This, z})))),
        Features = 'Features':getInstance(),
        Waypoint = case 'J2MEUtil':isHTML() of true -> 'MultipassNoCacheWaypoint':new(This, 'AttackSound':getInstance()); false -> 'NoCacheWaypoint':new(This, 'AttackSound':getInstance()) end,
        (fun(Target_N72835) -> (get({Target_N72835, '$class'})):setWaypoint(Target_N72835, Waypoint) end)((get({This, '$class'})):getWaypointBehavior(This)),
        'AdvancedRTSGameLayer':updateWaypointBehavior(This, GeographicMapInterface),
        (get({This, '$class'})):initRangeHack(This).

% throws Exception
construct(This, RtsPlayerLayerInterface) ->
        'AdvancedRTSGameLayer':construct(This, RtsPlayerLayerInterface),
        (fun(Target_N73010) -> (get({Target_N73010, '$class'})):addListenerInterface(Target_N73010, This) end)('TrackingEventHandler':getInstance()),
        (fun(Target_N73044) -> (get({Target_N73044, '$class'})):addListenerInterface(Target_N73044, (get({This, '$class'})):getUnitWaypointBehavior(This)) end)('WaypointEventHandlerFactory':getInstance(array:get(0, (get({This, '$class'})):getGroupInterface(This)))),
        (fun(Target_N73108) -> (get({Target_N73108, '$class'})):addListenerInterface(Target_N73108, This) end)('BuildingEventHandler':getInstance()),
        (fun(Target_N73142) -> (get({Target_N73142, '$class'})):setCurrentPathGeographicMapCellPosition(Target_N73142, (get({This, '$class'})):getCurrentGeographicMapCellPosition(This)) end)((get({This, '$class'})):getUnitWaypointBehavior(This)),
        (get({This, '$class'})):updateSensorGeographicMapCellPositionList(This),
        (fun(Target_N73194) -> (get({Target_N73194, '$class'})):setLastPathGeographicMapCellPosition(Target_N73194, (fun(Target_N73214) -> (get({Target_N73214, '$class'})):getCurrentPathGeographicMapCellPosition(Target_N73214) end)((get({This, '$class'})):getUnitWaypointBehavior(This))) end)((get({This, '$class'})):getUnitWaypointBehavior(This)).

% throws Exception
updateSensorGeographicMapCellPositionList(This) ->
        case (fun(Target_N73352) -> (get({Target_N73352, '$class'})):shouldProcess(Target_N73352) end)('VisibleCellPositionsSingleton':getInstance()) of
            true ->
            CurrentGeographicMapCellPosition = (get({This, '$class'})):getCurrentGeographicMapCellPosition(This),
            (get({get({This, sensorGeographicMapCellPositionList}), '$class'})):clear(get({This, sensorGeographicMapCellPositionList})),
            (get({get({This, sensorGeographicMapCellPositionList}), '$class'})):add(get({This, sensorGeographicMapCellPositionList}), CurrentGeographicMapCellPosition),
            SensorRange = (get({This, weaponRange}) * get({'UnitLayer', 'SENSOR_RANGE_MULTIPLIER'})),
            GeographicMapCompositeInterface = get({This, allBinaryGameLayerManagerP}),
            GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
            TiledLayer = (get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface),
            TotalCells = (((SensorRange / (get({TiledLayer, '$class'})):getCellHeight(TiledLayer))) / 2),
            GeographicMapCellPositionFactory = (get({GeographicMapInterface, '$class'})):getGeographicMapCellPositionFactory(GeographicMapInterface),
            Column = (get({CurrentGeographicMapCellPosition, '$class'})):getColumn(CurrentGeographicMapCellPosition),
            Row = (get({CurrentGeographicMapCellPosition, '$class'})):getRow(CurrentGeographicMapCellPosition),
            put({local, lastColumn}, (Column + TotalCells)),
            put({local, lastRow}, (Row + TotalCells)),
            case (get({local, lastColumn}) > (get({TiledLayer, '$class'})):getColumns(TiledLayer)) of
                true ->
                put({local, lastColumn}, (get({TiledLayer, '$class'})):getColumns(TiledLayer));
                false -> ok
            end,
            case (get({local, lastRow}) > (get({TiledLayer, '$class'})):getRows(TiledLayer)) of
                true ->
                put({local, lastRow}, (get({TiledLayer, '$class'})):getRows(TiledLayer));
                false -> ok
            end,
            put({local, firstColumn}, (Column - TotalCells)),
            put({local, firstRow}, (Row - TotalCells)),
            case (get({local, firstColumn}) < 0) of
                true ->
                put({local, firstColumn}, 0);
                false -> ok
            end,
            case (get({local, firstRow}) < 0) of
                true ->
                put({local, firstRow}, 0);
                false -> ok
            end,
            lists:foreach(fun(Index) ->
                lists:foreach(fun(Index2) ->
                    GeographicMapCellPosition = (get({GeographicMapCellPositionFactory, '$class'})):getAt(GeographicMapCellPositionFactory, Index, Index2),
                    case (not (get({get({This, sensorGeographicMapCellPositionList}), '$class'})):contains(get({This, sensorGeographicMapCellPositionList}), GeographicMapCellPosition)) of
                        true ->
                        (get({get({This, sensorGeographicMapCellPositionList}), '$class'})):add(get({This, sensorGeographicMapCellPositionList}), GeographicMapCellPosition);
                        false -> ok
                    end
                end, lists:seq((get({local, lastRow}) - 1), get({local, firstRow}), -1))
            end, lists:seq((get({local, lastColumn}) - 1), get({local, firstColumn}), -1));
            false -> ok
        end.

getSensorGeographicMapCellPositionList(This) ->
        get({This, sensorGeographicMapCellPositionList}).

select(This) ->
        put({This, pathAnimation}, get({This, initPathAnimation})),
        'AdvancedRTSGameLayer':select(This).

deselect(This) ->
        put({This, pathAnimation}, (fun(Target_N74863) -> (get({Target_N74863, '$class'})):getInstance(Target_N74863, 0) end)('NullAnimationFactory':getFactoryInstance())),
        'AdvancedRTSGameLayer':deselect(This).

setSelected(This, Selected) when is_boolean(Selected) ->
        'AdvancedRTSGameLayer':setSelected(This, Selected),
        case Selected of
            true ->
            case get({This, debug}) of
                true ->
                put({This, rtsLogHelper}, 'RTSLayerSelectedLogHelper':getInstance());
                false -> ok
            end,
            put({This, rtsLayer2LogHelper}, 'RTSLayer2SelectedLogHelper':getInstance());
            false ->
            case get({This, debug}) of
                true ->
                put({This, rtsLogHelper}, 'RTSLayerLogHelper':getInstance());
                false -> ok
            end,
            put({This, rtsLayer2LogHelper}, 'RTSLayer2LogHelper':getInstance())
        end.

% throws Exception
setClosestGeographicMapCellHistory(This, PathsList) ->
        (get({get({This, rtsLogHelper}), '$class'})):setClosestGeographicMapCellHistory(get({This, rtsLogHelper}), This, PathsList),
        put({local, closestIndex}, (-1)),
        put({local, shortestDistance}, get({'Integer', 'MAX_VALUE'})),
        put({local, currentDistance}, get({'Integer', 'MAX_VALUE'})),
        lists:foreach(fun(Index) ->
            put({local, geographicMapCellPositionBasicArrayList}, (get({PathsList, '$class'})):get(PathsList, Index)),
            put({local, geographicMapCellPosition}, (get({get({local, geographicMapCellPositionBasicArrayList}), '$class'})):get(get({local, geographicMapCellPositionBasicArrayList}), ((get({get({local, geographicMapCellPositionBasicArrayList}), '$class'})):size(get({local, geographicMapCellPositionBasicArrayList})) - 1))),
            put({local, currentDistance}, (get({get({This, layerDistanceUtil}), '$class'})):getDistanceAt(get({This, layerDistanceUtil}), This, (get({get({local, geographicMapCellPosition}), '$class'})):getMidPoint(get({local, geographicMapCellPosition})))),
            case (get({local, currentDistance}) < get({local, shortestDistance})) of
                true ->
                put({local, shortestDistance}, get({local, currentDistance})),
                put({local, closestIndex}, Index);
                false -> ok
            end
        end, lists:seq(((get({PathsList, '$class'})):size(PathsList) - 1), 0, -1)),
        case (get({local, closestIndex}) >= 0) of
            true ->
            put({local, geographicMapCellPositionBasicArrayList}, (get({PathsList, '$class'})):get(PathsList, get({local, closestIndex}))),
            put({local, geographicMapCellPosition}, (get({get({local, geographicMapCellPositionBasicArrayList}), '$class'})):get(get({local, geographicMapCellPositionBasicArrayList}), 0)),
            (get({This, '$class'})):teleportTo(This, get({local, geographicMapCellPosition}));
            false -> ok
        end.

% throws Exception
init(This, GeographicMapCellHistory, GeographicMapCellPositionBasicArrayList) ->
        (get({GeographicMapCellHistory, '$class'})):trackAll(GeographicMapCellHistory, GeographicMapCellPositionBasicArrayList).

onMovement(This, TrackingEvent) ->
        try
            LayerInterface = (get({TrackingEvent, '$class'})):getLayerInterface(TrackingEvent),
            case (array:get(0, (get({LayerInterface, '$class'})):getGroupInterface(LayerInterface)) =/= array:get(0, (get({This, '$class'})):getGroupInterface(This))) of
                true ->
                (fun(Target_N76312) -> (get({Target_N76312, '$class'})):add(Target_N76312, LayerInterface) end)((fun(Target_N76319) -> (get({Target_N76319, '$class'})):getPossibleTargetList(Target_N76319) end)((get({This, '$class'})):getUnitWaypointBehavior(This))),
                (get({LayerInterface, '$class'})):onMovementFound(LayerInterface, (get({This, '$class'})):getTrackingEvent(This));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "onMovement", E)
        end.

% throws Exception
onMovementFound(This, TrackingEvent) ->
        LayerInterface = (get({TrackingEvent, '$class'})):getLayerInterface(TrackingEvent),
        case (array:get(0, (get({LayerInterface, '$class'})):getGroupInterface(LayerInterface)) =/= array:get(0, (get({This, '$class'})):getGroupInterface(This))) of
            true ->
            (fun(Target_N76674) -> (get({Target_N76674, '$class'})):add(Target_N76674, LayerInterface) end)((fun(Target_N76681) -> (get({Target_N76681, '$class'})):getPossibleTargetList(Target_N76681) end)((get({This, '$class'})):getUnitWaypointBehavior(This)));
            false -> ok
        end.

initRangeHack(This) ->
        BasicWeaponPart = array:get(0, (get({This, '$class'})):getPartInterfaceArray(This)),
        WeaponProperties = (get({BasicWeaponPart, '$class'})):getWeaponProperties(BasicWeaponPart),
        put({This, weaponRange}, (get({WeaponProperties, '$class'})):getRange(WeaponProperties)),
        put({This, initRangeAnimation}, 'AdjustedCircleAnimation':createW(get({This, weaponRange}), get({This, weaponRange}), (get({This, '$class'})):getWidth(This), get({get({This, basicColorFactory}), 'GREEN'}))),
        SensorRange = (get({This, weaponRange}) * get({'UnitLayer', 'SENSOR_RANGE_MULTIPLIER'})),
        put({This, initSensorRangeAnimation}, 'AdjustedCircleAnimation':createW(SensorRange, SensorRange, (get({This, '$class'})):getWidth(This), get({get({This, basicColorFactory}), 'RED'}))),
        (fun(Target_N77228) -> (get({Target_N77228, '$class'})):initRange(Target_N77228, get({This, weaponRange})) end)((get({This, '$class'})):getUnitWaypointBehavior(This)),
        put({get({This, fireTimeHelper}), delay}, (trunc((get({WeaponProperties, '$class'})):getReloadTime(WeaponProperties)))).

% throws Exception
processBuiltTick(This, AllBinaryLayerManager) ->
        case (not (fun(Target_N77350) -> (get({Target_N77350, '$class'})):isAlive(Target_N77350) end)((get({This, '$class'})):getHealthInterface(This))) of
            true ->
            case (get({This, '$class'})):isReadyForExplosion(This) of
                true ->
                CurrentFrame = (get({get({This, destroyAnimationInterface}), '$class'})):getFrame(get({This, destroyAnimationInterface})),
                Size = ((get({get({This, destroyAnimationInterface}), '$class'})):getSize(get({This, destroyAnimationInterface})) - 1),
                case (CurrentFrame =:= Size) of
                    true ->
                    case (not (fun(Target_N77797) -> (get({Target_N77797, '$class'})):isAlive(Target_N77797) end)((get({This, '$class'})):getHealthInterface(This))) of
                        true ->
                        (get({This, '$class'})):setDestroyed(This, true);
                        false -> ok
                    end;
                    false ->
                    (get({get({This, destroyAnimationInterface}), '$class'})):nextFrame(get({This, destroyAnimationInterface}))
                end;
                false ->
                (get({This, '$class'})):setAnimationInterface(This, get({This, destroyAnimationInterface})),
                (fun(Target_N77463) -> (get({Target_N77463, '$class'})):add(Target_N77463, 'ExplosionBasicSound':getInstance()) end)('SecondaryPlayerQueueFactory':getInstance()),
                (get({get({This, shakeListener}), '$class'})):onSmallShakeEvent(get({This, shakeListener})),
                (get({get({This, vibration}), '$class'})):vibrate(get({This, vibration}), get({This, duration}), 0, 0),
                (get({This, '$class'})):setReadyForExplosion(This, true)
            end;
            false ->
            'AdvancedRTSGameLayer':processBuiltTick(This, AllBinaryLayerManager)
        end,
        (get({get({This, captionAnimationHelper}), '$class'})):tick(get({This, captionAnimationHelper})),
        (fun(Target_N77890) -> (get({Target_N77890, '$class'})):processTick(Target_N77890, AllBinaryLayerManager) end)((get({This, '$class'})):getUnitWaypointBehavior(This)).

teleportTo(This, GeographicMapCellPosition) ->
        Point = (get({GeographicMapCellPosition, '$class'})):getMidPoint(GeographicMapCellPosition),
        (get({This, '$class'})):setPosition(This, ((get({Point, '$class'})):getX(Point) - (get({This, '$class'})):getHalfWidth(This)), ((get({Point, '$class'})):getY(Point) - (get({This, '$class'})):getHalfHeight(This)), get({This, z})).

% throws Exception
getCurrentGeographicMapCellPosition(This) ->
        GeographicMapCompositeInterface = get({This, allBinaryGameLayerManagerP}),
        GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
        GeographicMapCellPosition = (get({GeographicMapInterface, '$class'})):getCellPositionAtXY(GeographicMapInterface, (get({This, x}) + (get({This, '$class'})):getHalfWidth(This)), (get({This, y}) + (get({This, '$class'})):getHalfHeight(This))),
        RaceTrackGeographicMap = GeographicMapInterface,
        case (not (get({RaceTrackGeographicMap, '$class'})):isValid(RaceTrackGeographicMap, GeographicMapCellPosition)) of
            true ->
            erlang:error({'Exception', lists:concat(["Position is not really on the map: ", GeographicMapCellPosition])});
            false -> ok
        end,
        GeographicMapCellPosition.

% throws Exception
fire(This, LayerManager, GameKeyEvent) ->
        case (get({get({This, fireTimeHelper}), '$class'})):isTimeTNT(get({This, fireTimeHelper})) of
            true ->
            (get({This, '$class'})):fireAll(This, LayerManager);
            false ->
            (get({This, '$class'})):reload(This)
        end.

% throws Exception
left(This) ->
        (get({get({This, initResourceAnimation}), '$class'})):previousRotation(get({This, initResourceAnimation})),
        (get({get({This, decalAnimation}), '$class'})):previousRotation(get({This, decalAnimation})),
        (get({get({This, rotationAnimationInterfaceP}), '$class'})):previousRotation(get({This, rotationAnimationInterfaceP})).

% throws Exception
right(This) ->
        (get({get({This, initResourceAnimation}), '$class'})):nextRotation(get({This, initResourceAnimation})),
        (get({get({This, decalAnimation}), '$class'})):nextRotation(get({This, decalAnimation})),
        (get({get({This, rotationAnimationInterfaceP}), '$class'})):nextRotation(get({This, rotationAnimationInterfaceP})).

down(This) ->
        VelocityProperties = (fun(Target_N79062) -> (get({Target_N79062, '$class'})):getVelocityProperties(Target_N79062) end)((get({This, '$class'})):getVehicleProperties(This)),
        case (not (get({VelocityProperties, '$class'})):isOverXYMaxForwardVelocity(VelocityProperties)) of
            true ->
            (get({This, '$class'})):accelerate(This, get({This, decelerationBasicDecimal}));
            false -> ok
        end.

up(This) ->
        VelocityProperties = (fun(Target_N79212) -> (get({Target_N79212, '$class'})):getVelocityProperties(Target_N79212) end)((get({This, '$class'})):getVehicleProperties(This)),
        case (not (get({VelocityProperties, '$class'})):isOverXYMaxForwardVelocity(VelocityProperties)) of
            true ->
            (get({This, '$class'})):accelerate(This, get({This, accelerationBasicDecimal}));
            false -> ok
        end.

initInputProcessors(This) ->
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'RIGHT'}), 'SpecialRightGameInputProcessor':new(This), get({This, inputProcessorArray}))),
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'LEFT'}), 'SpecialLeftGameInputProcessor':new(This), get({This, inputProcessorArray}))),
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'KEY_NUM0'}), 'SpecialFireGameInputProcessor':new(This), get({This, inputProcessorArray}))),
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'KEY_POUND'}), array:get(get({'Canvas', 'KEY_NUM0'}), get({This, inputProcessorArray})), get({This, inputProcessorArray}))),
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'DOWN'}), 'SpecialDownGameInputProcessor':new(This), get({This, inputProcessorArray}))),
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'UP'}), 'SpecialUpGameInputProcessor':new(This), get({This, inputProcessorArray}))),
        'AdvancedRTSGameLayer':initInputProcessors(This).

% throws Exception
processInput(This, LayerManager) ->
        List = (get({This, '$class'})):getGameKeyEventList(This),
        Size = (get({List, '$class'})):size(List),
        lists:foreach(fun(Index) ->
            AnyType = (get({List, '$class'})):get(List, Index),
            Key = 'GameKeyEventUtil':getKey(AnyType),
            (fun(Target_N79966) -> (get({Target_N79966, '$class'})):processEvent(Target_N79966, LayerManager, get({'GameKeyEvent', 'NONE'})) end)(array:get(Key, get({This, inputProcessorArray})))
        end, lists:seq(0, Size - 1)),
        (get({List, '$class'})):clear(List),
        (get({This, '$class'})):groundFriction(This),
        (get({This, '$class'})):move(This).

accelerate(This, Accelerate) ->
        (fun(Target_N80211) -> (get({Target_N80211, '$class'})):addVelocityi(Target_N80211, (get({Accelerate, '$class'})):getUnscaled(Accelerate), trunc((fun(Target_N80258) -> (get({Target_N80258, '$class'})):getAngle(Target_N80258) end)((get({get({This, rotationAnimationInterfaceP}), '$class'})):getAngleInfoP(get({This, rotationAnimationInterfaceP})))), 90) end)((fun(Target_N80218) -> (get({Target_N80218, '$class'})):getVelocityProperties(Target_N80218) end)((get({This, '$class'})):getVehicleProperties(This))).

% throws Exception
fireAll(This, LayerManager) ->
        AngleInfo = (get({get({This, rotationAnimationInterfaceP}), '$class'})):getAngleInfoP(get({This, rotationAnimationInterfaceP})),
        Angle = trunc((((get({AngleInfo, '$class'})):getAngle(AngleInfo) + get({This, slightAngle})))),
        (get({get({This, hashtable}), '$class'})):put(get({This, hashtable}), (fun(Target_N80499) -> (get({Target_N80499, '$class'})):getAt(Target_N80499, 1) end)('SmallIntegerSingletonFactory':getInstance()), (fun(Target_N80530) -> (get({Target_N80530, '$class'})):getAt(Target_N80530, trunc((fun(Target_N80558) -> (get({Target_N80558, '$class'})):getValue(Target_N80558) end)((fun(Target_N80565) -> (get({Target_N80565, '$class'})):getAt(Target_N80565, Angle) end)('AngleFactory':getInstance())))) end)('SmallIntegerSingletonFactory':getInstance())),
        SalvoInterface = array:get(0, (get({This, '$class'})):getPartInterfaceArray(This)),
        (get({SalvoInterface, '$class'})):process(SalvoInterface, LayerManager, Angle, 90).

downgrade(This) ->
        case ((get({This, '$class'})):getLevel(This) > 1) of
            true ->
            'AdvancedRTSGameLayer':downgrade(This);
            false -> ok
        end.

upgrade(This) ->
        'AdvancedRTSGameLayer':upgrade(This),
        (get({This, '$class'})):initRangeHack(This).

groundFriction(This) ->
        VehicleFrictionProperties = (fun(Target_N80964) -> (get({Target_N80964, '$class'})):getVehicleFrictionProperties(Target_N80964) end)((get({This, '$class'})):getVehicleProperties(This)),
        (fun(Target_N81002) -> (get({Target_N81002, '$class'})):friction(Target_N81002, (fun(Target_N81030) -> (get({Target_N81030, '$class'})):getVelocityProperties(Target_N81030) end)((get({This, '$class'})):getVehicleProperties(This)), (get({VehicleFrictionProperties, '$class'})):getTireFrictionNominator(VehicleFrictionProperties)) end)((fun(Target_N81009) -> (get({Target_N81009, '$class'})):getVehicleFrictionProperties(Target_N81009) end)((get({This, '$class'})):getVehicleProperties(This))).

% throws Exception
trackTo(This, Reason) when (is_list(Reason) orelse Reason =:= undefined) ->
        WaypointBehaviorBase = get({This, waypointBehaviorBase}),
        NextUnvisitedPathGeographicMapCellPosition = (get({WaypointBehaviorBase, '$class'})):getNextUnvisitedPathGeographicMapCellPosition(WaypointBehaviorBase),
        Point = (get({NextUnvisitedPathGeographicMapCellPosition, '$class'})):getMidPoint(NextUnvisitedPathGeographicMapCellPosition),
        Dx = ((((get({This, '$class'})):getXP(This) + (get({This, '$class'})):getHalfWidth(This))) - (get({Point, '$class'})):getX(Point)),
        Dy = ((((get({This, '$class'})):getYP(This) + (get({This, '$class'})):getHalfHeight(This))) - (get({Point, '$class'})):getY(Point)),
        (get({get({This, rtsLogHelper}), '$class'})):trackTo(get({This, rtsLogHelper}), This, NextUnvisitedPathGeographicMapCellPosition, Dx, Dy, Reason),
        (get({This, '$class'})):trackToDXY(This, Dx, Dy).

% throws Exception
trackToDXY(This, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        AngleOfTarget = 0,
        (get({This, '$class'})):trackToDXYTargetAngle(This, Dx, Dy, AngleOfTarget).

% throws Exception
turnTo(This, Dx, Dy, TargetAngle) when is_integer(Dx), is_integer(Dy), is_integer(TargetAngle) ->
        put({local, targetAngle}, TargetAngle),
        try
        WaypointBehaviorBase = get({This, waypointBehaviorBase}),
        NextUnvisitedPathGeographicMapCellPosition = (get({WaypointBehaviorBase, '$class'})):getNextUnvisitedPathGeographicMapCellPosition(WaypointBehaviorBase),
        put({local, evading}, false),
        case ((fun(Target_N81902) -> (get({Target_N81902, '$class'})):getSensorAction(Target_N81902) end)((get({This, '$class'})):getUnitWaypointBehavior(This)) =:= get({'SensorActionFactory':getInstance(), 'EVADE'})) of
            true ->
            (get({get({This, rtsLogHelper}), '$class'})):evade(get({This, rtsLogHelper}), This),
            put({local, evading}, true),
            put({local, targetAngle}, (get({local, targetAngle}) + 180));
            false -> ok
        end,
        AngleInfo = (get({get({This, rotationAnimationInterfaceP}), '$class'})):getAngleInfoP(get({This, rotationAnimationInterfaceP})),
        Angle = (fun(Target_N82104) -> (get({Target_N82104, '$class'})):adjustAngleToFrameAngle(Target_N82104, ((get({AngleInfo, '$class'})):getAngle(AngleInfo) - 270)) end)('FrameUtil':getInstance()),
        (get({get({This, rtsLogHelper}), '$class'})):turnTo(get({This, rtsLogHelper}), This, Dx, Dy, AngleInfo, Angle, get({This, movementAngle}), get({local, evading}), get({local, targetAngle})),
        GameKeyEventFactory = 'GameKeyEventFactory':getInstance(),
        case ((Dx =:= 0) andalso (Dy =:= 0)) of
            true ->
            (get({get({This, rtsLogHelper}), '$class'})):doneMoving(get({This, rtsLogHelper}), This),
            throw({'$return', true});
            false ->
            case ((trunc((get({get({This, movementAngle}), '$class'})):getValue(get({This, movementAngle})))) =:= Angle) of
            true ->
            case ((Dx > 0) andalso (get({This, movementAngle}) =:= get({get({This, angleFactory}), 'LEFT'}))) of
                true ->
                (get({get({This, rtsLogHelper}), '$class'})):movingLeft(get({This, rtsLogHelper}), This),
                throw({'$return', false});
                false -> ok
            end,
            case ((Dx < 0) andalso (get({This, movementAngle}) =:= get({get({This, angleFactory}), 'RIGHT'}))) of
                true ->
                (get({get({This, rtsLogHelper}), '$class'})):movingRight(get({This, rtsLogHelper}), This),
                throw({'$return', false});
                false -> ok
            end,
            case ((Dy > 0) andalso (get({This, movementAngle}) =:= get({get({This, angleFactory}), 'UP'}))) of
                true ->
                (get({get({This, rtsLogHelper}), '$class'})):movingUp(get({This, rtsLogHelper}), This),
                throw({'$return', false});
                false -> ok
            end,
            case ((Dy < 0) andalso (get({This, movementAngle}) =:= get({get({This, angleFactory}), 'DOWN'}))) of
                true ->
                (get({get({This, rtsLogHelper}), '$class'})):movingDown(get({This, rtsLogHelper}), This),
                throw({'$return', false});
                false -> ok
            end,
            (get({get({This, rtsLogHelper}), '$class'})):currentMoveEnded(get({This, rtsLogHelper}), This),
            case ((get({This, movementAngle}) =:= get({get({This, angleFactory}), 'LEFT'})) orelse (get({This, movementAngle}) =:= get({get({This, angleFactory}), 'RIGHT'}))) of
                true ->
                (get({This, '$class'})):handleDeltalY(This, Dx, Dy);
                false ->
                case ((get({This, movementAngle}) =:= get({get({This, angleFactory}), 'UP'})) orelse (get({This, movementAngle}) =:= get({get({This, angleFactory}), 'DOWN'}))) of
                true ->
                (get({This, '$class'})):handleDeltalX(This, Dx, Dy);
                false -> ok
            end
            end,
            throw({'$return', true});
            false ->
            case (NextUnvisitedPathGeographicMapCellPosition =/= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) of
                true ->
                case (get({This, steeringInsideGeographicMapCellPosition}) =/= NextUnvisitedPathGeographicMapCellPosition) of
                    true ->
                    case ((erlang:abs(Dx) > erlang:abs(Dy)) andalso (Dy =/= 0)) of
                        true ->
                        (get({This, '$class'})):handleDeltalY(This, Dx, Dy);
                        false ->
                        case (Dx =/= 0) of
                        true ->
                        (get({This, '$class'})):handleDeltalX(This, Dx, Dy);
                        false ->
                        (get({This, '$class'})):handleDeltalY(This, Dx, Dy)
                    end
                    end;
                    false -> ok
                end,
                DeltaAngle2 = ((get({get({This, movementAngle}), '$class'})):getValue(get({This, movementAngle})) - Angle),
                case (DeltaAngle2 > 0) of
                    true ->
                    (get({get({This, rtsLogHelper}), '$class'})):rotateRight(get({This, rtsLogHelper}), This),
                    (fun(Target_N82953) -> (get({Target_N82953, '$class'})):add(Target_N82953, (get({GameKeyEventFactory, '$class'})):getInstanceForKey(GameKeyEventFactory, This, get({'Canvas', 'RIGHT'}))) end)((get({This, '$class'})):getGameKeyEventList(This));
                    false ->
                    (get({get({This, rtsLogHelper}), '$class'})):rotateLeft(get({This, rtsLogHelper}), This),
                    (fun(Target_N82853) -> (get({Target_N82853, '$class'})):add(Target_N82853, (get({GameKeyEventFactory, '$class'})):getInstanceForKey(GameKeyEventFactory, This, get({'Canvas', 'LEFT'}))) end)((get({This, '$class'})):getGameKeyEventList(This))
                end,
                throw({'$return', true});
                false ->
                (get({get({This, rtsLogHelper}), '$class'})):noRotation(get({This, rtsLogHelper}), This)
            end,
            throw({'$return', false})
        end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

handleDeltalX(This, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        WaypointBehaviorBase = get({This, waypointBehaviorBase}),
        NextUnvisitedPathGeographicMapCellPosition = (get({WaypointBehaviorBase, '$class'})):getNextUnvisitedPathGeographicMapCellPosition(WaypointBehaviorBase),
        case (Dx > 0) of
            true ->
            put({This, movementAngle}, get({get({This, angleFactory}), 'LEFT'})),
            put({This, steeringInsideGeographicMapCellPosition}, NextUnvisitedPathGeographicMapCellPosition);
            false ->
            put({This, movementAngle}, get({get({This, angleFactory}), 'RIGHT'})),
            put({This, steeringInsideGeographicMapCellPosition}, NextUnvisitedPathGeographicMapCellPosition)
        end,
        (get({get({This, rtsLogHelper}), '$class'})):handle(get({This, rtsLogHelper}), This, get({This, movementAngle})).

handleDeltalY(This, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        WaypointBehaviorBase = get({This, waypointBehaviorBase}),
        NextUnvisitedPathGeographicMapCellPosition = (get({WaypointBehaviorBase, '$class'})):getNextUnvisitedPathGeographicMapCellPosition(WaypointBehaviorBase),
        case (Dy > 0) of
            true ->
            put({This, movementAngle}, get({get({This, angleFactory}), 'UP'})),
            put({This, steeringInsideGeographicMapCellPosition}, NextUnvisitedPathGeographicMapCellPosition);
            false ->
            put({This, movementAngle}, get({get({This, angleFactory}), 'DOWN'})),
            put({This, steeringInsideGeographicMapCellPosition}, NextUnvisitedPathGeographicMapCellPosition)
        end,
        (get({get({This, rtsLogHelper}), '$class'})):handle(get({This, rtsLogHelper}), This, get({This, movementAngle})).

% throws Exception
trackToDXYTargetAngle(This, Dx, Dy, TargetAngle) when is_integer(Dx), is_integer(Dy), is_integer(TargetAngle) ->
        List = (fun(Target_N84675) -> (get({Target_N84675, '$class'})):getSteeringVisitorList(Target_N84675) end)((get({This, '$class'})):getUnitWaypointBehavior(This)),
        case ((get({List, '$class'})):size(List) > 0) of
            true ->
            lists:foreach(fun(Index) ->
                SteeringVisitor = (get({List, '$class'})):get(List, Index),
                AnyType = (get({SteeringVisitor, '$class'})):visit(SteeringVisitor, This),
                case (AnyType =:= undefined) of
                    true ->
                    (get({List, '$class'})):removeAt(List, Index);
                    false -> ok
                end
            end, lists:seq(((get({List, '$class'})):size(List) - 1), 0, -1)),
            (get({This, '$class'})):fireOrMove(This);
            false ->
            case (not (get({This, '$class'})):turnTo(This, Dx, Dy, TargetAngle)) of
            true ->
            (get({This, '$class'})):fireOrMove(This);
            false -> ok
        end
        end.

% throws Exception
fireOrMove(This) ->
        GameKeyEventFactory = 'GameKeyEventFactory':getInstance(),
        case (fun(Target_N85314) -> (get({Target_N85314, '$class'})):needToMove(Target_N85314) end)((get({This, '$class'})):getUnitWaypointBehavior(This)) of
            true ->
            (get({get({This, rtsLayer2LogHelper}), '$class'})):steeringUp(get({This, rtsLayer2LogHelper}), This),
            case (get({This, showMoreCaptionStates}) andalso (not (get({get({This, captionAnimationHelper}), '$class'})):isShowing(get({This, captionAnimationHelper})))) of
                true ->
                (get({get({This, captionAnimationHelper}), '$class'})):update(get({This, captionAnimationHelper}), get({'UnitLayer', 'MOVE'}), get({get({This, basicColorFactory}), 'GREEN'}));
                false -> ok
            end,
            (fun(Target_N85716) -> (get({Target_N85716, '$class'})):add(Target_N85716, (get({GameKeyEventFactory, '$class'})):getInstanceForKey(GameKeyEventFactory, This, get({'Canvas', 'UP'}))) end)((get({This, '$class'})):getGameKeyEventList(This));
            false ->
            (get({get({This, captionAnimationHelper}), '$class'})):update(get({This, captionAnimationHelper}), get({'CommonPhoneStrings':getInstance(), 'FIRE'}), get({get({This, basicColorFactory}), 'RED'})),
            (get({get({This, rtsLayer2LogHelper}), '$class'})):steeringFireOrStop(get({This, rtsLayer2LogHelper}), This),
            (get({This, '$class'})):allStop(This),
            (fun(Target_N85462) -> (get({Target_N85462, '$class'})):add(Target_N85462, (get({GameKeyEventFactory, '$class'})):getInstanceForKey(GameKeyEventFactory, This, get({'Canvas', 'KEY_NUM0'}))) end)((get({This, '$class'})):getGameKeyEventList(This)),
            (fun(Target_N85526) -> (get({Target_N85526, '$class'})):fireEvent(Target_N85526, (get({This, '$class'})):getTrackingEvent(This)) end)('TrackingEventHandler':getInstance())
        end.

move(This) ->
        try
            VelocityProperties = (fun(Target_N85846) -> (get({Target_N85846, '$class'})):getVelocityProperties(Target_N85846) end)((get({This, '$class'})):getVehicleProperties(This)),
            VelocityXScaled = trunc((fun(Target_N85902) -> (get({Target_N85902, '$class'})):getScaled(Target_N85902) end)((get({VelocityProperties, '$class'})):getVelocityXBasicDecimalP(VelocityProperties))),
            VelocityYScaled = trunc((fun(Target_N85964) -> (get({Target_N85964, '$class'})):getScaled(Target_N85964) end)((get({VelocityProperties, '$class'})):getVelocityYBasicDecimalP(VelocityProperties))),
            (fun(Target_N86008) -> (get({Target_N86008, '$class'})):move(Target_N86008) end)((get({This, '$class'})):getUnitWaypointBehavior(This)),
            case ((VelocityXScaled =/= 0) orelse (VelocityYScaled =/= 0)) of
                true ->
                (fun(Target_N86078) -> (get({Target_N86078, '$class'})):setMoving(Target_N86078, true) end)((get({This, '$class'})):getUnitWaypointBehavior(This)),
                GeographicMapCompositeInterface = get({This, allBinaryGameLayerManagerP}),
                GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
                (get({get({This, layerPartialCellPositionsUtil}), '$class'})):getAllDXY(get({This, layerPartialCellPositionsUtil}), GeographicMapInterface, This, VelocityXScaled, VelocityYScaled, 'UnitLayer':getPartialpositionlist()),
                CellPosition = (fun(Target_N86326) -> (get({Target_N86326, '$class'})):getCellPositionWithDrop(Target_N86326, 'UnitLayer':getPartialpositionlist()) end)('DropCellPositionHistory':getInstance()),
                case (CellPosition =:= get({get({This, cellPositionFactory}), 'NONE'})) of
                    true ->
                    TiledLayer = (get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface),
                    TiledLayerUtil = 'TiledLayerUtil':getInstance(),
                    put({local, x}, (get({This, x}) + VelocityXScaled)),
                    put({local, y}, (get({This, y}) + VelocityYScaled)),
                    put({local, x}, (get({TiledLayerUtil, '$class'})):keepOnMapX(TiledLayerUtil, TiledLayer, get({local, x}), (get({This, '$class'})):getWidth(This))),
                    put({local, y}, (get({TiledLayerUtil, '$class'})):keepOnMapY(TiledLayerUtil, TiledLayer, get({local, y}), (get({This, '$class'})):getHeight(This))),
                    (get({This, '$class'})):setPosition(This, get({local, x}), get({local, y}), get({This, z}));
                    false ->
                    AllbinaryLayer = (fun(Target_N86456) -> (get({Target_N86456, '$class'})):getLayerInterface(Target_N86456, CellPosition) end)('DropCellPositionHistory':getInstance()),
                    (fun(Target_N86510) -> (get({Target_N86510, '$class'})):setMovingFromStopped(Target_N86510, false) end)((get({This, '$class'})):getUnitWaypointBehavior(This)),
                    (fun(Target_N86540) -> (get({Target_N86540, '$class'})):addBuildingChase(Target_N86540, AllbinaryLayer, CellPosition) end)((get({This, '$class'})):getUnitWaypointBehavior(This))
                end;
                false -> ok
            end,
            case (fun(Target_N86976) -> (get({Target_N86976, '$class'})):isMoving(Target_N86976) end)((get({This, '$class'})):getUnitWaypointBehavior(This)) of
                true ->
                (fun(Target_N87040) -> (get({Target_N87040, '$class'})):fireEvent(Target_N87040, (get({This, '$class'})):getTrackingEvent(This)) end)('TrackingEventHandler':getInstance());
                false ->
                (fun(Target_N87003) -> (get({Target_N87003, '$class'})):setMovingFromStopped(Target_N87003, false) end)((get({This, '$class'})):getUnitWaypointBehavior(This))
            end,
            case ((fun(Target_N87093) -> (get({Target_N87093, '$class'})):isMovingFromStopped(Target_N87093) end)((get({This, '$class'})):getUnitWaypointBehavior(This)) andalso (get({This, '$class'})):isVisible(This)) of
                true ->
                (fun(Target_N87132) -> (get({Target_N87132, '$class'})):add(Target_N87132, get({This, moveSoundInterface})) end)('SecondaryPlayerQueueFactory':getInstance());
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "move", E)
        end.

allStop(This) ->
        VelocityProperties = (fun(Target_N87322) -> (get({Target_N87322, '$class'})):getVelocityProperties(Target_N87322) end)((get({This, '$class'})):getVehicleProperties(This)),
        (fun(Target_N87360) -> (get({Target_N87360, '$class'})):setint(Target_N87360, 0) end)((get({VelocityProperties, '$class'})):getVelocityXBasicDecimalP(VelocityProperties)),
        (fun(Target_N87395) -> (get({Target_N87395, '$class'})):setint(Target_N87395, 0) end)((get({VelocityProperties, '$class'})):getVelocityYBasicDecimalP(VelocityProperties)).

paint(This, Graphics) ->
        case (get({This, '$class'})):isVisible(This) of
            true ->
            'AdvancedRTSGameLayer':paint(This, Graphics),
            ViewPosition = (get({This, '$class'})):getViewPosition(This),
            ViewX = (get({ViewPosition, '$class'})):getX(ViewPosition),
            ViewY = (get({ViewPosition, '$class'})):getY(ViewPosition),
            (get({get({This, decalAnimation}), '$class'})):paintXY(get({This, decalAnimation}), Graphics, ViewX, ViewY),
            (get({get({This, rangeAnimation}), '$class'})):paintXY(get({This, rangeAnimation}), Graphics, ViewX, ViewY),
            (get({get({This, sensorRangeAnimation}), '$class'})):paintXY(get({This, sensorRangeAnimation}), Graphics, ViewX, ViewY),
            (get({get({This, damageFloatersPaintableInterface}), '$class'})):paint(get({This, damageFloatersPaintableInterface}), Graphics),
            (get({get({This, healthBar}), '$class'})):paint(get({This, healthBar}), Graphics),
            (get({get({This, captionAnimationHelper}), '$class'})):paintXY(get({This, captionAnimationHelper}), Graphics, ViewX, ViewY),
            (get({get({This, pathAnimation}), '$class'})):paintXY(get({This, pathAnimation}), Graphics, ViewX, ViewY),
            (get({get({This, resourceAnimation}), '$class'})):paintXY(get({This, resourceAnimation}), Graphics, ViewX, ViewY);
            false -> ok
        end.

% throws Exception
onBuildingEvent(This, Event) ->
        BuildingLayer = (get({Event, '$class'})):getRtsLayer(Event),
        (fun(Target_N88120) -> (get({Target_N88120, '$class'})):moveAwayFromBuilding(Target_N88120, BuildingLayer) end)((get({This, '$class'})):getUnitWaypointBehavior(This)).

getVehicleProperties(This) ->
        get({This, vehicleProperties}).

% throws Exception
damage(This, Damage, DamageType) when is_integer(Damage), is_integer(DamageType) ->
        'AdvancedRTSGameLayer':damage(This, Damage, DamageType),
        (get({get({This, damageFloaters}), '$class'})):add(get({This, damageFloaters}), Damage),
        case (Damage > 0) of
            true ->
            (fun(Target_N88367) -> (get({Target_N88367, '$class'})):damage(Target_N88367, Damage) end)((get({This, '$class'})):getHealthInterface(This));
            false -> ok
        end.

% throws Exception
getDamage(This, DamageType) when is_integer(DamageType) ->
        0.

% throws Exception
setDestroyed(This, Destroyed) when is_boolean(Destroyed) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "setDestroyed"),
        'AdvancedRTSGameLayer':setDestroyed(This, Destroyed),
        case (get({This, '$class'})):isDestroyed(This) of
            true ->
            (fun(Target_N88670) -> (get({Target_N88670, '$class'})):removeListener(Target_N88670, (get({This, '$class'})):getUnitWaypointBehavior(This)) end)('WaypointEventHandlerFactory':getInstance(array:get(0, (get({This, '$class'})):getGroupInterface(This)))),
            (fun(Target_N88734) -> (get({Target_N88734, '$class'})):removeListener(Target_N88734, This) end)('TrackingEventHandler':getInstance()),
            (fun(Target_N88768) -> (get({Target_N88768, '$class'})):removeListener(Target_N88768, This) end)('BuildingEventHandler':getInstance()),
            case (not (fun(Target_N88806) -> (get({Target_N88806, '$class'})):isAlive(Target_N88806) end)((get({This, '$class'})):getHealthInterface(This))) of
                true ->
                Damage = (fun(Target_N88849) -> (get({Target_N88849, '$class'})):getMaxHealth(Target_N88849) end)((get({This, '$class'})):getHealthInterface(This)),
                case (Damage > 10) of
                    true ->
                    (fun(Target_N88908) -> (get({Target_N88908, '$class'})):add(Target_N88908, 'ExplosionBasicSound':getInstance()) end)('SecondaryPlayerQueueFactory':getInstance()),
                    case (Damage < 100) of
                        true ->
                        (get({get({This, shakeListener}), '$class'})):onSmallShakeEvent(get({This, shakeListener})),
                        (get({get({This, vibration}), '$class'})):vibrate(get({This, vibration}), get({This, duration}), 0, 0);
                        false ->
                        case (Damage < 1000) of
                        true ->
                        (get({get({This, shakeListener}), '$class'})):onMediumShakeEvent(get({This, shakeListener})),
                        (get({get({This, vibration}), '$class'})):vibrate(get({This, vibration}), (get({This, duration}) * 2), 0, 0);
                        false ->
                        case (Damage < 3000) of
                        true ->
                        (get({get({This, shakeListener}), '$class'})):onLargeShakeEvent(get({This, shakeListener})),
                        (get({get({This, vibration}), '$class'})):vibrate(get({This, vibration}), (get({This, duration}) * 4), 0, 0);
                        false -> ok
                    end
                    end
                    end;
                    false -> ok
                end;
                false -> ok
            end;
            false -> ok
        end.

getLoad(This) ->
        get({This, resourceLoad}).

% throws Exception
clearResourceAnimation(This) ->
        put({This, resourceAnimation}, (fun(Target_N89403) -> (get({Target_N89403, '$class'})):getInstance(Target_N89403, 0) end)('NullIndexedAnimationFactory':getFactoryInstance())).

% throws Exception
setLoad(This, Resource) when is_integer(Resource) ->
        case (Resource > 0) of
            true ->
            put({This, resourceAnimation}, get({This, initResourceAnimation}));
            false ->
            (get({This, '$class'})):clearResourceAnimation(This)
        end,
        put({This, resourceLoad}, Resource).

addLoad(This, Resource) when is_integer(Resource) ->
        put({This, resourceLoad}, (get({This, resourceLoad}) + Resource)).

% throws Exception
handleCost(This, OwnerLayer) ->
        case ((get({This, '$class'})):getLoad(This) > 0) of
            true ->
            (get({get({This, 'CAPITAL_EVENT'}), '$class'})):setValue(get({This, 'CAPITAL_EVENT'}), (get({This, '$class'})):getLoad(This)),
            (fun(Target_N89858) -> (get({Target_N89858, '$class'})):fireEvent(Target_N89858, get({This, 'CAPITAL_EVENT'})) end)('CapitalEventHandlerFactory':getInstance(array:get(0, (get({OwnerLayer, '$class'})):getGroupInterface(OwnerLayer)))),
            (get({This, '$class'})):setLoad(This, 0);
            false -> ok
        end.

createHudPaintable(This) ->
        RtsLayerHudPaintable = 'RTSLayerHudPaintable':getInstance(),
        (get({RtsLayerHudPaintable, '$class'})):setBasicColorP(RtsLayerHudPaintable, (get({get({This, allBinaryGameLayerManagerP}), '$class'})):getForegroundBasicColor(get({This, allBinaryGameLayerManagerP}))),
        (get({RtsLayerHudPaintable, '$class'})):setRtsLayer(RtsLayerHudPaintable, This),
        RtsLayerHudPaintable.

getHudPaintable(This) ->
        RtsLayerHudPaintable = 'RTSLayerHudPaintable':getInstance(),
        RtsLayerHudPaintable.

getType(This) ->
        'UnitLayer':getStaticType().

getStaticType() ->
        1.

getUnitWaypointBehavior(This) ->
        (get({This, '$class'})):getWaypointBehavior(This).

getTrackingEvent(This) ->
        get({This, trackingEvent}).

getCaptionAnimationHelper(This) ->
        get({This, captionAnimationHelper}).

isSelfUpgradeable(This) ->
        false.

getMaxResourceLoad(This) ->
        get({This, maxResourceLoad}).

getPartialpositionlist() ->
        get({'UnitLayer', partialPositionList}).

