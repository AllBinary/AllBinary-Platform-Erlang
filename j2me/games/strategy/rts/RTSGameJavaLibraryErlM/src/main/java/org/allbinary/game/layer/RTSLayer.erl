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
% package org.allbinary.game.layer
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.input.form.RTSFormInput
% import org.allbinary.game.multiplayer.layer.MultiPlayerGameLayer
% import org.allbinary.animation.Animation
% import org.allbinary.animation.AnimationInterfaceFactoryInterface
% import org.allbinary.animation.IndexedAnimation
% import org.allbinary.animation.NullAnimationFactory
% import org.allbinary.animation.NullIndexedAnimationFactory
% import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface
% import org.allbinary.animation.RotationAnimation
% import org.allbinary.animation.caption.CaptionAnimationHelperBase
% import org.allbinary.game.combat.destroy.DestroyedLayerProcessor
% import org.allbinary.game.health.Health
% import org.allbinary.game.identification.Group
% import org.allbinary.game.identification.GroupFactory
% import org.allbinary.game.input.GameInputInterface
% import org.allbinary.game.input.GameInputProcessor
% import org.allbinary.game.input.GameInputProcessorUtil
% import org.allbinary.game.input.GameKeyEventSourceInterface
% import org.allbinary.game.input.InputFactory
% import org.allbinary.game.input.form.NullRTSFormInputFactory
% import org.allbinary.game.layer.waypoint.Waypoint2LogHelper
% import org.allbinary.game.layer.waypoint.WaypointLogHelper
% import org.allbinary.game.layer.waypoint.WaypointRunnableLogHelper
% import org.allbinary.game.tick.TickableInterface
% import org.allbinary.game.tracking.TrackingEvent
% import org.allbinary.game.view.TileLayerPositionIntoViewPosition
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.RectangleFactory
% import org.allbinary.graphics.form.ScrollSelectionForm
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.view.event.ViewPositionEventHandler
% import org.allbinary.game.multiplayer.layer.RemoteInfo
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.math.LayerDistanceUtil
% import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.view.ViewPositionBase

