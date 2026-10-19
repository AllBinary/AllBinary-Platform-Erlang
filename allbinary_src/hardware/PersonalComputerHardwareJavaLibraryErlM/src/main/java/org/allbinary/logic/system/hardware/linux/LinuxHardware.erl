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
% package org.allbinary.logic.system.hardware.linux
% import java.io.FileReader
% import java.io.LineNumberReader
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory
% import org.allbinary.logic.communication.log.config.type.LogConfigTypes
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.FilePathData
% import org.allbinary.logic.io.file.directory.SubDirectory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.hardware.HardwareInterface
% import org.allbinary.logic.system.hardware.components.interfaces.BridgeInterface
% import org.allbinary.logic.system.hardware.components.interfaces.CpuInterface
% import org.allbinary.logic.system.hardware.components.interfaces.EthernetInterface
% import org.allbinary.logic.system.hardware.components.interfaces.FireWireInterface
% import org.allbinary.logic.system.hardware.components.interfaces.HardDriveControllerInterface
% import org.allbinary.logic.system.hardware.components.interfaces.HardDriveInterface
% import org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface
% import org.allbinary.logic.system.hardware.components.interfaces.MachineAccessControlAddressInterface
% import org.allbinary.logic.system.hardware.components.interfaces.MediaInterface
% import org.allbinary.logic.system.hardware.components.interfaces.MonitorInterface
% import org.allbinary.logic.system.hardware.components.interfaces.UsbInterface
% import org.allbinary.logic.system.hardware.components.interfaces.VideoInterface
% import org.allbinary.logic.system.hardware.components.linux.Cpu
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList

-module('LinuxHardware').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements HardwareInterface

static_init() ->
    put({?MODULE, 'PCIFILE'}, "/proc/pci"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, componentInterfaceVector}, undefined),
    put({This, videoInterfaceVector}, undefined),
    put({This, hardDriveControllerInterfaceVector}, undefined),
    put({This, cpuInterfaceVector}, undefined),
    put({This, usbInterfaceVector}, undefined),
    put({This, ethernetInterfaceVector}, undefined),
    put({This, multimediaInterfaceVector}, undefined),
    put({This, fireWireInterfaceVector}, undefined),
    put({This, bridgeInterfaceVector}, undefined),
    put({This, hardDriveInterfaceVector}, undefined),
    put({This, macInterfaceVector}, undefined),
    put({This, monitorInterfaceVector}, undefined),
    put({This, 'NAME'}, "Linux Hardware Profile"),
    put({This, 'MINHARDWARE'}, 5),
    ok.


new(Path) when (is_list(Path) orelse Path =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Path),
    This.

init(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):init(This, Path).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        (get({This, '$class'})):init(This, get({'LinuxHardware', 'PCIFILE'})),
        case ((get({get({This, componentInterfaceVector}), '$class'})):size(get({This, componentInterfaceVector})) < get({This, 'MINHARDWARE'})) of
            true ->
            erlang:error({'Exception', "Not Enough Data For A Valid License On Linux"});
            false -> ok
        end,
        Cpu = 'Cpu':new(),
        case (Cpu =/= undefined) of
            true ->
            (get({get({This, cpuInterfaceVector}), '$class'})):add(get({This, cpuInterfaceVector}), Cpu),
            (get({get({This, componentInterfaceVector}), '$class'})):add(get({This, componentInterfaceVector}), Cpu);
            false -> ok
        end,
        case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'OS'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Hardware Data: ", (get({This, '$class'})):toString(This)]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end.

