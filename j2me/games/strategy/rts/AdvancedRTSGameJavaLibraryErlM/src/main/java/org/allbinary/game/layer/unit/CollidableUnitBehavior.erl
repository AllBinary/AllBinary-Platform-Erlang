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
% import org.allbinary.game.layer.SteeringVisitor
% import org.allbinary.game.layer.AdvancedRTSGameLayer
% import org.allbinary.game.layer.CollidableCompositeLayer
% import org.allbinary.game.layer.CollidableRTSBehavior
% import org.allbinary.util.BasicArrayList
% import org.allbinary.game.input.event.GameKeyEventFactory
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.game.layer.TiledLayerUtil
% import org.allbinary.game.layer.geographic.map.LayerPartialCellPositionsUtil
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.math.AngleInfo
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface
% import org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory
% import org.allbinary.string.CommonStrings

-module('CollidableUnitBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CollidableRTSBehavior', Function, Arguments).

init_fields(This) ->
    put({This, layerPartialCellPositionsUtil}, 'LayerPartialCellPositionsUtil':getInstance()),
    put({This, simpleSteeringVisitor}, 'SimpleSteeringVisitor':new()),
    ok.


new(Collidable) when is_boolean(Collidable) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Collidable),
    This.

'$init'(This, Collidable) when is_boolean(Collidable) ->
        'CollidableRTSBehavior':'$init'(This, Collidable),
        init_fields(This).

% throws Exception
collideNone(This, OwnerLayer, CollidableInterfaceCompositeInterface) ->
        (get({This, '$class'})):chase(This, OwnerLayer, CollidableInterfaceCompositeInterface),
        RtsLayer = CollidableInterfaceCompositeInterface,
        case ((get({RtsLayer, '$class'})):getType(RtsLayer) =:= 'UnitLayer':getStaticType()) of
            true ->
            (get({This, '$class'})):collideUnit(This, OwnerLayer, RtsLayer);
            false -> ok
        end.

% throws Exception
steer(This, OwnerLayer, CollidableInterfaceCompositeInterface) ->
        try
        OwnerUnitLayer = OwnerLayer,
        UnitLayer = CollidableInterfaceCompositeInterface,
        AngleInfo2 = (fun(Target_N67432) -> (get({Target_N67432, '$class'})):getAngleInfoP(Target_N67432) end)((get({UnitLayer, '$class'})):getRotationAnimationInterface(UnitLayer)),
        AngleInfo = (fun(Target_N67490) -> (get({Target_N67490, '$class'})):getAngleInfoP(Target_N67490) end)((get({OwnerUnitLayer, '$class'})):getRotationAnimationInterface(OwnerUnitLayer)),
        Angle = ((get({AngleInfo, '$class'})):getAngle(AngleInfo) - (get({AngleInfo2, '$class'})):getAngle(AngleInfo2)),
        case ((Angle < 90) orelse (Angle > 270)) of
            true ->
            throw({'$return', true});
            false ->
            case ((Angle >= 90) orelse (Angle =< 270)) of
            true ->
            (fun(Target_N67693) -> (get({Target_N67693, '$class'})):add(Target_N67693, (fun(Target_N67718) -> (get({Target_N67718, '$class'})):getInstanceForKey(Target_N67718, OwnerUnitLayer, get({'Canvas', 'RIGHT'})) end)('GameKeyEventFactory':getInstance())) end)((get({OwnerUnitLayer, '$class'})):getGameKeyEventList(OwnerUnitLayer)),
            throw({'$return', false});
            false -> ok
        end
        end,
        erlang:error({'Exception', "Error"})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
