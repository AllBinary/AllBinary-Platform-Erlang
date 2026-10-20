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
% package org.allbinary.logic.communication.http.request.session
% import java.util.HashMap
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.http.HttpSession
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.UserData
% import org.allbinary.business.user.commerce.inventory.basket.Basket
% import org.allbinary.business.user.commerce.inventory.order.Order
% import org.allbinary.business.user.commerce.inventory.order.OrderInterface
% import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData
% import org.allbinary.business.user.role.UserRole
% import org.allbinary.business.user.role.UserRoleB
% import org.allbinary.business.user.role.UserRoleData
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.logic.string.StringValidationUtil

-module('WeblisketSession').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements WeblisketSessionInterface

init_fields(This) ->
    put({This, session}, undefined),
    ok.


new(HashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap, PageContext),
    This;
new(HashMap, HttpServletRequest) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap, HttpServletRequest),
    This.

'$init'(This, HashMap, PageContext) ->
        '$init'(This, HashMap, (get({PageContext, '$class'})):getRequest(PageContext));
'$init'(This, HashMap, HttpServletRequest) ->
    init_fields(This),
        PropertiesHashMap = HashMap,
        Request = HttpServletRequest,
        put({This, session}, (get({Request, '$class'})):getSession(Request, true)),
        case ((get({This, '$class'})):getStoreName(This) =:= undefined) of
            true ->
            (get({This, '$class'})):setStoreName(This, (get({PropertiesHashMap, '$class'})):get(PropertiesHashMap, get({'StoreFrontData':getInstance(), 'NAME'})));
            false -> ok
        end.


getId(This) ->
        (get({get({This, session}), '$class'})):getId(get({This, session})).

setPassword(This, Password) when (is_list(Password) orelse Password =:= undefined) ->
        (get({get({This, session}), '$class'})):setAttribute(get({This, session}), get({'UserData', 'PASSWORD'}), Password).

setUserName(This, UserName) when (is_list(UserName) orelse UserName =:= undefined) ->
        (get({get({This, session}), '$class'})):setAttribute(get({This, session}), get({'UserData', 'USERNAME'}), UserName).

setPaymentMethod(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        (get({get({This, session}), '$class'})):setAttribute(get({This, session}), (get({get({'PaymentGatewayData', 'NAME'}), '$class'})):toString(get({'PaymentGatewayData', 'NAME'})), Value).

setAuthenticated(This) ->
        (get({get({This, session}), '$class'})):setAttribute(get({This, session}), get({'WeblisketSessionData', 'AUTHENTICATED'}), get({'BooleanFactory':getInstance(), 'TRUE_STRING'})).

setRole(This, ARole) ->
        (get({get({This, session}), '$class'})):setAttribute(get({This, session}), (get({get({'UserRoleData', 'NAME'}), '$class'})):toString(get({'UserRoleData', 'NAME'})), ARole).

setAttempts(This, Value) ->
        (get({get({This, session}), '$class'})):setAttribute(get({This, session}), get({'WeblisketSessionData', 'ATTEMPTS'}), Value).

setTimeout(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        (get({get({This, session}), '$class'})):setAttribute(get({This, session}), get({'WeblisketSessionData', 'TIMEOUT'}), Value).

setStoreName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        (get({get({This, session}), '$class'})):setAttribute(get({This, session}), get({'StoreFrontData':getInstance(), 'NAME'}), Value).

getWebAppPath(This) ->
        (get({get({This, session}), '$class'})):getAttribute(get({This, session}), get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'WEBAPPPATH'})).

getUserName(This) ->
        (get({get({This, session}), '$class'})):getAttribute(get({This, session}), get({'UserData', 'USERNAME'})).

getPassword(This) ->
        (get({get({This, session}), '$class'})):getAttribute(get({This, session}), get({'UserData', 'PASSWORD'})).

getPaymentMethod(This) ->
        (get({get({This, session}), '$class'})):getAttribute(get({This, session}), (get({get({'PaymentGatewayData', 'NAME'}), '$class'})):toString(get({'PaymentGatewayData', 'NAME'}))).

