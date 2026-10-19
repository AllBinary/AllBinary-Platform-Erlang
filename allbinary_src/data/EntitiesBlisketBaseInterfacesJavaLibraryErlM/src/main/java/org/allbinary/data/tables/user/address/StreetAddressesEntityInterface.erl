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
% package org.allbinary.data.tables.user.address
% import org.allbinary.business.user.address.StreetAddress
% import org.allbinary.data.tables.BasicDataTableInterface

-module('StreetAddressesEntityInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicDataTableInterface', Function, Arguments).


remove(This, Index) ->
    erlang:error({abstract_method, remove}).

add(This, Address) ->
    erlang:error({abstract_method, add}).

update(This, Address) ->
    erlang:error({abstract_method, update}).

getLastId(This) ->
    erlang:error({abstract_method, getLastId}).

getDefault(This) ->
    erlang:error({abstract_method, getDefault}).

setDefault(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setDefault}).

