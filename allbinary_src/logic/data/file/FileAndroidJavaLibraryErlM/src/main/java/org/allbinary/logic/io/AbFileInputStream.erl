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
% import java.io.FileInputStream
% import java.io.FileNotFoundException
% import java.io.IOException
% import java.io.InputStream
% import java.nio.channels.FileChannel

-module('AbFileInputStream').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('InputStream', Function, Arguments).

init_fields(This) ->
    put({This, fileInputStream}, undefined),
    ok.


new(FileInputStream) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, FileInputStream),
    This.

'$init'(This, FileInputStream) ->
    'InputStream':'$init'(This),
    init_fields(This),
        put({This, fileInputStream}, FileInputStream).

mark(This, Readlimit) when is_integer(Readlimit) ->
        (get({get({This, fileInputStream}), '$class'})):mark(get({This, fileInputStream}), Readlimit).

markSupported(This) ->
        (get({get({This, fileInputStream}), '$class'})):markSupported(get({This, fileInputStream})).

% throws IOException
reset(This) ->
        (get({get({This, fileInputStream}), '$class'})):reset(get({This, fileInputStream})).

% throws IOException
available(This) ->
        (get({get({This, fileInputStream}), '$class'})):available(get({This, fileInputStream})).

% throws IOException
close(This) ->
        (get({get({This, fileInputStream}), '$class'})):close(get({This, fileInputStream})).

getChannel(This) ->
        (get({get({This, fileInputStream}), '$class'})):getChannel(get({This, fileInputStream})).

% throws IOException
read(This) ->
        (get({get({This, fileInputStream}), '$class'})):read(get({This, fileInputStream})).

% throws IOException
read(This, B) when (is_tuple(B) orelse B =:= undefined) ->
        (get({get({This, fileInputStream}), '$class'})):read(get({This, fileInputStream}), B).

% throws IOException
read(This, Buffer, Offset, Count) when (is_tuple(Buffer) orelse Buffer =:= undefined), is_integer(Offset), is_integer(Count) ->
        (get({get({This, fileInputStream}), '$class'})):read(get({This, fileInputStream}), Buffer, Offset, Count).

% throws IOException
skip(This, N) when is_integer(N) ->
        (get({get({This, fileInputStream}), '$class'})):skip(get({This, fileInputStream}), N).

