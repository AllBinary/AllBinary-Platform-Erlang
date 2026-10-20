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
% package servlet.request
% import java.io
% import java.net
% import javax.servlet
% import javax.servlet.http
% import org.allbinary.logic.system.security.licensing.LicensingException
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.workflow.WorkFlowInterface
% import org.allbinary.logic.control.workflow.RequestWorkFlowFactory

-module('RequestHandler').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpServlet', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'HttpServlet':'$init'(This),
    init_fields(This).


% throws ServletException
init(This, Config) ->
        'HttpServlet':init(This, Config).

destroy(This) ->
        ok.

% throws ServletException, IOException
processRequest(This, Request, Response) ->
        try
            (get({Response, '$class'})):setContentType(Response, "text/html"),
            Out = (get({Response, '$class'})):getWriter(Response),
            WorkflowInterface = 'RequestWorkFlowFactory':getInstance(Request, Response, (get({This, '$class'})):getServletConfig(This), (get({This, '$class'})):getServletContext(This)),
            case (WorkflowInterface =/= undefined) of
                true ->
                (get({Out, '$class'})):print(Out, (get({WorkflowInterface, '$class'})):process(WorkflowInterface));
                false -> ok
            end,
            (get({Out, '$class'})):flush(Out),
            (get({Out, '$class'})):close(Out)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SERVLETERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Servlet LicensingException", This, "processRequest()", E);
                false -> ok
            end,
            (get({Response, '$class'})):sendRedirect(Response, get({get({get({get({This, abcs}), globals}), 'URLGLOBALS'}), 'LICENSEERRORPAGE'}))
        end.

% throws ServletException, IOException
doGet(This, Request, Response) ->
        (get({This, '$class'})):processRequest(This, Request, Response).

% throws ServletException, IOException
doPost(This, Request, Response) ->
        (get({This, '$class'})):processRequest(This, Request, Response).

getServletInfo(This) ->
        "WorkFlow Request Handler".

