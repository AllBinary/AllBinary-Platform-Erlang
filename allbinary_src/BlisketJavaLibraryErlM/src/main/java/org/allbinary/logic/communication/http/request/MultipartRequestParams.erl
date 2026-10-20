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
% import java.util.HashMap
% import java.util.List
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.PageContext
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.http.file.upload.AbFileUploadFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.apache.commons.fileupload.FileItem
% import org.apache.commons.fileupload.FileUploadBase.InvalidContentTypeException

-module('MultipartRequestParams').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RequestParams', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, special}, false),
    ok.


new(Request) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Request),
    This;
new(PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PageContext),
    This.

'$init'(This, Request) ->
        'RequestParams':'$init'(This),
        init_fields(This),
        (get({This, '$class'})):processMultipartRequest(This, Request);
'$init'(This, PageContext) ->
        'RequestParams':'$init'(This),
        init_fields(This),
        (get({This, '$class'})):processMultipartRequest(This, (get({PageContext, '$class'})):getRequest(PageContext)).


setSpecial(This) ->
        put({This, special}, true).

processMultipartRequest(This, Request) ->
        try
            SpecialRequest = (fun(Target_N66232) -> (get({Target_N66232, '$class'})):createHashMap(Target_N66232) end)('StdUtil':getInstance()),
            MultipartRequestList = (fun(Target_N66283) -> (get({Target_N66283, '$class'})):getFileItemStreamList(Target_N66283, Request) end)('AbFileUploadFactory':getInstance()),
            case (MultipartRequestList =/= undefined) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["FileItem List Size: ", (get({MultipartRequestList, '$class'})):size(MultipartRequestList)]), This, "processMultipartRequest()");
                    false -> ok
                end,
                FileItemArray = (get({MultipartRequestList, '$class'})):toArray(MultipartRequestList),
                Size = array:size(FileItemArray),
                lists:foreach(fun(Index) ->
                    FileItem = array:get(Index, FileItemArray),
                    Name = (get({FileItem, '$class'})):getName(FileItem),
                    case (fun(Target_N66808) -> (get({Target_N66808, '$class'})):isEmpty(Target_N66808, Name) end)('StringValidationUtil':getInstance()) of
                        true ->
                        (get({SpecialRequest, '$class'})):put(SpecialRequest, (get({FileItem, '$class'})):getFieldName(FileItem), (get({FileItem, '$class'})):getString(FileItem));
                        false ->
                        (get({SpecialRequest, '$class'})):put(SpecialRequest, (get({FileItem, '$class'})):getFieldName(FileItem), FileItem)
                    end
                end, lists:seq(0, Size - 1)),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Special Request Data: ", (get({SpecialRequest, '$class'})):toString(SpecialRequest)]), This, "processMultipartRequest()");
                    false -> ok
                end,
                (get({This, '$class'})):setSpecial(This),
                (get({This, '$class'})):setMap(This, SpecialRequest);
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Using Normal RequestParams", This, "processMultipartRequest()");
                false -> ok
            end,
            'RequestParams':setMap(This, (get({Request, '$class'})):getParameterMap(Request))
        end.

% throws Exception
toHashMap(This) ->
        try
        case get({This, special}) of
            true ->
            throw({'$return', (get({This, '$class'})):getMap(This)});
            false ->
            throw({'$return', 'RequestParams':toHashMap(This)})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

