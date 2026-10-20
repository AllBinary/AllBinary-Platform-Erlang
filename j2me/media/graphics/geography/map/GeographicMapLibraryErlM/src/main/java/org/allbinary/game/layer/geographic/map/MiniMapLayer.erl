%
% AllBinary Open License Version 1
% Copyright (c) 2011 AllBinary
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
% package org.allbinary.game.layer.geographic.map
% import javax.microedition.lcdui.Graphics
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.animation.vector.CircleFilledAnimation
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.color.ColorCompositeInterface
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.event.GeographicMapCellPositionEvent
% import org.allbinary.media.graphics.geography.map.event.GeographicMapCellPositionEventHandler
% import org.allbinary.media.graphics.geography.map.event.GeographicMapCellPositionEventListenerInterface
% import org.allbinary.view.ViewPositionBase

-module('MiniMapLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements GeographicMapCellPositionEventListenerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryLayer', Function, Arguments).

init_fields(This) ->
    put({This, allBinaryTiledLayer}, undefined),
    put({This, geographicMapCellPositionFactory}, undefined),
    put({This, list}, undefined),
    put({This, basicColorList}, undefined),
    put({This, positionList}, undefined),
    put({This, animationInterface}, undefined),
    ok.


new(GeographicMapInterface, ViewPosition) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GeographicMapInterface, ViewPosition),
    This.

'$init'(This, GeographicMapInterface, ViewPosition) ->
        'AllBinaryLayer':'$init'(This, get({'StringUtil':getInstance(), 'EMPTY_STRING'}), 'Rectangle':new((fun(Target_N66610) -> (get({Target_N66610, '$class'})):createXY(Target_N66610, 0, (get({ViewPosition, '$class'})):getY(ViewPosition)) end)('PointFactory':getInstance()), (fun(Target_N66657) -> (get({Target_N66657, '$class'})):getWidth(Target_N66657) end)((get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface)), (fun(Target_N66681) -> (get({Target_N66681, '$class'})):getHeight(Target_N66681) end)((get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface))), ViewPosition),
        init_fields(This),
        put({This, allBinaryTiledLayer}, (get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface)),
        put({This, geographicMapCellPositionFactory}, (get({GeographicMapInterface, '$class'})):getGeographicMapCellPositionFactory(GeographicMapInterface)),
        put({This, animationInterface}, 'CircleFilledAnimation':new((get({get({This, allBinaryTiledLayer}), '$class'})):getCellWidth(get({This, allBinaryTiledLayer})), (get({get({This, allBinaryTiledLayer}), '$class'})):getCellHeight(get({This, allBinaryTiledLayer})), get({'BasicColorFactory':getInstance(), 'WHITE'}))),
        put({This, list}, 'BasicArrayListD':new()),
        put({This, basicColorList}, 'BasicArrayListD':new()),
        put({This, positionList}, 'BasicArrayListD':new()),
        (fun(Target_N66993) -> (get({Target_N66993, '$class'})):addListener(Target_N66993, This) end)('GeographicMapCellPositionEventHandler':getInstance()),
        (get({This, '$class'})):init(This).

% throws Exception
init(This) ->
        (get({get({This, allBinaryTiledLayer}), '$class'})):setPosition(get({This, allBinaryTiledLayer}), get({This, x}), get({This, y}), get({This, z})).

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

% throws Exception
onRemoveGeographicMapCellPositionEvent(This, GeographicMapCellPositionEvent) ->
        ColorCompositeInterface = (get({GeographicMapCellPositionEvent, '$class'})):getSource(GeographicMapCellPositionEvent),
        Index = (get({get({This, list}), '$class'})):indexOf(get({This, list}), ColorCompositeInterface),
        case (Index >= 0) of
            true ->
            (get({get({This, list}), '$class'})):removeAt(get({This, list}), Index),
            (get({get({This, basicColorList}), '$class'})):removeAt(get({This, basicColorList}), Index),
            (get({get({This, positionList}), '$class'})):removeAt(get({This, positionList}), Index);
            false -> ok
        end.

% throws Exception
onGeographicMapCellPositionEvent(This, GeographicMapCellPositionEvent) ->
        ColorCompositeInterface = (get({GeographicMapCellPositionEvent, '$class'})):getSource(GeographicMapCellPositionEvent),
        put({local, layerIndex}, (-1)),
        Size = (get({get({This, list}), '$class'})):size(get({This, list})),
        put({local, nextColorCompositeInterface}, undefined),
        lists:foreach(fun(Index) ->
            put({local, nextColorCompositeInterface}, (get({get({This, list}), '$class'})):get(get({This, list}), Index)),
            case (get({local, nextColorCompositeInterface}) =:= ColorCompositeInterface) of
                true ->
                put({local, layerIndex}, Index),
                throw('$break');
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        GeographicMapCellPosition = (get({get({This, geographicMapCellPositionFactory}), '$class'})):getInstance(get({This, geographicMapCellPositionFactory}), (get({GeographicMapCellPositionEvent, '$class'})):getGeographicMapCellPosition(GeographicMapCellPositionEvent)),
        Point = (get({GeographicMapCellPosition, '$class'})):getPoint(GeographicMapCellPosition),
        case (get({local, layerIndex}) =:= (-1)) of
            true ->
            (get({get({This, list}), '$class'})):add(get({This, list}), ColorCompositeInterface),
            BasicColor = (get({ColorCompositeInterface, '$class'})):getBasicColorP(ColorCompositeInterface),
            (get({get({This, basicColorList}), '$class'})):add(get({This, basicColorList}), BasicColor),
            (get({get({This, positionList}), '$class'})):add(get({This, positionList}), Point),
            put({local, layerIndex}, ((get({get({This, basicColorList}), '$class'})):size(get({This, basicColorList})) - 1));
            false ->
            (get({get({This, positionList}), '$class'})):set(get({This, positionList}), get({local, layerIndex}), Point)
        end.

paintDots(This, Graphics) ->
        LocalPositionList = get({This, positionList}),
        LocalBasicColorList = get({This, basicColorList}),
        Length = (get({LocalPositionList, '$class'})):size(LocalPositionList),
        put({local, point}, undefined),
        put({local, basicColor}, undefined),
        put({local, index}, Length),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, point}, (get({LocalPositionList, '$class'})):get(LocalPositionList, get({local, index}))),
            put({local, basicColor}, (get({LocalBasicColorList, '$class'})):get(LocalBasicColorList, get({local, index}))),
            (get({Graphics, '$class'})):setColor(Graphics, (get({get({local, basicColor}), '$class'})):intValue(get({local, basicColor}))),
            (get({get({This, animationInterface}), '$class'})):setBasicColorP(get({This, animationInterface}), get({local, basicColor})),
            (get({get({This, animationInterface}), '$class'})):paintXY(get({This, animationInterface}), Graphics, ((get({get({local, point}), '$class'})):getX(get({local, point})) + get({This, x})), ((get({get({local, point}), '$class'})):getY(get({local, point})) + get({This, y}))),
            Loop();
        false -> ok end end)().

paint(This, Graphics) ->
        (get({get({This, allBinaryTiledLayer}), '$class'})):paint(get({This, allBinaryTiledLayer}), Graphics),
        (get({This, '$class'})):paintDots(This, Graphics).

