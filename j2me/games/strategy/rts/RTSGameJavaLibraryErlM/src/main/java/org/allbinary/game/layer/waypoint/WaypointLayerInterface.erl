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
% import org.allbinary.animation.caption.CaptionAnimationHelperBase
% import org.allbinary.game.layer.WaypointBehaviorBase
% import org.allbinary.game.tracking.TrackingEvent
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.util.BasicArrayList

-module('WaypointLayerInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


% throws Exception
init(This, GeographicMapCellHistory, GeographicMapCellPositionBasicArrayList) ->
    erlang:error({abstract_method, init}).

getMoveOutOfBuildAreaPath(This, GeographicMapCellPosition) ->
    erlang:error({abstract_method, getMoveOutOfBuildAreaPath}).

% throws Exception
setClosestGeographicMapCellHistory(This, PathsList) ->
    erlang:error({abstract_method, setClosestGeographicMapCellHistory}).

teleportTo(This, GeographicMapCellPosition) ->
    erlang:error({abstract_method, teleportTo}).

% throws Exception
setLoad(This, Resource) when is_integer(Resource) ->
    erlang:error({abstract_method, setLoad}).

% throws Exception
getSurroundingGeographicMapCellPositionList(This) ->
    erlang:error({abstract_method, getSurroundingGeographicMapCellPositionList}).

isSelected(This) ->
    erlang:error({abstract_method, isSelected}).

shouldAddWaypointFromBuilding(This) ->
    erlang:error({abstract_method, shouldAddWaypointFromBuilding}).

isShowMoreCaptionStates(This) ->
    erlang:error({abstract_method, isShowMoreCaptionStates}).

% throws Exception
trackTo(This, Reason) when (is_list(Reason) orelse Reason =:= undefined) ->
    erlang:error({abstract_method, trackTo}).

% throws Exception
trackToDXY(This, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
    erlang:error({abstract_method, trackToDXY}).

% throws Exception
buildingChase(This, AllbinaryLayer, CellPosition) ->
    erlang:error({abstract_method, buildingChase}).

getTrackingEvent(This) ->
    erlang:error({abstract_method, getTrackingEvent}).

allStop(This) ->
    erlang:error({abstract_method, allStop}).

isWaypointListEmptyOrOnlyTargets(This) ->
    erlang:error({abstract_method, isWaypointListEmptyOrOnlyTargets}).

% throws Exception
getCurrentGeographicMapCellPosition(This) ->
    erlang:error({abstract_method, getCurrentGeographicMapCellPosition}).

% throws Exception
getTopLeftGeographicMapCellPosition(This) ->
    erlang:error({abstract_method, getTopLeftGeographicMapCellPosition}).

getCaptionAnimationHelper(This) ->
    erlang:error({abstract_method, getCaptionAnimationHelper}).

getWaypointBehavior(This) ->
    erlang:error({abstract_method, getWaypointBehavior}).

getWaypointLogHelper(This) ->
    erlang:error({abstract_method, getWaypointLogHelper}).

getWaypoint2LogHelper(This) ->
    erlang:error({abstract_method, getWaypoint2LogHelper}).

getWaypointRunnableLogHelper(This) ->
    erlang:error({abstract_method, getWaypointRunnableLogHelper}).

