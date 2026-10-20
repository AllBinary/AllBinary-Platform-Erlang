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
% package org.allbinary.logic.io.file
% import org.allbinary.logic.io.file.directory.DirectoryBooleanFileVisitor
% import org.allbinary.logic.io.file.directory.DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor
% import org.allbinary.logic.io.file.directory.DirectoryOrIncludeFileExtensionBooleanFileVisitor
% import org.allbinary.logic.io.file.directory.SubDirectory
% import org.allbinary.logic.io.file.filter.VisitorFileFilter
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('FileListFetcher').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'FileListFetcher':new()),
    ok.

init_fields(This) ->
    put({This, subDirectory}, 'SubDirectory':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'FileListFetcher', instance}).

getFiles(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
        try
            Files = (get({get({This, subDirectory}), '$class'})):search(get({This, subDirectory}), 'AbFile':createAbFile(Path)),
            Files
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            io:format("~p~n", [E]),
            io:format("~ts~n", [allbinary_java:to_string(lists:concat([lists:concat([lists:concat(["Error: ", E]), "\nMsg: "]), allbinary_java:to_string(E)]))])
        end,
        undefined.

getFiles(This, Path, IncludeExtensions) when (is_list(Path) orelse Path =:= undefined), (is_tuple(IncludeExtensions) orelse IncludeExtensions =:= undefined) ->
        try
            IncludeExtensionBasicArrayList = 'BasicArrayListD':new(),
            Size = array:size(IncludeExtensions),
            lists:foreach(fun(Index) ->
                (get({IncludeExtensionBasicArrayList, '$class'})):add(IncludeExtensionBasicArrayList, array:get(Index, IncludeExtensions))
            end, lists:seq(0, Size - 1)),
            VisitorFileFilter = 'VisitorFileFilter':new('DirectoryOrIncludeFileExtensionBooleanFileVisitor':new(IncludeExtensionBasicArrayList)),
            Files = (get({get({This, subDirectory}), '$class'})):search(get({This, subDirectory}), VisitorFileFilter, 'AbFile':createAbFile(Path)),
            Files
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            io:format("~p~n", [E]),
            io:format("~ts~n", [allbinary_java:to_string(lists:concat([lists:concat([lists:concat(["Error: ", E]), "\nMsg: "]), allbinary_java:to_string(E)]))])
        end,
        undefined;
getFiles(This, Path, IncludeExtension) when (is_list(Path) orelse Path =:= undefined), (is_list(IncludeExtension) orelse IncludeExtension =:= undefined) ->
        try
            IncludeExtensionBasicArrayList = 'BasicArrayListD':new(),
            (get({IncludeExtensionBasicArrayList, '$class'})):add(IncludeExtensionBasicArrayList, IncludeExtension),
            VisitorFileFilter = 'VisitorFileFilter':new('DirectoryOrIncludeFileExtensionBooleanFileVisitor':new(IncludeExtensionBasicArrayList)),
            Files = (get({get({This, subDirectory}), '$class'})):search(get({This, subDirectory}), VisitorFileFilter, 'AbFile':createAbFile(Path)),
            Files
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            io:format("~p~n", [E]),
            io:format("~ts~n", [allbinary_java:to_string(lists:concat([lists:concat([lists:concat(["Error: ", E]), "\nMsg: "]), allbinary_java:to_string(E)]))])
        end,
        undefined.


getFiles(This, Path, PathIncludes, IncludeExtension) when (is_list(Path) orelse Path =:= undefined), (is_list(PathIncludes) orelse PathIncludes =:= undefined), (is_list(IncludeExtension) orelse IncludeExtension =:= undefined) ->
        try
            IncludeExtensionBasicArrayList = 'BasicArrayListD':new(),
            (get({IncludeExtensionBasicArrayList, '$class'})):add(IncludeExtensionBasicArrayList, IncludeExtension),
            VisitorFileFilter = 'VisitorFileFilter':new('DirectoryOrIncludeFileExtensionBooleanFileVisitor':new(IncludeExtensionBasicArrayList, PathIncludes)),
            Files = (get({get({This, subDirectory}), '$class'})):search(get({This, subDirectory}), VisitorFileFilter, 'AbFile':createAbFile(Path)),
            Files
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            io:format("~p~n", [E]),
            io:format("~ts~n", [allbinary_java:to_string(lists:concat([lists:concat([lists:concat(["Error: ", E]), "\nMsg: "]), allbinary_java:to_string(E)]))])
        end,
        undefined.

getTrackedFiles(This, Path, IncludeExtensions) when (is_list(Path) orelse Path =:= undefined), (is_tuple(IncludeExtensions) orelse IncludeExtensions =:= undefined) ->
        try
            IncludeExtensionBasicArrayList = 'BasicArrayListD':new(),
            Size = array:size(IncludeExtensions),
            lists:foreach(fun(Index) ->
                (get({IncludeExtensionBasicArrayList, '$class'})):add(IncludeExtensionBasicArrayList, array:get(Index, IncludeExtensions))
            end, lists:seq(0, Size - 1)),
            VisitorFileFilter = 'VisitorFileFilter':new('DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor':new(IncludeExtensionBasicArrayList)),
            Files = (get({get({This, subDirectory}), '$class'})):search(get({This, subDirectory}), VisitorFileFilter, 'AbFile':createAbFile(Path)),
            Files
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            io:format("~p~n", [E]),
            io:format("~ts~n", [allbinary_java:to_string(lists:concat([lists:concat([lists:concat(["Error: ", E]), "\nMsg: "]), allbinary_java:to_string(E)]))])
        end,
        undefined;
getTrackedFiles(This, Path, IncludeExtension) when (is_list(Path) orelse Path =:= undefined), (is_list(IncludeExtension) orelse IncludeExtension =:= undefined) ->
        try
            IncludeExtensionBasicArrayList = 'BasicArrayListD':new(),
            (get({IncludeExtensionBasicArrayList, '$class'})):add(IncludeExtensionBasicArrayList, IncludeExtension),
            VisitorFileFilter = 'VisitorFileFilter':new('DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor':new(IncludeExtensionBasicArrayList)),
            Files = (get({get({This, subDirectory}), '$class'})):search(get({This, subDirectory}), VisitorFileFilter, 'AbFile':createAbFile(Path)),
            Files
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            io:format("~p~n", [E]),
            io:format("~ts~n", [allbinary_java:to_string(lists:concat([lists:concat([lists:concat(["Error: ", E]), "\nMsg: "]), allbinary_java:to_string(E)]))])
        end,
        undefined.


getDirectories(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
        try
            VisitorFileFilter = 'VisitorFileFilter':new('DirectoryBooleanFileVisitor':new()),
            Files = (get({get({This, subDirectory}), '$class'})):search(get({This, subDirectory}), VisitorFileFilter, 'AbFile':createAbFile(Path)),
            Files
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            io:format("~p~n", [E]),
            io:format("~ts~n", [allbinary_java:to_string(lists:concat([lists:concat([lists:concat(["Error: ", E]), "\nMsg: "]), allbinary_java:to_string(E)]))])
        end,
        undefined.

