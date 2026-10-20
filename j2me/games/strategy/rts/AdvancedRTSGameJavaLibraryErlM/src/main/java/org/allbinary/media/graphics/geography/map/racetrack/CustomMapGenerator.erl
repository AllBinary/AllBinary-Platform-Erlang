% 
% AllBinary Open License Version 1 
% Copyright (c) 2006 AllBinary 
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
% package org.allbinary.media.graphics.geography.map.racetrack
% import org.allbinary.game.layer.AdvancedRTSGameLayer
% import org.allbinary.game.layer.waypoint.WaypointLayer
% import org.allbinary.graphics.CellPosition
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory
% import org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory

-module('CustomMapGenerator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CustomMapGeneratorBase', Function, Arguments).

init_fields(This) ->
    put({This, customMapArray}, undefined),
    put({This, raceTrackGeographicMap}, undefined),
    put({This, geographicMapCellTypeFactory}, undefined),
    put({This, dropCellPositionHistory}, 'DropCellPositionHistory':getInstance()),
    ok.


new(RaceTrackGeographicMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, RaceTrackGeographicMap),
    This.

'$init'(This, RaceTrackGeographicMap) ->
    'CustomMapGeneratorBase':'$init'(This),
    init_fields(This),
        put({This, raceTrackGeographicMap}, RaceTrackGeographicMap),
        put({This, geographicMapCellTypeFactory}, (get({get({This, raceTrackGeographicMap}), '$class'})):getGeographicMapCellTypeFactory(get({This, raceTrackGeographicMap}))),
        MapArray = (fun(Target_N66050) -> (get({Target_N66050, '$class'})):getMapArray(Target_N66050) end)((get({RaceTrackGeographicMap, '$class'})):getRaceTrackData(RaceTrackGeographicMap)),
        Size2 = array:size(array:get(0, MapArray)),
        put({This, customMapArray}, array:new(array:size(MapArray), {default, array:new(Size2, {default, 0})})),
        case ((array:size(MapArray) =/= array:size(get({This, customMapArray}))) orelse (array:size(array:get(0, MapArray)) =/= array:size(array:get(0, get({This, customMapArray}))))) of
            true ->
            erlang:error({'Exception', "Array Incorrect"});
            false -> ok
        end.

% throws Exception
copyMapIntoCustomMap(This) ->
        MapArray = (fun(Target_N66419) -> (get({Target_N66419, '$class'})):getMapArray(Target_N66419) end)((get({get({This, raceTrackGeographicMap}), '$class'})):getRaceTrackData(get({This, raceTrackGeographicMap}))),
        StartIndex2 = (array:size(array:get(0, MapArray)) - 1),
        lists:foreach(fun(Index) ->
            lists:foreach(fun(Index2) ->
                put({This, customMapArray}, array:set(Index, array:set(Index2, (get({This, '$class'})):getCustomType(This, Index2, Index, array:get(Index2, array:get(Index, MapArray))), array:get(Index, get({This, customMapArray}))), get({This, customMapArray})))
            end, lists:seq(StartIndex2, 0, -1))
        end, lists:seq((array:size(MapArray) - 1), 0, -1)).

% throws Exception
getCustomType(This, Column, Row, CurrentType) when is_integer(Column), is_integer(Row), is_integer(CurrentType) ->
        try
        EmptyType = (get({get({This, geographicMapCellTypeFactory}), '$class'})):getEmptyType(get({This, geographicMapCellTypeFactory})),
        GeographicMapCellPositionFactory = (get({get({This, raceTrackGeographicMap}), '$class'})):getGeographicMapCellPositionFactory(get({This, raceTrackGeographicMap})),
        CellPosition = (get({GeographicMapCellPositionFactory, '$class'})):getAt(GeographicMapCellPositionFactory, Column, Row),
        case (get({get({This, dropCellPositionHistory}), '$class'})):isCellPositionWithDrop(get({This, dropCellPositionHistory}), CellPosition) of
            true ->
            Layer = (get({get({This, dropCellPositionHistory}), '$class'})):getLayerInterface(get({This, dropCellPositionHistory}), CellPosition),
            case (Layer =:= get({'AllBinaryLayer', 'NULL_ALLBINARY_LAYER'})) of
                true ->
                throw({'$return', EmptyType});
                false -> ok
            end,
            RtsLayer = Layer,
            case (not (((get({RtsLayer, '$class'})):getType(RtsLayer) =:= 'WaypointLayer':getStaticType()))) of
                true ->
                throw({'$return', EmptyType});
                false -> ok
            end;
            false -> ok
        end,
        CurrentType
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getCustomMapArray(This) ->
        get({This, customMapArray}).

