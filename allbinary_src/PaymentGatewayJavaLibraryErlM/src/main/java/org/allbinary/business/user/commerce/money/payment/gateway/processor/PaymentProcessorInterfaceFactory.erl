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
% package org.allbinary.business.user.commerce.money.payment.gateway.processor
% import org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionInterface
% import org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionInterfaceRequestFactory
% import org.allbinary.business.user.commerce.money.payment.types.PaymentType
% import org.allbinary.business.user.commerce.money.payment.types.PaymentTypeUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.string.CommonStrings

-module('PaymentProcessorInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PaymentProcessorInterfaceFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'PaymentProcessorInterfaceFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance(This, TransformInfoInterface) ->
        try
        try
            PaymentTransactionInterface = (fun(Target_N66147) -> (get({Target_N66147, '$class'})):getInstance(Target_N66147, TransformInfoInterface) end)('PaymentTransactionInterfaceRequestFactory':getInstance()),
            GatewayName = (fun(Target_N66209) -> (get({Target_N66209, '$class'})):getPaymentMethod(Target_N66209) end)((get({PaymentTransactionInterface, '$class'})):getOrderHistory(PaymentTransactionInterface)),
            case (not (fun(Target_N66260) -> (get({Target_N66260, '$class'})):isEmpty(Target_N66260, GatewayName) end)('StringValidationUtil':getInstance())) of
                true ->
                PaymentType = (fun(Target_N66312) -> (get({Target_N66312, '$class'})):get(Target_N66312, GatewayName) end)('PaymentTypeUtil':getInstance()),
                PaymentProcessorInterfaceFactoryInterface = (get({PaymentType, '$class'})):getPaymentProcessorInterfaceFactoryInterface(PaymentType),
                throw({'$return', (get({PaymentProcessorInterfaceFactoryInterface, '$class'})):getInstance(PaymentProcessorInterfaceFactoryInterface, TransformInfoInterface, PaymentTransactionInterface)});
                false -> ok
            end,
            erlang:error({'Exception', "Error Getting PaymentProcessorInterface"})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PAYMENTERROR'})) of
                true ->
                CommonStrings = 'CommonStrings':getInstance(),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'GET_INSTANCE'}), E);
                false -> ok
            end,
            erlang:error(E)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