chase(This, OwnerLayer, CollidableInterfaceCompositeInterface) ->
        RtsLayer = CollidableInterfaceCompositeInterface,
        case ((get({RtsLayer, '$class'})):getType(RtsLayer) =:= 'UnitLayer':getStaticType()) of
            true ->
            case (not (fun(Target_N68024) -> (get({Target_N68024, '$class'})):contains(Target_N68024, CollidableInterfaceCompositeInterface) end)((get({get({This, simpleSteeringVisitor}), '$class'})):getList(get({This, simpleSteeringVisitor})))) of
                true ->
                (fun(Target_N68071) -> (get({Target_N68071, '$class'})):add(Target_N68071, CollidableInterfaceCompositeInterface) end)((get({get({This, simpleSteeringVisitor}), '$class'})):getList(get({This, simpleSteeringVisitor})));
                false -> ok
            end,
            OwnerUnitLayer = OwnerLayer,
            List = (fun(Target_N68185) -> (get({Target_N68185, '$class'})):getSteeringVisitorList(Target_N68185) end)((get({OwnerUnitLayer, '$class'})):getUnitWaypointBehavior(OwnerUnitLayer)),
            case (not (get({List, '$class'})):contains(List, get({This, simpleSteeringVisitor}))) of
                true ->
                (get({List, '$class'})):add(List, get({This, simpleSteeringVisitor}));
                false -> ok
            end;
            false -> ok
        end.

