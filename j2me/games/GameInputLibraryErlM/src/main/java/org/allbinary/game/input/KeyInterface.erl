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
% package org.allbinary.game.input

-module('KeyInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


keyPressed(This, KeyCode) when is_integer(KeyCode) ->
    erlang:error({abstract_method, keyPressed}).

keyReleased(This, KeyCode) when is_integer(KeyCode) ->
    erlang:error({abstract_method, keyReleased}).

keyPressedByDevice(This, KeyCode, DeviceId) when is_integer(KeyCode), is_integer(DeviceId) ->
    erlang:error({abstract_method, keyPressedByDevice}).

keyReleasedByDevice(This, KeyCode, DeviceId) when is_integer(KeyCode), is_integer(DeviceId) ->
    erlang:error({abstract_method, keyReleasedByDevice}).

