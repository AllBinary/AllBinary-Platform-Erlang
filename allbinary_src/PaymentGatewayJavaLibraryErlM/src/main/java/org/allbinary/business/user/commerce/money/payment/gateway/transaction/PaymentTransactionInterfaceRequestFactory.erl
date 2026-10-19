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
% import java.util.HashMap
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.address.StreetAddress
% import org.allbinary.business.user.commerce.inventory.basket.Basket
% import org.allbinary.business.user.commerce.inventory.order.OrderHistory
% import org.allbinary.business.user.commerce.inventory.order.OrderInterface
% import org.allbinary.business.user.commerce.money.Money
% import org.allbinary.business.user.commerce.money.payment.Payment
% import org.allbinary.business.user.commerce.money.payment.PaymentData
% import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData
% import org.allbinary.business.user.commerce.money.payment.types.TenderTypeFactory
% import org.allbinary.business.user.commerce.money.payment.types.TransactionTypeFactory
% import org.allbinary.data.generator.OrderIdGenerator
% import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory
% import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityInterface
% import org.allbinary.logic.communication.http.request.session.WeblisketSession
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.string.CommonStrings

-module('PaymentTransactionInterfaceRequestFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PaymentTransactionInterfaceRequestFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.


getInstance() ->
        get({'PaymentTransactionInterfaceRequestFactory', instance}).

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
            HttpTransformInfoInterface = TransformInfoInterface,
            PageContext = (get({HttpTransformInfoInterface, '$class'})):getPageContext(HttpTransformInfoInterface),
            HttpServletRequest = (get({PageContext, '$class'})):getRequest(PageContext),
            Command = (get({HttpServletRequest, '$class'})):getParameter(HttpServletRequest, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'ADMINCOMMAND'})),
            case ((Command =/= undefined) andalso ((get({Command, '$class'})):compareTo(Command, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'AUTHORIZEFORMEVALBODYONERROR'})) =:= 0)) of
                true ->
                throw({'$return', (get({This, '$class'})):generateFromTestData(This, TransformInfoInterface)});
                false ->
                PropertiesHashMap = (get({HttpTransformInfoInterface, '$class'})):getPropertiesHashMap(HttpTransformInfoInterface),
                WeblisketSession = 'WeblisketSession':new(PropertiesHashMap, PageContext),
                StoreFrontInterface = 'StoreFrontFactory':getInstance((get({WeblisketSession, '$class'})):getStoreName(WeblisketSession)),
                Order = (get({WeblisketSession, '$class'})):getOrder(WeblisketSession),
                OrderId = (get({Order, '$class'})):getId(Order),
                OrderHistoryEntityInterface = 'OrderHistoryEntityFactory':getInstance(),
                OrderReview = (get({OrderHistoryEntityInterface, '$class'})):getOrder(OrderHistoryEntityInterface, OrderId),
                OrderPaymentInfo = (get({OrderReview, '$class'})):getPaymentInfo(OrderReview),
                (get({OrderPaymentInfo, '$class'})):setTransactionType(OrderPaymentInfo, (fun(Target_N67558) -> (get({Target_N67558, '$class'})):toString(Target_N67558) end)(get({'TransactionTypeFactory':getInstance(), 'SALE'}))),
                (get({OrderPaymentInfo, '$class'})):setTenderType(OrderPaymentInfo, (fun(Target_N67613) -> (get({Target_N67613, '$class'})):toString(Target_N67613) end)(get({'TenderTypeFactory':getInstance(), 'CREDITCARD'}))),
                (get({OrderReview, '$class'})):setPaymentInfo(OrderReview, OrderPaymentInfo),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PAYMENT'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({OrderReview, '$class'})):getId(OrderReview), This, "getPaymentTransactionInterface()");
                    false -> ok
                end,
                PaymentTransactionInterface = (fun(Target_N67913) -> (get({Target_N67913, '$class'})):getInstance(Target_N67913, OrderReview) end)('PaymentTransactionInterfaceFactory':getInstance()),
                throw({'$return', PaymentTransactionInterface})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PAYMENTERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getPaymentTransactionInterface()", E);
                false -> ok
            end,
            erlang:error(E)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
