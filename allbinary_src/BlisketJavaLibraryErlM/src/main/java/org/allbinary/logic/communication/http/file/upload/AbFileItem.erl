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
% import java.io.File
% import java.io.IOException
% import java.io.InputStream
% import java.io.OutputStream
% import java.io.UnsupportedEncodingException
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.string.CommonStrings
% import org.apache.commons.fileupload.FileItem
% import org.apache.commons.fileupload.FileItemHeaders
% import org.apache.commons.fileupload.FileItemUtil

-module('AbFileItem').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements FileItem

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, name}, undefined),
    put({This, fieldName}, undefined),
    put({This, byteArray}, undefined),
    ok.


new(Name, FieldName, ByteArray) when (is_list(Name) orelse Name =:= undefined), (is_list(FieldName) orelse FieldName =:= undefined), (is_tuple(ByteArray) orelse ByteArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, FieldName, ByteArray),
    This.

init(This, Name, FieldName, ByteArray) when (is_list(Name) orelse Name =:= undefined), (is_list(FieldName) orelse FieldName =:= undefined), (is_tuple(ByteArray) orelse ByteArray =:= undefined) ->
    init_fields(This),
        put({This, name}, Name),
        put({This, fieldName}, FieldName),
        put({This, byteArray}, ByteArray).

% throws IOException
getInputStream(This) ->
        erlang:error({'IOException', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

getContentType(This) ->
        undefined.

getName(This) ->
        get({This, name}).

isInMemory(This) ->
        true.

getSize(This) ->
        array:size(get({This, byteArray})).

get(This) ->
        get({This, byteArray}).

% throws UnsupportedEncodingException
getString(This, Encoding) when (is_list(Encoding) orelse Encoding =:= undefined) ->
        allbinary_java:to_string(get({This, byteArray}), Encoding).

getString(This) ->
        try
            (fun(Target_N66761) -> (get({Target_N66761, '$class'})):getString(Target_N66761, get({This, byteArray})) end)('FileItemUtil':getInstance())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getString", E);
                false -> ok
            end,
            get({'StringUtil':getInstance(), 'EMPTY_STRING'})
        end.

% throws Exception
write(This, File) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})});
% throws Exception
write(This, File) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).


delete(This) ->
        'ForcedLogUtil':log(get({get({This, commonStrings}), 'NOT_IMPLEMENTED'}), "delete()").

getFieldName(This) ->
        get({This, fieldName}).

setFieldName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({This, fieldName}, Name).

isFormField(This) ->
        try
        case (fun(Target_N67506) -> (get({Target_N67506, '$class'})):isEmpty(Target_N67506, get({This, fieldName})) end)('StringValidationUtil':getInstance()) of
            true ->
            throw({'$return', false});
            false ->
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setFormField(This, State) when is_boolean(State) ->
        ok.

% throws IOException
getOutputStream(This) ->
        erlang:error({'IOException', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

getHeaders(This) ->
        erlang:error({'RuntimeException', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

setHeaders(This, Fih) ->
        erlang:error({'RuntimeException', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