-module('RTSLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements TickableInterface
% implements GameInputInterface
% implements GameKeyEventSourceInterface
% implements RTSInterface
% implements PathFindingLayerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('MultiPlayerGameLayer', Function, Arguments).

static_init() ->
    put({?MODULE, id}, 0),
    put({?MODULE, 'MAIN_INDEX'}, 0),
    put({?MODULE, 'SECONDARY_INDEX'}, 1),
    ok.

init_fields(This) ->
    put({This, debug}, true),
    put({This, showMoreCaptionStates}, get({This, debug})),
    put({This, inputProcessorArray}, array:new(get({'InputFactory':getInstance(), 'MAX'}), {default, undefined})),
    put({This, rtsLayer2LogHelper}, 'RTSLayer2LogHelper':getInstance()),
    put({This, waypointLogHelperP}, 'WaypointLogHelper':getInstance()),
    put({This, waypoint2LogHelperP}, 'Waypoint2LogHelper':getInstance()),
    put({This, waypointRunnableLogHelperP}, 'WaypointRunnableLogHelper':getInstance()),
    put({This, rtsFormInput}, undefined),
    put({This, verticleBuildAnimationInterface}, undefined),
    put({This, rangeAnimation}, undefined),
    put({This, initRangeAnimation}, undefined),
    put({This, sensorRangeAnimation}, undefined),
    put({This, initSensorRangeAnimation}, undefined),
    put({This, baseAnimationInterface}, undefined),
    put({This, buildFrameTimeHelper}, 'TimeDelayHelper':new(50)),
    put({This, buildAnimationInterface}, undefined),
    put({This, animationInterface}, undefined),
    put({This, initAnimationInterface}, undefined),
    put({This, indexedButShouldBeRotationAnimationInterface}, undefined),
    put({This, emptyAnimationInterface}, undefined),
    put({This, destroyAnimationInterface}, undefined),
    put({This, fireTimeHelper}, 'TimeDelayHelper':new(700)),
    put({This, rootName}, undefined),
    put({This, hashtable}, (fun(Target_N68306) -> (get({Target_N68306, '$class'})):createHashtable(Target_N68306) end)('StdUtil':getInstance())),
    put({This, 'BUILD_VALUE'}, 63),
    put({This, geographicMapCellPositionAreaBase}, undefined),
    put({This, healthInterface}, get({'Health', 'NULL_HEALTH'})),
    put({This, level}, 1),
    put({This, maxLevel}, 1),
    put({This, hackVerticleBuild}, get({This, 'BUILD_VALUE'})),
    put({This, slightAngle}, 0),
    put({This, percentCompleteP}, 0),
    put({This, destroyed}, false),
    put({This, selected}, false),
    put({This, rtsLayerUtil}, 'RTSLayerUtil':getInstance()),
    put({This, layerDistanceUtil}, 'LayerDistanceUtil':getInstance()),
    ok.


% throws Exception
createSimulatedInstance(RemoteInfo) ->
        NullAnimationInterfaceFactoryInterface = 'NullAnimationFactory':getFactoryInstance(),
        NullIndexedAnimationInterfaceFactoryInterface = 'NullIndexedAnimationFactory':getFactoryInstance(),
        'RTSLayer':new(get({'RemoteInfo', 'REMOTE_INFO'}), get({'GroupFactory':getInstance(), 'NULL_GROUP_ARRAY'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Health', 'NULL_HEALTH'}), 'NullRTSFormInputFactory':getInstance(), NullAnimationInterfaceFactoryInterface, NullIndexedAnimationInterfaceFactoryInterface, NullAnimationInterfaceFactoryInterface, NullAnimationInterfaceFactoryInterface, NullIndexedAnimationInterfaceFactoryInterface, 'NullIndexedAnimationFactory':getFactoryInstance(), get({'RectangleFactory', 'SINGLETON'}), 0, 0, 'TileLayerPositionIntoViewPosition':new()).

new(RemoteInfo, GroupInterface, RootName, Name, HealthInterface, RtsFormInput, AnimationInterfaceFactoryInterface, EmptyAnimationInterfaceFactoryInterface, BaseAnimationInterfaceFactoryInterface, BuildAnimationInterfaceFactoryInterface, VerticleBuildAnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, X, Y, ViewPosition) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), (is_list(RootName) orelse RootName =:= undefined), (is_list(Name) orelse Name =:= undefined), is_integer(X), is_integer(Y) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, RemoteInfo, GroupInterface, RootName, Name, HealthInterface, RtsFormInput, AnimationInterfaceFactoryInterface, EmptyAnimationInterfaceFactoryInterface, BaseAnimationInterfaceFactoryInterface, BuildAnimationInterfaceFactoryInterface, VerticleBuildAnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, X, Y, ViewPosition),
    This.

'$init'(This, RemoteInfo, GroupInterface, RootName, Name, HealthInterface, RtsFormInput, AnimationInterfaceFactoryInterface, EmptyAnimationInterfaceFactoryInterface, BaseAnimationInterfaceFactoryInterface, BuildAnimationInterfaceFactoryInterface, VerticleBuildAnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, X, Y, ViewPosition) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), (is_list(RootName) orelse RootName =:= undefined), (is_list(Name) orelse Name =:= undefined), is_integer(X), is_integer(Y) ->
        'MultiPlayerGameLayer':'$init'(This, RemoteInfo, GroupInterface, Name, Rectangle, ViewPosition),
        init_fields(This),
        (get({This, '$class'})):initInputProcessors(This),
        put({This, rootName}, RootName),
        put({This, healthInterface}, HealthInterface),
        put({This, rtsFormInput}, RtsFormInput),
        (get({This, '$class'})):setPosition(This, X, Y, get({This, z})),
        put({This, verticleBuildAnimationInterface}, (get({VerticleBuildAnimationInterfaceFactoryInterface, '$class'})):getInstance(VerticleBuildAnimationInterfaceFactoryInterface, 0)),
        put({This, buildAnimationInterface}, (get({BuildAnimationInterfaceFactoryInterface, '$class'})):getInstance(BuildAnimationInterfaceFactoryInterface, 0)),
        put({This, baseAnimationInterface}, (get({BaseAnimationInterfaceFactoryInterface, '$class'})):getInstance(BaseAnimationInterfaceFactoryInterface, 0)),
        put({This, emptyAnimationInterface}, (get({EmptyAnimationInterfaceFactoryInterface, '$class'})):getInstance(EmptyAnimationInterfaceFactoryInterface, 0)),
        put({This, indexedButShouldBeRotationAnimationInterface}, (get({AnimationInterfaceFactoryInterface, '$class'})):getInstance(AnimationInterfaceFactoryInterface, 0)),
        put({This, initAnimationInterface}, get({This, indexedButShouldBeRotationAnimationInterface})),
        put({This, destroyAnimationInterface}, (get({ProceduralAnimationInterfaceFactoryInterface, '$class'})):getInstanceAnimation(ProceduralAnimationInterfaceFactoryInterface, get({This, indexedButShouldBeRotationAnimationInterface}))),
        Animation = (fun(Target_N69379) -> (get({Target_N69379, '$class'})):getInstance(Target_N69379, 0) end)('NullAnimationFactory':getFactoryInstance()),
        put({This, rangeAnimation}, Animation),
        put({This, initRangeAnimation}, Animation),
        put({This, sensorRangeAnimation}, Animation),
        put({This, initSensorRangeAnimation}, Animation),
        put({This, animationInterface}, get({This, initAnimationInterface})),
        put({This, geographicMapCellPositionAreaBase}, 'GeographicMapCellPositionArea':new(This)).

% throws Exception
setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager) ->
        'MultiPlayerGameLayer':setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager),
        GeographicMapCompositeInterface = get({This, allBinaryGameLayerManagerP}),
        GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
        TiledLayer = (get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface),
        ViewPosition2 = (get({This, '$class'})):getViewPosition(This),
        (get({ViewPosition2, '$class'})):setTiledLayer(ViewPosition2, TiledLayer),
        (get({This, '$class'})):updateWaypointBehavior(This, GeographicMapInterface).

