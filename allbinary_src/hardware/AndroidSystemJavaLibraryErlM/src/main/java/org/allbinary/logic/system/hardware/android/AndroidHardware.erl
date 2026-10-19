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
% package org.allbinary.logic.system.hardware.android
% import java.io.Closeable
% import java.io.FileReader
% import java.io.LineNumberReader
% import org.allbinary.logic.io.NullCloseable
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.hardware.HardwareInterface
% import org.allbinary.logic.system.hardware.components.android.UnknownHardware
% import org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('AndroidHardware').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements HardwareInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, componentInterfaceVector}, 'BasicArrayListD':new()),
    put({This, 'PROC_BUS_INPUT_DIRECTORY'}, "/proc/bus/input/"),
    put({This, 'DEVICES'}, lists:concat([get({This, 'PROC_BUS_INPUT_DIRECTORY'}), "devices/"])),
    put({This, 'MINHARDWARE'}, 3),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        (get({This, '$class'})):init(This, get({This, 'DEVICES'})),
        Size = (get({get({This, componentInterfaceVector}), '$class'})):size(get({This, componentInterfaceVector})),
        case (Size < get({This, 'MINHARDWARE'})) of
            true ->
            erlang:error({'Exception', "Not Enough Data For A Valid License On Linux"});
            false -> ok
        end.

% throws Exception
init(This, FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        put({local, lineNumberReader}, get({'NullCloseable', 'NULL_CLOSEABLE'})),
        try
            put({local, lineNumberReader}, (get({This, '$class'})):get(This, FilePath))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat(["Hardware Data: ", (get({This, '$class'})):toString(This)]), This, get({get({This, commonStrings}), 'INIT'}), E),
            erlang:error(E)
        after
            case (get({local, lineNumberReader}) =/= undefined) of
                true ->
                (get({get({local, lineNumberReader}), '$class'})):close(get({local, lineNumberReader}));
                false -> ok
            end
        end.

% throws Exception
get(This, FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        put({This, componentInterfaceVector}, 'BasicArrayListD':new()),
        PciFile = 'FileReader':new(FilePath),
        LineNumberReader = 'LineNumberReader':new(PciFile),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "File Found", This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        put({local, nextLine}, (get({LineNumberReader, '$class'})):readLine(LineNumberReader)),
        (fun Loop() -> case (get({local, nextLine}) =/= undefined) of true ->
            put({local, nextLine}, (get({LineNumberReader, '$class'})):readLine(LineNumberReader)),
            (get({get({This, componentInterfaceVector}), '$class'})):add(get({This, componentInterfaceVector}), 'UnknownHardware':new(get({local, nextLine}))),
            Loop();
        false -> ok end end)(),
        LineNumberReader.

getComponent(This, Index) when is_integer(Index) ->
        (get({get({This, componentInterfaceVector}), '$class'})):get(get({This, componentInterfaceVector}), Index).

toString(This) ->
        StringBuilder = 'StringMaker':new(),
        Size = (get({get({This, componentInterfaceVector}), '$class'})):size(get({This, componentInterfaceVector})),
        lists:foreach(fun(Index) ->
            ComponentInterface = (get({get({This, componentInterfaceVector}), '$class'})):get(get({This, componentInterfaceVector}), Index),
            (get({StringBuilder, '$class'})):append(StringBuilder, (get({ComponentInterface, '$class'})):toString(ComponentInterface)),
            (get({StringBuilder, '$class'})):append(StringBuilder, get({'CommonSeps':getInstance(), 'NEW_LINE'}))
        end, lists:seq(0, Size - 1)),
        (get({StringBuilder, '$class'})):toString(StringBuilder).

compareTo(This, HardwareInterface) ->
        true.

difference(This, HardwareInterface) ->
        get({'StdUtil':getInstance(), 'NULL_TABLE'}).

