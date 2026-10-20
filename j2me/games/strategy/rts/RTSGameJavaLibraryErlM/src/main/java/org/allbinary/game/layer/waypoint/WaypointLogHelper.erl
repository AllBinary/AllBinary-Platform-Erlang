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
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.util.BasicArrayList

-module('WaypointLogHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'WaypointLogHelper':new()),
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
        get({'WaypointLogHelper', instance}).

onWaypointEvent(This, AssociatedAdvancedRTSGameLayer, AdvancedRTSGameLayer) ->
        ok.

addWaypointFromBuilding(This, AssociatedAdvancedRTSGameLayer, AdvancedRTSGameLayer) ->
        ok.

addWaypointFromBuildingList(This, AssociatedAdvancedRTSGameLayer, AdvancedRTSGameLayer, List) ->
        ok.

insertWaypoint(This, AssociatedAdvancedRTSGameLayer, Index, RtsLayer, WaypointName) when is_integer(Index), (is_list(WaypointName) orelse WaypointName =:= undefined) ->
        ok.

insertWaypointList(This, AssociatedAdvancedRTSGameLayer, Index, RtsLayer, WaypointName, List) when is_integer(Index), (is_list(WaypointName) orelse WaypointName =:= undefined) ->
        ok.

setRandomGeographicMapCellHistoryList(This, AssociatedAdvancedRTSGameLayer, PathsList) ->
        ok.

moveAwayFromBuilding(This, AssociatedAdvancedRTSGameLayer) ->
        ok.

needToMove(This, AssociatedAdvancedRTSGameLayer, UnitWaypointBehavior) ->
        ok.

setRandomGeographicMapCellHistory(This, AssociatedAdvancedRTSGameLayer) ->
        ok.

setCurrentPathGeographicMapCellPosition(This, AssociatedAdvancedRTSGameLayer, ExistingCurrentPathGeographicMapCellPosition, CurrentPathGeographicMapCellPosition) ->
        ok.

setNextUnvisitedPathGeographicMapCellPosition(This, AssociatedAdvancedRTSGameLayer, ExistingNextUnvisitedPathGeographicMapCellPosition, NextUnvisitedPathGeographicMapCellPosition) ->
        ok.

