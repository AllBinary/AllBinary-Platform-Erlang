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
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.business.user.commerce.money.payment.types.BasicPaymentType
% import org.allbinary.business.user.commerce.money.payment.types.BasicPaymentTypeUtil
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.http.request.RequestParams
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('PaymentGatewayInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements PaymentGatewayInterfaceFactoryInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance(This, HttpServletRequest) ->
        CommonStrings = 'CommonStrings':getInstance(),
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PAYMENT'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Getting", This, get({CommonStrings, 'GET_INSTANCE'}));
                false -> ok
            end,
            (get({This, '$class'})):getInstance(This, (fun(Target_N66256) -> (get({Target_N66256, '$class'})):toHashMap(Target_N66256) end)('RequestParams':new(HttpServletRequest)))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PAYMENTERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "getInstance(HttpServletRequest)", E);
                false -> ok
            end,
            erlang:error(E)
        end;
% throws Exception
getInstance(This, PaymentType) ->
        HashMap = (fun(Target_N66639) -> (get({Target_N66639, '$class'})):createHashMap(Target_N66639) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, (get({get({'PaymentGatewayData', 'NAME'}), '$class'})):toString(get({'PaymentGatewayData', 'NAME'})), (get({PaymentType, '$class'})):getName(PaymentType)),
        (get({This, '$class'})):getInstance(This, HashMap);
% throws Exception
getInstance(This, HashMap) ->
        CommonStrings = 'CommonStrings':getInstance(),
        try
            GatewayName = (get({HashMap, '$class'})):get(HashMap, (get({get({'PaymentGatewayData', 'NAME'}), '$class'})):toString(get({'PaymentGatewayData', 'NAME'}))),
            PaymentType = (fun(Target_N66980) -> (get({Target_N66980, '$class'})):get(Target_N66980, GatewayName) end)('BasicPaymentTypeUtil':getInstance()),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PAYMENT'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["Getting PaymentGatewayInterface for PaymentType: ", (get({PaymentType, '$class'})):getName(PaymentType)]), " with: "]), HashMap]), This, get({CommonStrings, 'GET_INSTANCE'}));
                false -> ok
            end,
            PaymentGatewayInterfaceFactoryInterface = (get({PaymentType, '$class'})):getPaymentGatewayInterfaceFactoryInterface(PaymentType),
            (get({PaymentGatewayInterfaceFactoryInterface, '$class'})):getInstance(PaymentGatewayInterfaceFactoryInterface, HashMap)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PAYMENTERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'GET_INSTANCE'}), E);
                false -> ok
            end,
            erlang:error(E)
        end.