getAuthentication(This) ->
        (get({get({This, session}), '$class'})):getAttribute(get({This, session}), get({'WeblisketSessionData', 'AUTHENTICATED'})).

getAttempts(This) ->
        (get({get({This, session}), '$class'})):getAttribute(get({This, session}), get({'WeblisketSessionData', 'ATTEMPTS'})).

getTimeout(This) ->
        (get({get({This, session}), '$class'})):getAttribute(get({This, session}), get({'WeblisketSessionData', 'TIMEOUT'})).

getStoreName(This) ->
        (get({get({This, session}), '$class'})):getAttribute(get({This, session}), get({'StoreFrontData':getInstance(), 'NAME'})).

% throws Exception
getRole(This) ->
        try
        UserRole = (get({get({This, session}), '$class'})):getAttribute(get({This, session}), (get({get({'UserRoleData', 'NAME'}), '$class'})):toString(get({'UserRoleData', 'NAME'}))),
        case (UserRole =/= undefined) of
            true ->
            throw({'$return', 'UserRoleB':getRole((fun(Target_N68329) -> (get({Target_N68329, '$class'})):getRole(Target_N68329) end)((get({UserRole, '$class'})):getBasicUserRole(UserRole)))});
            false ->
            throw({'$return', undefined})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getOrder(This) ->
        try
        StoreFrontInterface = 'StoreFrontFactory':getInstance((get({This, '$class'})):getStoreName(This)),
        BasketName = (get({StoreFrontInterface, '$class'})):getBasketName(StoreFrontInterface),
        case (not (fun(Target_N68507) -> (get({Target_N68507, '$class'})):isEmpty(Target_N68507, BasketName) end)('StringValidationUtil':getInstance())) of
            true ->
            put({local, orderInterface}, (get({get({This, session}), '$class'})):getAttribute(get({This, session}), BasketName)),
            case (get({local, orderInterface}) =:= undefined) of
                true ->
                put({local, orderInterface}, 'Order':new('Basket':new()));
                false -> ok
            end,
            (get({get({This, session}), '$class'})):setAttribute(get({This, session}), BasketName, get({local, orderInterface})),
            throw({'$return', get({local, orderInterface})});
            false ->
            erlang:error({'Exception', "Basket Name Not Found"})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setAuthenticated(This, Value) when is_boolean(Value) ->
        (get({get({This, session}), '$class'})):setAttribute(get({This, session}), get({'WeblisketSessionData', 'AUTHENTICATED'}), get({'BooleanFactory':getInstance(), 'FALSE_STRING'})).

clear(This) ->
        (get({get({This, session}), '$class'})):removeAttribute(get({This, session}), get({'WeblisketSessionData', 'AUTHENTICATED'})),
        (get({get({This, session}), '$class'})):removeAttribute(get({This, session}), get({'WeblisketSessionData', 'TIMEOUT'})),
        (get({get({This, session}), '$class'})):removeAttribute(get({This, session}), (get({get({'UserRoleData', 'NAME'}), '$class'})):toString(get({'UserRoleData', 'NAME'}))),
        (get({get({This, session}), '$class'})):removeAttribute(get({This, session}), get({'UserData', 'USERNAME'})).

getCreationTime(This) ->
        (get({get({This, session}), '$class'})):getCreationTime(get({This, session})).

getLastAccessedTime(This) ->
        (get({get({This, session}), '$class'})):getLastAccessedTime(get({This, session})).

removeBasket(This) ->
        StoreFrontInterface = 'StoreFrontFactory':getInstance((get({This, '$class'})):getStoreName(This)),
        BasketName = (get({StoreFrontInterface, '$class'})):getBasketName(StoreFrontInterface),
        case (not (fun(Target_N69353) -> (get({Target_N69353, '$class'})):isEmpty(Target_N69353, BasketName) end)('StringValidationUtil':getInstance())) of
            true ->
            (get({get({This, session}), '$class'})):removeAttribute(get({This, session}), BasketName);
            false -> ok
        end.

