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
% import java.nio.channels.FileChannel
% import java.nio.channels.FileLock
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.AbFileOutputStream
% import org.allbinary.logic.io.StreamUtil

-module('FileLockUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'FileLockUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'FileLockUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
getAll(This, Vector, IsReturnOnFailure) when is_boolean(IsReturnOnFailure) ->
        try
        FileLockVector = 'BasicArrayListD':new(),
        Size = (get({Vector, '$class'})):size(Vector),
        lists:foreach(fun(Index) ->
            File = (get({Vector, '$class'})):get(Vector, Index),
            FileLock = (get({This, '$class'})):getLock(This, File),
            case (FileLock =/= undefined) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["File Lock Obtained: ", (get({File, '$class'})):getAbsolutePath(File)]), This, "getAll"),
                (get({FileLockVector, '$class'})):add(FileLockVector, FileLock);
                false ->
                case IsReturnOnFailure of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Total Locks Obtained: ", (get({FileLockVector, '$class'})):size(FileLockVector)]), This, "getAll"),
                throw({'$return', FileLockVector});
                false -> ok
            end
            end
        end, lists:seq(0, Size - 1)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Total Locks Obtained: ", (get({FileLockVector, '$class'})):size(FileLockVector)]), This, "getAll"),
        FileLockVector
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getAllPossible(This, Vector) ->
        (get({This, '$class'})):getAll(This, Vector, false).

% throws Exception
getAllOrNone(This, Vector) ->
        try
        FileLockVector = (get({This, '$class'})):getAll(This, Vector, true),
        case ((get({Vector, '$class'})):size(Vector) =/= (get({FileLockVector, '$class'})):size(FileLockVector)) of
            true ->
            throw({'$return', 'BasicArrayListD':new()});
            false ->
            throw({'$return', FileLockVector})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getLock(This, File) ->
        try
            (get({This, '$class'})):getLock(This, 'AbFileOutputStream':createFromAbFileAppend(File, true))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Exception returns null", This, "getLock", E),
            undefined
        after
            ok
        end;
% throws Exception
getLock(This, FileOutputStream) ->
        try
            FileLock = (get({This, '$class'})):getLock(This, (get({FileOutputStream, '$class'})):getChannel(FileOutputStream)),
            FileLock
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Exception returns null", This, "getLock", E),
            undefined
        after
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Finally - Closing FileOutputStream", This, "getLock"),
            (fun(Target_N67154) -> (get({Target_N67154, '$class'})):close(Target_N67154, FileOutputStream) end)('StreamUtil':getInstance())
        end;
% throws Exception
getLock(This, FileChannel) ->
        try
            FileLock = (get({FileChannel, '$class'})):tryLock(FileChannel),
            FileLock
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Exception returns null", This, "getLock", E),
            undefined
        after
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Finally - Closing FileChannel", This, "getLock"),
            (get({FileChannel, '$class'})):close(FileChannel)
        end.



