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

-module('RTSInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


isSelfUpgradeable(This) ->
    erlang:error({abstract_method, isSelfUpgradeable}).

isCompleted(This) ->
    erlang:error({abstract_method, isCompleted}).

getPercentComplete(This) ->
    erlang:error({abstract_method, getPercentComplete}).

getLevel(This) ->
    erlang:error({abstract_method, getLevel}).

getMaxLevel(This) ->
    erlang:error({abstract_method, getMaxLevel}).

getCost(This) ->
    erlang:error({abstract_method, getCost}).

downgrade(This) ->
    erlang:error({abstract_method, downgrade}).

getDowngradeCost(This) ->
    erlang:error({abstract_method, getDowngradeCost}).

isDowngradeable(This) ->
    erlang:error({abstract_method, isDowngradeable}).

getUpgradeCost(This) ->
    erlang:error({abstract_method, getUpgradeCost}).

isUpgradeable(This) ->
    erlang:error({abstract_method, isUpgradeable}).

upgrade(This) ->
    erlang:error({abstract_method, upgrade}).

