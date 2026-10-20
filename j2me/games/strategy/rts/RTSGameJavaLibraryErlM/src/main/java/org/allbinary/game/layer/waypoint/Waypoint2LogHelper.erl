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
% import org.allbinary.game.layer.PathFindingLayerInterface
% import org.allbinary.game.layer.WaypointBehaviorBase
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.util.BasicArrayList

-module('Waypoint2LogHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'Waypoint2LogHelper':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'Waypoint2LogHelper', instance}).

initRange(This, AssociatedAdvancedRTSGameLayer, CloseRange, SensorRange) when is_integer(CloseRange), is_integer(SensorRange) ->
        ok.

processPossibleTarget(This, AssociatedAdvancedRTSGameLayer, UnitWaypointBehavior2, LayerInterface, AnotherTargetDistance, IsShorterThanCurrentTargetDistance, IsCurrentTargetDestroyed) when is_integer(AnotherTargetDistance), is_boolean(IsShorterThanCurrentTargetDistance), is_boolean(IsCurrentTargetDestroyed) ->
        ok.

processSetTarget(This, AssociatedAdvancedRTSGameLayer, UnitWaypointBehavior2, LayerInterface, AnotherTargetDistance) when is_integer(AnotherTargetDistance) ->
        ok.

processPossibleTargetCloser(This, AssociatedAdvancedRTSGameLayer, UnitWaypointBehavior2, LayerInterface, AnotherTargetDistance) when is_integer(AnotherTargetDistance) ->
        ok.

setTarget(This, AssociatedAdvancedRTSGameLayer, UnitWaypointBehavior2, LayerInterface, AnotherTargetDistance) when is_integer(AnotherTargetDistance) ->
        ok.

setTargetPath(This, AssociatedAdvancedRTSGameLayer) ->
        ok.

setTargetPathIgnoreNewPath(This, AssociatedAdvancedRTSGameLayer, UnitWaypointBehavior2) ->
        ok.

processWaypoint(This, AssociatedAdvancedRTSGameLayer, UnitWaypointBehavior2, TargetLayer, Size) when is_integer(Size) ->
        ok.

processWaypointTracked(This, AssociatedAdvancedRTSGameLayer, UnitWaypointBehavior2) ->
        ok.

processWaypointTrackedVisit(This, AssociatedAdvancedRTSGameLayer, GeographicMapCellPosition) ->
        ok.

processWaypointTrackedWithoutProgress(This, AssociatedAdvancedRTSGameLayer, Reason) when (is_list(Reason) orelse Reason =:= undefined) ->
        ok.

wander(This, AssociatedAdvancedRTSGameLayer) ->
        ok.

targetDestroyed(This, AssociatedAdvancedRTSGameLayer) ->
        ok.

processTargeting(This, AssociatedAdvancedRTSGameLayer, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        ok.

processTargetingNonWayPoint(This, AssociatedAdvancedRTSGameLayer, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        ok.

removeWaypoint(This, AssociatedAdvancedRTSGameLayer, UnitWaypointBehavior2, WaypointLayer, Reason) when (is_list(Reason) orelse Reason =:= undefined) ->
        ok.

removeWaypointList(This, AssociatedAdvancedRTSGameLayer, UnitWaypointBehavior2, List) ->
        ok.

removeWaypointClear(This, AssociatedAdvancedRTSGameLayer) ->
        ok.

clearTarget(This, AssociatedAdvancedRTSGameLayer) ->
        ok.

addWaypointFromUser(This, AssociatedAdvancedRTSGameLayer, AdvancedRTSGameLayer) ->
        ok.

targetMovedSoRetarget(This, AssociatedAdvancedRTSGameLayer) ->
        ok.

