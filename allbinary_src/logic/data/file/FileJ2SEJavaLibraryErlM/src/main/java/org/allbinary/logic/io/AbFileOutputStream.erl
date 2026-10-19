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
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.AbFileNativeUtil

-module('AbFileOutputStream').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('FileOutputStream', Function, Arguments).

init_fields(This) ->
    ok.


% throws FileNotFoundException
createFromAbFile(File) ->
        'AbFileOutputStream':new((get({File, '$class'})):getPath(File), false).

% throws FileNotFoundException
createFromAbFileAppend(File, Append) when is_boolean(Append) ->
        'AbFileOutputStream':new((get({File, '$class'})):getPath(File), Append).

% throws FileNotFoundException
createFromFilePath(Name) when (is_list(Name) orelse Name =:= undefined) ->
        'AbFileOutputStream':new(Name, false).

% throws FileNotFoundException
createFromFilePathAppend(Name, Append) when (is_list(Name) orelse Name =:= undefined), is_boolean(Append) ->
        'AbFileOutputStream':new(Name, Append).

new(Name, Append) when (is_list(Name) orelse Name =:= undefined), is_boolean(Append) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, Append),
    This.

init(This, Name, Append) when (is_list(Name) orelse Name =:= undefined), is_boolean(Append) ->
        'FileOutputStream':init(This, Name, Append).

