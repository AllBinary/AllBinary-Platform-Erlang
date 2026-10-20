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
% package org.allbinary.game.layer
% import javax.microedition.lcdui.Canvas
% import org.allbinary.animation.AnimationInterfaceFactoryInterface
% import org.allbinary.animation.NullAnimationFactory
% import org.allbinary.animation.NullIndexedAnimationFactory
% import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface
% import org.allbinary.animation.transition.shake.ShakeAnimationListener
% import org.allbinary.direction.Direction
% import org.allbinary.direction.DirectionFactory
% import org.allbinary.game.GameTypeFactory
% import org.allbinary.game.combat.destroy.event.DestroyedEvent
% import org.allbinary.game.combat.destroy.event.DestroyedEventHandler
% import org.allbinary.game.combat.destroy.event.DestroyedEventListenerInterface
% import org.allbinary.game.health.Health
% import org.allbinary.game.identification.Group
% import org.allbinary.game.identification.GroupFactory
% import org.allbinary.game.input.event.GameKeyEventFactory
% import org.allbinary.game.input.form.NullRTSFormInputFactory
% import org.allbinary.game.input.form.RTSFormInput
% import org.allbinary.game.layer.building.event.BuildingEventHandler
% import org.allbinary.game.layer.unit.UnitLayer
% import org.allbinary.game.layer.waypoint.Waypoint2LogHelper
% import org.allbinary.game.layer.waypoint.Waypoint2SelectedLogHelper
% import org.allbinary.game.layer.waypoint.WaypointBase
% import org.allbinary.game.layer.waypoint.WaypointLogHelper
% import org.allbinary.game.layer.waypoint.WaypointRunnableLogHelper
% import org.allbinary.game.layer.waypoint.WaypointRunnableSelectedLogHelper
% import org.allbinary.game.layer.waypoint.WaypointSelectedLogHelper
% import org.allbinary.game.multiplayer.layer.RemoteInfo
% import org.allbinary.game.tick.NullTickable
% import org.allbinary.game.tick.TickableInterface
% import org.allbinary.game.view.TileLayerPositionIntoViewPosition
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.RectangleFactory
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.math.AngleInfo
% import org.allbinary.math.FrameUtil
% import org.allbinary.media.AllBinaryVibrationME
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface
% import org.allbinary.media.graphics.geography.map.GeographicMapDirectionUtil
% import org.allbinary.util.BasicArrayList
% import org.allbinary.view.ViewPositionBase

