% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% import org.allbinary.animation.caption.CaptionAnimationHelperBase
% import org.allbinary.game.identification.Group
% import org.allbinary.game.layer.waypoint.Waypoint2LogHelper
% import org.allbinary.game.layer.waypoint.WaypointLogHelper
% import org.allbinary.game.layer.waypoint.WaypointRunnableLogHelper
% import org.allbinary.game.tracking.TrackingEvent
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.util.BasicArrayList

-module('NullPathFindingLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements PathFindingLayerInterface

static_init() ->
    put({?MODULE, 'NULL_PATH_FINDING_LAYER'}, 'NullPathFindingLayer':new()),
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


getName(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
getEndGeographicMapCellPositionList(This) ->
        erlang:error({'RuntimeException'}).

shouldHandleStartSameAsEnd(This) ->
        erlang:error({'RuntimeException'}).

getGeographicMapCellPositionArea(This) ->
        erlang:error({'RuntimeException'}).

getHudPaintable(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
handleCost(This, OwnerLayer) ->
        erlang:error({'RuntimeException'}).

getParentLayer(This) ->
        erlang:error({'RuntimeException'}).

getRTSLayer2LogHelper(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
setTarget(This, TargetGameLayer) ->
        erlang:error({'RuntimeException'}).

% throws Exception
init(This, GeographicMapCellHistory, GeographicMapCellPositionBasicArrayList) ->
        erlang:error({'RuntimeException'}).

getMoveOutOfBuildAreaPath(This, GeographicMapCellPosition) ->
        erlang:error({'RuntimeException'}).

% throws Exception
setClosestGeographicMapCellHistory(This, PathsList) ->
        erlang:error({'RuntimeException'}).

teleportTo(This, GeographicMapCellPosition) ->
        erlang:error({'RuntimeException'}).

% throws Exception
setLoad(This, Resource) when is_integer(Resource) ->
        erlang:error({'RuntimeException'}).

% throws Exception
getSurroundingGeographicMapCellPositionList(This) ->
        erlang:error({'RuntimeException'}).

isSelected(This) ->
        erlang:error({'RuntimeException'}).

shouldAddWaypointFromBuilding(This) ->
        erlang:error({'RuntimeException'}).

isShowMoreCaptionStates(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
trackTo(This, Reason) when (is_list(Reason) orelse Reason =:= undefined) ->
        erlang:error({'RuntimeException'}).

% throws Exception
trackToDXY(This, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        erlang:error({'RuntimeException'}).

% throws Exception
buildingChase(This, AllbinaryLayer, CellPosition) ->
        erlang:error({'RuntimeException'}).

getTrackingEvent(This) ->
        erlang:error({'RuntimeException'}).

allStop(This) ->
        erlang:error({'RuntimeException'}).

isWaypointListEmptyOrOnlyTargets(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
getCurrentGeographicMapCellPosition(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
getTopLeftGeographicMapCellPosition(This) ->
        erlang:error({'RuntimeException'}).

getCaptionAnimationHelper(This) ->
        erlang:error({'RuntimeException'}).

getWaypointBehavior(This) ->
        erlang:error({'RuntimeException'}).

getWaypointLogHelper(This) ->
        erlang:error({'RuntimeException'}).

getWaypoint2LogHelper(This) ->
        erlang:error({'RuntimeException'}).

getWaypointRunnableLogHelper(This) ->
        erlang:error({'RuntimeException'}).

getGroupInterface(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
isDestroyed(This) ->
        erlang:error({'RuntimeException'}).

getSourceId(This) ->
        erlang:error({'RuntimeException'}).

