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
% package org.allbinary.media.graphics.geography.map.racetrack.drop
% import org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.game.layer.drop.DropLayerFactory
% import org.allbinary.game.layer.pickup.PickupLayerCircularStaticPool
% import org.allbinary.game.layer.pickup.RaceTrackPickupLayer
% import org.allbinary.game.rand.MyRandomFactory
% import org.allbinary.graphics.GPoint
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition

-module('RaceTrackRandomDropCellPositionGenerator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RaceTrackDropCellPositionGenerator', Function, Arguments).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'RaceTrackRandomDropCellPositionGenerator':new()),
    ok.

init_fields(This) ->
    put({This, myRandomFactory}, 'MyRandomFactory':getInstance()),
    put({This, cellsPerRowOrColumn}, 3),
    put({This, totalCells}, (get({This, cellsPerRowOrColumn}) * get({This, cellsPerRowOrColumn}))),
    put({This, rowArray}, array:from_list([0, 1, 2, 0, 1, 2, 0, 1, 2])),
    put({This, columnArray}, array:from_list([0, 0, 0, 1, 1, 1, 2, 2, 2])),
    put({This, cellWidth}, 0),
    put({This, cellHeight}, 0),
    ok.


getInstance() ->
        get({'RaceTrackRandomDropCellPositionGenerator', 'SINGLETON'}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'RaceTrackDropCellPositionGenerator':'$init'(This),
    init_fields(This),
        ok.

% throws Exception
update(This, AllBinaryGameLayerManager, GeographicMapInterface) ->
        'RaceTrackDropCellPositionGenerator':update(This, AllBinaryGameLayerManager, GeographicMapInterface),
        TiledLayer = (get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface),
        put({This, cellWidth}, ((get({TiledLayer, '$class'})):getCellWidth(TiledLayer) / get({This, cellsPerRowOrColumn}))),
        put({This, cellHeight}, ((get({TiledLayer, '$class'})):getCellHeight(TiledLayer) / get({This, cellsPerRowOrColumn}))).

% throws Exception
drop(This, AllBinaryLayerManager, Index) when is_integer(Index) ->
        GeographicMapCellPosition = (get({get({This, list}), '$class'})):get(get({This, list}), Index),
        Point = (get({GeographicMapCellPosition, '$class'})):getPoint(GeographicMapCellPosition),
        RandomCell = (get({get({This, myRandomFactory}), '$class'})):getAbsoluteNextInt(get({This, myRandomFactory}), get({This, totalCells})),
        Row = array:get(RandomCell, get({This, rowArray})),
        Column = array:get(RandomCell, get({This, columnArray})),
        X = ((get({Point, '$class'})):getX(Point) + ((Row * get({This, cellWidth})))),
        Y = ((get({Point, '$class'})):getY(Point) + ((Column * get({This, cellHeight})))),
        PickedUpLayerInterfaceFactory = (fun(Target_N67141) -> (get({Target_N67141, '$class'})):getRandomInstance(Target_N67141) end)('DropLayerFactory':getInstance()),
        TiledLayer = (get({get({This, raceTrackGeographicMap}), '$class'})):getAllBinaryTiledLayer(get({This, raceTrackGeographicMap})),
        PickupLayer = (fun(Target_N67241) -> (get({Target_N67241, '$class'})):getInstanceXYZ(Target_N67241, PickedUpLayerInterfaceFactory, X, Y, ((get({TiledLayer, '$class'})):getZP(TiledLayer) + 3)) end)('PickupLayerCircularStaticPool':getInstance()),
        (get({PickupLayer, '$class'})):setTiledLayer(PickupLayer, TiledLayer),
        (get({AllBinaryLayerManager, '$class'})):append(AllBinaryLayerManager, PickupLayer).

