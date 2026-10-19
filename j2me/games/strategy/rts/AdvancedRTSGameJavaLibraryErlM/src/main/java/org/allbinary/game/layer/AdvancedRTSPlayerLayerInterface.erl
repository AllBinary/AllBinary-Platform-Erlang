% 
% AllBinary Open License Version 1 
% Copyright (c) 2006 AllBinary 
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
% import org.allbinary.game.GameType
% import org.allbinary.graphics.color.BasicColor

-module('AdvancedRTSPlayerLayerInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('RTSPlayerLayerInterface', Function, Arguments).


getAdvancedPlayerOwnedRTSLayers(This) ->
    erlang:error({abstract_method, getAdvancedPlayerOwnedRTSLayers}).

isLocalPlayer(This) ->
    erlang:error({abstract_method, isLocalPlayer}).

getGameType(This) ->
    erlang:error({abstract_method, getGameType}).

getDecalBasicColor(This) ->
    erlang:error({abstract_method, getDecalBasicColor}).

