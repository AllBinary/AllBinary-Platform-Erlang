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
% package org.allbinary.business.user.commerce.shipping
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.user.commerce.shipping.modules.ShippingInterface

-module('ShippingMethodsInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


get(This) ->
    erlang:error({abstract_method, get}).

% throws Exception
getShippingInterface(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
    erlang:error({abstract_method, getShippingInterface}).

% throws Exception
getDefault(This) ->
    erlang:error({abstract_method, getDefault}).