% throws Exception
updateWaypointBehavior(This, GeographicMapInterface) ->
        (get({get({This, geographicMapCellPositionAreaBase}), '$class'})):update(get({This, geographicMapCellPositionAreaBase}), GeographicMapInterface).

% throws Exception
construct(This, RtsPlayerLayerInterface) ->
        (fun(Target_N70503) -> (get({Target_N70503, '$class'})):addListener(Target_N70503, This) end)('ViewPositionEventHandler':getInstance()),
        put({This, animationInterface}, get({This, buildAnimationInterface})),
        put({This, hackVerticleBuild}, 0).

select(This) ->
        put({This, rangeAnimation}, get({This, initRangeAnimation})),
        put({This, sensorRangeAnimation}, get({This, initSensorRangeAnimation})),
        (get({This, '$class'})):setSelected(This, true).

deselect(This) ->
        Animation = (fun(Target_N70795) -> (get({Target_N70795, '$class'})):getInstance(Target_N70795, 0) end)('NullAnimationFactory':getFactoryInstance()),
        put({This, rangeAnimation}, Animation),
        put({This, sensorRangeAnimation}, Animation),
        (get({This, '$class'})):setSelected(This, false).

setSelected(This, Selected) when is_boolean(Selected) ->
        put({This, selected}, Selected).

isSelected(This) ->
        get({This, selected}).

getPercentComplete(This) ->
        get({This, percentCompleteP}).

getScrollSelectionForm(This) ->
        'ScrollSelectionForm':getNullScrollSelectionForm().

initInputProcessors(This) ->
        'GameInputProcessorUtil':init(get({This, inputProcessorArray})).

% throws Exception
processBuiltTick(This, AllBinaryLayerManager) ->
        put({This, animationInterface}, get({This, indexedButShouldBeRotationAnimationInterface})).

processTick(This, AllBinaryLayerManager) ->
        try
            case (get({This, '$class'})):isCompleted(This) of
                true ->
                (get({This, '$class'})):processBuiltTick(This, AllBinaryLayerManager);
                false ->
                (get({This, '$class'})):build(This)
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "processTick", E)
        end.

% throws Exception
processInput(This, LayerManager) ->
        ok.

reload(This) ->
        ok.

onMovement(This, TrackingEvent) ->
        ok.

% throws Exception
onMovementFound(This, TrackingEvent) ->
        ok.

