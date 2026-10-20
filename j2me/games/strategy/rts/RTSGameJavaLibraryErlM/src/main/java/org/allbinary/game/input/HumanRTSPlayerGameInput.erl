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
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.input.form.RTSFormInput
% import org.allbinary.game.layer.MultiSelectPaintable
% import org.allbinary.game.layer.RTSGameStrings
% import org.allbinary.game.layer.RTSLayer
% import org.allbinary.game.layer.RTSLayerInfoPaintable
% import org.allbinary.game.layer.RTSPlayerLayerInterface
% import org.allbinary.game.state.GameStateFactory
% import org.allbinary.input.motion.button.EndLevelNoBuildingSelectedTouchButtonsBuilder
% import org.allbinary.input.motion.button.EndLevelTouchButtonsBuilder
% import org.allbinary.input.motion.button.NoBuildingSelectedTouchButtonsBuilder
% import org.allbinary.input.motion.button.RTSTouchButtonsBuilder
% import org.allbinary.media.audio.SelectBuildingSound
% import org.allbinary.util.BasicArrayList
% import org.allbinary.string.CommonSeps
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.hud.event.GameNotificationEvent
% import org.allbinary.game.layer.hud.event.GameNotificationEventHandler
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.form.ScrollSelectionForm
% import org.allbinary.graphics.form.item.ABCustomItem
% import org.allbinary.graphics.paint.NullInitUpdatePaintable
% import org.allbinary.input.motion.button.TouchButtonsBuilderFactory
% import org.allbinary.input.motion.gesture.MotionGestureInput
% import org.allbinary.input.motion.gesture.TouchMotionGestureFactory
% import org.allbinary.input.motion.gesture.observer.BaseMotionGestureEventListener
% import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler
% import org.allbinary.input.motion.gesture.observer.MotionGestureEvent
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.string.CommonLabels
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.math.RectangleCollisionUtil
% import org.allbinary.media.audio.ErrorSound
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface
% import org.allbinary.view.ViewPositionBase

-module('HumanRTSPlayerGameInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements BaseMotionGestureEventListener

'$handle_undefined_function'(Function, Arguments) ->
    apply('RTSPlayerGameInput', Function, Arguments).

init_fields(This) ->
    put({This, isDragging}, false),
    put({This, gameStateFactory}, 'GameStateFactory':getInstance()),
    put({This, rectangleCollisionUtil}, 'RectangleCollisionUtil':getInstance()),
    put({This, touchMotionGestureFactory}, 'TouchMotionGestureFactory':getInstance()),
    put({This, 'PRESSED'}, get({get({This, touchMotionGestureFactory}), 'PRESSED'})),
    put({This, 'RELEASED'}, get({get({This, touchMotionGestureFactory}), 'RELEASED'})),
    put({This, touchButtonsBuilderFactory}, undefined),
    put({This, notYoursGameNotificationEvent}, undefined),
    put({This, selectedRtsLayer}, 'CollidableDestroyableDamageableLayer':getNullInstance()),
    put({This, startPoint}, get({'PointFactory':getInstance(), 'ZERO_ZERO'})),
    put({This, endPoint}, get({'PointFactory':getInstance(), 'ZERO_ZERO'})),
    put({This, 'POSSIBLE'}, "Possible: "),
    put({This, 'AT'}, "At: "),
    put({This, 'METHOD'}, "makeSelection"),
    put({This, 'ADDING'}, "Adding: "),
    put({This, 'SPACE'}, get({'CommonSeps':getInstance(), 'SPACE'})),
    put({This, multiSelectPaintable}, 'MultiSelectPaintable':new()),
    ok.


new(GameCanvas, InputList, PlayerInputId, TowerInfoPaintable, RtsPlayerLayerInterface, LayerPositionFinderInterface, SelectRTSLayerVisitorFactoryInterface, TouchButtonsBuilderFactory) when is_integer(PlayerInputId) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GameCanvas, InputList, PlayerInputId, TowerInfoPaintable, RtsPlayerLayerInterface, LayerPositionFinderInterface, SelectRTSLayerVisitorFactoryInterface, TouchButtonsBuilderFactory),
    This.

