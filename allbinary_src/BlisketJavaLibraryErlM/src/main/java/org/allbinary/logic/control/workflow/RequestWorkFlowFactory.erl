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
% package org.allbinary.logic.control.workflow
% import java.util.HashMap
% import javax.servlet.ServletConfig
% import javax.servlet.ServletContext
% import javax.servlet.ServletRequest
% import javax.servlet.ServletResponse
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.PageContext
% import org.allbinary.data.tables.workflow.WorkFlowEntityFactory
% import org.allbinary.logic.communication.http.request.session.WeblisketSession
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.system.security.licensing.LicensingException

-module('RequestWorkFlowFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception, LicensingException
getInstance(Request, Response, ServletConfig, ServletContext) ->
        HttpRequest = Request,
        RequestCommand = (get({HttpRequest, '$class'})):getPathInfo(HttpRequest),
        Index = allbinary_java:index_of(RequestCommand, get({'AbPathData':getInstance(), 'SEPARATOR'})),
        StoreName = string:slice(RequestCommand, 0, (Index) - (0)),
        RequestName = string:slice(RequestCommand, Index, (string:length(RequestCommand)) - (Index)),
        (fun(Target_N66206) -> (get({Target_N66206, '$class'})):get(Target_N66206, RequestName, StoreName) end)((fun(Target_N66213) -> (get({Target_N66213, '$class'})):create2(Target_N66213) end)('WorkFlowEntityFactory':getInstance())).

% throws Exception, LicensingException
getInstance(HashMap, PageContext) ->
        WorkFlowName = (fun(Target_N66404) -> (get({Target_N66404, '$class'})):getParameter(Target_N66404, get({'WorkFlowData':getInstance(), 'NAME'})) end)((get({PageContext, '$class'})):getRequest(PageContext)),
        WeblisketSession = 'WeblisketSession':new(HashMap, PageContext),
        StoreName = (get({WeblisketSession, '$class'})):getStoreName(WeblisketSession),
        (fun(Target_N66584) -> (get({Target_N66584, '$class'})):get(Target_N66584, WorkFlowName, StoreName) end)((fun(Target_N66591) -> (get({Target_N66591, '$class'})):create2(Target_N66591) end)('WorkFlowEntityFactory':getInstance())).