paint(This, Graphics) ->
        'MultiPlayerGameLayer':paintFirst(This, Graphics),
        ViewPosition = (get({This, '$class'})):getViewPosition(This),
        ViewX = (get({ViewPosition, '$class'})):getX(ViewPosition),
        ViewY = (get({ViewPosition, '$class'})):getY(ViewPosition),
        (fun(Target_N71931) -> (get({Target_N71931, '$class'})):paintXY(Target_N71931, Graphics, ViewX, ViewY) end)((get({This, '$class'})):getAnimationInterface(This)).

% throws Exception
damage(This, Damage, DamageType) when is_integer(Damage), is_integer(DamageType) ->
        ok.

getSourceId(This) ->
        get({'RTSLayer', id}).

downgrade(This) ->
        (get({get({This, rtsLayerUtil}), '$class'})):downgrade(get({This, rtsLayerUtil}), This).

upgrade(This) ->
        (get({get({This, rtsLayerUtil}), '$class'})):upgrade(get({This, rtsLayerUtil}), This).

isCompleted(This) ->
        try
        case (get({This, hackVerticleBuild}) < get({This, 'BUILD_VALUE'})) of
            true ->
            throw({'$return', false});
            false ->
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
build(This) ->
        case (get({get({This, buildFrameTimeHelper}), '$class'})):isTimeTNT(get({This, buildFrameTimeHelper})) of
            true ->
            put({This, animationInterface}, get({This, buildAnimationInterface})),
            (get({get({This, verticleBuildAnimationInterface}), '$class'})):nextFrame(get({This, verticleBuildAnimationInterface})),
            put({This, hackVerticleBuild}, get({This, hackVerticleBuild}) + 1);
            false -> ok
        end,
        put({This, percentCompleteP}, ((100 * get({This, hackVerticleBuild})) div get({This, 'BUILD_VALUE'}))),
        (fun(Target_N72629) -> (get({Target_N72629, '$class'})):updateInfo(Target_N72629) end)((get({This, '$class'})):getHudPaintable(This)).

isSelfUpgradeable(This) ->
        true.

getCost(This) ->
        (get({get({This, rtsLayerUtil}), '$class'})):getCost(get({This, rtsLayerUtil}), This).

getDowngradeCost(This) ->
        (get({get({This, rtsLayerUtil}), '$class'})):getDowngradeCost(get({This, rtsLayerUtil}), This).

getUpgradeCost(This) ->
        (get({get({This, rtsLayerUtil}), '$class'})):getUpgradeCost(get({This, rtsLayerUtil}), This).

isUpgradeable(This) ->
        try
        case ((get({This, '$class'})):getLevel(This) < (get({This, '$class'})):getMaxLevel(This)) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isDowngradeable(This) ->
        try
        case ((get({This, '$class'})):getLevel(This) > 1) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getLevel(This) ->
        get({This, level}).

setLevel(This, Level) when is_integer(Level) ->
        put({This, level}, Level).

getVerticleBuildAnimationInterface(This) ->
        get({This, verticleBuildAnimationInterface}).

getAnimationInterface(This) ->
        get({This, animationInterface}).

setAnimationInterface(This, AnimationInterface) ->
        put({This, animationInterface}, AnimationInterface).

% throws Exception
setTarget(This, TargetGameLayer) ->
        AnotherTargetDistance = (get({get({This, layerDistanceUtil}), '$class'})):getDistance(get({This, layerDistanceUtil}), This, TargetGameLayer),
        WaypointBehaviorBase = (get({This, '$class'})):getWaypointBehavior(This),
        (get({WaypointBehaviorBase, '$class'})):setTargetWithDistance(WaypointBehaviorBase, TargetGameLayer, AnotherTargetDistance).

createHudPaintable(This) ->
        erlang:error({'RuntimeException'}).

getHudPaintable(This) ->
        erlang:error({'RuntimeException'}).

getMaxLevel(This) ->
        get({This, maxLevel}).

setMaxLevel(This, MaxLevel) when is_integer(MaxLevel) ->
        put({This, maxLevel}, MaxLevel).

getHealthInterface(This) ->
        get({This, healthInterface}).

setHealthInterface(This, HealthInterface) ->
        put({This, healthInterface}, HealthInterface).

