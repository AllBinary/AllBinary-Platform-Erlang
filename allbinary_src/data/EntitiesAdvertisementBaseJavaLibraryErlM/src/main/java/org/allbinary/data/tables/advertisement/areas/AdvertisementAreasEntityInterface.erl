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
% package org.allbinary.data.tables.advertisement.areas
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.advertisement.area.AdvertisementAreaInterface
% import org.allbinary.data.tables.BasicDataTableInterface

-module('AdvertisementAreasEntityInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicDataTableInterface', Function, Arguments).


% throws Exception
get(This, StoreName) when (is_list(StoreName) orelse StoreName =:= undefined) ->
    erlang:error({abstract_method, get}).

% throws Exception
get(This, StoreName, AdvertisementAreaName) when (is_list(StoreName) orelse StoreName =:= undefined), (is_list(AdvertisementAreaName) orelse AdvertisementAreaName =:= undefined) ->
    erlang:error({abstract_method, get}).

delete(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, delete}).

insert(This, Values) ->
    erlang:error({abstract_method, insert}).

update(This, UpdatedValues) ->
    erlang:error({abstract_method, update}).

