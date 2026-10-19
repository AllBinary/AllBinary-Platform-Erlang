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
% package org.allbinary.data.tables.user.commerce.inventory.item
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.commerce.inventory.item.ItemInterface
% import org.allbinary.business.user.commerce.money.MoneyException
% import org.allbinary.data.tables.BasicDataTableInterface

-module('InventoryEntityInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicDataTableInterface', Function, Arguments).


% throws MoneyException
getItem(This, Id) when (is_list(Id) orelse Id =:= undefined) ->
    erlang:error({abstract_method, getItem}).

% throws Exception
getItems(This, StoreFrontInterface) ->
    erlang:error({abstract_method, getItems}).

getWeight(This, Id) when (is_list(Id) orelse Id =:= undefined) ->
    erlang:error({abstract_method, getWeight}).

deleteWhere(This, Key, Value) when (is_list(Key) orelse Key =:= undefined), (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, deleteWhere}).

insert(This, Values) ->
    erlang:error({abstract_method, insert}).

update(This, UpdatedValues) ->
    erlang:error({abstract_method, update}).

