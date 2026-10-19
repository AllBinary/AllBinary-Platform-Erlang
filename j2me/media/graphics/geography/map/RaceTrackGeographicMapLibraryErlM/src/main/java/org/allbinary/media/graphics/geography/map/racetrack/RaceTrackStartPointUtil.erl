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
% package org.allbinary.media.graphics.geography.map.racetrack
% import org.allbinary.util.BasicArrayList
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.PointFactory
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo
% import org.allbinary.media.graphics.geography.pathfinding.PathFindingNode

-module('RaceTrackStartPointUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


% throws Exception
get(GeographicMapInterface, PathFindingInfo, Index) when is_integer(Index) ->
        List = (get({PathFindingInfo, '$class'})):getStartPathFindingNodeList(PathFindingInfo),
        StartPathFindingNode = (get({List, '$class'})):get(List, Index),
        GeographicMapCellPosition = get({StartPathFindingNode, geographicMapCellPosition}),
        Point = (get({GeographicMapCellPosition, '$class'})):getPoint(GeographicMapCellPosition),
        (fun(Target_N66067) -> (get({Target_N66067, '$class'})):createXY(Target_N66067, (get({Point, '$class'})):getX(Point), ((get({Point, '$class'})):getY(Point) + (fun(Target_N66128) -> (get({Target_N66128, '$class'})):getHalfCellHeight(Target_N66128) end)((get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface)))) end)('PointFactory':getInstance()).

