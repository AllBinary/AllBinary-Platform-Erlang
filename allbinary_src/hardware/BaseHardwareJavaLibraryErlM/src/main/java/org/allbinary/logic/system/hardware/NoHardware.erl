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
% package org.allbinary.logic.system.hardware
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface
% import org.allbinary.logic.system.hardware.components.interfaces.NoHardwareComponent
% import org.allbinary.util.ABHashtable

-module('NoHardware').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements HardwareInterface

static_init() ->
    put({?MODULE, instance}, 'NoHardware':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'NoHardware', instance}).

getComponent(This, Index) when is_integer(Index) ->
        'NoHardwareComponent':getInstance().

toString(This) ->
        "No Hardware".

compareTo(This, HardwareInterface) ->
        true.

difference(This, HardwareInterface) ->
        get({'StdUtil':getInstance(), 'NULL_TABLE'}).

