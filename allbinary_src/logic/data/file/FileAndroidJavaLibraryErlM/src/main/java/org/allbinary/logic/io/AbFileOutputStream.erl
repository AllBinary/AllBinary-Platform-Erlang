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
% import java.io.FileNotFoundException
% import java.io.FileOutputStream
% import java.io.IOException
% import java.io.OutputStream
% import java.nio.channels.FileChannel
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.AbFileNativeUtil

-module('AbFileOutputStream').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('OutputStream', Function, Arguments).

init_fields(This) ->
    put({This, fileOutputStream}, undefined),
    ok.


% throws FileNotFoundException
createFromAbFile(File) ->
        'AbFileOutputStream':new('FileOutputStream':new('AbFileNativeUtil':get(File))).

% throws FileNotFoundException
createFromAbFileAppend(File, Append) when is_boolean(Append) ->
        'AbFileOutputStream':new('FileOutputStream':new((get({File, '$class'})):getPath(File))).

% throws FileNotFoundException
createFromFilePath(Name) when (is_list(Name) orelse Name =:= undefined) ->
        'AbFileOutputStream':new('FileOutputStream':new(Name)).

% throws FileNotFoundException
createFromFilePathAppend(Name, Append) when (is_list(Name) orelse Name =:= undefined), is_boolean(Append) ->
        'AbFileOutputStream':new('FileOutputStream':new(Name)).

new(FileOutputStream) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, FileOutputStream),
    This.

init(This, FileOutputStream) ->
    'OutputStream':init(This),
    init_fields(This),
        put({This, fileOutputStream}, FileOutputStream).

% throws IOException
close(This) ->
        (get({get({This, fileOutputStream}), '$class'})):close(get({This, fileOutputStream})).

getChannel(This) ->
        (get({get({This, fileOutputStream}), '$class'})):getChannel(get({This, fileOutputStream})).

% throws IOException
write(This, Buffer) when (is_tuple(Buffer) orelse Buffer =:= undefined) ->
        (get({get({This, fileOutputStream}), '$class'})):write(get({This, fileOutputStream}), Buffer);
% throws IOException
write(This, B) when is_integer(B) ->
        (get({get({This, fileOutputStream}), '$class'})):write(get({This, fileOutputStream}), B).

% throws IOException
write(This, Buffer, Offset, Count) when (is_tuple(Buffer) orelse Buffer =:= undefined), is_integer(Offset), is_integer(Count) ->
        (get({get({This, fileOutputStream}), '$class'})):write(get({This, fileOutputStream}), Buffer, Offset, Count).


