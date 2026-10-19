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
% package org.allbinary.logic.communication.http.file.upload
% import java.util.ArrayList
% import java.util.List
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.logic.communication.http.AbFileItemFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.apache.commons.fileupload.FileItemIterator
% import org.apache.commons.fileupload.FileItemStream
% import org.apache.commons.fileupload.FileItemUtil

-module('AbFileUploadFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AbFileUploadFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'AbFileUploadFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getFileItemStreamList(This, HttpServletRequest) ->
        try
            FileUpload = 'AbFileUpload':new('AbFileItemFactory':new()),
            Iterator = (get({FileUpload, '$class'})):getItemIterator(FileUpload, HttpServletRequest),
            Items = 'ArrayList':new(),
            (fun Loop() -> case (get({Iterator, '$class'})):hasNext(Iterator) of true ->
                FileItemStream = (get({Iterator, '$class'})):next(Iterator),
                'HttpFileUploadUtil':log(FileItemStream),
                FileItem = 'AbFileItem':new((get({FileItemStream, '$class'})):getName(FileItemStream), (get({FileItemStream, '$class'})):getFieldName(FileItemStream), (fun(Target_N66321) -> (get({Target_N66321, '$class'})):getBytes(Target_N66321, FileItemStream) end)('FileItemUtil':getInstance())),
                (get({Items, '$class'})):add(Items, FileItem),
                Loop();
            false -> ok end end)(),
            Items
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPERROR'})) of
                true ->
                CommonStrings = 'CommonStrings':getInstance(),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "get()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

% throws Exception
getFileItemList(This, HttpServletRequest) ->
        try
            AbFileUpload = 'AbFileUpload':new('AbFileItemFactory':new()),
            (get({AbFileUpload, '$class'})):parseRequest(AbFileUpload, HttpServletRequest)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "get()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

