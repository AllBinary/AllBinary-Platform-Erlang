% 
% AllBinary Open License Version 1 
% Copyright (c) 2003 AllBinary 
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
% package org.allbinary.game.layer
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.game.layer.waypoint.WaypointBase
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.game.tick.TickableInterface
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.util.BasicArrayListS

-module('WaypointBehaviorBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TickableInterface

init_fields(This) ->
    put({This, ownedWaypointList}, undefined),
    put({This, waypointOverridesAttacking}, true),
    put({This, waypoint}, get({'WaypointBase', 'NULL_WAYPOINT_BASE'})),
    put({This, steeringVisitorList}, 'BasicArrayListD':new()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        put({This, ownedWaypointList}, 'BasicArrayListS':new(1)).

getName(This) ->
        atom_to_list(get({This, '$class'})).

isRunning(This) ->
        false.

% throws Exception
processTick(This, AllBinaryLayerManager) ->
        ok.

getOwnedWaypointList(This) ->
        get({This, ownedWaypointList}).

getWaypoint(This) ->
        get({This, waypoint}).

setWaypoint(This, Waypoint) ->
        put({This, waypoint}, Waypoint).

getSteeringVisitorList(This) ->
        get({This, steeringVisitorList}).

getMovementLogicAsString(This) ->
        erlang:error({'RuntimeException'}).

isWaypointListEmptyOrOnlyTargets(This) ->
        erlang:error({'RuntimeException'}).

isInSensorRange(This, LayerInterface, TargetDistance) when is_integer(TargetDistance) ->
        erlang:error({'RuntimeException'}).

getCurrentTargetLayerInterface(This) ->
        erlang:error({'RuntimeException'}).

getCurrentTargetingStateString(This) ->
        erlang:error({'RuntimeException'}).

isTrackingWaypoint(This) ->
        erlang:error({'RuntimeException'}).

getCurrentPathGeographicMapCellPosition(This) ->
        erlang:error({'RuntimeException'}).

getCurrentGeographicMapCellHistory(This) ->
        erlang:error({'RuntimeException'}).

isWaypointOverridesAttacking(This) ->
        get({This, waypointOverridesAttacking}).

getNextUnvisitedPathGeographicMapCellPosition(This) ->
        erlang:error({'RuntimeException'}).

needToMove(This) ->
        erlang:error({'RuntimeException'}).

setWaypointPathsList(This, WaypointPathsList) ->
        erlang:error({'RuntimeException'}).

getWaypointPathsList(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
setTarget(This, LayerInterface) ->
        erlang:error({'RuntimeException'}).

% throws Exception
setTargetWithDistance(This, LayerInterface, AnotherTargetDistance) when is_integer(AnotherTargetDistance) ->
        erlang:error({'RuntimeException'}).

% throws Exception
clearTarget(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
updatePathOnTargetMove(This, Reason) when (is_list(Reason) orelse Reason =:= undefined) ->
        ok.

