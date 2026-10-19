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
% package org.allbinary.logic.io.file.visitor
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.util.BasicArrayList

-module('ExcludeFileExtensionsBooleanFileVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BooleanFileVisitor', Function, Arguments).

init_fields(This) ->
    ok.


new(FilterStringBasicArrayList) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, FilterStringBasicArrayList),
    This.

init(This, FilterStringBasicArrayList) ->
        'BooleanFileVisitor':init(This, FilterStringBasicArrayList).

visit(This, File) ->
        try
        case ((fun(Target_N65737) -> (get({Target_N65737, '$class'})):size(Target_N65737) end)((get({This, '$class'})):getFilterStringBasicArrayList(This)) =:= 0) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        'BooleanFileVisitor':visit(This, File)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

visit(This, File, FileNameString) when (is_list(FileNameString) orelse FileNameString =:= undefined) ->
        try
        FileNameAndExtension = (get({File, '$class'})):getPath(File),
        case (string:length(FileNameAndExtension) > string:length(FileNameString)) of
            true ->
            StartIndex = (string:length(FileNameAndExtension) - string:length(FileNameString)),
            FileName = string:slice(FileNameAndExtension, StartIndex),
            case ((get({FileName, '$class'})):compareTo(FileName, FileNameString) =:= 0) of
                true ->
                throw({'$return', false});
                false -> ok
            end;
            false -> ok
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

