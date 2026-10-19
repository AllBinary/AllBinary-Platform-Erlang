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
% package org.allbinary.game.layer
% import org.allbinary.game.combat.destroy.DestroyableInterface
% import org.allbinary.game.identification.GroupInterfaceCompositeInterface
% import org.allbinary.game.input.GameKeyEventSourceInterface
% import org.allbinary.game.layer.waypoint.WaypointLayerInterface
% import org.allbinary.util.BasicArrayList

-module('PathFindingLayerInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('WaypointLayerInterface', Function, Arguments).


% throws Exception
getEndGeographicMapCellPositionList(This) ->
    erlang:error({abstract_method, getEndGeographicMapCellPositionList}).

shouldHandleStartSameAsEnd(This) ->
    erlang:error({abstract_method, shouldHandleStartSameAsEnd}).

getGeographicMapCellPositionArea(This) ->
    erlang:error({abstract_method, getGeographicMapCellPositionArea}).

getHudPaintable(This) ->
    erlang:error({abstract_method, getHudPaintable}).

% throws Exception
handleCost(This, OwnerLayer) ->
    erlang:error({abstract_method, handleCost}).

getParentLayer(This) ->
    erlang:error({abstract_method, getParentLayer}).

getRTSLayer2LogHelper(This) ->
    erlang:error({abstract_method, getRTSLayer2LogHelper}).

% throws Exception
setTarget(This, TargetGameLayer) ->
    erlang:error({abstract_method, setTarget}).

