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
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.os.GenericOperatingSystem
% import org.allbinary.string.CommonStrings

-module('SystemHardwareFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'SystemHardwareFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, hardwareInterface}, 'NoHardware':getInstance()),
    ok.


getInstance() ->
        get({'SystemHardwareFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getInstance(This, OperatingSystemInterface) ->
        try
            case (get({This, hardwareInterface}) =:= 'NoHardware':getInstance()) of
                true ->
                put({This, hardwareInterface}, (fun(Target_N66093) -> (get({Target_N66093, '$class'})):getInstance(Target_N66093, OperatingSystemInterface) end)('HardwareFactory':getInstance()));
                false -> ok
            end,
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Found Hardware", This, get({get({This, commonStrings}), 'CONSTRUCTOR'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}), E)
        end,
        get({This, hardwareInterface}).

static_toString() ->
        SystemHardwareFactory = 'SystemHardwareFactory':getInstance(),
        OsBuffer = 'StringMaker':new(),
        (get({OsBuffer, '$class'})):append(OsBuffer, "Hardware Info: \n"),
        case (get({SystemHardwareFactory, hardwareInterface}) =/= undefined) of
            true ->
            (get({OsBuffer, '$class'})):append(OsBuffer, (get({get({SystemHardwareFactory, hardwareInterface}), '$class'})):toString(get({SystemHardwareFactory, hardwareInterface})));
            false ->
            (get({OsBuffer, '$class'})):append(OsBuffer, get({'StringUtil':getInstance(), 'NULL_STRING'}))
        end,
        (get({OsBuffer, '$class'})):toString(OsBuffer).

