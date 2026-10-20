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
% package org.allbinary.game.input
% import javax.microedition.lcdui.Canvas
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.input.form.RTSFormInput
% import org.allbinary.game.layer.RTSLayer
% import org.allbinary.game.layer.RTSLayerInfoPaintable
% import org.allbinary.game.layer.RTSPlayerLayerInterface
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.InputFeatureFactory
% import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.game.input.form.NullRTSFormInputFactory
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.game.layer.NullRTSLayer
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.displayable.event.DisplayChangeEvent
% import org.allbinary.input.motion.gesture.observer.MotionGestureEvent
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.media.audio.SecondaryPlayerQueueFactory
% import org.allbinary.media.audio.SelectSound
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface
% import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory
% import org.allbinary.string.CommonLabels

-module('RTSPlayerGameInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PlayerGameInput', Function, Arguments).

init_fields(This) ->
    put({This, inputProcessorArray}, array:new(get({'InputFactory':getInstance(), 'MAX'}), {default, undefined})),
    put({This, removeInputProcessorArray}, array:new(get({'InputFactory':getInstance(), 'MAX'}), {default, undefined})),
    put({This, inputList}, undefined),
    put({This, isSingleKeyProcessing}, ((fun(Target_N66829) -> (get({Target_N66829, '$class'})):isFeature(Target_N66829, get({'InputFeatureFactory':getInstance(), 'SINGLE_KEY_REPEAT_PRESS'})) end)('Features':getInstance()) orelse (fun(Target_N66880) -> (get({Target_N66880, '$class'})):isFeature(Target_N66880, get({'InputFeatureFactory':getInstance(), 'SINGLE_KEY_PRESS'})) end)('Features':getInstance()))),
    put({This, gameCanvas}, undefined),
    put({This, motionGestureInputList}, 'BasicArrayListD':new()),
    put({This, scrollPlayerGameInput}, undefined),
    put({This, selectedRTSLayerPlayerGameInput}, undefined),
    put({This, towerInfoPaintable}, undefined),
    put({This, rtsPlayerLayerInterface}, undefined),
    put({This, layerPositionFinderInterface}, undefined),
    put({This, selectedRtsFormInput}, 'NullRTSFormInputFactory':getInstance()),
    ok.


new(GameCanvas, InputList, PlayerInputId, TowerInfoPaintable, RtsPlayerLayerInterface, LayerPositionFinderInterface, SelectRTSLayerVisitorFactoryInterface) when is_integer(PlayerInputId) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GameCanvas, InputList, PlayerInputId, TowerInfoPaintable, RtsPlayerLayerInterface, LayerPositionFinderInterface, SelectRTSLayerVisitorFactoryInterface),
    This.

'$init'(This, GameCanvas, InputList, PlayerInputId, TowerInfoPaintable, RtsPlayerLayerInterface, LayerPositionFinderInterface, SelectRTSLayerVisitorFactoryInterface) when is_integer(PlayerInputId) ->
        'PlayerGameInput':'$init'(This, InputList, 'BasicArrayListD':new(), PlayerInputId),
        init_fields(This),
        (get({This, '$class'})):initInputProcessors(This),
        put({This, gameCanvas}, GameCanvas),
        put({This, inputList}, InputList),
        put({This, towerInfoPaintable}, TowerInfoPaintable),
        put({This, rtsPlayerLayerInterface}, RtsPlayerLayerInterface),
        put({This, selectedRTSLayerPlayerGameInput}, 'SelectedRTSLayersPlayerGameInput':new((get({This, '$class'})):getRTSLayerInfoPaintable(This), (get({This, '$class'})):getRtsPlayerLayerInterface(This), get({This, inputList}), PlayerInputId, SelectRTSLayerVisitorFactoryInterface)),
        case (get({This, rtsPlayerLayerInterface}) =/= get({'NullRTSLayer', 'NULL_RTS_LAYER'})) of
            true ->
            (get({This, '$class'})):setSelectedRtsFormInput(This, (get({get({This, rtsPlayerLayerInterface}), '$class'})):getRTSFormInput(get({This, rtsPlayerLayerInterface})));
            false -> ok
        end,
        GeographicMapCompositeInterface = (get({get({This, gameCanvas}), '$class'})):getLayerManager(get({This, gameCanvas})),
        GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
        put({This, scrollPlayerGameInput}, 'ScrollMapPlayerGameInput':new(GeographicMapInterface, get({This, inputList}), PlayerInputId)),
        put({This, layerPositionFinderInterface}, LayerPositionFinderInterface).

