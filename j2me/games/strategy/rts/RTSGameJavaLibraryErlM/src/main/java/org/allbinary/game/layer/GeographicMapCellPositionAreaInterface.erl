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
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.util.BasicArrayList

-module('GeographicMapCellPositionAreaInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getNextSurroundingGeographicMapCellPosition(This) ->
    erlang:error({abstract_method, getNextSurroundingGeographicMapCellPosition}).

getOccupyingGeographicMapCellPositionList(This) ->
    erlang:error({abstract_method, getOccupyingGeographicMapCellPositionList}).

getSurroundingGeographicMapCellPositionList(This) ->
    erlang:error({abstract_method, getSurroundingGeographicMapCellPositionList}).

% throws Exception
update(This, GeographicMapInterface) ->
    erlang:error({abstract_method, update}).

