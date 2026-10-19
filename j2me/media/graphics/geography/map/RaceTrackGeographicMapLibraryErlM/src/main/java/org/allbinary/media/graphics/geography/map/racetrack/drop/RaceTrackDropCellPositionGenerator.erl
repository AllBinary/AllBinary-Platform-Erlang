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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.util.BasicArrayListUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory
% import org.allbinary.media.graphics.geography.map.drop.BaseDropCellPositionGenerator
% import org.allbinary.media.graphics.geography.map.racetrack.BaseRaceTrackGeographicMap
% import org.allbinary.media.graphics.geography.map.racetrack.NullRaceTrackGeographicMap
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellTypeFactory
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapInterface
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackRoadsGeographicMapCellHistoryFactory
% import org.allbinary.time.GameTickTimeDelayHelperFactory
% import org.allbinary.time.TimeDelayHelper

-module('RaceTrackDropCellPositionGenerator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseDropCellPositionGenerator', Function, Arguments).

init_fields(This) ->
    put({This, list}, 'BasicArrayListD':new()),
    put({This, timeDelayHelper}, undefined),
    put({This, 'STRAIGHTAWAY'}, 4),
    put({This, raceTrackGeographicMap}, get({'NullRaceTrackGeographicMap', 'NULL_RACE_TRACK_GEOGRAPHIC_MAP'})),
    put({This, raceTrackGeographicMapCellTypeFactory}, 'GeographicMapCellTypeFactory':getInstance()),
    put({This, basicArrayListUtil}, 'BasicArrayListUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'BaseDropCellPositionGenerator':init(This),
    init_fields(This),
        put({This, timeDelayHelper}, 'TimeDelayHelper':new(10000)).

init(This) ->
        (get({get({This, list}), '$class'})):clear(get({This, list})).

% throws Exception
isDropAllowedAt(This, GeographicMapCellPosition) ->
        try
        RaceTrackGeographicMapCellType = (get({get({This, raceTrackGeographicMap}), '$class'})):getCellTypeAt(get({This, raceTrackGeographicMap}), GeographicMapCellPosition),
        RaceTrackGeographicMapCellTypeFactory = get({This, raceTrackGeographicMapCellTypeFactory}),
        case ((RaceTrackGeographicMapCellType =:= get({RaceTrackGeographicMapCellTypeFactory, 'HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE'})) orelse (RaceTrackGeographicMapCellType =:= get({RaceTrackGeographicMapCellTypeFactory, 'VERTICAL_STRAIGHT_ROAD_CELL_TYPE'}))) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
update(This, AllBinaryGameLayerManager, GeographicMapInterface) ->
        (get({This, '$class'})):init(This),
        BaseRaceTrackGeographicMap = GeographicMapInterface,
        put({This, raceTrackGeographicMap}, BaseRaceTrackGeographicMap),
        put({This, raceTrackGeographicMapCellTypeFactory}, (get({BaseRaceTrackGeographicMap, '$class'})):getGeographicMapCellTypeFactory(BaseRaceTrackGeographicMap)),
        RoadGeographicMapCellHistory = 'RaceTrackRoadsGeographicMapCellHistoryFactory':getInstance(),
        TrackedList = (get({RoadGeographicMapCellHistory, '$class'})):getTracked(RoadGeographicMapCellHistory),
        put({local, geographicMapCellPosition}, undefined),
        LastIndex = ((get({TrackedList, '$class'})):size(TrackedList) - 1),
        put({local, total}, 0),
        put({local, ahead}, 0),
        lists:foreach(fun(Index) ->
            put({local, geographicMapCellPosition}, (get({TrackedList, '$class'})):get(TrackedList, Index)),
            put({local, total}, 0),
            put({local, ahead}, Index),
            (fun Loop() -> case (get({This, '$class'})):isDropAllowedAt(This, (get({TrackedList, '$class'})):get(TrackedList, get({local, ahead}))) of true ->
                put({local, total}, get({local, total}) + 1),
                case (get({local, total}) > get({This, 'STRAIGHTAWAY'})) of
                    true ->
                    (get({get({This, list}), '$class'})):add(get({This, list}), get({local, geographicMapCellPosition})),
                    throw('$break');
                    false -> ok
                end,
                put({local, ahead}, get({local, ahead}) + 1),
                case (get({local, ahead}) > LastIndex) of
                    true ->
                    throw('$break');
                    false -> ok
                end,
                Loop();
            false -> ok end end)()
        end, lists:seq(LastIndex, 0 + 1, -1)),
        Size = (get({get({This, list}), '$class'})):size(get({This, list})),
        lists:foreach(fun(Index) ->
            (get({This, '$class'})):drop(This, AllBinaryGameLayerManager, Index)
        end, lists:seq((Size - 1), 0, -1)).

% throws Exception
processTick(This, AllBinaryLayerManager) ->
        case (get({get({This, timeDelayHelper}), '$class'})):isTime(get({This, timeDelayHelper}), get({'GameTickTimeDelayHelperFactory':getInstance(), startTime})) of
            true ->
            Index = (get({get({This, basicArrayListUtil}), '$class'})):getRandomIndex(get({This, basicArrayListUtil}), get({This, list})),
            (get({This, '$class'})):drop(This, AllBinaryLayerManager, Index);
            false -> ok
        end.

% throws Exception
drop(This, AllBinaryLayerManager, Index) when is_integer(Index) ->
        erlang:error({'Exception', get({'CommonStrings':getInstance(), 'NOT_IMPLEMENTED'})}).