% throws Exception
setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager) ->
        (get({get({This, selectedRTSLayerPlayerGameInput}), '$class'})):setAllBinaryGameLayerManager(get({This, selectedRTSLayerPlayerGameInput}), AllBinaryGameLayerManager),
        case (get({This, selectedRtsFormInput}) =/= 'NullRTSFormInputFactory':getInstance()) of
            true ->
            (get({get({This, selectedRtsFormInput}), '$class'})):setAllBinaryGameLayerManager(get({This, selectedRtsFormInput}), AllBinaryGameLayerManager);
            false -> ok
        end.

onDisplayChangeEvent(This, DisplayChangeEvent) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "onDisplayChangeEvent"),
            (fun(Target_N68221) -> (get({Target_N68221, '$class'})):update(Target_N68221) end)((get({This, '$class'})):getRTSLayerInfoPaintable(This))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "onDisplayChangeEvent", E)
        end.

% throws Exception
left(This) ->
        (fun(Target_N68383) -> (get({Target_N68383, '$class'})):processInputKey(Target_N68383, get({'Canvas', 'LEFT'})) end)((get({get({This, rtsPlayerLayerInterface}), '$class'})):getCurrentScrollSelectionForm(get({This, rtsPlayerLayerInterface}))).

% throws Exception
right(This) ->
        (fun(Target_N68469) -> (get({Target_N68469, '$class'})):processInputKey(Target_N68469, get({'Canvas', 'RIGHT'})) end)((get({get({This, rtsPlayerLayerInterface}), '$class'})):getCurrentScrollSelectionForm(get({This, rtsPlayerLayerInterface}))).

initInputProcessors(This) ->
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'LEFT'}), 'RTSPlayerLeftGameInputProcessor':new(This), get({This, inputProcessorArray}))),
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'KEY_NUM0'}), array:get(get({'Canvas', 'LEFT'}), get({This, inputProcessorArray})), get({This, inputProcessorArray}))),
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'RIGHT'}), 'RTSPlayerRightGameInputProcessor':new(This), get({This, inputProcessorArray}))),
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'KEY_POUND'}), array:get(get({'Canvas', 'RIGHT'}), get({This, inputProcessorArray})), get({This, inputProcessorArray}))),
        put({This, removeInputProcessorArray}, array:set(get({'Canvas', 'KEY_NUM1'}), 'RTSPlayerFireGameInputProcessor':new(This), get({This, removeInputProcessorArray}))),
        put({This, removeInputProcessorArray}, array:set(get({'Canvas', 'KEY_NUM3'}), array:get(get({'Canvas', 'KEY_NUM1'}), get({This, removeInputProcessorArray})), get({This, removeInputProcessorArray}))),
        put({This, removeInputProcessorArray}, array:set(get({'Canvas', 'KEY_NUM3'}), array:get(get({'Canvas', 'KEY_NUM1'}), get({This, removeInputProcessorArray})), get({This, removeInputProcessorArray}))),
        put({This, removeInputProcessorArray}, array:set(get({'Canvas', 'LEFT'}), array:get(get({'Canvas', 'KEY_NUM1'}), get({This, removeInputProcessorArray})), get({This, removeInputProcessorArray}))),
        put({This, removeInputProcessorArray}, array:set(get({'Canvas', 'RIGHT'}), array:get(get({'Canvas', 'KEY_NUM1'}), get({This, removeInputProcessorArray})), get({This, removeInputProcessorArray}))),
        put({This, removeInputProcessorArray}, array:set(get({'Canvas', 'KEY_NUM0'}), array:get(get({'Canvas', 'KEY_NUM1'}), get({This, removeInputProcessorArray})), get({This, removeInputProcessorArray}))),
        put({This, removeInputProcessorArray}, array:set(get({'Canvas', 'KEY_POUND'}), array:get(get({'Canvas', 'KEY_NUM1'}), get({This, removeInputProcessorArray})), get({This, removeInputProcessorArray}))),
        'GameInputProcessorUtil':init(get({This, inputProcessorArray})),
        'GameInputProcessorUtil':init(get({This, removeInputProcessorArray})).

