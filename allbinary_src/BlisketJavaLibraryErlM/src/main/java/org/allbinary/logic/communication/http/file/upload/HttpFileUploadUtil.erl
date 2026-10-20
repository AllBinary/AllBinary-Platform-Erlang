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
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.java.anyType.clazz.ClassUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps
% import org.apache.commons.fileupload.FileItem
% import org.apache.commons.fileupload.FileItemStream

-module('HttpFileUploadUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'HttpFileUploadUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'HttpFileUploadUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
isValid(This, AnyType) ->
        try
        case ((AnyType =/= undefined) andalso (not (allbinary_java:instance_of(AnyType, 'String')))) of
            true ->
            case allbinary_java:instance_of(AnyType, 'FileItem') of
                true ->
                throw({'$return', true});
                false ->
                erlang:error({'Exception', lists:concat(["Object Not Instance Of FileItem but is: ", 'ClassUtil':viewAll(AnyType, get({'CommonSeps':getInstance(), 'NEW_LINE'}))])})
            end;
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
log(FileItem) ->
        LogUtil = 'LogUtil':getInstance(),
        StringBuffer = 'StringMaker':new(),
        CommonSeps = 'CommonSeps':getInstance(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "FileItem Log:"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Content Type:"),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({FileItem, '$class'})):getContentType(FileItem)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Field Name:"),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({FileItem, '$class'})):getFieldName(FileItem)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Name:"),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({FileItem, '$class'})):getName(FileItem)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Size:"),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Not Calculated Yet"),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTP'})) of
            true ->
            (get({LogUtil, '$class'})):putF(LogUtil, (get({StringBuffer, '$class'})):toString(StringBuffer), getInstance(), "log()");
            false -> ok
        end;
log(FileItem) ->
        LogUtil = 'LogUtil':getInstance(),
        StringBuffer = 'StringMaker':new(),
        CommonSeps = 'CommonSeps':getInstance(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "FileItem Log:"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Content Type:"),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({FileItem, '$class'})):getContentType(FileItem)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Field Name:"),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({FileItem, '$class'})):getFieldName(FileItem)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Name:"),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({FileItem, '$class'})):getName(FileItem)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Size:"),
        (get({StringBuffer, '$class'})):appendlong(StringBuffer, trunc((get({FileItem, '$class'})):getSize(FileItem))),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
            true ->
            (get({LogUtil, '$class'})):putF(LogUtil, (get({StringBuffer, '$class'})):toString(StringBuffer), getInstance(), "log()");
            false -> ok
        end.