% throws Exception
init(This, FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        LineNumberReader = undefined,
        try
            (get({This, '$class'})):init(This, LineNumberReader, FilePath)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'OS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat(["Hardware Data: ", (get({This, '$class'})):toString(This)]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}), E);
                false -> ok
            end,
            erlang:error(E)
        end.

% throws Exception
init(This, LineNumberReader, FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        put({local, lineNumberReader}, LineNumberReader),
        try
            put({This, componentInterfaceVector}, 'BasicArrayListD':new()),
            put({This, videoInterfaceVector}, 'BasicArrayListD':new()),
            put({This, hardDriveControllerInterfaceVector}, 'BasicArrayListD':new()),
            put({This, cpuInterfaceVector}, 'BasicArrayListD':new()),
            put({This, usbInterfaceVector}, 'BasicArrayListD':new()),
            put({This, ethernetInterfaceVector}, 'BasicArrayListD':new()),
            put({This, multimediaInterfaceVector}, 'BasicArrayListD':new()),
            put({This, fireWireInterfaceVector}, 'BasicArrayListD':new()),
            put({This, bridgeInterfaceVector}, 'BasicArrayListD':new()),
            put({This, hardDriveInterfaceVector}, 'BasicArrayListD':new()),
            put({This, macInterfaceVector}, 'BasicArrayListD':new()),
            put({This, monitorInterfaceVector}, 'BasicArrayListD':new()),
            PciFile = 'FileReader':new(FilePath),
            put({local, lineNumberReader}, 'LineNumberReader':new(PciFile)),
            case (get({local, lineNumberReader}) =:= undefined) of
                true ->
                FileVector = (fun(Target_N68619) -> (get({Target_N68619, '$class'})):search(Target_N68619, FilePath, 'AbFile':createAbFile(get({'FilePathData':getInstance(), 'PATH_START'}))) end)('SubDirectory':getInstance()),
                case (not (get({FileVector, '$class'})):isEmpty(FileVector)) of
                    true ->
                    File = (get({FileVector, '$class'})):get(FileVector, 0),
                    put({local, lineNumberReader}, 'LineNumberReader':new('FileReader':new((get({File, '$class'})):getPath(File))));
                    false -> ok
                end,
                case (get({local, lineNumberReader}) =:= undefined) of
                    true ->
                    erlang:error({'Exception', "No Linux File Data"});
                    false -> ok
                end;
                false -> ok
            end,
            case (get({local, lineNumberReader}) =/= undefined) of
                true ->
                case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'OS'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "PCI File Found", This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
                    false -> ok
                end,
                put({local, nextLine}, (get({get({local, lineNumberReader}), '$class'})):readLine(get({local, lineNumberReader}))),
                (fun Loop() -> case ((get({local, lineNumberReader}) =/= undefined) andalso (get({local, nextLine}) =/= undefined)) of true ->
                    case (get({This, '$class'})):isNextHardware(This, get({local, nextLine})) of
                        true ->
                        throw('$break');
                        false -> ok
                    end,
                    put({local, nextLine}, (get({get({local, lineNumberReader}), '$class'})):readLine(get({local, lineNumberReader}))),
                    Loop();
                false -> ok end end)(),
                (fun Loop() -> case (get({This, '$class'})):isNextHardware(This, get({local, nextLine})) of true ->
                    ComponentData = 'StringMaker':new(),
                    case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'OS'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Found Hardware Device: ", (get({get({This, componentInterfaceVector}), '$class'})):size(get({This, componentInterfaceVector}))]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
                        false -> ok
                    end,
                    (get({ComponentData, '$class'})):append(ComponentData, get({local, nextLine})),
                    (get({ComponentData, '$class'})):append(ComponentData, get({'CommonSeps':getInstance(), 'NEW_LINE'})),
                    put({local, nextLine}, (get({get({local, lineNumberReader}), '$class'})):readLine(get({local, lineNumberReader}))),
                    ComponentType = (fun(Target_N69676) -> (get({Target_N69676, '$class'})):getComponentType(Target_N69676, get({local, nextLine})) end)('PCComponentFactory':getInstance()),
                    (fun Loop() -> case (get({local, lineNumberReader}) =/= undefined) of true ->
                        (get({ComponentData, '$class'})):append(ComponentData, get({local, nextLine})),
                        (get({ComponentData, '$class'})):append(ComponentData, get({'CommonSeps':getInstance(), 'NEW_LINE'})),
                        put({local, nextLine}, (get({get({local, lineNumberReader}), '$class'})):readLine(get({local, lineNumberReader}))),
                        case ((get({local, nextLine}) =:= undefined) orelse (get({This, '$class'})):isNextHardware(This, get({local, nextLine}))) of
                            true ->
                            throw('$break');
                            false -> ok
                        end,
                        Loop();
                    false -> ok end end)(),
                    ComponentInterface = (fun(Target_N69933) -> (get({Target_N69933, '$class'})):getInstance(Target_N69933, ComponentType, (get({ComponentData, '$class'})):toString(ComponentData)) end)('PCComponentFactory':getInstance()),
                    case (ComponentInterface =/= undefined) of
                        true ->
                        (get({get({This, componentInterfaceVector}), '$class'})):add(get({This, componentInterfaceVector}), ComponentInterface);
                        false -> ok
                    end,
                    Loop();
                false -> ok end end)();
                false ->
                case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'OS'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Could not load PCI File", This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
                    false -> ok
                end
            end,
            (get({get({local, lineNumberReader}), '$class'})):close(get({local, lineNumberReader}))
        after
            case (get({local, lineNumberReader}) =/= undefined) of
                true ->
                (get({get({local, lineNumberReader}), '$class'})):close(get({local, lineNumberReader}));
                false -> ok
            end
        end.

getMultimedia(This, Index) when is_integer(Index) ->
        (get({get({This, multimediaInterfaceVector}), '$class'})):get(get({This, multimediaInterfaceVector}), Index).

getBridge(This, Index) when is_integer(Index) ->
        (get({get({This, bridgeInterfaceVector}), '$class'})):get(get({This, bridgeInterfaceVector}), Index).

getCpu(This, Index) when is_integer(Index) ->
        (get({get({This, cpuInterfaceVector}), '$class'})):get(get({This, cpuInterfaceVector}), Index).

getEthernet(This, Index) when is_integer(Index) ->
        (get({get({This, ethernetInterfaceVector}), '$class'})):get(get({This, ethernetInterfaceVector}), Index).

getFireWire(This, Index) when is_integer(Index) ->
        (get({get({This, fireWireInterfaceVector}), '$class'})):get(get({This, fireWireInterfaceVector}), Index).

getHardDriveController(This, Index) when is_integer(Index) ->
        (get({get({This, hardDriveControllerInterfaceVector}), '$class'})):get(get({This, hardDriveControllerInterfaceVector}), Index).

getHardDrive(This, Index) when is_integer(Index) ->
        (get({get({This, hardDriveInterfaceVector}), '$class'})):get(get({This, hardDriveInterfaceVector}), Index).

getMachineAccessControlAddress(This, Index) when is_integer(Index) ->
        (get({get({This, macInterfaceVector}), '$class'})):get(get({This, macInterfaceVector}), Index).

getMonitor(This, Index) when is_integer(Index) ->
        (get({get({This, monitorInterfaceVector}), '$class'})):get(get({This, monitorInterfaceVector}), Index).

getUsb(This, Index) when is_integer(Index) ->
        (get({get({This, usbInterfaceVector}), '$class'})):get(get({This, usbInterfaceVector}), Index).

getVideo(This, Index) when is_integer(Index) ->
        (get({get({This, videoInterfaceVector}), '$class'})):get(get({This, videoInterfaceVector}), Index).

getComponent(This, Index) when is_integer(Index) ->
        (get({get({This, componentInterfaceVector}), '$class'})):get(get({This, componentInterfaceVector}), Index).

toString(This) ->
        HardwareBuffer = 'StringMaker':new(),
        Size = (get({get({This, componentInterfaceVector}), '$class'})):size(get({This, componentInterfaceVector})),
        lists:foreach(fun(Index) ->
            ComponentInterface = (get({get({This, componentInterfaceVector}), '$class'})):get(get({This, componentInterfaceVector}), Index),
            (get({HardwareBuffer, '$class'})):append(HardwareBuffer, "Component "),
            (get({HardwareBuffer, '$class'})):appendint(HardwareBuffer, Index),
            (get({HardwareBuffer, '$class'})):append(HardwareBuffer, ": \n"),
            (get({HardwareBuffer, '$class'})):append(HardwareBuffer, (get({ComponentInterface, '$class'})):toString(ComponentInterface)),
            (get({HardwareBuffer, '$class'})):append(HardwareBuffer, get({'CommonSeps':getInstance(), 'NEW_LINE'}))
        end, lists:seq(0, Size - 1)),
        (get({HardwareBuffer, '$class'})):toString(HardwareBuffer).

compareTo(This, HardwareInterface) ->
        true.

difference(This, HardwareInterface) ->
        get({'StdUtil':getInstance(), 'NULL_TABLE'}).

isNextHardware(This, NextLine) when (is_list(NextLine) orelse NextLine =:= undefined) ->
        try
        case (NextLine =/= undefined) of
            true ->
            Index = allbinary_java:index_of(NextLine, "Bus"),
            case ((Index >= 0) andalso (Index < 4)) of
                true ->
                throw({'$return', true});
                false -> ok
            end;
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

