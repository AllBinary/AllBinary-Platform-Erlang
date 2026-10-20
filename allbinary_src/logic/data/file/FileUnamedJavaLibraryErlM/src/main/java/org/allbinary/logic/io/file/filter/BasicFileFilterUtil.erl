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
% import java.io.FileFilter
% import org.allbinary.logic.io.file.visitor.IncludeFileExtensionsBooleanFileVisitor
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('BasicFileFilterUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getInstance(Extension) when (is_list(Extension) orelse Extension =:= undefined) ->
        Vector = 'BasicArrayListD':new(),
        (get({Vector, '$class'})):add(Vector, Extension),
        IncludeFileExtensionsBooleanFileVisitor = 'IncludeFileExtensionsBooleanFileVisitor':new(Vector),
        'VisitorFileFilter':new(IncludeFileExtensionsBooleanFileVisitor).

