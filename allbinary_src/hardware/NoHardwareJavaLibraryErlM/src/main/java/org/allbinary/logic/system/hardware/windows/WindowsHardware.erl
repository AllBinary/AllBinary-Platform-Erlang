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
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.string.StringUtil
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
% import org.allbinary.util.ABHashtable

-module('WindowsHardware').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements HardwareInterface

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getMultimedia(This, Index) when is_integer(Index) ->
        erlang:error({'RuntimeException'}).

getBridge(This, Index) when is_integer(Index) ->
        erlang:error({'RuntimeException'}).

getCpu(This, Index) when is_integer(Index) ->
        erlang:error({'RuntimeException'}).

getEthernet(This, Index) when is_integer(Index) ->
        erlang:error({'RuntimeException'}).

getFireWire(This, Index) when is_integer(Index) ->
        erlang:error({'RuntimeException'}).

getHardDriveController(This, Index) when is_integer(Index) ->
        erlang:error({'RuntimeException'}).

getHardDrive(This, Index) when is_integer(Index) ->
        erlang:error({'RuntimeException'}).

getMachineAccessControlAddress(This, Index) when is_integer(Index) ->
        erlang:error({'RuntimeException'}).

getMonitor(This, Index) when is_integer(Index) ->
        erlang:error({'RuntimeException'}).

getUsb(This, Index) when is_integer(Index) ->
        erlang:error({'RuntimeException'}).

getVideo(This, Index) when is_integer(Index) ->
        erlang:error({'RuntimeException'}).

getComponent(This, Index) when is_integer(Index) ->
        erlang:error({'RuntimeException'}).

toString(This) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

compareTo(This, HardwareInterface) ->
        true.

difference(This, HardwareInterface) ->
        get({'StdUtil':getInstance(), 'NULL_TABLE'}).

