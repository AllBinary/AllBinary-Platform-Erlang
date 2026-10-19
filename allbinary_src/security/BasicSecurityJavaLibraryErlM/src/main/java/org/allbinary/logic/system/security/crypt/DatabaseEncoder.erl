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
% package org.allbinary.logic.system.security.crypt
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.tokens.Tokenizer
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('DatabaseEncoder').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

encode(Value) when (is_tuple(Value) orelse Value =:= undefined) ->
        try
            Array = Value,
            StringBuffer = 'StringMaker':new(),
            lists:foreach(fun(Index) ->
                (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N65996) -> (get({Target_N65996, '$class'})):toString(Target_N65996) end)(array:get(Index, Array))),
                case (Index < (array:size(Array) - 1)) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'}));
                    false -> ok
                end
            end, lists:seq(0, array:size(Array) - 1)),
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            'PreLogUtil':putOE(get({CommonStrings, 'EXCEPTION'}), "DatabaseEncoder", "decode", E),
            get({'StringUtil':getInstance(), 'EMPTY_STRING'})
        end.

decode(Value) when (is_list(Value) orelse Value =:= undefined) ->
        try
            Tokenizer = 'Tokenizer':new(get({'CommonSeps':getInstance(), 'SPACE'})),
            Vector = (get({Tokenizer, '$class'})):getTokensFromString(Tokenizer, Value, 'BasicArrayListD':new()),
            ByteVector = 'BasicArrayListD':new(),
            Size = (get({Vector, '$class'})):size(Vector),
            put({local, byteOfData}, undefined),
            lists:foreach(fun(Index) ->
                put({local, byteOfData}, array:get(Index, get({Vector, objectArray}))),
                (get({ByteVector, '$class'})):add(ByteVector, get({local, byteOfData}))
            end, lists:seq(0, Size - 1)),
            Decode = array:new((get({ByteVector, '$class'})):size(ByteVector), {default, 0}),
            put({local, decodeIndex}, 0),
            put({local, aByte}, undefined),
            lists:foreach(fun(Index) ->
                put({local, aByte}, array:get(Index, get({ByteVector, objectArray}))),
                array:set(get({local, decodeIndex}), (get({get({local, aByte}), '$class'})):byteValue(get({local, aByte})), Decode),
                put({local, decodeIndex}, get({local, decodeIndex}) + 1)
            end, lists:seq(0, Size - 1)),
            Decode
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            'PreLogUtil':putSE(get({CommonStrings, 'EXCEPTION'}), "DatabaseEncoder", "decode", E),
            get({'NullUtil':getInstance(), 'NULL_BYTE_ARRAY'})
        end.

