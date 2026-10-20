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
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory
% import org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo
% import org.allbinary.media.graphics.geography.pathfinding.PathFindingNode
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInitVisitorInterface
% import org.allbinary.string.CommonSeps

-module('BasePathFindingInfoFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


% throws Exception
init(This, GeographicMapInterface, PathFindingInfo, MapArray) when (is_tuple(MapArray) orelse MapArray =:= undefined) ->
        ok % Java nested type RaceTrackGeographicMapCellPositionFactoryInitVisitor: move it to its own module
,
        (fun(Target_N67582) -> (get({Target_N67582, '$class'})):visit(Target_N67582, 'RaceTrackGeographicMapCellPositionFactoryInitVisitor':new()) end)((get({GeographicMapInterface, '$class'})):getGeographicMapCellPositionFactory(GeographicMapInterface)).

% throws Exception
addStartPathFindingNode(This, PathFindingInfo, StartGeographicMapCellPosition) ->
        (get({PathFindingInfo, '$class'})):addStartPathFindingNode(PathFindingInfo, 'PathFindingNode':new(get({'NullUtil':getInstance(), 'NULL_OBJECT'}), StartGeographicMapCellPosition)).

% throws Exception
addEndPathFindingNode(This, PathFindingInfo, EndGeographicMapCellPosition) ->
        (get({PathFindingInfo, '$class'})):addEndPathFindingNode(PathFindingInfo, 'PathFindingNode':new(get({'NullUtil':getInstance(), 'NULL_OBJECT'}), EndGeographicMapCellPosition)).

% throws Exception
getInstancePathFindingInfo(This, GeographicMapInterface, GraphArray) when (is_tuple(GraphArray) orelse GraphArray =:= undefined) ->
        erlang:error({'RuntimeException'}).

