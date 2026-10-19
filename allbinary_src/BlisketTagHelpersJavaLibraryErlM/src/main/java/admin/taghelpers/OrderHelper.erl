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
% package admin.taghelpers
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.commerce.inventory.order.Order
% import org.allbinary.business.user.commerce.inventory.order.OrderInterface
% import org.allbinary.business.user.commerce.inventory.order.OrderProcessorUtil
% import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData
% import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterface
% import org.allbinary.business.user.commerce.money.payment.types.BasicPaymentType
% import org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntity
% import org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntityFactory
% import org.allbinary.logic.communication.http.request.session.WeblisketSession
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringValidationUtil

-module('OrderHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TagHelper', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, weblisketSession}, undefined),
    put({This, storeFrontInterface}, undefined),
    put({This, propertiesHashMap}, undefined),
    put({This, pageContext}, undefined),
    put({This, request}, undefined),
    ok.


new(PropertiesHashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PropertiesHashMap, PageContext),
    This.

init(This, PropertiesHashMap, PageContext) ->
    'TagHelper':init(This),
    init_fields(This),
        put({This, propertiesHashMap}, PropertiesHashMap),
        put({This, pageContext}, PageContext),
        put({This, request}, (get({PageContext, '$class'})):getRequest(PageContext)),
        StoreName = (get({PropertiesHashMap, '$class'})):get(PropertiesHashMap, get({'StoreFrontData':getInstance(), 'NAME'})),
        case (not (fun(Target_N66760) -> (get({Target_N66760, '$class'})):isEmpty(Target_N66760, StoreName) end)('StringValidationUtil':getInstance())) of
            true ->
            put({This, storeFrontInterface}, 'StoreFrontFactory':getInstance(StoreName));
            false -> ok
        end,
        put({This, weblisketSession}, 'WeblisketSession':new(get({This, propertiesHashMap}), get({This, pageContext}))).

setPaymentGateway(This) ->
        try
            put({local, paymentGatewayBoolean}, false),
            put({local, orderInterface}, (get({get({This, weblisketSession}), '$class'})):getOrder(get({This, weblisketSession}))),
            RequestPaymentGateway = (get({get({This, request}), '$class'})):getParameter(get({This, request}), (get({get({'PaymentGatewayData', 'NAME'}), '$class'})):toString(get({'PaymentGatewayData', 'NAME'}))),
            case (not (fun(Target_N67160) -> (get({Target_N67160, '$class'})):isEmpty(Target_N67160, RequestPaymentGateway) end)('StringValidationUtil':getInstance())) of
                true ->
                (get({get({This, weblisketSession}), '$class'})):setPaymentMethod(get({This, weblisketSession}), RequestPaymentGateway),
                (get({get({local, orderInterface}), '$class'})):setPaymentMethod(get({local, orderInterface}), RequestPaymentGateway),
                put({local, paymentGatewayBoolean}, true);
                false -> ok
            end,
            PaymentGatewayEntityInterface = 'PaymentGatewayEntityFactory':getInstance(),
            PaymentTypeVector = (get({PaymentGatewayEntityInterface, '$class'})):findPaymentTypeVectorByStore(PaymentGatewayEntityInterface, (get({get({This, weblisketSession}), '$class'})):getStoreName(get({This, weblisketSession}))),
            case ((get({PaymentTypeVector, '$class'})):size(PaymentTypeVector) =:= 1) of
                true ->
                PaymentType = (get({PaymentTypeVector, '$class'})):get(PaymentTypeVector, 0),
                PaymentGatewayInterface = (get({PaymentGatewayEntityInterface, '$class'})):getPaymentGatewayInterface(PaymentGatewayEntityInterface, (get({get({This, weblisketSession}), '$class'})):getStoreName(get({This, weblisketSession})), PaymentType),
                PaymentGateway = (get({PaymentGatewayInterface, '$class'})):getName(PaymentGatewayInterface),
                (get({get({This, weblisketSession}), '$class'})):setPaymentMethod(get({This, weblisketSession}), PaymentGateway),
                (get({get({local, orderInterface}), '$class'})):setPaymentMethod(get({local, orderInterface}), PaymentGateway),
                put({local, paymentGatewayBoolean}, true);
                false -> ok
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                put({local, stringBuffer}, 'StringMaker':new()),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Successfully set PaymentGateway Order: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({get({local, orderInterface}), '$class'})):getId(get({local, orderInterface}))),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " to: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({get({local, orderInterface}), '$class'})):getPaymentMethod(get({local, orderInterface}))),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, "setPaymentGateway()");
                false -> ok
            end,
            get({local, paymentGatewayBoolean})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                put({local, stringBuffer}, 'StringMaker':new()),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Failed to set PaymentGateway for Order: "),
                try
                    put({local, orderInterface}, (get({get({This, weblisketSession}), '$class'})):getOrder(get({This, weblisketSession}))),
                    case (get({local, orderInterface}) =/= undefined) of
                        true ->
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({get({local, orderInterface}), '$class'})):getId(get({local, orderInterface}))),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " to: "),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({get({local, orderInterface}), '$class'})):getPaymentMethod(get({local, orderInterface})));
                        false -> ok
                    end
                catch _:Ex when Ex =/= '$break', Ex =/= '$continue', (not is_tuple(Ex) orelse element(1, Ex) =/= '$return') ->
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " Exception Getting")
                end,
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, "setPaymentGateway()", E);
                false -> ok
            end,
            false
        end.

process(This) ->
        try
            Order = (get({get({This, weblisketSession}), '$class'})):getOrder(get({This, weblisketSession})),
            (get({Order, '$class'})):setStoreName(Order, (get({get({This, storeFrontInterface}), '$class'})):getName(get({This, storeFrontInterface}))),
            Result = (fun(Target_N68891) -> (get({Target_N68891, '$class'})):process(Target_N68891, (get({get({This, weblisketSession}), '$class'})):getUserName(get({This, weblisketSession})), Order) end)('OrderProcessorUtil':getInstance()),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Successfully Processed Order: ", Result]), This, "processOrder()");
                false -> ok
            end,
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Failed to Process Order: "),
            try
                (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N69326) -> (get({Target_N69326, '$class'})):getId(Target_N69326) end)((get({get({This, weblisketSession}), '$class'})):getOrder(get({This, weblisketSession}))))
            catch _:Ex when Ex =/= '$break', Ex =/= '$continue', (not is_tuple(Ex) orelse element(1, Ex) =/= '$return') ->
                (get({StringBuffer, '$class'})):append(StringBuffer, " Exception Getting Id")
            end,
            Error = (get({StringBuffer, '$class'})):toString(StringBuffer),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'PROCESS'}), E);
                false -> ok
            end,
            Error
        end.

