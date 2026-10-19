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
% package org.allbinary.data.tables.user.commerce.money.payment.transaction
% import org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionInterface
% import org.allbinary.data.tables.BasicDataTableInterface

-module('TransactionEntityInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicDataTableInterface', Function, Arguments).


remove(This, UserName, OrderNumber) when (is_list(UserName) orelse UserName =:= undefined), (is_list(OrderNumber) orelse OrderNumber =:= undefined) ->
    erlang:error({abstract_method, remove}).

add(This, UserName, OrderNumber, PaymentTransactionInterface) when (is_list(UserName) orelse UserName =:= undefined), (is_list(OrderNumber) orelse OrderNumber =:= undefined) ->
    erlang:error({abstract_method, add}).

