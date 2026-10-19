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
% package org.allbinary.business.user.commerce.money.payment.gateway
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tables.TableMappingInterface

-module('PaymentGatewayEncryptedMapping').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TableMappingInterface

init_fields(This) ->
    put({This, paymentGatewayInterface}, undefined),
    ok.


new(PaymentGatewayInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PaymentGatewayInterface),
    This.

init(This, PaymentGatewayInterface) ->
    init_fields(This),
        put({This, paymentGatewayInterface}, PaymentGatewayInterface).

% throws Exception
toHashMap(This) ->
        (get({get({This, paymentGatewayInterface}), '$class'})):toHashMap(get({This, paymentGatewayInterface}), true).

toVector(This) ->
        (get({get({This, paymentGatewayInterface}), '$class'})):toVector(get({This, paymentGatewayInterface}), true).

% throws Exception
getKey(This) ->
        (get({get({This, paymentGatewayInterface}), '$class'})):getKey(get({This, paymentGatewayInterface})).

