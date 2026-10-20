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
% package org.allbinary.game.media.graphics.geography.map.racetrack
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.racetrack.BasePathFindingInfoFactory
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackRoadsGeographicMapCellHistoryFactory
% import org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo
% import org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfoFactoryBase
% import org.allbinary.util.BasicArrayListS

-module('PathFindingInfoFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasePathFindingInfoFactory', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'PathFindingInfoFactory':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'PathFindingInfoFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'BasePathFindingInfoFactory':'$init'(This),
    init_fields(This),
        ok.

% throws Exception
getInstancePathFindingInfo(This, GeographicMapInterface, GraphArray) when (is_tuple(GraphArray) orelse GraphArray =:= undefined) ->
        CommonStrings = 'CommonStrings':getInstance(),
        'PreLogUtil':put(get({CommonStrings, 'START'}), This, get({CommonStrings, 'GET_INSTANCE'})),
        PathFindingInfo = 'PathFindingInfo':new('PathFindingNodeCostInfoFactoryBase':new(), 'BasicArrayListS':new(1), 'BasicArrayListS':new(1)),
        (fun(Target_N66261) -> (get({Target_N66261, '$class'})):init(Target_N66261) end)('RaceTrackRoadsGeographicMapCellHistoryFactory':getInstance()),
        (get({This, '$class'})):init(This, GeographicMapInterface, PathFindingInfo, GraphArray),
        PathFindingInfo.

