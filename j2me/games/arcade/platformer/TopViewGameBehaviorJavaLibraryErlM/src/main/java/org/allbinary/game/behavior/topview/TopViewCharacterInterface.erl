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
% package org.allbinary.game.behavior.topview
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCellType

-module('TopViewCharacterInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


terrainMove(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray, X, Y) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined), is_integer(X), is_integer(Y) ->
    erlang:error({abstract_method, terrainMove}).

% throws Exception
terrainEvent(This, X, Y, GeographicMapInterfaceArray, GeographicMapCellTypeArray, GeographicMapCellPosition) when is_integer(X), is_integer(Y), (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined) ->
    erlang:error({abstract_method, terrainEvent}).

move(This) ->
    erlang:error({abstract_method, move}).

upp(This) ->
    erlang:error({abstract_method, upp}).

leftp(This) ->
    erlang:error({abstract_method, leftp}).

rightp(This) ->
    erlang:error({abstract_method, rightp}).

% throws Exception
reset(This) ->
    erlang:error({abstract_method, reset}).

