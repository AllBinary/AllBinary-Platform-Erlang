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
% import org.allbinary.animation.Animation
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.displayable.CanvasStrings
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface
% import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory
% import org.allbinary.util.BasicArrayList

-module('PathAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Animation', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, linePathAnimation}, undefined),
    put({This, pathFindingLayer}, undefined),
    put({This, allBinaryGameLayerManagerP}, 'AllBinaryGameLayerManager':getNullInstance()),
    put({This, startColor}, get({'BasicColorFactory':getInstance(), 'RED'})),
    put({This, middleColor}, get({'BasicColorFactory':getInstance(), 'BLUE'})),
    put({This, endColor}, get({'BasicColorFactory':getInstance(), 'GREEN'})),
    ok.


new(PathFindingLayer, LinePathAnimation) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PathFindingLayer, LinePathAnimation),
    This.

init(This, PathFindingLayer, LinePathAnimation) ->
    'Animation':init(This),
    init_fields(This),
        put({This, pathFindingLayer}, PathFindingLayer),
        put({This, linePathAnimation}, LinePathAnimation).

% throws Exception
setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager) ->
        put({This, allBinaryGameLayerManagerP}, AllBinaryGameLayerManager).

% throws Exception
nextFrame(This) ->
        ok.

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        try
            WaypointBehaviorBase = (get({get({This, pathFindingLayer}), '$class'})):getWaypointBehavior(get({This, pathFindingLayer})),
            case (WaypointBehaviorBase =/= undefined) of
                true ->
                GeographicMapCellHistory = (get({WaypointBehaviorBase, '$class'})):getCurrentGeographicMapCellHistory(WaypointBehaviorBase),
                List = (get({GeographicMapCellHistory, '$class'})):getTracked(GeographicMapCellHistory),
                Size = (get({List, '$class'})):size(List),
                case (Size > 0) of
                    true ->
                    GeographicMapCompositeInterface = get({This, allBinaryGameLayerManagerP}),
                    GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
                    TiledLayer = (get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface),
                    put({local, geographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
                    put({local, nextPoint}, undefined),
                    put({local, point}, undefined),
                    Start = (Size - 2),
                    lists:foreach(fun(Index) ->
                        case (Index =:= Start) of
                            true ->
                            (get({This, '$class'})):setBasicColorP(This, get({This, startColor})),
                            (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP3(get({This, basicSetColorUtil}), Graphics, (get({This, '$class'})):getBasicColorP(This), (get({This, '$class'})):getColor(This));
                            false ->
                            case (get({GeographicMapCellHistory, '$class'})):isVisited(GeographicMapCellHistory, get({local, geographicMapCellPosition})) of
                            true ->
                            (get({This, '$class'})):setBasicColorP(This, get({This, endColor})),
                            (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP3(get({This, basicSetColorUtil}), Graphics, (get({This, '$class'})):getBasicColorP(This), (get({This, '$class'})):getColor(This));
                            false ->
                            (get({This, '$class'})):setBasicColorP(This, get({This, middleColor})),
                            (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP3(get({This, basicSetColorUtil}), Graphics, (get({This, '$class'})):getBasicColorP(This), (get({This, '$class'})):getColor(This))
                        end
                        end,
                        put({local, geographicMapCellPosition}, (get({List, '$class'})):get(List, Index)),
                        put({local, point}, (get({get({local, geographicMapCellPosition}), '$class'})):getMidPoint(get({local, geographicMapCellPosition}))),
                        put({local, geographicMapCellPosition}, (get({List, '$class'})):get(List, (Index + 1))),
                        put({local, nextPoint}, (get({get({local, geographicMapCellPosition}), '$class'})):getMidPoint(get({local, geographicMapCellPosition}))),
                        (get({get({This, linePathAnimation}), '$class'})):paint(get({This, linePathAnimation}), Graphics, get({local, point}), get({local, nextPoint}), TiledLayer)
                    end, lists:seq(0, (Size - 1) - 1));
                    false -> ok
                end;
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Cleared Target", This, get({'CanvasStrings':getInstance(), 'PAINT'}))
        end.

