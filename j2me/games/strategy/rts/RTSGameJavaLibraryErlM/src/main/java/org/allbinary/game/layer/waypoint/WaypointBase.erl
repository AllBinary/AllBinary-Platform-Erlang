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
% package org.allbinary.game.layer.waypoint
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.PathFindingLayerInterface
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventListenerInterface
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.media.audio.NoSound
% import org.allbinary.media.audio.Sound
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.pathfinding.MultipassState
% import org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('WaypointBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements EventListenerInterface

static_init() ->
    put({?MODULE, 'NULL_WAYPOINT_BASE'}, 'WaypointBase':new('NoSound':getInstance())),
    ok.

init_fields(This) ->
    put({This, connectedWaypointList}, 'BasicArrayListD':new()),
    put({This, sound}, undefined),
    put({This, allBinaryGameLayerManagerP}, 'AllBinaryGameLayerManager':getNullInstance()),
    ok.


new(Sound) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Sound),
    This.

'$init'(This, Sound) ->
    init_fields(This),
        put({This, sound}, Sound).

getSound(This) ->
        get({This, sound}).

% throws Exception
setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager) ->
        put({This, allBinaryGameLayerManagerP}, AllBinaryGameLayerManager).

getConnectedWaypointList(This) ->
        get({This, connectedWaypointList}).

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

% throws Exception
getPathFindingInfo(This, GeographicMapCellPosition) ->
        erlang:error({'RuntimeException'}).

% throws Exception
getPathsList(This, GeographicMapCellPosition, PathFindingInfo, MultipassState) ->
        erlang:error({'RuntimeException'}).

% throws Exception
getPathsListRunnable(This, GeographicMapCellPosition) ->
        erlang:error({'RuntimeException'}).

% throws Exception
getPathsListFromCacheOnly(This, GeographicMapCellPosition) ->
        erlang:error({'RuntimeException'}).

% throws Exception
visit(This, UnitLayer) ->
        ok.

reset(This) ->
        ok.

getType(This) ->
        0.

