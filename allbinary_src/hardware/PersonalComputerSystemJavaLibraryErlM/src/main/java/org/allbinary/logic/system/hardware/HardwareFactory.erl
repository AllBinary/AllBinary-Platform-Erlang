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
% import org.allbinary.logic.system.os.GenericOperatingSystem
% import org.allbinary.logic.system.os.OperatingSystems
% import org.allbinary.logic.system.hardware.linux.LinuxHardware
% import org.allbinary.logic.system.hardware.windows.WindowsHardware

-module('HardwareFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'HardwareFactory':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'HardwareFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance(Os) ->
        try
        try
            OperatingSystems = 'OperatingSystems':getInstance(),
            case ((fun(Target_N65937) -> (get({Target_N65937, '$class'})):compareTo(Target_N65937, get({OperatingSystems, 'LINUX'})) end)((get({Os, '$class'})):getName(Os)) =:= 0) of
                true ->
                throw({'$return', 'LinuxHardware':new()});
                false ->
                case ((fun(Target_N65992) -> (get({Target_N65992, '$class'})):indexOf(Target_N65992, get({OperatingSystems, 'WINDOWS'})) end)((get({Os, '$class'})):getName(Os)) >= 0) of
                true ->
                throw({'$return', 'WindowsHardware':new()});
                false -> ok
            end
            end,
            erlang:error({'Exception', lists:concat(["No Hardware Imp for: ", (get({Os, '$class'})):getName(Os)])})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

