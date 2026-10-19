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
% package org.allbinary.business.user.commerce.inventory.basket
% import java.util.HashMap
% import java.util.Set
% import org.allbinary.business.user.commerce.money.Money
% import org.allbinary.business.user.commerce.money.MoneyException

-module('BasketInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


addItem(This, Id, Num) when (is_list(Id) orelse Id =:= undefined), (is_list(Num) orelse Num =:= undefined) ->
    erlang:error({abstract_method, addItem}).

removeItem(This, Id) when (is_list(Id) orelse Id =:= undefined) ->
    erlang:error({abstract_method, removeItem}).

adjustItem(This, Id, Num) when (is_list(Id) orelse Id =:= undefined), (is_list(Num) orelse Num =:= undefined) ->
    erlang:error({abstract_method, adjustItem}).

getTotalWeight(This) ->
    erlang:error({abstract_method, getTotalWeight}).

getNumberOfItems(This) ->
    erlang:error({abstract_method, getNumberOfItems}).

getIds(This) ->
    erlang:error({abstract_method, getIds}).

getItems(This) ->
    erlang:error({abstract_method, getItems}).

getNumberOf(This, Product) when (is_list(Product) orelse Product =:= undefined) ->
    erlang:error({abstract_method, getNumberOf}).

% throws MoneyException
getSubTotal(This) ->
    erlang:error({abstract_method, getSubTotal}).

