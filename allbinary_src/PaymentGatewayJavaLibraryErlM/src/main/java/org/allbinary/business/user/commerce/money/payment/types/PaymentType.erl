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
% package org.allbinary.business.user.commerce.money.payment.types
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData
% import org.allbinary.business.user.commerce.money.payment.gateway.processor.PaymentProcessorInterfaceFactoryInterface
% import org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionInterfaceFactoryInterface
% import org.allbinary.logic.StdUtil

-module('PaymentType').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, basicPaymentType}, undefined),
    put({This, paymentTransactionInterfaceFactoryInterface}, undefined),
    put({This, paymentProcessorInterfaceFactoryInterface}, undefined),
    ok.


new(BasicPaymentType) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, BasicPaymentType),
    This.

'$init'(This, BasicPaymentType) ->
    init_fields(This),
        put({This, basicPaymentType}, BasicPaymentType),
        put({This, paymentTransactionInterfaceFactoryInterface}, undefined),
        put({This, paymentProcessorInterfaceFactoryInterface}, undefined),
        (fun(Target_N66050) -> (get({Target_N66050, '$class'})):add(Target_N66050, This) end)('PaymentTypeUtil':getInstance()).

new(BasicPaymentType, PaymentTransactionInterfaceFactoryInterface, PaymentProcessorInterfaceFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, BasicPaymentType, PaymentTransactionInterfaceFactoryInterface, PaymentProcessorInterfaceFactoryInterface),
    This.

'$init'(This, BasicPaymentType, PaymentTransactionInterfaceFactoryInterface, PaymentProcessorInterfaceFactoryInterface) ->
    init_fields(This),
        put({This, basicPaymentType}, BasicPaymentType),
        put({This, paymentTransactionInterfaceFactoryInterface}, PaymentTransactionInterfaceFactoryInterface),
        put({This, paymentProcessorInterfaceFactoryInterface}, PaymentProcessorInterfaceFactoryInterface),
        (fun(Target_N66210) -> (get({Target_N66210, '$class'})):add(Target_N66210, This) end)('PaymentTypeUtil':getInstance()).

% throws Exception
getPaymentTransactionInterfaceFactoryInterface(This) ->
        case (get({This, paymentTransactionInterfaceFactoryInterface}) =:= undefined) of
            true ->
            erlang:error({'Exception', "PaymentTransactionInterfaceFactoryInterface is Null"});
            false -> ok
        end,
        get({This, paymentTransactionInterfaceFactoryInterface}).

% throws Exception
getPaymentProcessorInterfaceFactoryInterface(This) ->
        case (get({This, paymentProcessorInterfaceFactoryInterface}) =:= undefined) of
            true ->
            erlang:error({'Exception', "PaymentProcessorInterfaceFactoryInterface is Null"});
            false -> ok
        end,
        get({This, paymentProcessorInterfaceFactoryInterface}).

toVector(This) ->
        Vector = 'BasicArrayListD':new(),
        (get({Vector, '$class'})):addAllList(Vector, (fun(Target_N66594) -> (get({Target_N66594, '$class'})):toVector(Target_N66594) end)((get({This, '$class'})):getBasicPaymentType(This))),
        case (get({This, paymentTransactionInterfaceFactoryInterface}) =/= undefined) of
            true ->
            (get({Vector, '$class'})):add(Vector, atom_to_list(get({get({This, paymentTransactionInterfaceFactoryInterface}), '$class'})));
            false -> ok
        end,
        case (get({This, paymentProcessorInterfaceFactoryInterface}) =/= undefined) of
            true ->
            (get({Vector, '$class'})):add(Vector, atom_to_list(get({get({This, paymentProcessorInterfaceFactoryInterface}), '$class'})));
            false -> ok
        end,
        Vector.

toHashMap(This) ->
        HashMap = (fun(Target_N66829) -> (get({Target_N66829, '$class'})):createHashMap(Target_N66829) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):putAll(HashMap, (fun(Target_N66889) -> (get({Target_N66889, '$class'})):toHashMap(Target_N66889) end)((get({This, '$class'})):getBasicPaymentType(This))),
        case (get({This, paymentTransactionInterfaceFactoryInterface}) =/= undefined) of
            true ->
            (get({HashMap, '$class'})):put(HashMap, (get({get({'PaymentGatewayData', 'PAYMENTTRANSACTIONINTERFACEFACTORYINTERFACE'}), '$class'})):toString(get({'PaymentGatewayData', 'PAYMENTTRANSACTIONINTERFACEFACTORYINTERFACE'})), atom_to_list(get({get({This, paymentTransactionInterfaceFactoryInterface}), '$class'})));
            false -> ok
        end,
        case (get({This, paymentProcessorInterfaceFactoryInterface}) =/= undefined) of
            true ->
            (get({HashMap, '$class'})):put(HashMap, (get({get({'PaymentGatewayData', 'PAYMENTPROCESSORINTERFACEFACTORYINTERFACE'}), '$class'})):toString(get({'PaymentGatewayData', 'PAYMENTPROCESSORINTERFACEFACTORYINTERFACE'})), atom_to_list(get({get({This, paymentProcessorInterfaceFactoryInterface}), '$class'})));
            false -> ok
        end,
        HashMap.

getBasicPaymentType(This) ->
        get({This, basicPaymentType}).