'$init'(This, GameCanvas, InputList, PlayerInputId, TowerInfoPaintable, RtsPlayerLayerInterface, LayerPositionFinderInterface, SelectRTSLayerVisitorFactoryInterface, TouchButtonsBuilderFactory) when is_integer(PlayerInputId) ->
        'RTSPlayerGameInput':'$init'(This, GameCanvas, InputList, PlayerInputId, TowerInfoPaintable, RtsPlayerLayerInterface, LayerPositionFinderInterface, SelectRTSLayerVisitorFactoryInterface),
        init_fields(This),
        put({This, touchButtonsBuilderFactory}, TouchButtonsBuilderFactory),
        BasicColorFactory = 'BasicColorFactory':getInstance(),
        put({This, notYoursGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'NOT_YOURS'}), (fun(Target_N67671) -> (get({Target_N67671, '$class'})):getAt(Target_N67671, 2) end)('SmallIntegerSingletonFactory':getInstance()), get({BasicColorFactory, 'PINK'}), get({'BooleanFactory':getInstance(), 'FALSE'}))),
        (fun(Target_N67749) -> (get({Target_N67749, '$class'})):addListenerInterface(Target_N67749, This) end)('BasicMotionGesturesHandler':getInstance()).

% throws Exception
setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager) ->
        GeographicMapCompositeInterface = AllBinaryGameLayerManager,
        GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
        (get({get({This, notYoursGameNotificationEvent}), '$class'})):setBasicColorP(get({This, notYoursGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)).

% throws Exception
processDraggingMotionInput(This, LayerManager) ->
        try
        MotionGestureEvent = (fun(Target_N68242) -> (get({Target_N68242, '$class'})):get(Target_N68242, ((fun(Target_N68266) -> (get({Target_N68266, '$class'})):size(Target_N68266) end)((get({This, '$class'})):getMotionGestureInputList(This)) - 1)) end)((get({This, '$class'})):getMotionGestureInputList(This)),
        MotionGestureInput = (get({MotionGestureEvent, '$class'})):getMotionGesture(MotionGestureEvent),
        RtsFormInput = (get({This, '$class'})):getSelectedRtsFormInput(This),
        case (MotionGestureInput =:= get({This, 'PRESSED'})) of
            true ->
            put({local, point}, (get({MotionGestureEvent, '$class'})):getCurrentPoint(MotionGestureEvent)),
            case (fun(Target_N69033) -> (get({Target_N69033, '$class'})):isInForm(Target_N69033, get({local, point})) end)((fun(Target_N69040) -> (get({Target_N69040, '$class'})):getCurrentScrollSelectionForm(Target_N69040) end)((get({This, '$class'})):getRtsPlayerLayerInterface(This))) of
                true ->
                put({This, isDragging}, (get({RtsFormInput, '$class'})):processSticky(RtsFormInput, (get({This, '$class'})):getSelectedRtsLayer(This), (get({This, '$class'})):getRtsPlayerLayerInterface(This), LayerManager, get({local, point})));
                false -> ok
            end;
            false ->
            case (MotionGestureInput =:= get({This, 'RELEASED'})) of
            true ->
            put({local, point}, (get({MotionGestureEvent, '$class'})):getCurrentPoint(MotionGestureEvent)),
            case (fun(Target_N68524) -> (get({Target_N68524, '$class'})):isInForm(Target_N68524, get({local, point})) end)((fun(Target_N68531) -> (get({Target_N68531, '$class'})):getCurrentScrollSelectionForm(Target_N68531) end)((get({This, '$class'})):getRtsPlayerLayerInterface(This))) of
                true ->
                (get({RtsFormInput, '$class'})):processAtPoint(RtsFormInput, (get({This, '$class'})):getSelectedRtsLayer(This), (get({This, '$class'})):getRtsPlayerLayerInterface(This), LayerManager, get({local, point}));
                false ->
                case (get({RtsFormInput, '$class'})):isStickyItemSelected(RtsFormInput) of
                true ->
                PreviousRtsFormInput = RtsFormInput,
                (get({This, '$class'})):select(This, MotionGestureEvent),
                (fun(Target_N68690) -> (get({Target_N68690, '$class'})):selectAllPreselected(Target_N68690) end)((get({This, '$class'})):getSelectedBuildingPlayerGameInput(This)),
                (get({PreviousRtsFormInput, '$class'})):processAtPoint(PreviousRtsFormInput, (get({This, '$class'})):getSelectedRtsLayer(This), (get({This, '$class'})):getRtsPlayerLayerInterface(This), LayerManager, get({local, point})),
                (fun(Target_N68774) -> (get({Target_N68774, '$class'})):deselectAllPreselected(Target_N68774) end)((get({This, '$class'})):getSelectedBuildingPlayerGameInput(This));
                false ->
                (get({This, '$class'})):select(This, MotionGestureEvent)
            end
            end,
            (get({RtsFormInput, '$class'})):setStickyItemSelected(RtsFormInput, false),
            (get({RtsFormInput, '$class'})):setSelectedStickyItem(RtsFormInput, 'ABCustomItem':getNullInstance()),
            (get({RtsFormInput, '$class'})):setSelectedStickyItemIndex(RtsFormInput, (-1)),
            throw({'$return', true});
            false -> ok
        end
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

makeSelection(This) ->
        RtsLayerList = get({(fun(Target_N69554) -> (get({Target_N69554, '$class'})):getPlayerOwnedRTSLayers(Target_N69554) end)((get({This, '$class'})):getRtsPlayerLayerInterface(This)), rtsLayerList}),
        put({local, rectX1}, (get({get({This, startPoint}), '$class'})):getX(get({This, startPoint}))),
        put({local, rectY1}, (get({get({This, startPoint}), '$class'})):getY(get({This, startPoint}))),
        put({local, rectX2}, (get({get({This, endPoint}), '$class'})):getX(get({This, endPoint}))),
        put({local, rectY2}, (get({get({This, endPoint}), '$class'})):getY(get({This, endPoint}))),
        case (get({local, rectX1}) > get({local, rectX2})) of
            true ->
            put({local, rectX2}, get({local, rectX1})),
            put({local, rectX1}, (get({get({This, endPoint}), '$class'})):getX(get({This, endPoint})));
            false -> ok
        end,
        case (get({local, rectY1}) > get({local, rectY2})) of
            true ->
            put({local, rectY2}, get({local, rectY1})),
            put({local, rectY1}, (get({get({This, endPoint}), '$class'})):getY(get({This, endPoint})));
            false -> ok
        end,
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'AT'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({local, rectX1})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'SPACE'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({local, rectY1})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'SPACE'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({local, rectX2})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'SPACE'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({local, rectY2})),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({This, 'METHOD'})),
        put({local, rtsLayer}, undefined),
        lists:foreach(fun(Index) ->
            put({local, rtsLayer}, (get({RtsLayerList, '$class'})):get(RtsLayerList, Index)),
            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
            ViewPosition = (get({get({local, rtsLayer}), '$class'})):getViewPosition(get({local, rtsLayer})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'POSSIBLE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({local, rtsLayer}), '$class'})):getName(get({local, rtsLayer}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'SPACE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'AT'})),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((((get({ViewPosition, '$class'})):getX(ViewPosition) + (get({get({local, rtsLayer}), '$class'})):getHalfWidth(get({local, rtsLayer})))))),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'SPACE'})),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((((get({ViewPosition, '$class'})):getY(ViewPosition) + (get({get({local, rtsLayer}), '$class'})):getHalfHeight(get({local, rtsLayer})))))),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({This, 'METHOD'})),
            case (get({get({This, rectangleCollisionUtil}), '$class'})):isInside(get({This, rectangleCollisionUtil}), get({local, rectX1}), get({local, rectY1}), get({local, rectX2}), get({local, rectY2}), ((get({ViewPosition, '$class'})):getX(ViewPosition) + (get({get({local, rtsLayer}), '$class'})):getHalfWidth(get({local, rtsLayer}))), ((get({ViewPosition, '$class'})):getY(ViewPosition) + (get({get({local, rtsLayer}), '$class'})):getHalfHeight(get({local, rtsLayer})))) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N71008) -> (get({Target_N71008, '$class'})):toString(Target_N71008) end)((fun(Target_N71015) -> (get({Target_N71015, '$class'})):append(Target_N71015, (get({get({local, rtsLayer}), '$class'})):getName(get({local, rtsLayer}))) end)((fun(Target_N71022) -> (get({Target_N71022, '$class'})):append(Target_N71022, get({This, 'ADDING'})) end)('StringMaker':new()))), This, get({This, 'METHOD'})),
                (get({get({local, rtsLayer}), '$class'})):select(get({local, rtsLayer})),
                (fun(Target_N71117) -> (get({Target_N71117, '$class'})):addSelectedRTSLayer(Target_N71117, get({local, rtsLayer})) end)((get({This, '$class'})):getSelectedBuildingPlayerGameInput(This));
                false -> ok
            end
        end, lists:seq(((get({RtsLayerList, '$class'})):size(RtsLayerList) - 1), 0, -1)),
        GameLayer = (fun(Target_N71252) -> (get({Target_N71252, '$class'})):getLastSelectedRtsLayer(Target_N71252) end)((get({This, '$class'})):getSelectedBuildingPlayerGameInput(This)),
        case (GameLayer =/= 'CollidableDestroyableDamageableLayer':getNullInstance()) of
            true ->
            LastRTSLayer = GameLayer,
            case ((get({LastRTSLayer, '$class'})):getScrollSelectionForm(LastRTSLayer) =/= 'ScrollSelectionForm':getNullScrollSelectionForm()) of
                true ->
                (get({This, '$class'})):updateForm(This, (get({LastRTSLayer, '$class'})):getScrollSelectionForm(LastRTSLayer), (get({LastRTSLayer, '$class'})):getRTSFormInput(LastRTSLayer)),
                (get({This, '$class'})):setSelectedRtsLayer(This, LastRTSLayer);
                false -> ok
            end;
            false -> ok
        end,
        (get({This, '$class'})):updatePaintable(This).

