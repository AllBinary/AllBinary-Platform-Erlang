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
% package org.allbinary.data.tables.context.module.storefronts
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.data.tables.BasicDataTableInterface

-module('StoreFrontsEntityInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicDataTableInterface', Function, Arguments).


% throws Exception
getStoreFrontInterface(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
    erlang:error({abstract_method, getStoreFrontInterface}).

getStoreFrontNames(This) ->
    erlang:error({abstract_method, getStoreFrontNames}).

delete(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, delete}).

insert(This, Values) ->
    erlang:error({abstract_method, insert}).

update(This, UpdatedValues) ->
    erlang:error({abstract_method, update}).

