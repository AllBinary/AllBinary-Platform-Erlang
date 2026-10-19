% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.allbinary.logic.io.file
% import java.io.ByteArrayOutputStream
% import java.io.IOException
% import java.io.InputStream
% import java.io.OutputStream
% import java.io.Reader
% import java.io.Writer
% import java.nio.CharBuffer
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('SimpleFileUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'SimpleFileUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'NULL_WRITER'}, 'SimpleFileUtil':nullWriter()),
    put({This, 'NULL_READER'}, 'SimpleFileUtil':nullReader()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, nullUtil}, 'NullUtil':getInstance()),
    put({This, streamUtil}, 'StreamUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'SimpleFileUtil', instance}).

nullOutputStream() ->
        'OutputStream':new() % Java anonymous class body: implement it as a module
%             ok % write
%             ok % write
%             ok % close
.

nullWriter() ->
        'Writer':new() % Java anonymous class body: implement it as a module
%             put({This, closed}, false)
%             ok % append
%             ok % append
%             ok % append
%             ok % write
%             ok % write
%             ok % write
%             ok % write
%             ok % flush
%             ok % close
.

nullReader() ->
        'Reader':new() % Java anonymous class body: implement it as a module
%             ok % read
%             ok % read
%             ok % read
%             ok % ready
%             ok % skip
%             ok % close
.

loadFileAsList(This, InputStream, Max, ByteArray1) when is_integer(Max), (is_tuple(ByteArray1) orelse ByteArray1 =:= undefined) ->
        (get({This, '$class'})):loadFileAsListReturnLine(This, InputStream, Max, ByteArray1, 0).

loadFileAsListReturnLine(This, InputStream, Max, ByteArray1, IncludeReturnLine) when is_integer(Max), (is_tuple(ByteArray1) orelse ByteArray1 =:= undefined), is_integer(IncludeReturnLine) ->
        try
        StringList = 'BasicArrayListD':new(),
        case (InputStream =:= undefined) of
            true ->
            throw({'$return', StringList});
            false -> ok
        end,
        put({local, byteArray}, get({get({This, nullUtil}), 'NULL_BYTE_ARRAY'})),
        try
            OutputStream2 = 'ByteArrayOutputStream':new(Max),
            put({local, byteArray}, (get({get({This, streamUtil}), '$class'})):getByteArray(get({This, streamUtil}), InputStream, OutputStream2, ByteArray1)),
            (get({get({This, streamUtil}), '$class'})):close(get({This, streamUtil}), InputStream)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, streamUtil}), '$class'})):close(get({This, streamUtil}), InputStream),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'ADD'}), E)
        end,
        case (get({local, byteArray}) =:= undefined) of
            true ->
            throw({'$return', StringList});
            false -> ok
        end,
        Size = array:size(get({local, byteArray})),
        put({local, index}, 0),
        put({local, startIndex}, 0),
        put({local, returnLine}, 0),
        (fun Loop() -> case (get({local, index}) < Size) of true ->
            put({local, startIndex}, get({local, index})),
            (fun Loop() -> case ((get({local, index}) < (Size - 1)) andalso (array:get(get({local, index}), get({local, byteArray})) =/= $\n)) of true ->
                put({local, index}, get({local, index}) + 1),
                Loop();
            false -> ok end end)(),
            case (IncludeReturnLine =:= 0) of
                true ->
                case ((get({local, index}) > 0) andalso (array:get((get({local, index}) - 1), get({local, byteArray})) =:= $\r)) of
                    true ->
                    put({local, returnLine}, 1);
                    false ->
                    put({local, returnLine}, 0)
                end;
                false -> ok
            end,
            S = allbinary_java:to_string(get({local, byteArray}), get({local, startIndex}), ((((get({local, index}) + IncludeReturnLine) - get({local, returnLine})) - get({local, startIndex})))),
            (get({StringList, '$class'})):add(StringList, S),
            put({local, index}, get({local, index}) + 1),
            Loop();
        false -> ok end end)(),
        StringList
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

createStringFromArrayOfStrings(This, StringArray) when (is_tuple(StringArray) orelse StringArray =:= undefined) ->
        StringMaker = 'StringMaker':new(),
        Size = array:size(StringArray),
        lists:foreach(fun(Index) ->
            (get({StringMaker, '$class'})):append(StringMaker, array:get(Index, StringArray))
        end, lists:seq(0, Size - 1)),
        (get({StringMaker, '$class'})):toString(StringMaker).

