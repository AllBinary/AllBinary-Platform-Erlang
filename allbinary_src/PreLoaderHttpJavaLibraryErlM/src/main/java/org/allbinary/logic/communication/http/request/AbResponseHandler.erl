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
% package org.allbinary.logic.communication.http.request
% import javax.servlet.RequestDispatcher
% import javax.servlet.ServletException
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.http.HttpServletResponse
% import javax.servlet.jsp.JspTagException
% import javax.servlet.jsp.PageContext
% import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory
% import org.allbinary.logic.communication.log.config.type.LogConfigTypes

-module('AbResponseHandler').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws JspTagException
sendJspTagRedirect(PageContext, E) ->
        LogUtil = 'LogUtil':getInstance(),
        try
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'JSPTAGERROR'})) of
                true ->
                (get({LogUtil, '$class'})):put(LogUtil, "Jsp Tag Exception", "AbResponseHandler", "sendJspRedirect()", E);
                false -> ok
            end,
            'AbResponseHandler':sendRedirect(PageContext, get({(get({get({'AbResponseHandler', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'AbResponseHandler', 'FREEBLISKET_PATH_GLOBALS'})), 'ERRORPAGE'}))
        catch _:E2 when E2 =/= '$break', E2 =/= '$continue', (not is_tuple(E2) orelse element(1, E2) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'LICENSINGERROR'})) of
                true ->
                (get({LogUtil, '$class'})):put(LogUtil, "Exception in Redirect Handling", "AbResponseHandler", "sendJspRedirect", E);
                false -> ok
            end,
            erlang:error({'JspTagException'})
        end.

% throws ServletException
sendServletRedirect(PageContext, E) ->
        LogUtil = 'LogUtil':getInstance(),
        try
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'JSPTAGERROR'})) of
                true ->
                (get({LogUtil, '$class'})):put(LogUtil, "Jsp Tag Exception", "AbResponseHandler", "sendJspRedirect()", E);
                false -> ok
            end,
            'AbResponseHandler':sendRedirect(PageContext, get({(get({get({'AbResponseHandler', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'AbResponseHandler', 'FREEBLISKET_PATH_GLOBALS'})), 'ERRORPAGE'}))
        catch _:E2 when E2 =/= '$break', E2 =/= '$continue', (not is_tuple(E2) orelse element(1, E2) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'LICENSINGERROR'})) of
                true ->
                (get({LogUtil, '$class'})):put(LogUtil, "Exception in Redirect Handling", "AbResponseHandler", "sendJspRedirect", E);
                false -> ok
            end,
            erlang:error({'ServletException'})
        end.

% throws JspTagException
sendJspTagLicensingRedirect(PageContext, E) ->
        LogUtil = 'LogUtil':getInstance(),
        try
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'JSPTAGERROR'})) of
                true ->
                (get({LogUtil, '$class'})):put(LogUtil, "Licensing Exception", "AbResponseHandler", "sendJspTagLicensingRedirect()", E);
                false -> ok
            end,
            'AbResponseHandler':sendRedirect(PageContext, get({(get({get({'AbResponseHandler', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'AbResponseHandler', 'FREEBLISKET_PATH_GLOBALS'})), 'LICENSEERRORPAGE'}))
        catch _:E2 when E2 =/= '$break', E2 =/= '$continue', (not is_tuple(E2) orelse element(1, E2) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'LICENSINGERROR'})) of
                true ->
                (get({LogUtil, '$class'})):put(LogUtil, "Exception in Redirect Handling", "AbResponseHandler", "sendJspTagLicensingRedirect", E);
                false -> ok
            end,
            erlang:error({'JspTagException'})
        end.

% throws ServletException
sendServletLicensingRedirect(PageContext, E) ->
        LogUtil = 'LogUtil':getInstance(),
        try
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'JSPTAGERROR'})) of
                true ->
                (get({LogUtil, '$class'})):put(LogUtil, "Licensing Exception", "AbResponseHandler", "sendServletLicensingRedirect()", E);
                false -> ok
            end,
            'AbResponseHandler':sendRedirect(PageContext, get({(get({get({'AbResponseHandler', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'AbResponseHandler', 'FREEBLISKET_PATH_GLOBALS'})), 'LICENSEERRORPAGE'}))
        catch _:E2 when E2 =/= '$break', E2 =/= '$continue', (not is_tuple(E2) orelse element(1, E2) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'LICENSINGERROR'})) of
                true ->
                (get({LogUtil, '$class'})):put(LogUtil, "Exception in Redirect Handling", "AbResponseHandler", "sendServletLicensingRedirect", E);
                false -> ok
            end,
            erlang:error({'ServletException'})
        end.

% throws Exception
sendRedirect(PageContext, Page) when (is_list(Page) orelse Page =:= undefined) ->
        Request = (get({PageContext, '$class'})):getRequest(PageContext),
        Response = (get({PageContext, '$class'})):getResponse(PageContext),
        RequestDispatcher = (get({Request, '$class'})):getRequestDispatcher(Request, Page),
        case (get({Response, '$class'})):isCommitted(Response) of
            true ->
            (get({Response, '$class'})):sendRedirect(Response, Page);
            false ->
            try
                (get({RequestDispatcher, '$class'})):forward(RequestDispatcher, Request, Response)
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                (fun(Target_N68086) -> (get({Target_N68086, '$class'})):print(Target_N68086, lists:concat(["Error: ", Page])) end)((get({PageContext, '$class'})):getOut(PageContext))
            end
        end.