% throws Exception
processSelectionBoxMotionInput(This, LayerManager) ->
        lists:foreach(fun(Index) ->
            MotionGestureEvent = (fun(Target_N71578) -> (get({Target_N71578, '$class'})):get(Target_N71578, Index) end)((get({This, '$class'})):getMotionGestureInputList(This)),
            MotionGestureInput = (get({MotionGestureEvent, '$class'})):getMotionGesture(MotionGestureEvent),
            Point = (get({MotionGestureEvent, '$class'})):getCurrentPoint(MotionGestureEvent),
            case (MotionGestureInput =:= get({get({This, touchMotionGestureFactory}), 'PRESSED'})) of
                true ->
                put({This, startPoint}, Point),
                put({This, endPoint}, Point);
                false ->
                case (MotionGestureInput =:= get({get({This, touchMotionGestureFactory}), 'RELEASED'})) of
                true ->
                put({This, endPoint}, Point),
                (get({This, '$class'})):makeSelection(This),
                put({This, startPoint}, get({'PointFactory':getInstance(), 'ZERO_ZERO'})),
                put({This, endPoint}, get({'PointFactory':getInstance(), 'ZERO_ZERO'}));
                false ->
                put({This, endPoint}, Point)
            end
            end
        end, lists:seq(((fun(Target_N72086) -> (get({Target_N72086, '$class'})):size(Target_N72086) end)((get({This, '$class'})):getMotionGestureInputList(This)) - 1), 0, -1)).

