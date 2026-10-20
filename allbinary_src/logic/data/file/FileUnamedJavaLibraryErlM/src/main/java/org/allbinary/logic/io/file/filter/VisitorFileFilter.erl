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
% package org.allbinary.logic.io.file.filter
% import java.io.File
% import java.io.FileFilter
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.FileWrapperUtil
% import org.allbinary.logic.util.visitor.VisitorInterface

-module('VisitorFileFilter').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements FileFilter

init_fields(This) ->
    put({This, booleanVisitorInterface}, undefined),
    ok.


new(BooleanVisitorInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, BooleanVisitorInterface),
    This.

'$init'(This, BooleanVisitorInterface) ->
    init_fields(This),
        put({This, booleanVisitorInterface}, BooleanVisitorInterface).

accept(This, File) ->
        AbFile = 'FileWrapperUtil':wrapFile(File),
        IsFileAcceptable = (fun(Target_N65926) -> (get({Target_N65926, '$class'})):booleanValue(Target_N65926) end)(((get({get({This, booleanVisitorInterface}), '$class'})):visit(get({This, booleanVisitorInterface}), AbFile))),
        (IsFileAcceptable orelse (get({File, '$class'})):isDirectory(File));
accept(This, File) ->
        IsFileAcceptable = (fun(Target_N66086) -> (get({Target_N66086, '$class'})):booleanValue(Target_N66086) end)(((get({get({This, booleanVisitorInterface}), '$class'})):visit(get({This, booleanVisitorInterface}), File))),
        (IsFileAcceptable orelse (get({File, '$class'})):isDirectory(File)).


