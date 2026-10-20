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
% package org.allbinary.game.layer.building
% import javax.microedition.lcdui.Graphics
% import org.allbinary.ag.weapon.media.audio.ExplosionBasicSound
% import org.allbinary.animation.NullAnimationFactory
% import org.allbinary.animation.NullIndexedAnimationFactory
% import org.allbinary.game.identification.GroupFactory
% import org.allbinary.game.input.form.NullRTSFormInputFactory
% import org.allbinary.game.input.form.RTSFormInput
% import org.allbinary.game.input.form.VisibleCellPositionsSingleton
% import org.allbinary.game.layer.AdvancedRTSGameLayer
% import org.allbinary.game.layer.AdvancedRTSPlayerLayerInterface
% import org.allbinary.game.layer.AdvancedRTSProperties
% import org.allbinary.game.layer.CollidableRTSBehavior
% import org.allbinary.game.layer.RTSLayerUtil
% import org.allbinary.game.layer.RTSPlayerLayerInterface
% import org.allbinary.game.layer.SelectionHudPaintable
% import org.allbinary.game.layer.waypoint.Waypoint
% import org.allbinary.game.view.TileLayerPositionIntoViewPosition
% import org.allbinary.graphics.RectangleFactory
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.animation.AnimationInterfaceFactoryInterface
% import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface
% import org.allbinary.animation.RotationAnimationInterfaceCompositeInterface
% import org.allbinary.direction.Direction
% import org.allbinary.direction.DirectionFactory
% import org.allbinary.game.combat.damage.DamageFloaters
% import org.allbinary.game.health.Health
% import org.allbinary.game.identification.Group
% import org.allbinary.game.layer.GeographicMapCellPositionAreaBase
% import org.allbinary.game.layer.NullPathFindingLayer
% import org.allbinary.game.tracking.TrackingEvent
% import org.allbinary.game.tracking.TrackingEventHandler
% import org.allbinary.game.tracking.TrackingEventListenerInterface
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.media.audio.SecondaryPlayerQueueFactory
% import org.allbinary.media.audio.SelectSound
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapDirectionUtil
% import org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.BasicArrayListS
% import org.allbinary.game.multiplayer.layer.RemoteInfo
% import org.allbinary.util.ABHashtable

