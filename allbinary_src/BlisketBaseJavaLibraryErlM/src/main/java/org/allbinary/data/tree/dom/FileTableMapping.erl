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
% package org.allbinary.data.tree.dom
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tables.TableMappingInterface
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.FileData
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.io.path.PathUtil

-module('FileTableMapping').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TableMappingInterface

init_fields(This) ->
    put({This, file}, undefined),
    ok.


new(File) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, File),
    This.

init(This, File) ->
    init_fields(This),
        put({This, file}, File).

% throws Exception
getKey(This) ->
        (get({get({This, file}), '$class'})):getPath(get({This, file})).

% throws Exception
toVector(This) ->
        FilePropertyVector = 'BasicArrayListD':new(),
        (get({FilePropertyVector, '$class'})):add(FilePropertyVector, (get({get({This, file}), '$class'})):getAbsolutePath(get({This, file}))),
        (get({FilePropertyVector, '$class'})):add(FilePropertyVector, (get({get({This, file}), '$class'})):getCanonicalPath(get({This, file}))),
        (get({FilePropertyVector, '$class'})):add(FilePropertyVector, (get({get({This, file}), '$class'})):getName(get({This, file}))),
        (get({FilePropertyVector, '$class'})):add(FilePropertyVector, (get({get({This, file}), '$class'})):getParent(get({This, file}))),
        (get({FilePropertyVector, '$class'})):add(FilePropertyVector, (get({get({This, file}), '$class'})):getPath(get({This, file}))),
        FilePropertyVector.

% throws Exception
toHashMap(This) ->
        FilePropertyHashMap = (fun(Target_N66379) -> (get({Target_N66379, '$class'})):createHashMap(Target_N66379) end)('StdUtil':getInstance()),
        PathData = 'AbPathData':getInstance(),
        PathUtil = 'PathUtil':getInstance(),
        RootFileName = (get({PathData, '$class'})):getNameFromPath(PathData, (get({PathUtil, '$class'})):getWithoutExtension(PathUtil, (get({get({This, file}), '$class'})):getPath(get({This, file})))),
        FileData = 'FileData':getInstance(),
        (get({FilePropertyHashMap, '$class'})):put(FilePropertyHashMap, get({FileData, 'ROOT_NAME'}), RootFileName),
        (get({FilePropertyHashMap, '$class'})):put(FilePropertyHashMap, get({FileData, 'ISFILE'}), (fun(Target_N66743) -> (get({Target_N66743, '$class'})):toString(Target_N66743) end)(allbinary_java:to_string((get({get({This, file}), '$class'})):isFile(get({This, file}))))),
        (get({FilePropertyHashMap, '$class'})):put(FilePropertyHashMap, get({FileData, 'ISDIRECTORY'}), (fun(Target_N66828) -> (get({Target_N66828, '$class'})):toString(Target_N66828) end)(allbinary_java:to_string((get({get({This, file}), '$class'})):isDirectory(get({This, file}))))),
        (get({FilePropertyHashMap, '$class'})):put(FilePropertyHashMap, get({FileData, 'ISHIDDEN'}), (fun(Target_N66913) -> (get({Target_N66913, '$class'})):toString(Target_N66913) end)(allbinary_java:to_string((get({get({This, file}), '$class'})):isHidden(get({This, file}))))),
        (get({FilePropertyHashMap, '$class'})):put(FilePropertyHashMap, get({FileData, 'ISABSOLUTE'}), (fun(Target_N66998) -> (get({Target_N66998, '$class'})):toString(Target_N66998) end)(allbinary_java:to_string((get({get({This, file}), '$class'})):isAbsolute(get({This, file}))))),
        (get({FilePropertyHashMap, '$class'})):put(FilePropertyHashMap, get({FileData, 'ABSOLUTE_PATH'}), (get({get({This, file}), '$class'})):getAbsolutePath(get({This, file}))),
        (get({FilePropertyHashMap, '$class'})):put(FilePropertyHashMap, get({FileData, 'CANONICAL_PATH'}), (get({get({This, file}), '$class'})):getCanonicalPath(get({This, file}))),
        (get({FilePropertyHashMap, '$class'})):put(FilePropertyHashMap, get({FileData, 'NAME'}), (get({get({This, file}), '$class'})):getName(get({This, file}))),
        (get({FilePropertyHashMap, '$class'})):put(FilePropertyHashMap, get({FileData, 'PARENT'}), (get({get({This, file}), '$class'})):getParent(get({This, file}))),
        (get({FilePropertyHashMap, '$class'})):put(FilePropertyHashMap, get({FileData, 'PATH'}), (get({get({This, file}), '$class'})):getPath(get({This, file}))),
        FilePropertyHashMap.

