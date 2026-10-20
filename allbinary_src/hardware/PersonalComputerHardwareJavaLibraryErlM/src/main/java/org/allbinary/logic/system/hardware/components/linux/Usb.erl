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
% import org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface
% import org.allbinary.logic.system.hardware.components.interfaces.UsbInterface

-module('Usb').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements HardwareComponentInterface
% implements UsbInterface

init_fields(This) ->
    put({This, data}, undefined),
    ok.


new(Data) when (is_list(Data) orelse Data =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Data),
    This.

'$init'(This, Data) when (is_list(Data) orelse Data =:= undefined) ->
    init_fields(This),
        put({This, data}, Data).

compareTo(This, ComponentInterface) ->
        true.

toString(This) ->
        get({This, data}).

