% 
% AllBinary Open License Version 1 
% Copyright (c) 2002 AllBinary 
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
% package org.allbinary.logic.io.file.directory
% import java.io.File
% import java.io.FileFilter
% import org.allbinary.logic.util.visitor.VisitorInterface

-module('DirectoryFileVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements VisitorInterface
% implements FileFilter

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

accept(This, Arg0) ->
        (fun(Target_N65716) -> (get({Target_N65716, '$class'})):booleanValue(Target_N65716) end)(((get({This, '$class'})):visit(This, Arg0))).

visit(This, AnyType) ->
        try
        File = AnyType,
        put({local, index}, 1),
        put({local, aFile}, (get({File, '$class'})):getParentFile(File)),
        (fun Loop() -> case ((begin put({local, aFile}, (get({get({local, aFile}), '$class'})):getParentFile(get({local, aFile}))), get({local, aFile}) end) =/= undefined) of true ->
            put({local, index}, get({local, index}) + 1),
            Loop();
        false -> ok end end)(),
        case ((get({File, '$class'})):isDirectory(File) andalso (get({local, index}) < 5)) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

