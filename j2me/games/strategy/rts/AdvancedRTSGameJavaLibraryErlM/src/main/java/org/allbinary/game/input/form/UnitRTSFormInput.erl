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
% import org.allbinary.graphics.form.item.ABCustomItem
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.game.layer.AdvancedPlayerOwnedRTSLayers
% import org.allbinary.game.layer.AdvancedRTSGameLayer
% import org.allbinary.game.layer.AdvancedRTSPlayerLayerInterface
% import org.allbinary.game.layer.RTSGameStrings
% import org.allbinary.game.layer.RTSLayer
% import org.allbinary.game.layer.RTSPlayerLayerInterface
% import org.allbinary.game.layer.capital.Capital
% import org.allbinary.game.layer.unit.UnitLayer
% import org.allbinary.game.layer.waypoint.WorkWaypoint
% import org.allbinary.media.audio.BuildingSound
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.game.identification.Group
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.GeographicMapCellPositionAreaBase
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
% import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface

-module('UnitRTSFormInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RTSFormInput', Function, Arguments).

static_init() ->
    put({?MODULE, 'DECAL_ID'}, (fun(Target_N66531) -> (get({Target_N66531, '$class'})):getAt(Target_N66531, 23) end)('SmallIntegerSingletonFactory':getInstance())),
    ok.

init_fields(This) ->
    put({This, noMoneyGameNotificationEvent}, undefined),
    put({This, newUnitGameNotificationEvent}, undefined),
    ok.


new(GroupInterface) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GroupInterface),
    This.

