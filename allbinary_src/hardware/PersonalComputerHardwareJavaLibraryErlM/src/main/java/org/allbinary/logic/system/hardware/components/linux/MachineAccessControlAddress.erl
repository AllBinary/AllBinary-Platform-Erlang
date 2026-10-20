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
% package org.allbinary.logic.system.hardware.components.linux
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface
% import org.allbinary.logic.system.hardware.components.interfaces.MachineAccessControlAddressInterface

-module('MachineAccessControlAddress').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements HardwareComponentInterface
% implements MachineAccessControlAddressInterface

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

compareTo(This, ComponentInterface) ->
        true.

toString(This) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

