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
% import java.io.File
% import java.io.FileInputStream
% import java.io.FileNotFoundException
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.AbFileNativeUtil

-module('AbFileInputStream').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('FileInputStream', Function, Arguments).

init_fields(This) ->
    ok.


new(Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name),
    This;
new(File) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, File),
    This;
new(File) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, File),
    This.

'$init'(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        'FileInputStream':'$init'(This, Name);
'$init'(This, File) ->
        'FileInputStream':'$init'(This, 'AbFileNativeUtil':get(File));
'$init'(This, File) ->
        'FileInputStream':'$init'(This, File).



