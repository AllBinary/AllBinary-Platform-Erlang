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
% package org.allbinary.business.user.commerce.money.payment.gateway.transaction
% import org.allbinary.business.user.commerce.inventory.order.OrderHistory
% import org.allbinary.business.user.commerce.money.payment.types.TenderType

-module('PaymentTransactionInterfaceFactoryInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


% throws Exception
getInstance(This, OrderHistory) ->
    erlang:error({abstract_method, getInstance}).

% throws Exception
getSaleTransaction(This, TenderType) ->
    erlang:error({abstract_method, getSaleTransaction}).

% throws Exception
getCreditTransaction(This, TenderType) ->
    erlang:error({abstract_method, getCreditTransaction}).

% throws Exception
getAuthorizationTransaction(This, TenderType) ->
    erlang:error({abstract_method, getAuthorizationTransaction}).

% throws Exception
getCaptureDelayedTransaction(This, TenderType) ->
    erlang:error({abstract_method, getCaptureDelayedTransaction}).

% throws Exception
getVoidTransaction(This, TenderType) ->
    erlang:error({abstract_method, getVoidTransaction}).

% throws Exception
getInquiryTransaction(This, TenderType) ->
    erlang:error({abstract_method, getInquiryTransaction}).

