% 
% AllBinary Open License Version 1 
% Copyright (c) 2026 AllBinary 
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
% package org.allbinary.java.runtime.process.git
% import java.io.File
% import java.io.IOException
% import java.nio.charset.StandardCharsets
% import java.util.ArrayList
% import java.util.List
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.AbFileNativeUtil
% import org.allbinary.logic.io.file.directory.TrackedStrings
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonStrings

-module('GitProcessHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GitProcessHelper':new()),
    ok.

init_fields(This) ->
    put({This, trackedStrings}, 'TrackedStrings':getInstance()),
    ok.


getInstance() ->
        get({'GitProcessHelper', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        LogUtil = 'LogUtil':getInstance(),
        CommonStrings = 'CommonStrings':getInstance(),
        THIS_IS_SLOW = "This is slow consider path exclusion instead",
        (get({LogUtil, '$class'})):putF(LogUtil, THIS_IS_SLOW, This, get({CommonStrings, 'CONSTRUCTOR'})).

% throws IOException, InterruptedException
trackedFiles(This, RootAsString, Pathspec) when (is_list(RootAsString) orelse RootAsString =:= undefined), (is_list(Pathspec) orelse Pathspec =:= undefined) ->
        (get({This, '$class'})):trackedFiles(This, RootAsString, Pathspec, ".java").

% throws IOException, InterruptedException
trackedFiles(This, RootAsString, Pathspec, Suffix) when (is_list(RootAsString) orelse RootAsString =:= undefined), (is_list(Pathspec) orelse Pathspec =:= undefined), (is_list(Suffix) orelse Suffix =:= undefined) ->
        Process = (fun(Target_N66445) -> (get({Target_N66445, '$class'})):start(Target_N66445) end)((fun(Target_N66452) -> (get({Target_N66452, '$class'})):redirectError(Target_N66452, get({get({'ProcessBuilder', 'Redirect'}), 'INHERIT'})) end)('ProcessBuilder':new(get({get({This, trackedStrings}), 'GIT_COMMAND'}), get({get({This, trackedStrings}), 'CHANGE_DIRECTORY_OPTION'}), RootAsString, get({get({This, trackedStrings}), 'LIST_FILES_COMMAND'}), get({get({This, trackedStrings}), 'SEP_BY_NULL_CHAR_INSTEAD_OF_NEW_LINE'}), get({get({This, trackedStrings}), 'PATHSPEC_SEPARATOR'}), Pathspec))),
        Output = (fun(Target_N66648) -> (get({Target_N66648, '$class'})):readAllBytes(Target_N66648) end)((get({Process, '$class'})):getInputStream(Process)),
        ExitCode = (get({Process, '$class'})):waitFor(Process),
        case (ExitCode =/= 0) of
            true ->
            erlang:error({'IllegalStateException', (fun(Target_N66776) -> (get({Target_N66776, '$class'})):toString(Target_N66776) end)((fun(Target_N66783) -> (get({Target_N66783, '$class'})):appendint(Target_N66783, ExitCode) end)((fun(Target_N66790) -> (get({Target_N66790, '$class'})):append(Target_N66790, " with exit code ") end)((fun(Target_N66797) -> (get({Target_N66797, '$class'})):append(Target_N66797, RootAsString) end)((fun(Target_N66804) -> (get({Target_N66804, '$class'})):append(Target_N66804, "git ls-files failed for ") end)('StringMaker':new())))))});
            false -> ok
        end,
        Files = 'ArrayList':new(),
        put({local, start}, 0),
        put({local, relativePath}, undefined),
        lists:foreach(fun(Index) ->
            case (array:get(Index, Output) =:= 0) of
                true ->
                put({local, relativePath}, allbinary_java:to_string(Output, get({local, start}), (Index - get({local, start})), get({'StandardCharsets', 'UTF_8'}))),
                case lists:suffix(Suffix, get({local, relativePath})) of
                    true ->
                    (get({Files, '$class'})):add(Files, get({local, relativePath}));
                    false -> ok
                end,
                put({local, start}, (Index + 1));
                false -> ok
            end
        end, lists:seq(0, array:size(Output) - 1)),
        Files.

isTracked(This, File) ->
        try
            NativeFile = 'AbFileNativeUtil':get(File),
            ParentFile = (get({NativeFile, '$class'})):getParentFile(NativeFile),
            Process = (fun(Target_N67577) -> (get({Target_N67577, '$class'})):start(Target_N67577) end)((fun(Target_N67584) -> (get({Target_N67584, '$class'})):redirectErrorStream(Target_N67584, true) end)('ProcessBuilder':new(get({get({This, trackedStrings}), 'GIT_COMMAND'}), get({get({This, trackedStrings}), 'CHANGE_DIRECTORY_OPTION'}), (get({ParentFile, '$class'})):getPath(ParentFile), get({get({This, trackedStrings}), 'LIST_FILES_COMMAND'}), get({get({This, trackedStrings}), 'ERROR_UNMATCH_OPTION'}), get({get({This, trackedStrings}), 'PATHSPEC_SEPARATOR'}), (get({NativeFile, '$class'})):getName(NativeFile)))),
            (fun(Target_N67761) -> (get({Target_N67761, '$class'})):readAllBytes(Target_N67761) end)((get({Process, '$class'})):getInputStream(Process)),
            ((get({Process, '$class'})):waitFor(Process) =:= 0)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            false
        end.

