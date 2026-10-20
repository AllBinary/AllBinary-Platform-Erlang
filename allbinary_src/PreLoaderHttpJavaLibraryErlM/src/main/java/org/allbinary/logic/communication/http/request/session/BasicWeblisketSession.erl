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
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.http.HttpSession
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.user.UserData
% import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData
% import org.allbinary.business.user.role.BasicUserRole
% import org.allbinary.business.user.role.BasicUserRoleData
% import org.allbinary.logic.java.bool.BooleanFactory

-module('BasicWeblisketSession').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, session}, undefined),
    put({This, pageContext}, undefined),
    ok.


new(PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PageContext),
    This.

'$init'(This, PageContext) ->
    init_fields(This),
        put({This, pageContext}, PageContext),
        Request = (get({PageContext, '$class'})):getRequest(PageContext),
        put({This, session}, (get({Request, '$class'})):getSession(Request, true)).

setRole(This, ARole) ->
        (get({get({This, session}), '$class'})):setAttribute(get({This, session}), (get({get({'BasicUserRoleData', 'NAME'}), '$class'})):toString(get({'BasicUserRoleData', 'NAME'})), ARole).

getRole(This) ->
        (get({get({This, session}), '$class'})):getAttribute(get({This, session}), (get({get({'BasicUserRoleData', 'NAME'}), '$class'})):toString(get({'BasicUserRoleData', 'NAME'}))).

setPassword(This, Password) when (is_list(Password) orelse Password =:= undefined) ->
        (get({get({This, session}), '$class'})):setAttribute(get({This, session}), get({'UserData', 'PASSWORD'}), Password).

setUserName(This, UserName) when (is_list(UserName) orelse UserName =:= undefined) ->
        (get({get({This, session}), '$class'})):setAttribute(get({This, session}), get({'UserData', 'USERNAME'}), UserName).

setPaymentMethod(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        (get({get({This, session}), '$class'})):setAttribute(get({This, session}), (get({get({'PaymentGatewayData', 'NAME'}), '$class'})):toString(get({'PaymentGatewayData', 'NAME'})), Value).

setAuthenticated(This) ->
        (get({get({This, session}), '$class'})):setAttribute(get({This, session}), get({'WeblisketSessionData', 'AUTHENTICATED'}), get({'BooleanFactory':getInstance(), 'TRUE_STRING'})).

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

setAuthenticated(This, Value) when is_boolean(Value) ->
        (get({get({This, session}), '$class'})):setAttribute(get({This, session}), get({'WeblisketSessionData', 'AUTHENTICATED'}), get({'BooleanFactory':getInstance(), 'FALSE_STRING'})).

clear(This) ->
        (get({get({This, session}), '$class'})):removeAttribute(get({This, session}), get({'WeblisketSessionData', 'AUTHENTICATED'})),
        (get({get({This, session}), '$class'})):removeAttribute(get({This, session}), get({'WeblisketSessionData', 'TIMEOUT'})),
        (get({get({This, session}), '$class'})):removeAttribute(get({This, session}), (get({get({'BasicUserRoleData', 'NAME'}), '$class'})):toString(get({'BasicUserRoleData', 'NAME'}))),
        (get({get({This, session}), '$class'})):removeAttribute(get({This, session}), get({'UserData', 'USERNAME'})).

getCreationTime(This) ->
        (get({get({This, session}), '$class'})):getCreationTime(get({This, session})).

getLastAccessedTime(This) ->
        LastAccessedTime = (get({get({This, session}), '$class'})):getLastAccessedTime(get({This, session})),
        LastAccessedTime.

