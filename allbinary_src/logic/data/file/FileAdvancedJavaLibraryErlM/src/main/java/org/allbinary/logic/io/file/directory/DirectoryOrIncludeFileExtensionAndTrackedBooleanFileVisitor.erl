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
% import org.allbinary.java.runtime.process.git.GitProcessHelper
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.CommonDataFileStrings
% import org.allbinary.logic.io.file.visitor.IncludeFileExtensionsBooleanFileVisitor
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('IncludeFileExtensionsBooleanFileVisitor', Function, Arguments).

init_fields(This) ->
    put({This, trackedStrings}, 'TrackedStrings':getInstance()),
    put({This, gitProcessHelper}, 'GitProcessHelper':getInstance()),
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
        case ((get({This, includesString}) =:= undefined) orelse ((fun(Target_N66228) -> (get({Target_N66228, '$class'})):indexOf(Target_N66228, get({This, includesString})) end)((get({File, '$class'})):getAbsolutePath(File)) >= 0)) of
            true ->
            throw({'$return', 'IncludeFileExtensionsBooleanFileVisitor':visit(This, File)});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

visit(This, File, FileNameString) when (is_list(FileNameString) orelse FileNameString =:= undefined) ->
        try
        FilePath = (get({File, '$class'})):getPath(File),
        case 'IncludeFileExtensionsBooleanFileVisitor':visit(This, File, FileNameString) of
            true ->
            case (not ((((string:find(FilePath, get({get({This, trackedStrings}), 'APPLICATION'})) =/= nomatch) orelse (string:find(FilePath, get({get({This, trackedStrings}), 'APP'})) =/= nomatch)) orelse (string:find(FilePath, get({get({This, trackedStrings}), 'HTML_TEMP'})) =/= nomatch)))) of
                true ->
                case (not (((string:find(FilePath, get({get({This, trackedStrings}), 'TARGET_PATH_WINDOWS'})) =/= nomatch) orelse (string:find(FilePath, get({get({This, trackedStrings}), 'TARGET_PATH_UNIX'})) =/= nomatch)))) of
                    true ->
                    case (get({get({This, gitProcessHelper}), '$class'})):isTracked(get({This, gitProcessHelper}), File) of
                        true ->
                        throw({'$return', true});
                        false ->
                        ok
                    end;
                    false ->
                    ok
                end;
                false ->
                ok
            end;
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

main(Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        CommonFileStrings = 'CommonDataFileStrings':getInstance(),
        List = 'BasicArrayListD':new(),
        (get({List, '$class'})):add(List, get({CommonFileStrings, 'JAVA'})),
        FilePath = "G:\\mnt\\bc\\mydev\\games\\ZeptoRacer\\platform\\j2se\\ZeptoRacerStaticPathsJ2SEM\\target\\dependency\\org\\allbinary\\logic\\system\\security\\licensing\\ZeptoRacerPCClientInformation.java",
        Result = (fun(Target_N67106) -> (get({Target_N67106, '$class'})):visit(Target_N67106, 'AbFile':createAbFileFromRawPath(FilePath)) end)('DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor':new(List)),
        io:format("~ts~n", [allbinary_java:to_string(lists:concat([lists:concat([FilePath, " is Tracked: "]), Result]))]).

