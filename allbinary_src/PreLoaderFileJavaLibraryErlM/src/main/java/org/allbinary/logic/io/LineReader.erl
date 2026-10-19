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
% package org.allbinary.logic.io
% import java.io.DataInputStream
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('LineReader').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, fileName}, undefined),
    put({This, string}, undefined),
    put({This, index}, 0),
    put({This, idFile}, undefined),
    put({This, idData}, undefined),
    ok.


new(FileName) when (is_list(FileName) orelse FileName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, FileName),
    This.

init(This, FileName) when (is_list(FileName) orelse FileName =:= undefined) ->
    init_fields(This),
        try
            Bytes = array:new(100000, {default, 0}),
            put({This, fileName}, FileName),
            put({This, idFile}, 'AbFileInputStream':new(FileName)),
            (get({get({This, idFile}), '$class'})):read(get({This, idFile}), Bytes),
            put({This, string}, allbinary_java:to_string(Bytes))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat(["File: ", FileName]), This, "LineReader", E),
            begin
                ok
            end
        end.

hasNext(This) ->
        try
        try
            NextIndex = (get({get({This, string}), '$class'})):indexOf(get({This, string}), get({'CommonSeps':getInstance(), 'NEW_LINE'}), get({This, index})),
            case (NextIndex =:= (-1)) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "hasNext", E),
            begin
                ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
next(This) ->
        try
            NextIndex = (get({get({This, string}), '$class'})):indexOf(get({This, string}), get({'CommonSeps':getInstance(), 'NEW_LINE'}), get({This, index})),
            case (NextIndex =:= (-1)) of
                true ->
                erlang:error({'Exception', "next() should have been called first"});
                false -> ok
            end,
            Temp = string:slice(get({This, string}), get({This, index}), (NextIndex) - (get({This, index}))),
            put({This, index}, (NextIndex + 1)),
            Temp
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "next", E),
            begin
                ok
            end,
            erlang:error(E)
        end.

