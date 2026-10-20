% Generated Code Do Not Modify
% package org.apache.commons.fileupload
% import java.io.ByteArrayOutputStream
% import java.io.InputStream
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.AbFileNativeUtil
% import org.allbinary.logic.string.StringMaker

-module('FileItemUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'FileItemUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'DEFAULT_CHARSET'}, "ISO-8859-1"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'FileItemUtil', instance}).

% throws Exception
getString(This, ByteArray) when (is_tuple(ByteArray) orelse ByteArray =:= undefined) ->
        allbinary_java:to_string(ByteArray, get({This, 'DEFAULT_CHARSET'}));
% throws Exception
getString(This, FileItem) ->
        allbinary_java:to_string((get({This, '$class'})):getBytes(This, FileItem), get({This, 'DEFAULT_CHARSET'})).


% throws Exception
getBytes(This, FileItem) ->
        StreamUtil = 'StreamUtil':getInstance(),
        put({local, inputStream}, undefined),
        put({local, outputStream}, undefined),
        try
            put({local, inputStream}, (get({FileItem, '$class'})):openStream(FileItem)),
            put({local, outputStream}, 'ByteArrayOutputStream':new()),
            case (get({FileItem, '$class'})):isFormField(FileItem) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["FileItemStream FieldName: ", (get({FileItem, '$class'})):getFieldName(FileItem)]), This, "write()");
                false ->
                StringBuffer = 'StringMaker':new(),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Uploaded File FieldName: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({FileItem, '$class'})):getFieldName(FileItem)),
                (get({StringBuffer, '$class'})):append(StringBuffer, " name = "),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({FileItem, '$class'})):getName(FileItem)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "write()")
            end,
            put({local, outputStream}, (get({StreamUtil, '$class'})):get(StreamUtil, get({local, inputStream}), get({local, outputStream}), array:new(16384, {default, 0}))),
            (get({get({local, outputStream}), '$class'})):toByteArray(get({local, outputStream}))
        after
            (get({StreamUtil, '$class'})):close(StreamUtil, get({local, outputStream})),
            (get({StreamUtil, '$class'})):close(StreamUtil, get({local, inputStream}))
        end.

% throws Exception
write(This, FileItem, File) ->
        (get({FileItem, '$class'})):write(FileItem, 'AbFileNativeUtil':get(File)).