-module('AdvancedRTSGameLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DestroyedEventListenerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('RTSLayer', Function, Arguments).

init_fields(This) ->
    put({This, shakeListener}, undefined),
    put({This, vibration}, undefined),
    put({This, duration}, 0),
    put({This, parentLayer}, get({'NullPathFindingLayer', 'NULL_PATH_FINDING_LAYER'})),
    put({This, waypointBehaviorBase}, 'NullTickable':getInstance()),
    ok.


% throws Exception
createSimulated() ->
        NullAnimationInterfaceFactoryInterface = 'NullAnimationFactory':getFactoryInstance(),
        NullIndexedAnimationInterfaceFactoryInterface = 'NullIndexedAnimationFactory':getFactoryInstance(),
        'AdvancedRTSGameLayer':new(get({'RemoteInfo', 'REMOTE_INFO'}), get({'NullPathFindingLayer', 'NULL_PATH_FINDING_LAYER'}), 'AdvancedRTSProperties':createPropertiesSimulated(), get({'GroupFactory':getInstance(), 'NULL_GROUP_ARRAY'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Health', 'NULL_HEALTH'}), 'NullRTSFormInputFactory':getInstance(), NullAnimationInterfaceFactoryInterface, NullIndexedAnimationInterfaceFactoryInterface, NullAnimationInterfaceFactoryInterface, NullAnimationInterfaceFactoryInterface, NullIndexedAnimationInterfaceFactoryInterface, 'NullIndexedAnimationFactory':getFactoryInstance(), get({'RectangleFactory', 'SINGLETON'}), 0, 0, 'TileLayerPositionIntoViewPosition':new()).

new(RemoteInfo, ParentLayer, AdvancedRTSProperties, GroupInterface, RootName, Name, HealthInterface, RtsFormInput, AnimationInterfaceFactoryInterface, EmptyAnimationInterfaceFactoryInterface, BaseAnimationInterfaceFactoryInterface, BuildAnimationInterfaceFactoryInterface, VerticleBuildAnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, X, Y, ViewPosition) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), (is_list(RootName) orelse RootName =:= undefined), (is_list(Name) orelse Name =:= undefined), is_integer(X), is_integer(Y) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, RemoteInfo, ParentLayer, AdvancedRTSProperties, GroupInterface, RootName, Name, HealthInterface, RtsFormInput, AnimationInterfaceFactoryInterface, EmptyAnimationInterfaceFactoryInterface, BaseAnimationInterfaceFactoryInterface, BuildAnimationInterfaceFactoryInterface, VerticleBuildAnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, X, Y, ViewPosition),
    This.

'$init'(This, RemoteInfo, ParentLayer, AdvancedRTSProperties, GroupInterface, RootName, Name, HealthInterface, RtsFormInput, AnimationInterfaceFactoryInterface, EmptyAnimationInterfaceFactoryInterface, BaseAnimationInterfaceFactoryInterface, BuildAnimationInterfaceFactoryInterface, VerticleBuildAnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, X, Y, ViewPosition) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), (is_list(RootName) orelse RootName =:= undefined), (is_list(Name) orelse Name =:= undefined), is_integer(X), is_integer(Y) ->
        'RTSLayer':'$init'(This, RemoteInfo, GroupInterface, RootName, Name, HealthInterface, RtsFormInput, AnimationInterfaceFactoryInterface, EmptyAnimationInterfaceFactoryInterface, BaseAnimationInterfaceFactoryInterface, BuildAnimationInterfaceFactoryInterface, VerticleBuildAnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, X, Y, ViewPosition),
        init_fields(This),
        (get({This, '$class'})):setVisible(This, false),
        (get({This, '$class'})):setWaypointBehavior(This, 'WaypointBehaviorBase':new()),
        put({This, shakeListener}, get({AdvancedRTSProperties, shakeListener})),
        put({This, vibration}, get({AdvancedRTSProperties, vibration})),
        put({This, duration}, get({AdvancedRTSProperties, duration})),
        (get({This, '$class'})):setParentLayer(This, ParentLayer).

% throws Exception
updateWaypointBehavior(This, GeographicMapInterface) ->
        'RTSLayer':updateWaypointBehavior(This, GeographicMapInterface),
        (fun(Target_N68428) -> (get({Target_N68428, '$class'})):setAllBinaryGameLayerManager(Target_N68428, get({This, allBinaryGameLayerManagerP})) end)((fun(Target_N68435) -> (get({Target_N68435, '$class'})):getWaypoint(Target_N68435) end)((get({This, '$class'})):getWaypointBehavior(This))).

initVisibility(This, RtsPlayerLayerInterface) ->
        AdvancedRTSPlayerLayerInterface = RtsPlayerLayerInterface,
        case ((get({AdvancedRTSPlayerLayerInterface, '$class'})):isLocalPlayer(AdvancedRTSPlayerLayerInterface) orelse ((get({AdvancedRTSPlayerLayerInterface, '$class'})):getGameType(AdvancedRTSPlayerLayerInterface) =:= get({'GameTypeFactory':getInstance(), 'BOT'}))) of
            true ->
            (get({This, '$class'})):setVisible(This, true);
            false ->
            (get({This, '$class'})):setVisible(This, false)
        end.

% throws Exception
construct(This, RtsPlayerLayerInterface) ->
        'RTSLayer':construct(This, RtsPlayerLayerInterface),
        (get({This, '$class'})):initVisibility(This, RtsPlayerLayerInterface),
        (fun(Target_N68823) -> (get({Target_N68823, '$class'})):addListenerInterface(Target_N68823, (fun(Target_N68848) -> (get({Target_N68848, '$class'})):getWaypoint(Target_N68848) end)((get({This, '$class'})):getWaypointBehavior(This))) end)('BuildingEventHandler':getInstance()).

% throws Exception
setDestroyed(This, Destroyed) when is_boolean(Destroyed) ->
        'RTSLayer':setDestroyed(This, Destroyed),
        case (get({This, '$class'})):isDestroyed(This) of
            true ->
            (fun(Target_N68985) -> (get({Target_N68985, '$class'})):removeListener(Target_N68985, (fun(Target_N69010) -> (get({Target_N69010, '$class'})):getWaypoint(Target_N69010) end)((get({This, '$class'})):getWaypointBehavior(This))) end)('BuildingEventHandler':getInstance()),
            (fun(Target_N69035) -> (get({Target_N69035, '$class'})):removeListener(Target_N69035, This) end)('BuildingEventHandler':getInstance()),
            (fun(Target_N69069) -> (get({Target_N69069, '$class'})):addListener(Target_N69069, This) end)('DestroyedEventHandler':getInstance()),
            (fun(Target_N69103) -> (get({Target_N69103, '$class'})):destroyAndClear(Target_N69103, (fun(Target_N69128) -> (get({Target_N69128, '$class'})):getOwnedWaypointList(Target_N69128) end)((get({This, '$class'})):getWaypointBehavior(This))) end)('RTSLayerUtil':getInstance());
            false -> ok
        end.

getParentLayer(This) ->
        get({This, parentLayer}).

setParentLayer(This, ParentLayer) ->
        put({This, parentLayer}, ParentLayer).

getWaypointBehavior(This) ->
        get({This, waypointBehaviorBase}).

setWaypointBehavior(This, UnitWaypointHelper) ->
        put({This, waypointBehaviorBase}, UnitWaypointHelper).

getWaypointLogHelper(This) ->
        get({This, waypointLogHelperP}).

getWaypoint2LogHelper(This) ->
        get({This, waypoint2LogHelperP}).

getWaypointRunnableLogHelper(This) ->
        get({This, waypointRunnableLogHelperP}).

shouldAddWaypointFromBuilding(This) ->
        try
        case (get({This, parentLayer}) =/= get({'NullPathFindingLayer', 'NULL_PATH_FINDING_LAYER'})) of
            true ->
            ParentAdvancedRTSGameLayer = get({This, parentLayer}),
            case ((get({ParentAdvancedRTSGameLayer, '$class'})):getType(ParentAdvancedRTSGameLayer) =/= 'UnitLayer':getStaticType()) of
                true ->
                throw({'$return', true});
                false -> ok
            end;
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isWaypointListEmptyOrOnlyTargets(This) ->
        try
        case ((get({This, '$class'})):getType(This) =/= 'UnitLayer':getStaticType()) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
buildingChase(This, AllbinaryLayer, CellPosition) ->
        try
        GeographicMapCellPosition = (get({This, '$class'})):getCurrentGeographicMapCellPosition(This),
        BuildingDirection = (fun(Target_N70022) -> (get({Target_N70022, '$class'})):getDirectionFromCellPositionToAdjacentCellPosition(Target_N70022, GeographicMapCellPosition, CellPosition) end)('GeographicMapDirectionUtil':getInstance()),
        AngleInfo = (fun(Target_N70103) -> (get({Target_N70103, '$class'})):getAngleInfoP(Target_N70103) end)((get({This, '$class'})):getRotationAnimationInterface(This)),
        Angle = (fun(Target_N70156) -> (get({Target_N70156, '$class'})):adjustAngleToFrameAngle(Target_N70156, ((get({AngleInfo, '$class'})):getAngle(AngleInfo) + 90)) end)('FrameUtil':getInstance()),
        GameKeyEventFactory = 'GameKeyEventFactory':getInstance(),
        case (BuildingDirection =:= get({'DirectionFactory':getInstance(), 'UP'})) of
            true ->
            (get({get({This, rtsLayer2LogHelper}), '$class'})):buildingAbove(get({This, rtsLayer2LogHelper}), This),
            case ((Angle > 180) andalso (Angle < 360)) of
                true ->
                (get({get({This, rtsLayer2LogHelper}), '$class'})):buildingChaseLeft(get({This, rtsLayer2LogHelper}), This, Angle),
                (fun(Target_N71876) -> (get({Target_N71876, '$class'})):add(Target_N71876, (get({GameKeyEventFactory, '$class'})):getInstanceForKey(GameKeyEventFactory, This, get({'Canvas', 'LEFT'}))) end)((get({This, '$class'})):getGameKeyEventList(This)),
                case (Angle =< 190) of
                    true ->
                    throw({'$return', true});
                    false -> ok
                end;
                false ->
                (get({get({This, rtsLayer2LogHelper}), '$class'})):buildingChaseRight(get({This, rtsLayer2LogHelper}), This, Angle),
                (fun(Target_N71728) -> (get({Target_N71728, '$class'})):add(Target_N71728, (get({GameKeyEventFactory, '$class'})):getInstanceForKey(GameKeyEventFactory, This, get({'Canvas', 'RIGHT'}))) end)((get({This, '$class'})):getGameKeyEventList(This)),
                case (Angle >= 170) of
                    true ->
                    throw({'$return', true});
                    false -> ok
                end
            end;
            false ->
            case (BuildingDirection =:= get({'DirectionFactory':getInstance(), 'DOWN'})) of
            true ->
            (get({get({This, rtsLayer2LogHelper}), '$class'})):buildingDown(get({This, rtsLayer2LogHelper}), This),
            case ((Angle > 180) andalso (Angle < 360)) of
                true ->
                (get({get({This, rtsLayer2LogHelper}), '$class'})):buildingChaseLeft(get({This, rtsLayer2LogHelper}), This, Angle),
                (fun(Target_N71492) -> (get({Target_N71492, '$class'})):add(Target_N71492, (get({GameKeyEventFactory, '$class'})):getInstanceForKey(GameKeyEventFactory, This, get({'Canvas', 'RIGHT'}))) end)((get({This, '$class'})):getGameKeyEventList(This)),
                case (Angle > 315) of
                    true ->
                    throw({'$return', true});
                    false -> ok
                end;
                false ->
                (get({get({This, rtsLayer2LogHelper}), '$class'})):buildingChaseRight(get({This, rtsLayer2LogHelper}), This, Angle),
                (fun(Target_N71344) -> (get({Target_N71344, '$class'})):add(Target_N71344, (get({GameKeyEventFactory, '$class'})):getInstanceForKey(GameKeyEventFactory, This, get({'Canvas', 'LEFT'}))) end)((get({This, '$class'})):getGameKeyEventList(This)),
                case (Angle < 45) of
                    true ->
                    throw({'$return', true});
                    false -> ok
                end
            end;
            false ->
            case (BuildingDirection =:= get({'DirectionFactory':getInstance(), 'LEFT'})) of
            true ->
            (get({get({This, rtsLayer2LogHelper}), '$class'})):buildingLeft(get({This, rtsLayer2LogHelper})),
            case ((Angle > 90) andalso (Angle < 270)) of
                true ->
                (get({get({This, rtsLayer2LogHelper}), '$class'})):buildingChaseDown(get({This, rtsLayer2LogHelper}), This, Angle),
                (fun(Target_N71112) -> (get({Target_N71112, '$class'})):add(Target_N71112, (get({GameKeyEventFactory, '$class'})):getInstanceForKey(GameKeyEventFactory, This, get({'Canvas', 'LEFT'}))) end)((get({This, '$class'})):getGameKeyEventList(This)),
                case (Angle < 135) of
                    true ->
                    throw({'$return', true});
                    false -> ok
                end;
                false ->
                (get({get({This, rtsLayer2LogHelper}), '$class'})):buildingChaseUp(get({This, rtsLayer2LogHelper}), This, Angle),
                (fun(Target_N70964) -> (get({Target_N70964, '$class'})):add(Target_N70964, (get({GameKeyEventFactory, '$class'})):getInstanceForKey(GameKeyEventFactory, This, get({'Canvas', 'RIGHT'}))) end)((get({This, '$class'})):getGameKeyEventList(This)),
                case (Angle > 45) of
                    true ->
                    throw({'$return', true});
                    false -> ok
                end
            end;
            false ->
            case (BuildingDirection =:= get({'DirectionFactory':getInstance(), 'RIGHT'})) of
            true ->
            (get({get({This, rtsLayer2LogHelper}), '$class'})):buildingRight(get({This, rtsLayer2LogHelper})),
            case ((Angle > 90) andalso (Angle < 270)) of
                true ->
                (get({get({This, rtsLayer2LogHelper}), '$class'})):buildingChaseDown(get({This, rtsLayer2LogHelper}), This, Angle),
                (fun(Target_N70734) -> (get({Target_N70734, '$class'})):add(Target_N70734, (get({GameKeyEventFactory, '$class'})):getInstanceForKey(GameKeyEventFactory, This, get({'Canvas', 'RIGHT'}))) end)((get({This, '$class'})):getGameKeyEventList(This)),
                case (Angle > 225) of
                    true ->
                    throw({'$return', true});
                    false -> ok
                end;
                false ->
                (get({get({This, rtsLayer2LogHelper}), '$class'})):buildingChaseUp(get({This, rtsLayer2LogHelper}), This, Angle),
                (fun(Target_N70564) -> (get({Target_N70564, '$class'})):add(Target_N70564, (get({GameKeyEventFactory, '$class'})):getInstanceForKey(GameKeyEventFactory, This, get({'Canvas', 'LEFT'}))) end)((get({This, '$class'})):getGameKeyEventList(This)),
                case ((Angle < 315) andalso (Angle > 180)) of
                    true ->
                    throw({'$return', true});
                    false -> ok
                end
            end;
            false ->
            throw({'$return', true})
        end
        end
        end
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getSurroundingGeographicMapCellPositionList(This) ->
        GeographicMapCompositeInterface = get({This, allBinaryGameLayerManagerP}),
        GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
        (get({get({This, geographicMapCellPositionAreaBase}), '$class'})):update(get({This, geographicMapCellPositionAreaBase}), GeographicMapInterface),
        (get({get({This, geographicMapCellPositionAreaBase}), '$class'})):getSurroundingGeographicMapCellPositionList(get({This, geographicMapCellPositionAreaBase})).

setSelected(This, Selected) when is_boolean(Selected) ->
        'RTSLayer':setSelected(This, Selected),
        case get({This, debug}) of
            true ->
            case Selected of
                true ->
                put({This, waypointLogHelperP}, 'WaypointSelectedLogHelper':getInstance()),
                put({This, waypoint2LogHelperP}, 'Waypoint2SelectedLogHelper':getInstance()),
                put({This, waypointRunnableLogHelperP}, 'WaypointRunnableSelectedLogHelper':getInstance());
                false ->
                put({This, waypointLogHelperP}, 'WaypointLogHelper':getInstance()),
                put({This, waypoint2LogHelperP}, 'Waypoint2LogHelper':getInstance()),
                put({This, waypointRunnableLogHelperP}, 'WaypointRunnableLogHelper':getInstance())
            end;
            false -> ok
        end.

onDestroyed(This, DestroyedEvent) ->
        try
            LayerInterface = (get({DestroyedEvent, '$class'})):getLayerInterface(DestroyedEvent),
            case (LayerInterface =:= This) of
                true ->
                (fun(Target_N72738) -> (get({Target_N72738, '$class'})):removeListener(Target_N72738, This) end)('DestroyedEventHandler':getInstance()),
                Waypoint = (fun(Target_N72783) -> (get({Target_N72783, '$class'})):getWaypoint(Target_N72783) end)((get({This, '$class'})):getWaypointBehavior(This)),
                (get({Waypoint, '$class'})):reset(Waypoint);
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "onDestroyed", E)
        end.

