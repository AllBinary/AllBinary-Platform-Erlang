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
% package org.allbinary.logic.communication.http.file.upload.media
% import java.util.HashMap
% import java.util.Set
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.visual.media.MediaData
% import org.allbinary.logic.visual.media.MediaIOUtil
% import org.allbinary.logic.visual.media.MediaTypeData
% import org.allbinary.string.CommonStrings

-module('UploadMediaSingleton').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, uploadMedia}, undefined),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, readerFileTypesHashMap}, undefined),
    put({This, writerFileTypesHashMap}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        put({This, readerFileTypesHashMap}, (fun(Target_N66083) -> (get({Target_N66083, '$class'})):createHashMap(Target_N66083) end)('StdUtil':getInstance())),
        put({This, writerFileTypesHashMap}, (fun(Target_N66127) -> (get({Target_N66127, '$class'})):createHashMap(Target_N66127) end)('StdUtil':getInstance())),
        HashMap = 'MediaData':toHashMap(),
        Set = (get({HashMap, '$class'})):keySet(HashMap),
        MediaDataNameArray = (get({Set, '$class'})):toArray(Set),
        Size = array:size(MediaDataNameArray),
        lists:foreach(fun(Index) ->
            MediaDataName = array:get(Index, MediaDataNameArray),
            MediaData = (get({HashMap, '$class'})):get(HashMap, MediaDataName),
            (get({get({This, readerFileTypesHashMap}), '$class'})):put(get({This, readerFileTypesHashMap}), (get({MediaData, '$class'})):getName(MediaData), (get({MediaData, '$class'})):getType(MediaData))
        end, lists:seq(0, Size - 1)),
        MediaIOUtil = 'MediaIOUtil':getInstance(),
        RESIZABLE_MEDIA = get({'MediaTypeData':getInstance(), 'RESIZABLE_MEDIA'}),
        ReaderFileTypes = (get({MediaIOUtil, '$class'})):getReaderFormatNames(MediaIOUtil),
        lists:foreach(fun(Index) ->
            (get({get({This, readerFileTypesHashMap}), '$class'})):put(get({This, readerFileTypesHashMap}), array:get(Index, ReaderFileTypes), RESIZABLE_MEDIA)
        end, lists:seq(0, array:size(ReaderFileTypes) - 1)),
        WriterFileTypes = (get({MediaIOUtil, '$class'})):getWriterFormatNames(MediaIOUtil),
        lists:foreach(fun(Index) ->
            (get({get({This, writerFileTypesHashMap}), '$class'})):put(get({This, writerFileTypesHashMap}), array:get(Index, WriterFileTypes), RESIZABLE_MEDIA)
        end, lists:seq(0, array:size(WriterFileTypes) - 1)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'HTTPREQUEST'})) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Supported Media Readers: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, readerFileTypesHashMap}), '$class'})):toString(get({This, readerFileTypesHashMap}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, " Writers: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, writerFileTypesHashMap}), '$class'})):toString(get({This, writerFileTypesHashMap}))),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end.

getInstance() ->
        case (get({'UploadMediaSingleton', uploadMedia}) =:= undefined) of
            true ->
            put({'UploadMediaSingleton', uploadMedia}, 'UploadMediaSingleton':new());
            false -> ok
        end,
        get({'UploadMediaSingleton', uploadMedia}).

isReaderSupported(This, MediaFileType) when (is_list(MediaFileType) orelse MediaFileType =:= undefined) ->
        (get({get({This, readerFileTypesHashMap}), '$class'})):containsKey(get({This, readerFileTypesHashMap}), MediaFileType).

isWriterSupported(This, MediaFileType) when (is_list(MediaFileType) orelse MediaFileType =:= undefined) ->
        (get({get({This, readerFileTypesHashMap}), '$class'})):containsKey(get({This, readerFileTypesHashMap}), MediaFileType).

isSupported(This, MediaFileType) when (is_list(MediaFileType) orelse MediaFileType =:= undefined) ->
        ((get({This, '$class'})):isReaderSupported(This, MediaFileType) andalso (get({This, '$class'})):isWriterSupported(This, MediaFileType)).

isMedia(This, MediaFileType, AMediaType) when (is_list(MediaFileType) orelse MediaFileType =:= undefined), (is_list(AMediaType) orelse AMediaType =:= undefined) ->
        ((get({This, '$class'})):isReaderMedia(This, MediaFileType, AMediaType) andalso (get({This, '$class'})):isWriterMedia(This, MediaFileType, AMediaType)).

isReaderMedia(This, MediaFileType, AMediaType) when (is_list(MediaFileType) orelse MediaFileType =:= undefined), (is_list(AMediaType) orelse AMediaType =:= undefined) ->
        (get({This, '$class'})):isMedia(This, MediaFileType, AMediaType, get({This, readerFileTypesHashMap})).

isWriterMedia(This, MediaFileType, AMediaType) when (is_list(MediaFileType) orelse MediaFileType =:= undefined), (is_list(AMediaType) orelse AMediaType =:= undefined) ->
        (get({This, '$class'})):isMedia(This, MediaFileType, AMediaType, get({This, writerFileTypesHashMap})).

isMedia(This, MediaFileType, AMediaType, HashMap) when (is_list(MediaFileType) orelse MediaFileType =:= undefined), (is_list(AMediaType) orelse AMediaType =:= undefined) ->
        try
        case (get({HashMap, '$class'})):containsKey(HashMap, MediaFileType) of
            true ->
            MediaType = (get({HashMap, '$class'})):get(HashMap, MediaFileType),
            case ((get({MediaType, '$class'})):compareTo(MediaType, AMediaType) =:= 0) of
                true ->
                throw({'$return', true});
                false ->
                throw({'$return', false})
            end;
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

