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
% package org.allbinary.data.tables.user.commerce.money.payment
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.user.commerce.money.payment.PaymentInterface
% import org.allbinary.data.tables.BasicDataTableInterface

-module('PaymentEntityInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicDataTableInterface', Function, Arguments).


getLastId(This, UserName) when (is_list(UserName) orelse UserName =:= undefined) ->
    erlang:error({abstract_method, getLastId}).

setDefault(This, UserName, Index) when (is_list(UserName) orelse UserName =:= undefined) ->
    erlang:error({abstract_method, setDefault}).

getDefault(This, UserName) when (is_list(UserName) orelse UserName =:= undefined) ->
    erlang:error({abstract_method, getDefault}).

get(This, UserName) when (is_list(UserName) orelse UserName =:= undefined) ->
    erlang:error({abstract_method, get}).

add(This, UserName, PaymentInterface) when (is_list(UserName) orelse UserName =:= undefined) ->
    erlang:error({abstract_method, add}).

remove(This, UserName, Index) when (is_list(UserName) orelse UserName =:= undefined) ->
    erlang:error({abstract_method, remove}).

insert(This, Values) ->
    erlang:error({abstract_method, insert}).

