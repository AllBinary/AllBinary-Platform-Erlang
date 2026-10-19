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
% package org.allbinary.logic.system.hardware.components.interfaces

-module('CpuInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getProcessor(This) ->
    erlang:error({abstract_method, getProcessor}).

getVendorId(This) ->
    erlang:error({abstract_method, getVendorId}).

getCpuFamily(This) ->
    erlang:error({abstract_method, getCpuFamily}).

getModel(This) ->
    erlang:error({abstract_method, getModel}).

getModelName(This) ->
    erlang:error({abstract_method, getModelName}).

getStepping(This) ->
    erlang:error({abstract_method, getStepping}).

getCpuSpeed(This) ->
    erlang:error({abstract_method, getCpuSpeed}).

getCacheSize(This) ->
    erlang:error({abstract_method, getCacheSize}).

compareTo(This, CpuInterface) ->
    erlang:error({abstract_method, compareTo}).

