%
% AllBinary Open License Version 1
% Copyright (c) 2011 AllBinary
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
% package org.allbinary.logic.system.hardware
% import org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface
% import org.allbinary.util.ABHashtable

-module('HardwareInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getComponent(This, Index) when is_integer(Index) ->
    erlang:error({abstract_method, getComponent}).

toString(This) ->
    erlang:error({abstract_method, toString}).

compareTo(This, HardwareInterface) ->
    erlang:error({abstract_method, compareTo}).

difference(This, HardwareInterface) ->
    erlang:error({abstract_method, difference}).

