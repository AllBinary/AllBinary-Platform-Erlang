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
% package org.allbinary.logic.system.hardware.components
% import org.allbinary.string.CommonStrings

-module('ComponentFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ComponentFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'VGA'}, 'Component':new("VGA")),
    put({This, 'IDE'}, 'Component':new("IDE")),
    put({This, 'SCSI'}, 'Component':new("SCSI")),
    put({This, 'BRIDGE'}, 'Component':new("bridge")),
    put({This, 'ETHERNET'}, 'Component':new("Ethernet")),
    put({This, 'USB'}, 'Component':new("USB")),
    put({This, 'MULTIMEDIA'}, 'Component':new("Multimedia")),
    put({This, 'PCI'}, 'Component':new("PCI")),
    put({This, 'RAID'}, 'Component':new("RAID")),
    put({This, 'SMBUS'}, 'Component':new("SMBus")),
    put({This, 'PIC'}, 'Component':new("PIC")),
    put({This, 'Class'}, 'Component':new("Class")),
    put({This, 'UNKNOWN'}, 'Component':new(get({'CommonStrings':getInstance(), 'UNKNOWN'}))),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'ComponentFactory', instance}).

