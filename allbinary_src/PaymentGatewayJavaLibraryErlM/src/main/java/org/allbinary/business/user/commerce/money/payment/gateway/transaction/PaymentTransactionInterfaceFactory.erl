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
% import org.allbinary.business.user.commerce.money.payment.types.PaymentType
% import org.allbinary.business.user.commerce.money.payment.types.PaymentTypeUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('PaymentTransactionInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PaymentTransactionInterfaceFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'PaymentTransactionInterfaceFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance(This, OrderReview) ->
        try
        try
            GatewayName = (get({OrderReview, '$class'})):getPaymentMethod(OrderReview),
            case (GatewayName =/= undefined) of
                true ->
                PaymentType = (fun(Target_N66079) -> (get({Target_N66079, '$class'})):get(Target_N66079, GatewayName) end)('PaymentTypeUtil':getInstance()),
                PaymentTransactionInterfaceFactoryInterface = (get({PaymentType, '$class'})):getPaymentTransactionInterfaceFactoryInterface(PaymentType),
                PaymentTransactionInterface = (get({PaymentTransactionInterfaceFactoryInterface, '$class'})):getInstance(PaymentTransactionInterfaceFactoryInterface, OrderReview),
                throw({'$return', PaymentTransactionInterface});
                false -> ok
            end,
            erlang:error({'Exception', lists:concat([lists:concat(["Failed to create PaymentTransactionInterface: ", "GatewayName is: "]), GatewayName])})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PAYMENTERROR'})) of
                true ->
                CommonStrings = 'CommonStrings':getInstance(),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to generate test data", This, get({CommonStrings, 'GET_INSTANCE'}), E);
                false -> ok
            end,
            erlang:error(E)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