-module('BuildingLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements RotationAnimationInterfaceCompositeInterface
% implements TrackingEventListenerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AdvancedRTSGameLayer', Function, Arguments).

init_fields(This) ->
    put({This, buildingLevelCost}, 0),
    put({This, productivity}, 0),
    put({This, efficiency}, 0),
    put({This, efficiencyPerLevel}, 0),
    put({This, trackingEvent}, undefined),
    put({This, damageFloaters}, undefined),
    put({This, damageFloatersPaintableInterface}, undefined),
    put({This, healthBar}, undefined),
    put({This, pathsHashtable}, undefined),
    put({This, local}, false),
    put({This, timeDelayHelper}, 'TimeDelayHelper':new(3000)),
    ok.


% throws Exception
createSimulated() ->
        NullAnimationInterfaceFactoryInterface = 'NullAnimationFactory':getFactoryInstance(),
        NullIndexedAnimationInterfaceFactoryInterface = 'NullIndexedAnimationFactory':getFactoryInstance(),
        'BuildingLayer':new(get({'RemoteInfo', 'REMOTE_INFO'}), 'SimulatedBuildingPropertiesFactory':getInstance(), 'AdvancedRTSProperties':createPropertiesSimulated(), get({'GroupFactory':getInstance(), 'NULL_GROUP_ARRAY'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Health', 'NULL_HEALTH'}), 'NullRTSFormInputFactory':getInstance(), NullAnimationInterfaceFactoryInterface, NullIndexedAnimationInterfaceFactoryInterface, NullAnimationInterfaceFactoryInterface, NullAnimationInterfaceFactoryInterface, NullIndexedAnimationInterfaceFactoryInterface, 'NullIndexedAnimationFactory':getFactoryInstance(), get({'RectangleFactory', 'SINGLETON'}), 0, 0).

new(RemoteInfo, BuildingPropertiesFactory, AdvancedRTSProperties, GroupInterface, RootName, Name, HealthInterface, RtsFormInput, AnimationInterfaceFactoryInterface, EmptyAnimationInterfaceFactoryInterface, BaseAnimationInterfaceFactoryInterface, BuildAnimationInterfaceFactoryInterface, VerticleBuildAnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, X, Y) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), (is_list(RootName) orelse RootName =:= undefined), (is_list(Name) orelse Name =:= undefined), is_integer(X), is_integer(Y) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, RemoteInfo, BuildingPropertiesFactory, AdvancedRTSProperties, GroupInterface, RootName, Name, HealthInterface, RtsFormInput, AnimationInterfaceFactoryInterface, EmptyAnimationInterfaceFactoryInterface, BaseAnimationInterfaceFactoryInterface, BuildAnimationInterfaceFactoryInterface, VerticleBuildAnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, X, Y),
    This.

'$init'(This, RemoteInfo, BuildingPropertiesFactory, AdvancedRTSProperties, GroupInterface, RootName, Name, HealthInterface, RtsFormInput, AnimationInterfaceFactoryInterface, EmptyAnimationInterfaceFactoryInterface, BaseAnimationInterfaceFactoryInterface, BuildAnimationInterfaceFactoryInterface, VerticleBuildAnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, X, Y) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), (is_list(RootName) orelse RootName =:= undefined), (is_list(Name) orelse Name =:= undefined), is_integer(X), is_integer(Y) ->
        'AdvancedRTSGameLayer':'$init'(This, RemoteInfo, get({'NullPathFindingLayer', 'NULL_PATH_FINDING_LAYER'}), AdvancedRTSProperties, GroupInterface, RootName, Name, HealthInterface, RtsFormInput, AnimationInterfaceFactoryInterface, EmptyAnimationInterfaceFactoryInterface, BaseAnimationInterfaceFactoryInterface, BuildAnimationInterfaceFactoryInterface, VerticleBuildAnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, X, Y, 'TileLayerPositionIntoViewPosition':new()),
        init_fields(This),
        (get({This, '$class'})):setCollidableInferface(This, 'CollidableRTSBehavior':new(true)),
        (fun(Target_N67898) -> (get({Target_N67898, '$class'})):setWaypoint(Target_N67898, 'Waypoint':new(This, 'SelectSound':getInstance())) end)((get({This, '$class'})):getWaypointBehavior(This)),
        put({This, damageFloaters}, (get({BuildingPropertiesFactory, '$class'})):getDamageFloaters(BuildingPropertiesFactory, This)),
        put({This, damageFloatersPaintableInterface}, get({BuildingPropertiesFactory, damageFloatersPaintableInterface})),
        put({This, healthBar}, (get({BuildingPropertiesFactory, '$class'})):getHealthBar(BuildingPropertiesFactory, This)),
        put({This, pathsHashtable}, (get({BuildingPropertiesFactory, '$class'})):getHashtable(BuildingPropertiesFactory)),
        (get({This, '$class'})):setMaxLevel(This, 30),
        (get({This, '$class'})):setProductivity(This, 1),
        (get({This, '$class'})):setEfficiency(This, (get({This, '$class'})):calculateEfficiency(This)),
        put({This, efficiencyPerLevel}, (get({BuildingPropertiesFactory, '$class'})):getEfficiencyPerLevel(BuildingPropertiesFactory, This)),
        put({This, efficiency}, get({This, efficiencyPerLevel})),
        (get({This, '$class'})):generateMoveOutOfBuildAreaPaths(This),
        put({This, trackingEvent}, (get({BuildingPropertiesFactory, '$class'})):getTrackingEvent(BuildingPropertiesFactory, This)).

initVisibility(This, RtsPlayerLayerInterface) ->
        AdvancedRTSPlayerLayerInterface = RtsPlayerLayerInterface,
        case (get({AdvancedRTSPlayerLayerInterface, '$class'})):isLocalPlayer(AdvancedRTSPlayerLayerInterface) of
            true ->
            put({This, local}, true),
            (get({This, '$class'})):addVisibility(This);
            false ->
            put({This, local}, false)
        end,
        'AdvancedRTSGameLayer':initVisibility(This, RtsPlayerLayerInterface).

% throws Exception
construct(This, RtsPlayerLayerInterface) ->
        'AdvancedRTSGameLayer':construct(This, RtsPlayerLayerInterface),
        (fun(Target_N69050) -> (get({Target_N69050, '$class'})):addListenerInterface(Target_N69050, This) end)('TrackingEventHandler':getInstance()).

onMovement(This, TrackingEvent) ->
        try
            LayerInterface = (get({TrackingEvent, '$class'})):getLayerInterface(TrackingEvent),
            case (array:get(0, (get({LayerInterface, '$class'})):getGroupInterface(LayerInterface)) =/= array:get(0, (get({This, '$class'})):getGroupInterface(This))) of
                true ->
                (get({LayerInterface, '$class'})):onMovementFound(LayerInterface, get({This, trackingEvent}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "onMovement", E)
        end.

% throws Exception
processBuiltTick(This, AllBinaryLayerManager) ->
        case (fun(Target_N69539) -> (get({Target_N69539, '$class'})):isDamaged(Target_N69539) end)((get({This, '$class'})):getHealthInterface(This)) of
            true ->
            (get({This, '$class'})):setAnimationInterface(This, get({This, destroyAnimationInterface}));
            false -> ok
        end,
        case (not (fun(Target_N69602) -> (get({Target_N69602, '$class'})):isAlive(Target_N69602) end)((get({This, '$class'})):getHealthInterface(This))) of
            true ->
            case (get({This, '$class'})):isReadyForExplosion(This) of
                true ->
                CurrentFrame = (get({get({This, destroyAnimationInterface}), '$class'})):getFrame(get({This, destroyAnimationInterface})),
                Size = ((get({get({This, destroyAnimationInterface}), '$class'})):getSize(get({This, destroyAnimationInterface})) - 1),
                case ((CurrentFrame =:= Size) andalso (not (get({get({This, timeDelayHelper}), '$class'})):isTimeTNT(get({This, timeDelayHelper})))) of
                    true ->
                    case (not (fun(Target_N70089) -> (get({Target_N70089, '$class'})):isAlive(Target_N70089) end)((get({This, '$class'})):getHealthInterface(This))) of
                        true ->
                        (get({This, '$class'})):setDestroyed(This, true);
                        false -> ok
                    end;
                    false ->
                    (get({get({This, destroyAnimationInterface}), '$class'})):nextFrame(get({This, destroyAnimationInterface}))
                end;
                false ->
                (get({This, '$class'})):setAnimationInterface(This, get({This, destroyAnimationInterface})),
                (fun(Target_N69715) -> (get({Target_N69715, '$class'})):add(Target_N69715, 'ExplosionBasicSound':getInstance()) end)('SecondaryPlayerQueueFactory':getInstance()),
                (get({get({This, shakeListener}), '$class'})):onSmallShakeEvent(get({This, shakeListener})),
                (get({get({This, vibration}), '$class'})):vibrate(get({This, vibration}), get({This, duration}), 0, 0),
                (get({get({This, timeDelayHelper}), '$class'})):setStartTimeTNT(get({This, timeDelayHelper})),
                (get({This, '$class'})):setReadyForExplosion(This, true)
            end;
            false ->
            'AdvancedRTSGameLayer':processBuiltTick(This, AllBinaryLayerManager)
        end,
        (get({get({This, indexedButShouldBeRotationAnimationInterface}), '$class'})):nextFrame(get({This, indexedButShouldBeRotationAnimationInterface})).

calculateEfficiency(This) ->
        get({This, efficiencyPerLevel}).

getCost(This) ->
        Total = (fun(Target_N70313) -> (get({Target_N70313, '$class'})):getCostExponential(Target_N70313, trunc((((get({This, '$class'})):getLevel(This) * (get({This, '$class'})):getBuildingLevelCost(This))))) end)('RTSLayerUtil':getInstance()),
        Total.

getDowngradeCost(This) ->
        DowngradeCost = (fun(Target_N70466) -> (get({Target_N70466, '$class'})):getCostExponential(Target_N70466, trunc((((((get({This, '$class'})):getLevel(This) - 1)) * (get({This, '$class'})):getBuildingLevelCost(This))))) end)('RTSLayerUtil':getInstance()),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Cost: ", DowngradeCost]), This, "getDowngradeCost"),
        ((DowngradeCost * 9) div 10).

getUpgradeCost(This) ->
        UpgradeCost = (fun(Target_N70700) -> (get({Target_N70700, '$class'})):getCostExponential(Target_N70700, trunc((((((get({This, '$class'})):getLevel(This) + 1)) * (get({This, '$class'})):getBuildingLevelCost(This))))) end)('RTSLayerUtil':getInstance()),
        UpgradeCost.

downgrade(This) ->
        'AdvancedRTSGameLayer':downgrade(This),
        (get({This, '$class'})):setProductivity(This, ((get({This, '$class'})):getProductivity(This) - 1)),
        (get({This, '$class'})):setEfficiency(This, ((get({This, '$class'})):getEfficiency(This) - (get({This, '$class'})):calculateEfficiency(This))),
        (fun(Target_N70953) -> (get({Target_N70953, '$class'})):setMaxHealth(Target_N70953, ((fun(Target_N70977) -> (get({Target_N70977, '$class'})):getMaxHealth(Target_N70977) end)((get({This, '$class'})):getHealthInterface(This)) - (((((get({This, '$class'})):getLevel(This) + 1)) * 100)))) end)((get({This, '$class'})):getHealthInterface(This)).

upgrade(This) ->
        'AdvancedRTSGameLayer':upgrade(This),
        (get({This, '$class'})):setProductivity(This, ((get({This, '$class'})):getProductivity(This) + 1)),
        (get({This, '$class'})):setEfficiency(This, ((get({This, '$class'})):getEfficiency(This) + (get({This, '$class'})):calculateEfficiency(This))),
        (fun(Target_N71174) -> (get({Target_N71174, '$class'})):setMaxHealth(Target_N71174, ((fun(Target_N71198) -> (get({Target_N71198, '$class'})):getMaxHealth(Target_N71198) end)((get({This, '$class'})):getHealthInterface(This)) + (((get({This, '$class'})):getLevel(This) * 100)))) end)((get({This, '$class'})):getHealthInterface(This)).

getBuildingLevelCost(This) ->
        get({This, buildingLevelCost}).

setBuildingLevelCost(This, BuildingLevelCost) when is_integer(BuildingLevelCost) ->
        put({This, buildingLevelCost}, BuildingLevelCost).

getProductivity(This) ->
        get({This, productivity}).

setProductivity(This, Productivity) when is_integer(Productivity) ->
        put({This, productivity}, Productivity).

getEfficiency(This) ->
        get({This, efficiency}).

setEfficiency(This, Efficiency) when is_integer(Efficiency) ->
        put({This, efficiency}, Efficiency).

% throws Exception
generateMoveOutOfBuildAreaPaths(This) ->
        OccupyList = (get({get({This, geographicMapCellPositionAreaBase}), '$class'})):getOccupyingGeographicMapCellPositionList(get({This, geographicMapCellPositionAreaBase})),
        SurroundList = (get({get({This, geographicMapCellPositionAreaBase}), '$class'})):getSurroundingGeographicMapCellPositionList(get({This, geographicMapCellPositionAreaBase})),
        NO_DIRECTION = get({'DirectionFactory':getInstance(), 'NO_DIRECTION'}),
        GeographicMapDirectionUtil = 'GeographicMapDirectionUtil':getInstance(),
        put({local, pathsList}, undefined),
        put({local, occupyGeographicMapCellPosition}, undefined),
        put({local, surroundGeographicMapCellPosition}, undefined),
        put({local, list}, undefined),
        lists:foreach(fun(Index2) ->
            put({local, pathsList}, 'BasicArrayListD':new()),
            put({local, occupyGeographicMapCellPosition}, (get({OccupyList, '$class'})):get(OccupyList, Index2)),
            lists:foreach(fun(Index) ->
                put({local, surroundGeographicMapCellPosition}, (get({SurroundList, '$class'})):get(SurroundList, Index)),
                case ((get({GeographicMapDirectionUtil, '$class'})):getEightDirectionFromCellPositionToAdjacentCellPosition(GeographicMapDirectionUtil, get({local, surroundGeographicMapCellPosition}), get({local, occupyGeographicMapCellPosition})) =/= NO_DIRECTION) of
                    true ->
                    put({local, list}, 'BasicArrayListS':new(1)),
                    (get({get({local, list}), '$class'})):add(get({local, list}), get({local, surroundGeographicMapCellPosition})),
                    (get({get({local, pathsList}), '$class'})):add(get({local, pathsList}), get({local, list}));
                    false -> ok
                end
            end, lists:seq(((get({SurroundList, '$class'})):size(SurroundList) - 1), 0, -1)),
            (get({get({This, pathsHashtable}), '$class'})):put(get({This, pathsHashtable}), get({local, occupyGeographicMapCellPosition}), get({local, pathsList}))
        end, lists:seq(((get({OccupyList, '$class'})):size(OccupyList) - 1), 0, -1)).

getMoveOutOfBuildAreaPath(This, GeographicMapCellPosition) ->
        PathsList = (get({get({This, pathsHashtable}), '$class'})):get(get({This, pathsHashtable}), GeographicMapCellPosition),
        PathsList.

getEndGeographicMapCellPositionList(This) ->
        (get({get({This, geographicMapCellPositionAreaBase}), '$class'})):getSurroundingGeographicMapCellPositionList(get({This, geographicMapCellPositionAreaBase})).

shouldHandleStartSameAsEnd(This) ->
        false.

paint(This, Graphics) ->
        case (get({This, '$class'})):isVisible(This) of
            true ->
            'AdvancedRTSGameLayer':paint(This, Graphics),
            (get({get({This, damageFloatersPaintableInterface}), '$class'})):paint(get({This, damageFloatersPaintableInterface}), Graphics),
            (get({get({This, healthBar}), '$class'})):paint(get({This, healthBar}), Graphics);
            false -> ok
        end.

% throws Exception
damage(This, Damage, DamageType) when is_integer(Damage), is_integer(DamageType) ->
        'AdvancedRTSGameLayer':damage(This, Damage, DamageType),
        (get({get({This, damageFloaters}), '$class'})):add(get({This, damageFloaters}), Damage),
        case (Damage > 0) of
            true ->
            (fun(Target_N73062) -> (get({Target_N73062, '$class'})):damage(Target_N73062, Damage) end)((get({This, '$class'})):getHealthInterface(This));
            false -> ok
        end.

% throws Exception
getDamage(This, DamageType) when is_integer(DamageType) ->
        0.

addVisibility(This) ->
        GeographicMapCellPositionArea = get({This, geographicMapCellPositionAreaBase}),
        OccupyList = (get({GeographicMapCellPositionArea, '$class'})):getOccupyingGeographicMapCellPositionList(GeographicMapCellPositionArea),
        (fun(Target_N73358) -> (get({Target_N73358, '$class'})):addStationaryCellPositions(Target_N73358, OccupyList) end)('VisibleCellPositionsSingleton':getInstance()),
        SurroundList = (get({GeographicMapCellPositionArea, '$class'})):getSurroundingGeographicMapCellPositionList(GeographicMapCellPositionArea),
        (fun(Target_N73447) -> (get({Target_N73447, '$class'})):addStationaryCellPositions(Target_N73447, SurroundList) end)('VisibleCellPositionsSingleton':getInstance()).

removeVisibility(This) ->
        OccupyList = (get({get({This, geographicMapCellPositionAreaBase}), '$class'})):getOccupyingGeographicMapCellPositionList(get({This, geographicMapCellPositionAreaBase})),
        (fun(Target_N73564) -> (get({Target_N73564, '$class'})):removeStationaryCellPositions(Target_N73564, OccupyList) end)('VisibleCellPositionsSingleton':getInstance()),
        SurroundList = (get({get({This, geographicMapCellPositionAreaBase}), '$class'})):getSurroundingGeographicMapCellPositionList(get({This, geographicMapCellPositionAreaBase})),
        (fun(Target_N73656) -> (get({Target_N73656, '$class'})):removeStationaryCellPositions(Target_N73656, SurroundList) end)('VisibleCellPositionsSingleton':getInstance()).

% throws Exception
setDestroyed(This, Destroyed) when is_boolean(Destroyed) ->
        'AdvancedRTSGameLayer':setDestroyed(This, Destroyed),
        case (get({This, '$class'})):isDestroyed(This) of
            true ->
            (fun(Target_N73765) -> (get({Target_N73765, '$class'})):removeAll(Target_N73765, This) end)('DropCellPositionHistory':getInstance()),
            (fun(Target_N73799) -> (get({Target_N73799, '$class'})):removeListener(Target_N73799, This) end)('TrackingEventHandler':getInstance()),
            case get({This, local}) of
                true ->
                (get({This, '$class'})):removeVisibility(This);
                false -> ok
            end,
            case (not (fun(Target_N73874) -> (get({Target_N73874, '$class'})):isAlive(Target_N73874) end)((get({This, '$class'})):getHealthInterface(This))) of
                true ->
                Damage = (fun(Target_N73917) -> (get({Target_N73917, '$class'})):getMaxHealth(Target_N73917) end)((get({This, '$class'})):getHealthInterface(This)),
                case (Damage > 10) of
                    true ->
                    (fun(Target_N73976) -> (get({Target_N73976, '$class'})):add(Target_N73976, 'ExplosionBasicSound':getInstance()) end)('SecondaryPlayerQueueFactory':getInstance()),
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

createHudPaintable(This) ->
        BuildingInfoHudPaintable = 'BuildingInfoHudPaintable':getInstance(),
        (get({BuildingInfoHudPaintable, '$class'})):setBasicColorP(BuildingInfoHudPaintable, (get({get({This, allBinaryGameLayerManagerP}), '$class'})):getForegroundBasicColor(get({This, allBinaryGameLayerManagerP}))),
        (get({BuildingInfoHudPaintable, '$class'})):setRtsLayer(BuildingInfoHudPaintable, This),
        BuildingInfoHudPaintable.

getHudPaintable(This) ->
        BuildingInfoHudPaintable = 'BuildingInfoHudPaintable':getInstance(),
        BuildingInfoHudPaintable.

getType(This) ->
        'BuildingLayer':getStaticType().

getStaticType() ->
        2.

