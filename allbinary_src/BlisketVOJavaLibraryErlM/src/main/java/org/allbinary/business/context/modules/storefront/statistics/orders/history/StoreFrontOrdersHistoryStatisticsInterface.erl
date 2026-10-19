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
% package org.allbinary.business.context.modules.storefront.statistics.orders.history
% import org.allbinary.business.user.commerce.money.Money
% import org.allbinary.data.tables.TableMappingInterface

-module('StoreFrontOrdersHistoryStatisticsInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('TableMappingInterface', Function, Arguments).


getNumberOfOrders(This) ->
    erlang:error({abstract_method, getNumberOfOrders}).

getSubTotal(This) ->
    erlang:error({abstract_method, getSubTotal}).

getShippingCost(This) ->
    erlang:error({abstract_method, getShippingCost}).

getTaxes(This) ->
    erlang:error({abstract_method, getTaxes}).

getTotal(This) ->
    erlang:error({abstract_method, getTotal}).

