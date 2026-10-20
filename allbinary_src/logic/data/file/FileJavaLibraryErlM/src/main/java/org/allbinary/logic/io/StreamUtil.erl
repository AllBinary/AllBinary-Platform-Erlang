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
% import java.io.ByteArrayOutputStream
% import java.io.Closeable
% import java.io.InputStream
% import java.io.OutputStream
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('StreamUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'StreamUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'StreamUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
get(This, InputStream, OutputStream, Buffer) when (is_tuple(Buffer) orelse Buffer =:= undefined) ->
        put({local, len}, 0),
        (fun Loop() -> case true of true ->
            put({local, len}, (get({InputStream, '$class'})):read(InputStream, Buffer, 0, array:size(Buffer))),
            case (get({local, len}) =/= (-1)) of
                true ->
                ok;
                false ->
                throw('$break')
            end,
            (get({OutputStream, '$class'})):write(OutputStream, Buffer, 0, get({local, len})),
            Loop();
        false -> ok end end)(),
        OutputStream.

% throws Exception
getByteArray(This, InputStream, OutputStream2, ByteArray) when (is_tuple(ByteArray) orelse ByteArray =:= undefined) ->
        OutputStream = OutputStream2,
        try
            (get({This, '$class'})):get(This, InputStream, OutputStream, ByteArray),
            (get({OutputStream, '$class'})):toByteArray(OutputStream)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        after
            (get({This, '$class'})):close(This, OutputStream)
        end.

close(This, Closeable) ->
        try
            case (Closeable =/= undefined) of
                true ->
                (get({Closeable, '$class'})):close(Closeable);
                false -> ok
            end,
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'CLOSE'}), E),
            false
        end.

