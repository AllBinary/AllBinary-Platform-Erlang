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
% package org.allbinary.logic.io.file.directory
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.visitor.IncludeFileExtensionsBooleanFileVisitor
% import org.allbinary.util.BasicArrayList

-module('DirectoryOrIncludeFileExtensionBooleanFileVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('IncludeFileExtensionsBooleanFileVisitor', Function, Arguments).

init_fields(This) ->
    put({This, includesString}, undefined),
    ok.


new(FilterStringBasicArrayList) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, FilterStringBasicArrayList),
    This.

'$init'(This, FilterStringBasicArrayList) ->
        'IncludeFileExtensionsBooleanFileVisitor':'$init'(This, FilterStringBasicArrayList),
        init_fields(This),
        put({This, includesString}, undefined).

new(FilterStringBasicArrayList, IncludesString) when (is_list(IncludesString) orelse IncludesString =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, FilterStringBasicArrayList, IncludesString),
    This.

'$init'(This, FilterStringBasicArrayList, IncludesString) when (is_list(IncludesString) orelse IncludesString =:= undefined) ->
        'IncludeFileExtensionsBooleanFileVisitor':'$init'(This, FilterStringBasicArrayList),
        init_fields(This),
        put({This, includesString}, IncludesString).

visit(This, File) ->
        try
        case (get({File, '$class'})):isDirectory(File) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        case ((get({This, includesString}) =:= undefined) orelse ((fun(Target_N66028) -> (get({Target_N66028, '$class'})):indexOf(Target_N66028, get({This, includesString})) end)((get({File, '$class'})):getAbsolutePath(File)) >= 0)) of
            true ->
            throw({'$return', 'IncludeFileExtensionsBooleanFileVisitor':visit(This, File)});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