% throws Exception
processMotionInput(This, LayerManager) ->
        case ((fun(Target_N72209) -> (get({Target_N72209, '$class'})):size(Target_N72209) end)((get({This, '$class'})):getMotionGestureInputList(This)) > 0) of
            true ->
            EndDrag = (get({This, '$class'})):processDraggingMotionInput(This, LayerManager),
            case (not get({This, isDragging})) of
                true ->
                (get({This, '$class'})):processSelectionBoxMotionInput(This, LayerManager);
                false -> ok
            end,
            case EndDrag of
                true ->
                put({This, isDragging}, false);
                false -> ok
            end;
            false -> ok
        end,
        (fun(Target_N72393) -> (get({Target_N72393, '$class'})):clear(Target_N72393) end)((get({This, '$class'})):getMotionGestureInputList(This)).

setSelectedRtsFormInput(This, SelectedRtsFormInput) ->
        LogUtil = 'LogUtil':getInstance(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N72560) -> (get({Target_N72560, '$class'})):toString(Target_N72560) end)((fun(Target_N72567) -> (get({Target_N72567, '$class'})):append(Target_N72567, (fun(Target_N72623) -> (get({Target_N72623, '$class'})):toString(Target_N72623, SelectedRtsFormInput) end)('StringUtil':getInstance())) end)((fun(Target_N72574) -> (get({Target_N72574, '$class'})):append(Target_N72574, get({'CommonLabels':getInstance(), 'START'})) end)('StringMaker':new()))), This, "setSelectedRtsFormInput"),
        'RTSPlayerGameInput':setSelectedRtsFormInput(This, SelectedRtsFormInput),
        (get({This, '$class'})):setSelectedRtsLayer(This, 'CollidableDestroyableDamageableLayer':getNullInstance()).