% throws Exception
collideUnit(This, OwnerLayer, UnitLayer) ->
        OwnerUnitLayer = OwnerLayer,
        PartialPositionList = 'UnitLayer':getPartialpositionlist(),
        GeographicMapCompositeInterface = get({OwnerUnitLayer, allBinaryGameLayerManagerP}),
        GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
        BasicGeographicMap = GeographicMapInterface,
        DropCellPositionHistory = 'DropCellPositionHistory':getInstance(),
        TiledLayerUtil = 'TiledLayerUtil':getInstance(),
        TiledLayer = (get({BasicGeographicMap, '$class'})):getAllBinaryTiledLayer(BasicGeographicMap),
        case (((get({OwnerLayer, '$class'})):getXP(OwnerLayer) < (get({UnitLayer, '$class'})):getXP(UnitLayer)) andalso ((get({OwnerLayer, '$class'})):getX2(OwnerLayer) > (get({UnitLayer, '$class'})):getXP(UnitLayer))) of
            true ->
            put({local, diff}, ((get({OwnerLayer, '$class'})):getWidth(OwnerLayer) + 1)),
            (get({get({This, layerPartialCellPositionsUtil}), '$class'})):getAllDXY(get({This, layerPartialCellPositionsUtil}), BasicGeographicMap, OwnerLayer, (-get({local, diff})), 0, PartialPositionList),
            case (not (get({DropCellPositionHistory, '$class'})):anyCellPositionWithDrop(DropCellPositionHistory, PartialPositionList)) of
                true ->
                put({local, x}, ((get({UnitLayer, '$class'})):getXP(UnitLayer) - get({local, diff}))),
                put({local, y}, (get({OwnerLayer, '$class'})):getYP(OwnerLayer)),
                put({local, x}, (get({TiledLayerUtil, '$class'})):keepOnMapX(TiledLayerUtil, TiledLayer, get({local, x}), (get({OwnerLayer, '$class'})):getWidth(OwnerLayer))),
                put({local, y}, (get({TiledLayerUtil, '$class'})):keepOnMapY(TiledLayerUtil, TiledLayer, get({local, y}), (get({OwnerLayer, '$class'})):getHeight(OwnerLayer))),
                (get({OwnerLayer, '$class'})):setPosition(OwnerLayer, get({local, x}), get({local, y}), (get({OwnerLayer, '$class'})):getZP(OwnerLayer));
                false -> ok
            end,
            (get({get({This, layerPartialCellPositionsUtil}), '$class'})):getAllDXY(get({This, layerPartialCellPositionsUtil}), BasicGeographicMap, UnitLayer, get({local, diff}), 0, PartialPositionList),
            case (not (get({DropCellPositionHistory, '$class'})):anyCellPositionWithDrop(DropCellPositionHistory, PartialPositionList)) of
                true ->
                put({local, x}, ((get({UnitLayer, '$class'})):getXP(UnitLayer) + get({local, diff}))),
                put({local, y}, (get({UnitLayer, '$class'})):getYP(UnitLayer)),
                put({local, x}, (get({TiledLayerUtil, '$class'})):keepOnMapX(TiledLayerUtil, TiledLayer, get({local, x}), (get({UnitLayer, '$class'})):getWidth(UnitLayer))),
                put({local, y}, (get({TiledLayerUtil, '$class'})):keepOnMapY(TiledLayerUtil, TiledLayer, get({local, y}), (get({UnitLayer, '$class'})):getHeight(UnitLayer))),
                (get({UnitLayer, '$class'})):setPosition(UnitLayer, get({local, x}), get({local, y}), (get({UnitLayer, '$class'})):getZP(UnitLayer));
                false -> ok
            end;
            false -> ok
        end,
        case (((get({OwnerLayer, '$class'})):getYP(OwnerLayer) < (get({UnitLayer, '$class'})):getYP(UnitLayer)) andalso ((get({OwnerLayer, '$class'})):getY2(OwnerLayer) > (get({UnitLayer, '$class'})):getYP(UnitLayer))) of
            true ->
            put({local, diff}, ((get({OwnerLayer, '$class'})):getHeight(OwnerLayer) + 1)),
            (get({get({This, layerPartialCellPositionsUtil}), '$class'})):getAllDXY(get({This, layerPartialCellPositionsUtil}), BasicGeographicMap, OwnerLayer, 0, (-get({local, diff})), PartialPositionList),
            case (not (get({DropCellPositionHistory, '$class'})):anyCellPositionWithDrop(DropCellPositionHistory, PartialPositionList)) of
                true ->
                put({local, x}, (get({OwnerLayer, '$class'})):getXP(OwnerLayer)),
                put({local, y}, ((get({UnitLayer, '$class'})):getYP(UnitLayer) - get({local, diff}))),
                put({local, x}, (get({TiledLayerUtil, '$class'})):keepOnMapX(TiledLayerUtil, TiledLayer, get({local, x}), (get({OwnerLayer, '$class'})):getWidth(OwnerLayer))),
                put({local, y}, (get({TiledLayerUtil, '$class'})):keepOnMapY(TiledLayerUtil, TiledLayer, get({local, y}), (get({OwnerLayer, '$class'})):getHeight(OwnerLayer))),
                (get({OwnerLayer, '$class'})):setPosition(OwnerLayer, get({local, x}), get({local, y}), (get({OwnerLayer, '$class'})):getZP(OwnerLayer));
                false -> ok
            end,
            (get({get({This, layerPartialCellPositionsUtil}), '$class'})):getAllDXY(get({This, layerPartialCellPositionsUtil}), BasicGeographicMap, UnitLayer, 0, get({local, diff}), PartialPositionList),
            case (not (get({DropCellPositionHistory, '$class'})):anyCellPositionWithDrop(DropCellPositionHistory, PartialPositionList)) of
                true ->
                put({local, x}, (get({UnitLayer, '$class'})):getXP(UnitLayer)),
                put({local, y}, ((get({UnitLayer, '$class'})):getYP(UnitLayer) + get({local, diff}))),
                put({local, x}, (get({TiledLayerUtil, '$class'})):keepOnMapX(TiledLayerUtil, TiledLayer, get({local, x}), (get({UnitLayer, '$class'})):getWidth(UnitLayer))),
                put({local, y}, (get({TiledLayerUtil, '$class'})):keepOnMapY(TiledLayerUtil, TiledLayer, get({local, y}), (get({UnitLayer, '$class'})):getHeight(UnitLayer))),
                (get({UnitLayer, '$class'})):setPosition(UnitLayer, get({local, x}), get({local, y}), (get({UnitLayer, '$class'})):getZP(UnitLayer));
                false -> ok
            end;
            false -> ok
        end.
% Java nested class SimpleSteeringVisitor: move it to its own module 'SimpleSteeringVisitor'

