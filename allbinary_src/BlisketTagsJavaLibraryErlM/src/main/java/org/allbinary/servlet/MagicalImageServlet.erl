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
% package org.allbinary.servlet
% import java.io.ByteArrayOutputStream
% import java.io.IOException
% import java.io.InputStream
% import javax.servlet.ServletException
% import javax.servlet.http.HttpServlet
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.http.HttpServletResponse
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.CloudStreamUtil
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.string.CommonStrings

-module('MagicalImageServlet').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpServlet', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'HttpServlet':init(This),
    init_fields(This).


% throws ServletException, IOException
processRequest(This, Request, Response) ->
        put({local, inputStream}, undefined),
        try
            (fun(Target_N66221) -> (get({Target_N66221, '$class'})):init(Target_N66221, Request) end)('BlisketServletUtil':getInstance()),
            RequestURI = (get({Request, '$class'})):getRequestURI(Request),
            File = 'AbFile':createAbFile(lists:concat([(get({get({'MagicalImageServlet', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'MagicalImageServlet', 'URLGLOBALS'})), RequestURI])),
            put({local, inputStream}, (fun(Target_N66408) -> (get({Target_N66408, '$class'})):getFileAnyWhere(Target_N66408, File) end)('CloudStreamUtil':getInstance())),
            OutputStream = 'ByteArrayOutputStream':new(8000),
            ByteArray = (fun(Target_N66516) -> (get({Target_N66516, '$class'})):getByteArray(Target_N66516, get({local, inputStream}), OutputStream, array:new(16384, {default, 0})) end)('StreamUtil':getInstance()),
            (get({Response, '$class'})):setContentType(Response, "image/jpeg;charset=utf-8"),
            (fun(Target_N66625) -> (get({Target_N66625, '$class'})):write(Target_N66625, ByteArray) end)((get({Response, '$class'})):getOutputStream(Response))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "processRequest()", E);
                false -> ok
            end
        after
            (fun(Target_N66077) -> (get({Target_N66077, '$class'})):close(Target_N66077, (get({Response, '$class'})):getOutputStream(Response)) end)('StreamUtil':getInstance()),
            case (not (fun(Target_N66128) -> (get({Target_N66128, '$class'})):close(Target_N66128, get({local, inputStream})) end)('StreamUtil':getInstance())) of
                true ->
                (get({Response, '$class'})):sendError(Response, get({'HttpServletResponse', 'SC_NOT_FOUND'}));
                false -> ok
            end
        end.

% throws ServletException, IOException
doGet(This, Request, Response) ->
        (get({This, '$class'})):processRequest(This, Request, Response).

% throws ServletException, IOException
doPost(This, Request, Response) ->
        (get({This, '$class'})):processRequest(This, Request, Response).

getServletInfo(This) ->
        "Serves Up Image From Local or Cloud".

