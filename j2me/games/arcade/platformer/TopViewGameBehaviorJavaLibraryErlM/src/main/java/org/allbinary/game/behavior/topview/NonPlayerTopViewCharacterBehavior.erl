% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package org.allbinary.game.behavior.topview
% import org.allbinary.media.graphics.geography.map.MultiGeographicMapBehavior
% import org.allbinary.direction.Direction
% import org.allbinary.direction.DirectionFactory
% import org.allbinary.game.terrain.BasicTerrainInfo
% import org.allbinary.game.terrain.TerrainEvent
% import org.allbinary.game.terrain.TerrainEventCircularStaticPool
% import org.allbinary.game.terrain.TerrainEventHandler
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.math.AngleFactory
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCellType
% import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory

-module('NonPlayerTopViewCharacterBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TopViewCharacterBehavior', Function, Arguments).

init_fields(This) ->
    put({This, geographicMapBehavior}, 'MultiGeographicMapBehavior':new()),
    put({This, 'CLIFF'}, 'BasicTerrainInfo':new(get({'AngleFactory':getInstance(), 'DOWN'}))),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'TopViewCharacterBehavior':init(This),
    init_fields(This).


% throws Exception
terrainEvent(This, Layer, Direction, X, Y, GeographicMapInterfaceArray, GeographicMapCellTypeArray, GeographicMapCellPosition) when is_integer(X), is_integer(Y), (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined) ->
        MaxColumns = (fun(Target_N66212) -> (get({Target_N66212, '$class'})):getColumns(Target_N66212) end)((fun(Target_N66219) -> (get({Target_N66219, '$class'})):getAllBinaryTiledLayer(Target_N66219) end)(array:get(0, GeographicMapInterfaceArray))),
        case (((get({GeographicMapCellPosition, '$class'})):getColumn(GeographicMapCellPosition) > 0) andalso ((get({GeographicMapCellPosition, '$class'})):getColumn(GeographicMapCellPosition) < MaxColumns)) of
            true ->
            put({local, nextTerrainGeographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
            GeographicMapCellPositionFactory = (fun(Target_N66384) -> (get({Target_N66384, '$class'})):getGeographicMapCellPositionFactory(Target_N66384) end)(array:get(0, GeographicMapInterfaceArray)),
            case (Direction =:= get({'DirectionFactory':getInstance(), 'LEFT'})) of
                true ->
                put({local, nextTerrainGeographicMapCellPosition}, (get({GeographicMapCellPositionFactory, '$class'})):getAt(GeographicMapCellPositionFactory, ((get({GeographicMapCellPosition, '$class'})):getColumn(GeographicMapCellPosition) - 1), (get({GeographicMapCellPosition, '$class'})):getRow(GeographicMapCellPosition)));
                false ->
                case (Direction =:= get({'DirectionFactory':getInstance(), 'RIGHT'})) of
                true ->
                put({local, nextTerrainGeographicMapCellPosition}, (get({GeographicMapCellPositionFactory, '$class'})):getAt(GeographicMapCellPositionFactory, ((get({GeographicMapCellPosition, '$class'})):getColumn(GeographicMapCellPosition) + 1), (get({GeographicMapCellPosition, '$class'})):getRow(GeographicMapCellPosition)));
                false -> ok
            end
            end,
            (get({get({This, geographicMapBehavior}), '$class'})):getCellTypeAt(get({This, geographicMapBehavior}), GeographicMapInterfaceArray, GeographicMapCellTypeArray, get({local, nextTerrainGeographicMapCellPosition})),
            HasSolidBlock = (get({This, '$class'})):hasSolidBlock(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray),
            case (not HasSolidBlock) of
                true ->
                TerrainEvent = (fun(Target_N66823) -> (get({Target_N66823, '$class'})):getNext(Target_N66823, get({This, 'CLIFF'})) end)('TerrainEventCircularStaticPool':getInstance()),
                (fun(Target_N66884) -> (get({Target_N66884, '$class'})):fireEvent(Target_N66884, TerrainEvent) end)('TerrainEventHandler':getInstance(Layer));
                false -> ok
            end;
            false -> ok
        end.

terrainMove(This, Layer, GeographicMapInterfaceArray, X, Y) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), is_integer(X), is_integer(Y) ->
        (get({Layer, '$class'})):moveDXY(Layer, X, Y).