generateFromTestData(This, TransformInfoInterface) ->
        try
            HttpTransformInfoInterface = TransformInfoInterface,
            PropertiesHashMap = (get({HttpTransformInfoInterface, '$class'})):getPropertiesHashMap(HttpTransformInfoInterface),
            PageContext = (get({HttpTransformInfoInterface, '$class'})):getPageContext(HttpTransformInfoInterface),
            WeblisketSession = 'WeblisketSession':new(PropertiesHashMap, PageContext),
            StoreFrontInterface = 'StoreFrontFactory':getInstance((get({WeblisketSession, '$class'})):getStoreName(WeblisketSession)),
            HttpServletRequest = (get({PageContext, '$class'})):getRequest(PageContext),
            put({local, gatewayName}, (get({WeblisketSession, '$class'})):getPaymentMethod(WeblisketSession)),
            case (fun(Target_N68735) -> (get({Target_N68735, '$class'})):isEmpty(Target_N68735, get({local, gatewayName})) end)('StringValidationUtil':getInstance()) of
                true ->
                put({local, gatewayName}, (get({HttpServletRequest, '$class'})):getParameter(HttpServletRequest, (get({get({'PaymentGatewayData', 'NAME'}), '$class'})):toString(get({'PaymentGatewayData', 'NAME'}))));
                false -> ok
            end,
            TransactionType = (get({HttpServletRequest, '$class'})):getParameter(HttpServletRequest, get({'PaymentData', 'TRANSACTIONTYPE'})),
            TenderType = (get({HttpServletRequest, '$class'})):getParameter(HttpServletRequest, get({'PaymentData', 'TENDERTYPE'})),
            Payment = 'Payment':new(),
            (get({Payment, '$class'})):setTransactionType(Payment, TransactionType),
            (get({Payment, '$class'})):setTenderType(Payment, TenderType),
            OrderReview = 'OrderHistory':new('Basket':new()),
            (get({OrderReview, '$class'})):setStoreName(OrderReview, (get({StoreFrontInterface, '$class'})):getName(StoreFrontInterface)),
            (get({OrderReview, '$class'})):setPaymentMethod(OrderReview, get({local, gatewayName})),
            (get({OrderReview, '$class'})):setUserName(OrderReview, "testing"),
            put({local, orderId}, (get({HttpServletRequest, '$class'})):getParameter(HttpServletRequest, "orderNumber")),
            case ((get({local, orderId}) =:= undefined) orelse ((get({get({local, orderId}), '$class'})):compareTo(get({local, orderId}), get({'StringUtil':getInstance(), 'EMPTY_STRING'})) =:= 0)) of
                true ->
                put({local, orderId}, (fun(Target_N69398) -> (get({Target_N69398, '$class'})):getNext(Target_N69398) end)('OrderIdGenerator':new())),
                (get({OrderReview, '$class'})):setId(OrderReview, get({local, orderId})),
                Account = (get({HttpServletRequest, '$class'})):getParameter(HttpServletRequest, "account"),
                ExpirationDate = (get({HttpServletRequest, '$class'})):getParameter(HttpServletRequest, "expirationDate"),
                CheckNumber = (get({HttpServletRequest, '$class'})):getParameter(HttpServletRequest, "checkNumber"),
                DriversLicense = (get({HttpServletRequest, '$class'})):getParameter(HttpServletRequest, "driversLicense"),
                MagneticInkCheckReader = (get({HttpServletRequest, '$class'})):getParameter(HttpServletRequest, "magneticInkCheckReader"),
                Aba = (get({HttpServletRequest, '$class'})):getParameter(HttpServletRequest, "aba"),
                AccountType = (get({HttpServletRequest, '$class'})):getParameter(HttpServletRequest, "accountType"),
                Name = (get({HttpServletRequest, '$class'})):getParameter(HttpServletRequest, "name"),
                (get({Payment, '$class'})):setName(Payment, Name),
                (get({Payment, '$class'})):setNumber(Payment, Account),
                (get({Payment, '$class'})):setExpiration(Payment, ExpirationDate),
                (get({Payment, '$class'})):setCheckNumber(Payment, CheckNumber),
                (get({Payment, '$class'})):setDriversLicense(Payment, DriversLicense),
                (get({Payment, '$class'})):setMagneticInkCheckReader(Payment, MagneticInkCheckReader),
                (get({Payment, '$class'})):setAba(Payment, Aba),
                (get({Payment, '$class'})):setAccountType(Payment, AccountType),
                Street = (get({HttpServletRequest, '$class'})):getParameter(HttpServletRequest, "street"),
                City = (get({HttpServletRequest, '$class'})):getParameter(HttpServletRequest, "city"),
                State = (get({HttpServletRequest, '$class'})):getParameter(HttpServletRequest, "state"),
                Zip = (get({HttpServletRequest, '$class'})):getParameter(HttpServletRequest, "zip"),
                StreetAddress = 'StreetAddress':new(),
                (get({StreetAddress, '$class'})):setName(StreetAddress, Name),
                (get({StreetAddress, '$class'})):setStreet(StreetAddress, Street),
                (get({StreetAddress, '$class'})):setCity(StreetAddress, City),
                (get({StreetAddress, '$class'})):setState(StreetAddress, State),
                (get({StreetAddress, '$class'})):setCode(StreetAddress, Zip),
                Email = (get({HttpServletRequest, '$class'})):getParameter(HttpServletRequest, "email"),
                Amount = (get({HttpServletRequest, '$class'})):getParameter(HttpServletRequest, "amount"),
                (get({OrderReview, '$class'})):setTotal(OrderReview, 'Money':new(Amount)),
                (get({OrderReview, '$class'})):setBillingAddress(OrderReview, StreetAddress);
                false ->
                (get({OrderReview, '$class'})):setId(OrderReview, get({local, orderId}))
            end,
            (get({OrderReview, '$class'})):setPaymentInfo(OrderReview, Payment),
            PaymentTransactionInterface = (fun(Target_N70723) -> (get({Target_N70723, '$class'})):getInstance(Target_N70723, OrderReview) end)('PaymentTransactionInterfaceFactory':getInstance()),
            PaymentTransactionInterface
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PAYMENTERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "generatePaymentTransactionInterfaceFromTestData()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