% throws Exception
processInput(This, LayerManager) ->
        try
            (get({This, '$class'})):processMotionInput(This, LayerManager),
            Size = (get({get({This, inputList}), '$class'})):size(get({This, inputList})),
            put({local, key}, 0),
            lists:foreach(fun(Index) ->
                GameKeyEvent = (get({get({This, inputList}), '$class'})):get(get({This, inputList}), Index),
                put({local, key}, (get({GameKeyEvent, '$class'})):getKey(GameKeyEvent)),
                (fun(Target_N69603) -> (get({Target_N69603, '$class'})):processInputKey(Target_N69603, get({local, key})) end)((get({This, '$class'})):getScrollPlayerGameInput(This)),
                (fun(Target_N69637) -> (get({Target_N69637, '$class'})):processInputKey(Target_N69637, get({local, key})) end)((get({This, '$class'})):getSelectedBuildingPlayerGameInput(This)),
                (fun(Target_N69671) -> (get({Target_N69671, '$class'})):processEvent(Target_N69671, LayerManager, GameKeyEvent) end)(array:get(get({local, key}), get({This, inputProcessorArray}))),
                (fun(Target_N69729) -> (get({Target_N69729, '$class'})):processEvent(Target_N69729, LayerManager, GameKeyEvent) end)(array:get(get({local, key}), get({This, removeInputProcessorArray})))
            end, lists:seq(0, Size - 1)),
            case (get({This, '$class'})):isIsSingleKeyProcessing(This) of
                true ->
                (get({This, '$class'})):clear(This);
                false ->
                (get({This, '$class'})):update(This)
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, gameInputStrings}), 'PROCESS_INPUT'}), E)
        end.

% throws Exception
processMotionInput(This, LayerManager) ->
        ok.

% throws Exception
select(This, MotionGestureEvent) ->
        Point = (get({MotionGestureEvent, '$class'})):getCurrentPoint(MotionGestureEvent),
        GeographicMapCompositeInterface = (get({get({This, gameCanvas}), '$class'})):getLayerManager(get({This, gameCanvas})),
        GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
        AllBinaryTiledLayer = (get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface),
        X = ((get({Point, '$class'})):getX(Point) + (get({AllBinaryTiledLayer, '$class'})):getXP(AllBinaryTiledLayer)),
        Y = ((get({Point, '$class'})):getY(Point) + (get({AllBinaryTiledLayer, '$class'})):getYP(AllBinaryTiledLayer)),
        put({local, geographicMapCellPosition}, (get({GeographicMapInterface, '$class'})):getCellPositionAtXYNoThrow(GeographicMapInterface, X, Y)),
        case (get({local, geographicMapCellPosition}) =/= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) of
            true ->
            (fun(Target_N70825) -> (get({Target_N70825, '$class'})):add(Target_N70825, 'SelectSound':getInstance()) end)('SecondaryPlayerQueueFactory':getInstance()),
            put({local, layer}, (get({get({This, layerPositionFinderInterface}), '$class'})):getLayerInterface(get({This, layerPositionFinderInterface}), get({local, geographicMapCellPosition}))),
            case (get({local, layer}) =:= get({'AllBinaryLayer', 'NULL_ALLBINARY_LAYER'})) of
                true ->
                put({local, layer}, 'CollidableDestroyableDamageableLayer':getNullInstance());
                false ->
                put({local, geographicMapCellPosition}, (get({GeographicMapInterface, '$class'})):getCellPositionAtXY(GeographicMapInterface, (get({get({local, layer}), '$class'})):getXP(get({local, layer})), (get({get({local, layer}), '$class'})):getYP(get({local, layer}))))
            end,
            FoundRTSLayer = get({local, layer}),
            (get({This, '$class'})):setSelectedRTSLayer(This, FoundRTSLayer, get({local, geographicMapCellPosition}));
            false ->
            CommonLabels = 'CommonLabels':getInstance(),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N70662) -> (get({Target_N70662, '$class'})):toString(Target_N70662) end)((fun(Target_N70669) -> (get({Target_N70669, '$class'})):appendint(Target_N70669, trunc((get({AllBinaryTiledLayer, '$class'})):getHeight(AllBinaryTiledLayer))) end)((fun(Target_N70676) -> (get({Target_N70676, '$class'})):append(Target_N70676, get({CommonLabels, 'HEIGHT_LABEL'})) end)((fun(Target_N70683) -> (get({Target_N70683, '$class'})):appendint(Target_N70683, trunc((get({AllBinaryTiledLayer, '$class'})):getWidth(AllBinaryTiledLayer))) end)((fun(Target_N70690) -> (get({Target_N70690, '$class'})):append(Target_N70690, get({CommonLabels, 'WIDTH_LABEL'})) end)((fun(Target_N70697) -> (get({Target_N70697, '$class'})):append(Target_N70697, "Off Of Map -") end)('StringMaker':new())))))), This, "select")
        end.

