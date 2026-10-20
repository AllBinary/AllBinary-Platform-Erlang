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
% package org.allbinary.media.graphics.geography.map
% import org.allbinary.game.displayable.canvas.AllBinaryGameCanvasInterface
% import org.allbinary.layer.AllBinaryLayer

-module('GeographicMapCellPositionTracking').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, currentGeographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
    put({This, previousGeographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
    put({This, newGeographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
    put({This, currentCellType}, get({'GeographicMapCellType', 'NULL_GEOGRAPHIC_MAP_CELL_TYPE'})),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
getCurrentOverCellType(This, GeographicMap) ->
        GeographicMapCellPosition = get({This, currentGeographicMapCellPosition}),
        case (GeographicMapCellPosition =/= get({This, previousGeographicMapCellPosition})) of
            true ->
            put({This, currentCellType}, (get({GeographicMap, '$class'})):getCellTypeAt(GeographicMap, GeographicMapCellPosition));
            false -> ok
        end,
        get({This, currentCellType}).

% throws Exception
updateStart(This, GameCanvasInterface, Layer) ->
        try
        case (GameCanvasInterface =/= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) of
            true ->
            GeographicMapCompositeInterface = (get({GameCanvasInterface, '$class'})):getLayerManager(GameCanvasInterface),
            GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
            put({This, newGeographicMapCellPosition}, (get({GeographicMapInterface, '$class'})):getCellPositionAtXY(GeographicMapInterface, ((get({Layer, '$class'})):getXP(Layer) + (get({Layer, '$class'})):getHalfWidth(Layer)), ((get({Layer, '$class'})):getYP(Layer) + (get({Layer, '$class'})):getHalfHeight(Layer)))),
            case (get({This, newGeographicMapCellPosition}) =/= get({This, currentGeographicMapCellPosition})) of
                true ->
                put({This, currentGeographicMapCellPosition}, get({This, newGeographicMapCellPosition})),
                throw({'$return', true});
                false -> ok
            end;
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

updateEnd(This) ->
        try
        case (get({This, currentGeographicMapCellPosition}) =/= get({This, previousGeographicMapCellPosition})) of
            true ->
            put({This, previousGeographicMapCellPosition}, get({This, currentGeographicMapCellPosition})),
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getPreviousGeographicMapCellPosition(This) ->
        get({This, previousGeographicMapCellPosition}).

getCurrentGeographicMapCellPosition(This) ->
        get({This, currentGeographicMapCellPosition}).

