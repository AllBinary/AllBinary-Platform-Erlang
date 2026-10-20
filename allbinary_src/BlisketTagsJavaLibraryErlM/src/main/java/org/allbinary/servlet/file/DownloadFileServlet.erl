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
% package org.allbinary.servlet.file
% import java.io.IOException
% import java.io.InputStream
% import java.util.HashMap
% import javax.servlet.ServletException
% import javax.servlet.http.HttpServlet
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.http.HttpServletResponse
% import admin.taghelpers.AuthenticationHelper
% import admin.taghelpers.AuthenticationHelperFactory
% import admin.taghelpers.AuthenticationHelperUtil
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.CloudStreamUtil
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.servlet.BlisketServletUtil
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('DownloadFileServlet').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpServlet', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, 'DOWNLOAD'}, "download"),
    put({This, 'DEFAULT_BUFFER_SIZE'}, 16384),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'HttpServlet':'$init'(This),
    init_fields(This).


% throws ServletException, IOException
processRequest(This, Request, Response) ->
        try
        put({local, inputStream}, undefined),
        try
            (fun(Target_N66450) -> (get({Target_N66450, '$class'})):init(Target_N66450, Request) end)('BlisketServletUtil':getInstance()),
            RequestPath = (get({Request, '$class'})):getRequestURI(Request),
            case (RequestPath =:= undefined) of
                true ->
                (get({Response, '$class'})):sendError(Response, get({'HttpServletResponse', 'SC_NOT_FOUND'})),
                throw({'$return', ok});
                false -> ok
            end,
            BeginIndex = allbinary_java:index_of(RequestPath, get({This, 'DOWNLOAD'})),
            put({local, filePath}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
            case (BeginIndex >= 0) of
                true ->
                put({local, filePath}, string:slice(RequestPath, (BeginIndex + string:length(get({This, 'DOWNLOAD'})))));
                false ->
                (get({Response, '$class'})):sendError(Response, get({'HttpServletResponse', 'SC_NOT_FOUND'}))
            end,
            File = 'AbFile':createAbFile(lists:concat([(get({get({'DownloadFileServlet', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'DownloadFileServlet', 'URLGLOBALS'})), get({local, filePath})])),
            case (not (get({File, '$class'})):exists(File)) of
                true ->
                (get({Response, '$class'})):sendError(Response, get({'HttpServletResponse', 'SC_NOT_FOUND'})),
                throw({'$return', ok});
                false -> ok
            end,
            HashMap = (fun(Target_N67008) -> (get({Target_N67008, '$class'})):createHashMap(Target_N67008) end)('StdUtil':getInstance()),
            AuthenticationHelper = (fun(Target_N67066) -> (get({Target_N67066, '$class'})):getInstance(Target_N67066, HashMap, Request) end)('AuthenticationHelperFactory':new()),
            case (get({AuthenticationHelper, '$class'})):isAuthenticated(AuthenticationHelper) of
                true ->
                case (fun(Target_N67211) -> (get({Target_N67211, '$class'})):isAuthorized(Target_N67211, AuthenticationHelper, get({local, filePath})) end)('AuthenticationHelperUtil':getInstance()) of
                    true ->
                    put({local, inputStream}, (fun(Target_N67324) -> (get({Target_N67324, '$class'})):getFile(Target_N67324, File) end)('CloudStreamUtil':getInstance())),
                    put({local, contentType}, (fun(Target_N67372) -> (get({Target_N67372, '$class'})):getMimeType(Target_N67372, (get({File, '$class'})):getName(File)) end)((get({This, '$class'})):getServletContext(This))),
                    case (get({local, contentType}) =:= undefined) of
                        true ->
                        put({local, contentType}, "application/octet-stream");
                        false -> ok
                    end,
                    (get({Response, '$class'})):reset(Response),
                    (get({Response, '$class'})):setBufferSize(Response, get({This, 'DEFAULT_BUFFER_SIZE'})),
                    (get({Response, '$class'})):setContentType(Response, get({local, contentType})),
                    (get({Response, '$class'})):setHeader(Response, "Content-Length", allbinary_java:to_string((get({File, '$class'})):length(File))),
                    StringBuffer = 'StringMaker':new(),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "attachment; filename=\""),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({File, '$class'})):getName(File)),
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'QUOTE'})),
                    (get({Response, '$class'})):setHeader(Response, "Content-Disposition", (get({StringBuffer, '$class'})):toString(StringBuffer)),
                    (fun(Target_N67820) -> (get({Target_N67820, '$class'})):get(Target_N67820, get({local, inputStream}), (get({Response, '$class'})):getOutputStream(Response), array:new(16348, {default, 0})) end)('StreamUtil':getInstance());
                    false ->
                    (get({Response, '$class'})):sendError(Response, get({'HttpServletResponse', 'SC_UNAUTHORIZED'}), "You are not Authorized")
                end;
                false ->
                (get({Response, '$class'})):sendError(Response, get({'HttpServletResponse', 'SC_UNAUTHORIZED'}), "Please Login")
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "processRequest()", E);
                false -> ok
            end,
            (get({Response, '$class'})):sendError(Response, get({'HttpServletResponse', 'SC_NOT_FOUND'}))
        after
            (fun(Target_N66349) -> (get({Target_N66349, '$class'})):close(Target_N66349, (get({Response, '$class'})):getOutputStream(Response)) end)('StreamUtil':getInstance()),
            case (not (fun(Target_N66400) -> (get({Target_N66400, '$class'})):close(Target_N66400, get({local, inputStream})) end)('StreamUtil':getInstance())) of
                true ->
                ok;
                false -> ok
            end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws ServletException, IOException
doGet(This, Request, Response) ->
        (get({This, '$class'})):processRequest(This, Request, Response).

% throws ServletException, IOException
doPost(This, Request, Response) ->
        (get({This, '$class'})):processRequest(This, Request, Response).

getServletInfo(This) ->
        "Serves Up Cloud Files".