% throws Exception
setSelectedRTSLayer(This, RtsLayer, GeographicMapCellPosition) ->
        (fun(Target_N71235) -> (get({Target_N71235, '$class'})):setSelectedRTSLayer(Target_N71235, RtsLayer) end)((get({This, '$class'})):getSelectedBuildingPlayerGameInput(This)).

paint(This, Graphics) ->
        GeographicMapCellPosition = (fun(Target_N71361) -> (get({Target_N71361, '$class'})):getSelectedGeographicCellPosition(Target_N71361) end)((get({This, '$class'})):getSelectedRtsFormInput(This)),
        GeographicMapCompositeInterface = (get({get({This, gameCanvas}), '$class'})):getLayerManager(get({This, gameCanvas})),
        GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
        AllBinaryTiledLayer = (get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface),
        (get({Graphics, '$class'})):setColor(Graphics, (fun(Target_N71589) -> (get({Target_N71589, '$class'})):intValue(Target_N71589) end)(get({'BasicColorFactory':getInstance(), 'GREEN'}))),
        List = (fun(Target_N71635) -> (get({Target_N71635, '$class'})):getPaintSelectedRTSLayersList(Target_N71635) end)((get({This, '$class'})):getSelectedBuildingPlayerGameInput(This)),
        put({local, width}, 0),
        put({local, height}, 0),
        case ((get({List, '$class'})):size(List) > 0) of
            true ->
            lists:foreach(fun(Index) ->
                RtsLayer = (get({List, '$class'})):get(List, Index),
                put({local, width}, (get({RtsLayer, '$class'})):getWidth(RtsLayer)),
                put({local, height}, (get({RtsLayer, '$class'})):getHeight(RtsLayer)),
                (get({Graphics, '$class'})):drawRect(Graphics, ((get({RtsLayer, '$class'})):getXP(RtsLayer) - (get({AllBinaryTiledLayer, '$class'})):getXP(AllBinaryTiledLayer)), ((get({RtsLayer, '$class'})):getYP(RtsLayer) - (get({AllBinaryTiledLayer, '$class'})):getYP(AllBinaryTiledLayer)), get({local, width}), get({local, height}))
            end, lists:seq(((get({List, '$class'})):size(List) - 1), 0, -1));
            false ->
            case (GeographicMapCellPosition =/= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) of
            true ->
            Point = (get({GeographicMapCellPosition, '$class'})):getPoint(GeographicMapCellPosition),
            put({local, width}, (get({AllBinaryTiledLayer, '$class'})):getCellWidth(AllBinaryTiledLayer)),
            put({local, height}, (get({AllBinaryTiledLayer, '$class'})):getCellHeight(AllBinaryTiledLayer)),
            (get({Graphics, '$class'})):drawRect(Graphics, ((get({Point, '$class'})):getX(Point) - (get({AllBinaryTiledLayer, '$class'})):getXP(AllBinaryTiledLayer)), ((get({Point, '$class'})):getY(Point) - (get({AllBinaryTiledLayer, '$class'})):getYP(AllBinaryTiledLayer)), get({local, width}), get({local, height}));
            false -> ok
        end
        end.

updatePaintable(This) ->
        ok.

getSelectedBuildingPlayerGameInput(This) ->
        get({This, selectedRTSLayerPlayerGameInput}).

getSelectedRtsFormInput(This) ->
        get({This, selectedRtsFormInput}).

setSelectedRtsFormInput(This, SelectedRtsFormInput) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N72541) -> (get({Target_N72541, '$class'})):toString(Target_N72541) end)((fun(Target_N72548) -> (get({Target_N72548, '$class'})):append(Target_N72548, (fun(Target_N72584) -> (get({Target_N72584, '$class'})):toString(Target_N72584, SelectedRtsFormInput) end)('StringUtil':getInstance())) end)((fun(Target_N72555) -> (get({Target_N72555, '$class'})):append(Target_N72555, "RTSFormInput: ") end)('StringMaker':new()))), This, "setSelectedRtsFormInput"),
        put({This, selectedRtsFormInput}, SelectedRtsFormInput).

getRtsPlayerLayerInterface(This) ->
        get({This, rtsPlayerLayerInterface}).

getRTSLayerInfoPaintable(This) ->
        get({This, towerInfoPaintable}).

getMotionGestureInputList(This) ->
        get({This, motionGestureInputList}).

getGameCanvas(This) ->
        get({This, gameCanvas}).

isIsSingleKeyProcessing(This) ->
        get({This, isSingleKeyProcessing}).

getScrollPlayerGameInput(This) ->
        get({This, scrollPlayerGameInput}).

