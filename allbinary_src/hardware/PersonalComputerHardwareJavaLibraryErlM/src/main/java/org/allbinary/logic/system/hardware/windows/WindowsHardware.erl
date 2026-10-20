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
% package org.allbinary.logic.system.hardware.windows
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.hardware.HardwareInterface
% import org.allbinary.logic.system.hardware.components.ComponentFactory
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
% import org.allbinary.string.CommonSeps
% import org.allbinary.util.ABHashtable

-module('WindowsHardware').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements HardwareInterface

init_fields(This) ->
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
    put({This, 'NAME'}, "Windows Hardware Profile"),
    put({This, 'MINHARDWARE'}, 0),
    put({This, componentFactory}, 'ComponentFactory':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
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
            case ((get({get({This, componentInterfaceVector}), '$class'})):size(get({This, componentInterfaceVector})) < get({This, 'MINHARDWARE'})) of
                true ->
                erlang:error({'Exception', "Not Enough Data For A Valid License On Windows"});
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

getComponentType(This, Component) when (is_list(Component) orelse Component =:= undefined) ->
        try
        case (allbinary_java:index_of(Component, (get({get({get({This, componentFactory}), 'ETHERNET'}), '$class'})):toString(get({get({This, componentFactory}), 'ETHERNET'}))) >= 0) of
            true ->
            throw({'$return', (get({get({get({This, componentFactory}), 'ETHERNET'}), '$class'})):toString(get({get({This, componentFactory}), 'ETHERNET'}))});
            false ->
            case (allbinary_java:index_of(Component, (get({get({get({This, componentFactory}), 'BRIDGE'}), '$class'})):toString(get({get({This, componentFactory}), 'BRIDGE'}))) >= 0) of
            true ->
            throw({'$return', (get({get({get({This, componentFactory}), 'BRIDGE'}), '$class'})):toString(get({get({This, componentFactory}), 'BRIDGE'}))});
            false ->
            case (allbinary_java:index_of(Component, (get({get({get({This, componentFactory}), 'IDE'}), '$class'})):toString(get({get({This, componentFactory}), 'IDE'}))) >= 0) of
            true ->
            throw({'$return', (get({get({get({This, componentFactory}), 'IDE'}), '$class'})):toString(get({get({This, componentFactory}), 'IDE'}))});
            false ->
            case (allbinary_java:index_of(Component, (get({get({get({This, componentFactory}), 'MULTIMEDIA'}), '$class'})):toString(get({get({This, componentFactory}), 'MULTIMEDIA'}))) >= 0) of
            true ->
            throw({'$return', (get({get({get({This, componentFactory}), 'MULTIMEDIA'}), '$class'})):toString(get({get({This, componentFactory}), 'MULTIMEDIA'}))});
            false ->
            case (allbinary_java:index_of(Component, (get({get({get({This, componentFactory}), 'SCSI'}), '$class'})):toString(get({get({This, componentFactory}), 'SCSI'}))) >= 0) of
            true ->
            throw({'$return', (get({get({get({This, componentFactory}), 'SCSI'}), '$class'})):toString(get({get({This, componentFactory}), 'SCSI'}))});
            false ->
            case (allbinary_java:index_of(Component, (get({get({get({This, componentFactory}), 'USB'}), '$class'})):toString(get({get({This, componentFactory}), 'USB'}))) >= 0) of
            true ->
            throw({'$return', (get({get({get({This, componentFactory}), 'USB'}), '$class'})):toString(get({get({This, componentFactory}), 'USB'}))});
            false ->
            case (allbinary_java:index_of(Component, (get({get({get({This, componentFactory}), 'VGA'}), '$class'})):toString(get({get({This, componentFactory}), 'VGA'}))) >= 0) of
            true ->
            throw({'$return', (get({get({get({This, componentFactory}), 'VGA'}), '$class'})):toString(get({get({This, componentFactory}), 'VGA'}))});
            false ->
            throw({'$return', undefined})
        end
        end
        end
        end
        end
        end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

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
            (get({HardwareBuffer, '$class'})):append(HardwareBuffer, (get({ComponentInterface, '$class'})):toString(ComponentInterface)),
            (get({HardwareBuffer, '$class'})):append(HardwareBuffer, get({'CommonSeps':getInstance(), 'NEW_LINE'}))
        end, lists:seq(0, Size - 1)),
        (get({HardwareBuffer, '$class'})):toString(HardwareBuffer).

compareTo(This, HardwareInterface) ->
        true.

difference(This, HardwareInterface) ->
        get({'StdUtil':getInstance(), 'NULL_TABLE'}).

