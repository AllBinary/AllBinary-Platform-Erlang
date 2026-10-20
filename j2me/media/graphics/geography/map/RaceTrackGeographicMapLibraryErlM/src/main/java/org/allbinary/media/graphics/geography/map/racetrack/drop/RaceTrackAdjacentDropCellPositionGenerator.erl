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
% import org.allbinary.game.identification.GroupCommonFactory
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.direction.Direction
% import org.allbinary.direction.DirectionFactory
% import org.allbinary.game.identification.BasicGroupFactory
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.geographic.map.LayerCoveringCellPositionsUtil
% import org.allbinary.graphics.GPoint
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.StdUtil
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCellType
% import org.allbinary.media.graphics.geography.map.GeographicMapDirectionUtil
% import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory
% import org.allbinary.media.graphics.geography.map.drop.DropCellPositionGeneratorInterface
% import org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory
% import org.allbinary.media.graphics.geography.map.racetrack.BaseRaceTrackGeographicMap
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellTypeFactory
% import org.allbinary.util.ABHashtable

-module('RaceTrackAdjacentDropCellPositionGenerator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RaceTrackDropCellPositionGenerator', Function, Arguments).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'RaceTrackAdjacentDropCellPositionGenerator':new()),
    ok.

init_fields(This) ->
    put({This, layerCoveringCellPositionsUtil}, 'LayerCoveringCellPositionsUtil':getInstance()),
    put({This, groupCommonFactory}, 'GroupCommonFactory':getInstance()),
    put({This, surroundingCellPositions}, array:new(4, {default, undefined})),
    put({This, hashtable}, (fun(Target_N67650) -> (get({Target_N67650, '$class'})):createHashtable(Target_N67650) end)('StdUtil':getInstance())),
    put({This, geographicMapDirectionUtil}, 'GeographicMapDirectionUtil':getInstance()),
    ok.


