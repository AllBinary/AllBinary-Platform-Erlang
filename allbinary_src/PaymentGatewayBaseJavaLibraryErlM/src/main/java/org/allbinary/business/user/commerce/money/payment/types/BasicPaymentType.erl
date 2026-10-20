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
% import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterfaceFactoryInterface
% import org.allbinary.business.user.commerce.money.payment.gateway.modules.gateway.PaymentGatewayDomNodeFactoryInterface
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.regex.replace.Replace
% import org.allbinary.string.CommonSeps

-module('BasicPaymentType').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, name}, undefined),
    put({This, value}, undefined),
    put({This, paymentGatewayInterfaceFactoryInterface}, undefined),
    put({This, paymentGatewayDomNodeFactoryInterface}, undefined),
    ok.


new(PaymentMethod) when (is_list(PaymentMethod) orelse PaymentMethod =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PaymentMethod),
    This.

'$init'(This, PaymentMethod) when (is_list(PaymentMethod) orelse PaymentMethod =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):init(This, PaymentMethod).

new(PaymentMethod, PaymentGatewayInterfaceFactoryInterface, PaymentGatewayDomNodeFactoryInterface) when (is_list(PaymentMethod) orelse PaymentMethod =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PaymentMethod, PaymentGatewayInterfaceFactoryInterface, PaymentGatewayDomNodeFactoryInterface),
    This.

'$init'(This, PaymentMethod, PaymentGatewayInterfaceFactoryInterface, PaymentGatewayDomNodeFactoryInterface) when (is_list(PaymentMethod) orelse PaymentMethod =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):init(This, PaymentMethod),
        put({This, paymentGatewayInterfaceFactoryInterface}, PaymentGatewayInterfaceFactoryInterface),
        put({This, paymentGatewayDomNodeFactoryInterface}, PaymentGatewayDomNodeFactoryInterface).

init(This, PaymentMethod) when (is_list(PaymentMethod) orelse PaymentMethod =:= undefined) ->
        HashMap = (fun(Target_N66323) -> (get({Target_N66323, '$class'})):createHashMap(Target_N66323) end)('StdUtil':getInstance()),
        UNDERSCORE = "_",
        (get({HashMap, '$class'})):put(HashMap, get({'CommonSeps':getInstance(), 'SPACE'}), UNDERSCORE),
        (get({HashMap, '$class'})):put(HashMap, get({'AbPathData':getInstance(), 'EXTENSION_SEP'}), UNDERSCORE),
        (get({HashMap, '$class'})):put(HashMap, "-", UNDERSCORE),
        Replace = 'Replace':new(HashMap),
        put({This, name}, (get({Replace, '$class'})):all(Replace, PaymentMethod)),
        put({This, value}, PaymentMethod),
        (fun(Target_N66674) -> (get({Target_N66674, '$class'})):add(Target_N66674, This) end)('BasicPaymentTypeUtil':getInstance()).

getName(This) ->
        get({This, name}).

getValue(This) ->
        get({This, value}).

% throws Exception
getPaymentGatewayInterfaceFactoryInterface(This) ->
        case (get({This, paymentGatewayInterfaceFactoryInterface}) =:= undefined) of
            true ->
            erlang:error({'Exception', "PaymentGatewayInterfaceFactoryInterface is Null"});
            false -> ok
        end,
        get({This, paymentGatewayInterfaceFactoryInterface}).

% throws Exception
getPaymentGatewayDomNodeFactoryInterface(This) ->
        case (get({This, paymentGatewayDomNodeFactoryInterface}) =:= undefined) of
            true ->
            erlang:error({'Exception', "PaymentGatewayDomNodeFactoryInterface is Null"});
            false -> ok
        end,
        get({This, paymentGatewayDomNodeFactoryInterface}).

getKey(This) ->
        (get({This, '$class'})):getName(This).

toVector(This) ->
        Vector = 'BasicArrayListD':new(),
        (get({Vector, '$class'})):add(Vector, get({This, name})),
        (get({Vector, '$class'})):add(Vector, get({This, value})),
        Vector.

toHashMap(This) ->
        HashMap = (fun(Target_N67263) -> (get({Target_N67263, '$class'})):createHashMap(Target_N67263) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, (get({get({'PaymentGatewayData', 'NAME'}), '$class'})):toString(get({'PaymentGatewayData', 'NAME'})), get({This, name})),
        (get({HashMap, '$class'})):put(HashMap, (get({get({'PaymentGatewayData', 'VALUE'}), '$class'})):toString(get({'PaymentGatewayData', 'VALUE'})), get({This, value})),
        HashMap.

toString(This) ->
        get({This, name}).