getRTSFormInput(This) ->
        get({This, rtsFormInput}).

% throws Exception
isDestroyed(This) ->
        get({This, destroyed}).

% throws Exception
setDestroyed(This, Destroyed) when is_boolean(Destroyed) ->
        put({This, destroyed}, Destroyed),
        case (get({This, '$class'})):isDestroyed(This) of
            true ->
            (fun(Target_N74269) -> (get({Target_N74269, '$class'})):add(Target_N74269, This) end)('DestroyedLayerProcessor':getInstance()),
            (fun(Target_N74307) -> (get({Target_N74307, '$class'})):removeListener(Target_N74307, This) end)('ViewPositionEventHandler':getInstance());
            false -> ok
        end.

getEndGeographicMapCellPositionList(This) ->
        (get({get({This, geographicMapCellPositionAreaBase}), '$class'})):getOccupyingGeographicMapCellPositionList(get({This, geographicMapCellPositionAreaBase})).

getGeographicMapCellPositionArea(This) ->
        get({This, geographicMapCellPositionAreaBase}).

shouldHandleStartSameAsEnd(This) ->
        true.

% throws Exception
handleCost(This, OwnerLayer) ->
        ok.

getWaypointBehavior(This) ->
        erlang:error({'RuntimeException'}).

getParentLayer(This) ->
        erlang:error({'RuntimeException'}).

getRTSLayer2LogHelper(This) ->
        get({This, rtsLayer2LogHelper}).

getWaypointLogHelper(This) ->
        get({This, waypointLogHelperP}).

getWaypoint2LogHelper(This) ->
        get({This, waypoint2LogHelperP}).

getWaypointRunnableLogHelper(This) ->
        get({This, waypointRunnableLogHelperP}).

shouldAddWaypointFromBuilding(This) ->
        false.

getCaptionAnimationHelper(This) ->
        erlang:error({'RuntimeException'}).

isShowMoreCaptionStates(This) ->
        get({This, showMoreCaptionStates}).

% throws Exception
init(This, GeographicMapCellHistory, GeographicMapCellPositionBasicArrayList) ->
        ok.

% throws Exception
getCurrentGeographicMapCellPosition(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
getTopLeftGeographicMapCellPosition(This) ->
        erlang:error({'RuntimeException'}).

getMoveOutOfBuildAreaPath(This, GeographicMapCellPosition) ->
        erlang:error({'RuntimeException'}).

% throws Exception
setClosestGeographicMapCellHistory(This, PathsList) ->
        ok.

teleportTo(This, GeographicMapCellPosition) ->
        ok.

% throws Exception
setLoad(This, Resource) when is_integer(Resource) ->
        ok.

% throws Exception
getSurroundingGeographicMapCellPositionList(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
trackTo(This, Reason) when (is_list(Reason) orelse Reason =:= undefined) ->
        ok.

% throws Exception
trackToDXY(This, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        ok.

isWaypointListEmptyOrOnlyTargets(This) ->
        false.

getTrackingEvent(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
buildingChase(This, AllbinaryLayer, CellPosition) ->
        false.

allStop(This) ->
        ok.

getMinStaticType() ->
        1.

getMaxStaticType() ->
        4.

isRTSLayer(LayerInterface) ->
        try
        case (((get({LayerInterface, '$class'})):getType(LayerInterface) >= 'RTSLayer':getMinStaticType()) andalso ((get({LayerInterface, '$class'})):getType(LayerInterface) =< 'RTSLayer':getMaxStaticType())) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

implmentsTickableInterface(This) ->
        true.

implmentsGameInputInterface(This) ->
        true.

getRootName(This) ->
        get({This, rootName}).

getRotationAnimationInterface(This) ->
        get({This, indexedButShouldBeRotationAnimationInterface}).

setFrame(This, Index) when is_integer(Index) ->
        (fun(Target_N76525) -> (get({Target_N76525, '$class'})):setFrame(Target_N76525, Index) end)((get({This, '$class'})):getRotationAnimationInterface(This)).

setRotationAnimationInterface(This, RotationAnimationInterface) ->
        put({This, indexedButShouldBeRotationAnimationInterface}, RotationAnimationInterface).