getInstance() ->
        get({'RaceTrackAdjacentDropCellPositionGenerator', 'SINGLETON'}).

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
getFirstNonRoadAdjacentCellPosition(This, Column, Row) when is_integer(Column), is_integer(Row) ->
        put({local, nonRoadGeographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
        GeographicMapCellPositionFactory = (get({get({This, raceTrackGeographicMap}), '$class'})):getGeographicMapCellPositionFactory(get({This, raceTrackGeographicMap})),
        put({This, surroundingCellPositions}, array:set(0, (get({GeographicMapCellPositionFactory, '$class'})):getAt(GeographicMapCellPositionFactory, Column, (Row - 1)), get({This, surroundingCellPositions}))),
        put({This, surroundingCellPositions}, array:set(1, (get({GeographicMapCellPositionFactory, '$class'})):getAt(GeographicMapCellPositionFactory, Column, (Row + 1)), get({This, surroundingCellPositions}))),
        put({This, surroundingCellPositions}, array:set(2, (get({GeographicMapCellPositionFactory, '$class'})):getAt(GeographicMapCellPositionFactory, (Column - 1), Row), get({This, surroundingCellPositions}))),
        put({This, surroundingCellPositions}, array:set(3, (get({GeographicMapCellPositionFactory, '$class'})):getAt(GeographicMapCellPositionFactory, (Column + 1), Row), get({This, surroundingCellPositions}))),
        BaseRaceTrackGeographicMap = get({This, raceTrackGeographicMap}),
        RaceTrackGeographicMapCellTypeFactory = (get({BaseRaceTrackGeographicMap, '$class'})):getGeographicMapCellTypeFactory(BaseRaceTrackGeographicMap),
        put({local, geographicMapCellPosition}, undefined),
        put({local, raceTrackGeographicMapCellType}, undefined),
        put({local, index}, array:size(get({This, surroundingCellPositions}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, geographicMapCellPosition}, array:get(get({local, index}), get({This, surroundingCellPositions}))),
            put({local, raceTrackGeographicMapCellType}, (get({get({This, raceTrackGeographicMap}), '$class'})):getCellTypeAt(get({This, raceTrackGeographicMap}), get({local, geographicMapCellPosition}))),
            case (not (get({RaceTrackGeographicMapCellTypeFactory, '$class'})):isPath(RaceTrackGeographicMapCellTypeFactory, get({local, raceTrackGeographicMapCellType}))) of
                true ->
                put({local, nonRoadGeographicMapCellPosition}, get({local, geographicMapCellPosition})),
                throw('$break');
                false -> ok
            end,
            Loop();
        false -> ok end end)(),
        get({local, nonRoadGeographicMapCellPosition}).

% throws Exception
update(This, AllBinaryGameLayerManager, GeographicMapInterface) ->
        (get({get({This, hashtable}), '$class'})):put(get({This, hashtable}), get({'AllBinaryGameLayerManager', 'ID'}), AllBinaryGameLayerManager),
        'RaceTrackDropCellPositionGenerator':update(This, AllBinaryGameLayerManager, GeographicMapInterface).

% throws Exception
drop(This, AllBinaryLayerManager, Index) when is_integer(Index) ->
        try
        GeographicMapCellPosition = (get({get({This, list}), '$class'})):get(get({This, list}), Index),
        RandomGeographicMapCellPosition = (get({This, '$class'})):getFirstNonRoadAdjacentCellPosition(This, (get({GeographicMapCellPosition, '$class'})):getColumn(GeographicMapCellPosition), (get({GeographicMapCellPosition, '$class'})):getRow(GeographicMapCellPosition)),
        case (RandomGeographicMapCellPosition =:= undefined) of
            true ->
            throw({'$return', ok});
            false -> ok
        end,
        DropCellPositionHistory = 'DropCellPositionHistory':getInstance(),
        case (not (get({DropCellPositionHistory, '$class'})):isCellPositionWithDrop(DropCellPositionHistory, GeographicMapCellPosition)) of
            true ->
            Direction = (get({get({This, geographicMapDirectionUtil}), '$class'})):getDirectionFromCellPositionToAdjacentCellPosition(get({This, geographicMapDirectionUtil}), RandomGeographicMapCellPosition, GeographicMapCellPosition),
            ObjectCanBeNull = (get({get({This, hashtable}), '$class'})):get(get({This, hashtable}), get({get({This, groupCommonFactory}), 'ID'})),
            case (ObjectCanBeNull =/= undefined) of
                true ->
                ok;
                false ->
                (get({get({This, hashtable}), '$class'})):put(get({This, hashtable}), get({get({This, groupCommonFactory}), 'ID'}), get({'BasicGroupFactory':getInstance(), 'NONE_ARRAY'}))
            end,
            (get({get({This, hashtable}), '$class'})):put(get({This, hashtable}), get({'DirectionFactory':getInstance(), 'NAME'}), Direction),
            Point = (get({RandomGeographicMapCellPosition, '$class'})):getPoint(RandomGeographicMapCellPosition),
            X = (get({Point, '$class'})):getX(Point),
            Y = (get({Point, '$class'})):getY(Point),
            Z = (get({Point, '$class'})):getZ(Point),
            LayerInterface = (fun(Target_N68742) -> (get({Target_N68742, '$class'})):getNextInstance(Target_N68742, get({This, hashtable}), X, Y, Z) end)((fun(Target_N68749) -> (get({Target_N68749, '$class'})):getRandomInstance(Target_N68749) end)('RaceTrackAdjacentDropLayerFactory':getInstance())),
            BaseRaceTrackGeographicMap = get({This, raceTrackGeographicMap}),
            List = (get({get({This, layerCoveringCellPositionsUtil}), '$class'})):getAll(get({This, layerCoveringCellPositionsUtil}), BaseRaceTrackGeographicMap, RandomGeographicMapCellPosition, LayerInterface, 'BasicArrayListD':new()),
            case (get({DropCellPositionHistory, '$class'})):anyCellPositionWithDrop(DropCellPositionHistory, List) of
                true ->
                throw({'$return', ok});
                false -> ok
            end,
            put({local, geographicMapCellType}, undefined),
            put({local, index2}, (get({List, '$class'})):size(List)),
            (fun Loop() -> case (begin put({local, index2}, get({local, index2}) - 1), get({local, index2}) end >= 0) of true ->
                put({local, geographicMapCellType}, (get({get({This, raceTrackGeographicMap}), '$class'})):getCellTypeAt(get({This, raceTrackGeographicMap}), (get({List, '$class'})):get(List, get({local, index2})))),
                case (get({get({This, raceTrackGeographicMapCellTypeFactory}), '$class'})):isPath(get({This, raceTrackGeographicMapCellTypeFactory}), get({local, geographicMapCellType})) of
                    true ->
                    throw({'$return', ok});
                    false -> ok
                end,
                Loop();
            false -> ok end end)(),
            (get({DropCellPositionHistory, '$class'})):addAll(DropCellPositionHistory, List, LayerInterface),
            (get({AllBinaryLayerManager, '$class'})):append(AllBinaryLayerManager, LayerInterface);
            false -> ok
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