updateFormForLayer(This, RtsLayer) ->
        ScrollSelectionForm = (get({RtsLayer, '$class'})):getScrollSelectionForm(RtsLayer),
        case ((ScrollSelectionForm =/= 'ScrollSelectionForm':getNullScrollSelectionForm()) andalso (array:get(0, (fun(Target_N72895) -> (get({Target_N72895, '$class'})):getGroupInterface(Target_N72895) end)((get({This, '$class'})):getRtsPlayerLayerInterface(This))) =:= array:get(0, (get({RtsLayer, '$class'})):getGroupInterface(RtsLayer)))) of
            true ->
            (get({This, '$class'})):updateForm(This, ScrollSelectionForm, (get({RtsLayer, '$class'})):getRTSFormInput(RtsLayer)),
            (fun(Target_N73126) -> (get({Target_N73126, '$class'})):setSelectedRTSLayer(Target_N73126, 'CollidableDestroyableDamageableLayer':getNullInstance()) end)((get({This, '$class'})):getSelectedBuildingPlayerGameInput(This)),
            (get({This, '$class'})):setSelectedRtsLayer(This, RtsLayer);
            false ->
            (fun(Target_N72949) -> (get({Target_N72949, '$class'})):setCurrentScrollSelectionForm(Target_N72949, (fun(Target_N72969) -> (get({Target_N72969, '$class'})):getBuildingScrollSelectionForm(Target_N72969) end)((get({This, '$class'})):getRtsPlayerLayerInterface(This))) end)((get({This, '$class'})):getRtsPlayerLayerInterface(This)),
            (get({This, '$class'})):setSelectedRtsFormInput(This, (fun(Target_N73006) -> (get({Target_N73006, '$class'})):getRTSFormInput(Target_N73006) end)((get({This, '$class'})):getRtsPlayerLayerInterface(This))),
            (fun(Target_N73035) -> (get({Target_N73035, '$class'})):setSelectedRTSLayer(Target_N73035, 'CollidableDestroyableDamageableLayer':getNullInstance()) end)((get({This, '$class'})):getSelectedBuildingPlayerGameInput(This))
        end.

updateForm(This, ScrollSelectionForm, RtfFormInput) ->
        (fun(Target_N73253) -> (get({Target_N73253, '$class'})):setCurrentScrollSelectionForm(Target_N73253, ScrollSelectionForm) end)((get({This, '$class'})):getRtsPlayerLayerInterface(This)),
        (get({This, '$class'})):setSelectedRtsFormInput(This, RtfFormInput).