'$init'(This, GroupInterface) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined) ->
        'RTSFormInput':'$init'(This, GroupInterface),
        init_fields(This),
        SmallIntegerSingletonFactory = 'SmallIntegerSingletonFactory':getInstance(),
        BasicColorFactory = 'BasicColorFactory':getInstance(),
        put({This, noMoneyGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'NO_MONEY'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), get({BasicColorFactory, 'WHITE'}), get({'BooleanFactory':getInstance(), 'FALSE'}))),
        put({This, newUnitGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'NEW_UNIT'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), get({BasicColorFactory, 'WHITE'}), get({'BooleanFactory':getInstance(), 'FALSE'}))),
        (fun(Target_N67022) -> (get({Target_N67022, '$class'})):put(Target_N67022, get({'WorkWaypoint', 'ID'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 50)) end)((get({This, '$class'})):getHashtable(This)).

% throws Exception
setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager) ->
        'RTSFormInput':setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager),
        GeographicMapCompositeInterface = AllBinaryGameLayerManager,
        GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
        (get({get({This, noMoneyGameNotificationEvent}), '$class'})):setBasicColorP(get({This, noMoneyGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)),
        (get({get({This, newUnitGameNotificationEvent}), '$class'})):setBasicColorP(get({This, newUnitGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)).

% throws Exception
processGameSpecific(This, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, Item, ItemIndex) when is_integer(ItemIndex) ->
        'RTSFormInput':process(This, LayerManager),
        AssociatedRtsLayer2 = AssociatedRtsLayer,
        GeographicMapCellPositionArea = get({AssociatedRtsLayer2, geographicMapCellPositionAreaBase}),
        GeographicMapCellPosition = (get({GeographicMapCellPositionArea, '$class'})):getNextSurroundingGeographicMapCellPosition(GeographicMapCellPositionArea),
        (fun(Target_N67621) -> (get({Target_N67621, '$class'})):put(Target_N67621, get({'Layer', 'ID'}), AssociatedRtsLayer) end)((get({This, '$class'})):getHashtable(This)),
        (fun(Target_N67671) -> (get({Target_N67671, '$class'})):put(Target_N67671, get({'UnitRTSFormInput', 'DECAL_ID'}), (get({(RtsPlayerLayerInterface), '$class'})):getDecalBasicColor((RtsPlayerLayerInterface))) end)((get({This, '$class'})):getHashtable(This)),
        case (array:get(ItemIndex, get({This, newUnconstructedRTSLayerInterfaceArray})) =:= 'CollidableDestroyableDamageableLayer':getNullInstance()) of
            true ->
            put({This, newUnconstructedRTSLayerInterfaceArray}, array:set(ItemIndex, (get({This, '$class'})):getInstance(This, LayerManager, Item, GeographicMapCellPosition), get({This, newUnconstructedRTSLayerInterfaceArray})));
            false ->
            put({local, cellPoint}, (get({GeographicMapCellPosition, '$class'})):getPoint(GeographicMapCellPosition)),
            put({local, rtsLayer}, array:get(ItemIndex, get({This, newUnconstructedRTSLayerInterfaceArray}))),
            (get({get({local, rtsLayer}), '$class'})):setPosition(get({local, rtsLayer}), (get({get({local, cellPoint}), '$class'})):getX(get({local, cellPoint})), (get({get({local, cellPoint}), '$class'})):getY(get({local, cellPoint})), (get({get({local, rtsLayer}), '$class'})):getZP(get({local, rtsLayer}))),
            GeographicMapCompositeInterface = get({get({local, rtsLayer}), allBinaryGameLayerManagerP}),
            GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
            (get({get({get({local, rtsLayer}), geographicMapCellPositionAreaBase}), '$class'})):update(get({get({local, rtsLayer}), geographicMapCellPositionAreaBase}), GeographicMapInterface)
        end,
        put({local, cellPoint}, (get({GeographicMapCellPosition, '$class'})):getMidPoint(GeographicMapCellPosition)),
        put({local, rtsLayer}, array:get(ItemIndex, get({This, newUnconstructedRTSLayerInterfaceArray}))),
        (get({get({local, rtsLayer}), '$class'})):setPosition(get({local, rtsLayer}), ((get({get({local, cellPoint}), '$class'})):getX(get({local, cellPoint})) - (get({get({local, rtsLayer}), '$class'})):getHalfWidth(get({local, rtsLayer}))), ((get({get({local, cellPoint}), '$class'})):getY(get({local, cellPoint})) - (get({get({local, rtsLayer}), '$class'})):getHalfHeight(get({local, rtsLayer}))), (get({get({local, rtsLayer}), '$class'})):getZP(get({local, rtsLayer}))),
        (get({This, '$class'})):attemptBuild(This, AssociatedRtsLayer2, RtsPlayerLayerInterface, LayerManager, get({local, rtsLayer}), ItemIndex).

% throws Exception
attemptBuild(This, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, LayerInterface, ItemIndex) when is_integer(ItemIndex) ->
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
            (get({RtsPlayerLayerInterface, '$class'})):add(RtsPlayerLayerInterface, 'BuildingSound':getInstance()),
            (get({Capital, '$class'})):removeMoney(Capital, Cost),
            (fun(Target_N69390) -> (get({Target_N69390, '$class'})):set(Target_N69390, LayerInterface, AssociatedRtsLayer) end)('AssignWaypointsUtil':getInstance()),
            (get({LayerManager, '$class'})):appendAt(LayerManager, LayerInterface, get({'PlayersSingletonFactory', total})),
            AdvancedRTSPlayerLayerInterface = RtsPlayerLayerInterface,
            AdvancedPlayerOwnedRTSLayers = (get({AdvancedRTSPlayerLayerInterface, '$class'})):getAdvancedPlayerOwnedRTSLayers(AdvancedRTSPlayerLayerInterface),
            (get({AdvancedPlayerOwnedRTSLayers, '$class'})):addUnit(AdvancedPlayerOwnedRTSLayers, LayerInterface),
            case (not (get({RtsPlayerLayerInterface, '$class'})):implmentsArtificialIntelligenceCompositeInterface(RtsPlayerLayerInterface)) of
                true ->
                (fun(Target_N69680) -> (get({Target_N69680, '$class'})):fireEvent(Target_N69680, get({This, newUnitGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
                false -> ok
            end;
            false ->
            (get({RtsPlayerLayerInterface, '$class'})):add(RtsPlayerLayerInterface, 'ErrorSound':getInstance()),
            case (not (get({RtsPlayerLayerInterface, '$class'})):implmentsArtificialIntelligenceCompositeInterface(RtsPlayerLayerInterface)) of
                true ->
                (fun(Target_N69189) -> (get({Target_N69189, '$class'})):fireEvent(Target_N69189, get({This, noMoneyGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
                false -> ok
            end
        end.

