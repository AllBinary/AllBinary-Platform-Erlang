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
% import org.allbinary.logic.communication.http.file.upload.FileUploadData
% import org.allbinary.logic.communication.http.file.upload.HttpFileUploadUtil
% import org.allbinary.logic.communication.http.request.HttpRequestUtil
% import org.allbinary.logic.communication.http.request.MultipartRequestParams
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.AbFileOutputStream
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.servlet.BlisketServletUtil
% import org.allbinary.string.CommonStrings
% import org.apache.commons.fileupload.FileItem

-module('UploadFileServlet').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpServlet', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, requestHashMap}, undefined),
    put({This, fileName}, undefined),
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
        put({local, isError}, false),
        InputStream = undefined,
        try
            (fun(Target_N66638) -> (get({Target_N66638, '$class'})):init(Target_N66638, Request) end)('BlisketServletUtil':getInstance()),
            put({This, requestHashMap}, (fun(Target_N66696) -> (get({Target_N66696, '$class'})):toHashMap(Target_N66696) end)('MultipartRequestParams':new(Request))),
            FilePath = (get({get({This, requestHashMap}), '$class'})):get(get({This, requestHashMap}), get({'FileUploadData':getInstance(), 'UPLOAD_TO_FILE_PATH'})),
            case (FilePath =:= undefined) of
                true ->
                put({local, isError}, true),
                (get({Response, '$class'})):sendError(Response, get({'HttpServletResponse', 'SC_NOT_FOUND'})),
                throw({'$return', ok});
                false -> ok
            end,
            HashMap = (fun(Target_N66915) -> (get({Target_N66915, '$class'})):createHashMap(Target_N66915) end)('StdUtil':getInstance()),
            AuthenticationHelper = (fun(Target_N66973) -> (get({Target_N66973, '$class'})):getInstance(Target_N66973, HashMap, Request) end)('AuthenticationHelperFactory':new()),
            case (get({AuthenticationHelper, '$class'})):isAuthenticated(AuthenticationHelper) of
                true ->
                case (fun(Target_N67139) -> (get({Target_N67139, '$class'})):isAuthorized(Target_N67139, AuthenticationHelper, FilePath) end)('AuthenticationHelperUtil':getInstance()) of
                    true ->
                    (get({This, '$class'})):saveFile(This, FilePath),
                    (get({Response, '$class'})):setContentType(Response, "text/plain"),
                    (fun(Target_N67318) -> (get({Target_N67318, '$class'})):write(Target_N67318, (get({"OK!", '$class'})):getBytes("OK!")) end)((get({Response, '$class'})):getOutputStream(Response));
                    false ->
                    put({local, isError}, true),
                    (get({Response, '$class'})):sendError(Response, get({'HttpServletResponse', 'SC_UNAUTHORIZED'}), "You are not Authorized")
                end;
                false ->
                put({local, isError}, true),
                (get({Response, '$class'})):sendError(Response, get({'HttpServletResponse', 'SC_UNAUTHORIZED'}), "Please Login")
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "processRequest()", E);
                false -> ok
            end,
            put({local, isError}, true),
            (get({Response, '$class'})):sendError(Response, get({'HttpServletResponse', 'SC_NOT_FOUND'}))
        after
            case (not get({local, isError})) of
                true ->
                (fun(Target_N66534) -> (get({Target_N66534, '$class'})):close(Target_N66534, (get({Response, '$class'})):getOutputStream(Response)) end)('StreamUtil':getInstance());
                false -> ok
            end,
            case (not (fun(Target_N66588) -> (get({Target_N66588, '$class'})):close(Target_N66588, InputStream) end)('StreamUtil':getInstance())) of
                true ->
                ok;
                false -> ok
            end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
saveFile(This, FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        put({local, filePath}, FilePath),
        put({local, fileOutputStream}, undefined),
        try
            FileItem = (get({get({This, requestHashMap}), '$class'})):get(get({This, requestHashMap}), get({'FileUploadData':getInstance(), 'FILE_DATA'})),
            case ((FileItem =/= undefined) andalso ((get({FileItem, '$class'})):getSize(FileItem) > 1)) of
                true ->
                put({This, fileName}, (fun(Target_N68026) -> (get({Target_N68026, '$class'})):generateFileName(Target_N68026, (get({FileItem, '$class'})):getName(FileItem)) end)('HttpRequestUtil':getInstance())),
                case (lists:suffix("/", get({local, filePath})) orelse lists:suffix("\\", get({local, filePath}))) of
                    true ->
                    put({local, filePath}, lists:concat([get({local, filePath}), get({This, fileName})]));
                    false -> ok
                end,
                File = 'AbFile':createAbFile(lists:concat([(get({get({'UploadFileServlet', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'UploadFileServlet', 'URLGLOBALS'})), get({local, filePath})])),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                    true ->
                    StringBuffer = 'StringMaker':new(),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "Uploaded File: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({This, fileName})),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " New File: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({File, '$class'})):getPath(File)),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "saveFile()");
                    false -> ok
                end,
                'HttpFileUploadUtil':log(FileItem),
                ByteArray = (get({FileItem, '$class'})):get(FileItem),
                case (get({File, '$class'})):isFile(File) of
                    true ->
                    (get({File, '$class'})):delete(File),
                    (get({File, '$class'})):createNewFile(File);
                    false -> ok
                end,
                put({local, fileOutputStream}, 'AbFileOutputStream':createFromAbFile(File)),
                (get({get({local, fileOutputStream}), '$class'})):write(get({local, fileOutputStream}), ByteArray);
                false -> ok
            end
        after
            case (get({local, fileOutputStream}) =/= undefined) of
                true ->
                (get({get({local, fileOutputStream}), '$class'})):close(get({local, fileOutputStream}));
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
        "Upload Cloud Files".