% throws Exception
setSelectedRTSLayer(This, RtSLayer, GeographicMapCellPosition) ->
        try
        case ((RtSLayer =/= 'CollidableDestroyableDamageableLayer':getNullInstance()) andalso (array:get(0, (fun(Target_N73441) -> (get({Target_N73441, '$class'})):getGroupInterface(Target_N73441) end)((get({This, '$class'})):getRtsPlayerLayerInterface(This))) =/= array:get(0, (get({RtSLayer, '$class'})):getGroupInterface(RtSLayer)))) of
            true ->
            (fun(Target_N73495) -> (get({Target_N73495, '$class'})):add(Target_N73495, 'ErrorSound':getInstance()) end)((get({This, '$class'})):getRtsPlayerLayerInterface(This)),
            (fun(Target_N73537) -> (get({Target_N73537, '$class'})):fireEvent(Target_N73537, get({This, notYoursGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance()),
            throw({'$return', ok});
            false -> ok
        end,
        GameCanvas = (get({This, '$class'})):getGameCanvas(This),
        case (RtSLayer =/= 'CollidableDestroyableDamageableLayer':getNullInstance()) of
            true ->
            (fun(Target_N74085) -> (get({Target_N74085, '$class'})):add(Target_N74085, 'SelectBuildingSound':getInstance()) end)((get({This, '$class'})):getRtsPlayerLayerInterface(This)),
            RtsLayer = RtSLayer,
            (get({RtsLayer, '$class'})):select(RtsLayer),
            (get({This, '$class'})):updateFormForLayer(This, RtsLayer),
            case ((get({GameCanvas, '$class'})):getGameState(GameCanvas) =:= get({get({This, gameStateFactory}), 'PLAYING_GAME_STATE'})) of
                true ->
                case (get({RtsLayer, '$class'})):isSelfUpgradeable(RtsLayer) of
                    true ->
                    (get({GameCanvas, '$class'})):updateCurrentTouchInputFactory(GameCanvas, 'RTSTouchButtonsBuilder':new());
                    false ->
                    (get({GameCanvas, '$class'})):updateCurrentTouchInputFactory(GameCanvas, 'NoBuildingSelectedTouchButtonsBuilder':new())
                end;
                false ->
                EndLevelTouchButtonsBuilder = 'EndLevelTouchButtonsBuilder':new(),
                case (get({This, touchButtonsBuilderFactory}) =/= undefined) of
                    true ->
                    (get({EndLevelTouchButtonsBuilder, '$class'})):add(EndLevelTouchButtonsBuilder, (get({get({This, touchButtonsBuilderFactory}), '$class'})):getInstance(get({This, touchButtonsBuilderFactory})));
                    false -> ok
                end,
                (get({GameCanvas, '$class'})):updateCurrentTouchInputFactory(GameCanvas, EndLevelTouchButtonsBuilder)
            end;
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Set Player Default Form", This, "setSelectedRTSLayer"),
            (fun(Target_N73708) -> (get({Target_N73708, '$class'})):setCurrentScrollSelectionForm(Target_N73708, (fun(Target_N73728) -> (get({Target_N73728, '$class'})):getBuildingScrollSelectionForm(Target_N73728) end)((get({This, '$class'})):getRtsPlayerLayerInterface(This))) end)((get({This, '$class'})):getRtsPlayerLayerInterface(This)),
            (get({This, '$class'})):setSelectedRtsFormInput(This, (fun(Target_N73765) -> (get({Target_N73765, '$class'})):getRTSFormInput(Target_N73765) end)((get({This, '$class'})):getRtsPlayerLayerInterface(This))),
            (fun(Target_N73794) -> (get({Target_N73794, '$class'})):setSelectedRTSLayer(Target_N73794, 'CollidableDestroyableDamageableLayer':getNullInstance()) end)((get({This, '$class'})):getSelectedBuildingPlayerGameInput(This)),
            case ((get({GameCanvas, '$class'})):getGameState(GameCanvas) =:= get({get({This, gameStateFactory}), 'PLAYING_GAME_STATE'})) of
                true ->
                (get({GameCanvas, '$class'})):updateCurrentTouchInputFactory(GameCanvas, 'NoBuildingSelectedTouchButtonsBuilder':new());
                false ->
                EndLevelNoBuildingSelectedTouchButtonsBuilder = 'EndLevelNoBuildingSelectedTouchButtonsBuilder':new(),
                case (get({This, touchButtonsBuilderFactory}) =/= undefined) of
                    true ->
                    (get({EndLevelNoBuildingSelectedTouchButtonsBuilder, '$class'})):add(EndLevelNoBuildingSelectedTouchButtonsBuilder, (get({get({This, touchButtonsBuilderFactory}), '$class'})):getInstance(get({This, touchButtonsBuilderFactory})));
                    false -> ok
                end,
                (get({GameCanvas, '$class'})):updateCurrentTouchInputFactory(GameCanvas, EndLevelNoBuildingSelectedTouchButtonsBuilder)
            end
        end,
        (fun(Target_N74541) -> (get({Target_N74541, '$class'})):setSelectedGeographicCellPosition(Target_N74541, GeographicMapCellPosition) end)((get({This, '$class'})):getSelectedRtsFormInput(This)),
        (fun(Target_N74575) -> (get({Target_N74575, '$class'})):setSelectedRTSLayer(Target_N74575, RtSLayer) end)((get({This, '$class'})):getSelectedBuildingPlayerGameInput(This)),
        (get({This, '$class'})):updatePaintable(This)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

updatePaintable(This) ->
        List = (fun(Target_N74783) -> (get({Target_N74783, '$class'})):getSelectedBasicArrayList(Target_N74783) end)((get({This, '$class'})):getSelectedBuildingPlayerGameInput(This)),
        case ((get({List, '$class'})):size(List) > 1) of
            true ->
            GeographicMapCompositeInterface = (get({This, '$class'})):getGameCanvas(This),
            GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
            (get({get({This, multiSelectPaintable}), '$class'})):setBasicColorP(get({This, multiSelectPaintable}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)),
            (get({get({This, multiSelectPaintable}), '$class'})):update(get({This, multiSelectPaintable}), List),
            (fun(Target_N75234) -> (get({Target_N75234, '$class'})):updateRTSLayerInfoSelection(Target_N75234, get({This, multiSelectPaintable})) end)((get({This, '$class'})):getRTSLayerInfoPaintable(This));
            false ->
            case ((get({List, '$class'})):size(List) =:= 1) of
            true ->
            RtsLayer = (get({List, '$class'})):get(List, 0),
            (fun(Target_N74993) -> (get({Target_N74993, '$class'})):updateRTSLayerInfoSelection(Target_N74993, (get({RtsLayer, '$class'})):createHudPaintable(RtsLayer)) end)((get({This, '$class'})):getRTSLayerInfoPaintable(This));
            false ->
            (fun(Target_N74882) -> (get({Target_N74882, '$class'})):updateRTSLayerInfoInit(Target_N74882, 'NullInitUpdatePaintable':getInstance()) end)((get({This, '$class'})):getRTSLayerInfoPaintable(This))
        end
        end.

paint(This, Graphics) ->
        'RTSPlayerGameInput':paint(This, Graphics),
        case ((get({This, startPoint}) =/= get({'PointFactory':getInstance(), 'ZERO_ZERO'})) andalso (get({This, endPoint}) =/= get({'PointFactory':getInstance(), 'ZERO_ZERO'}))) of
            true ->
            (get({Graphics, '$class'})):setColor(Graphics, (fun(Target_N75446) -> (get({Target_N75446, '$class'})):intValue(Target_N75446) end)(get({'BasicColorFactory':getInstance(), 'RED'}))),
            put({local, rectX1}, (get({get({This, startPoint}), '$class'})):getX(get({This, startPoint}))),
            put({local, rectY1}, (get({get({This, startPoint}), '$class'})):getY(get({This, startPoint}))),
            put({local, rectX2}, (get({get({This, endPoint}), '$class'})):getX(get({This, endPoint}))),
            put({local, rectY2}, (get({get({This, endPoint}), '$class'})):getY(get({This, endPoint}))),
            case (get({local, rectX1}) > get({local, rectX2})) of
                true ->
                put({local, rectX2}, get({local, rectX1})),
                put({local, rectX1}, (get({get({This, endPoint}), '$class'})):getX(get({This, endPoint})));
                false -> ok
            end,
            case (get({local, rectY1}) > get({local, rectY2})) of
                true ->
                put({local, rectY2}, get({local, rectY1})),
                put({local, rectY1}, (get({get({This, endPoint}), '$class'})):getY(get({This, endPoint})));
                false -> ok
            end,
            (get({Graphics, '$class'})):drawRect(Graphics, get({local, rectX1}), get({local, rectY1}), (get({local, rectX2}) - get({local, rectX1})), (get({local, rectY2}) - get({local, rectY1})));
            false -> ok
        end.

onMotionGestureEvent(This, MotionGestureEvent) ->
        (fun(Target_N75985) -> (get({Target_N75985, '$class'})):add(Target_N75985, MotionGestureEvent) end)((get({This, '$class'})):getMotionGestureInputList(This)).

onScrolledMotionGestureEvent(This, MotionGestureEvent) ->
        ok.

getSelectedRtsLayer(This) ->
        get({This, selectedRtsLayer}).

setSelectedRtsLayer(This, SelectedRtsLayer) ->
        put({This, selectedRtsLayer}, SelectedRtsLayer).

