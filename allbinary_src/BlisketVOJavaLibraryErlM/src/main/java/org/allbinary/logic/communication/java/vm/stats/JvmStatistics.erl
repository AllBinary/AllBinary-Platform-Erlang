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
% package org.allbinary.logic.communication.java.vm.stats

-module('JvmStatistics').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, runtime}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        put({This, runtime}, 'Runtime':getRuntime()).

getFreeMemoryBytes(This) ->
        (get({get({This, runtime}), '$class'})):freeMemory(get({This, runtime})).

getFreeMemoryKilobytes(This) ->
        ((get({This, '$class'})):getFreeMemoryBytes(This) div 1024).

getFreeMemoryMegabytes(This) ->
        ((get({This, '$class'})):getFreeMemoryKilobytes(This) div 1024).

getMaxMemoryBytes(This) ->
        (get({get({This, runtime}), '$class'})):maxMemory(get({This, runtime})).

getMaxMemoryKilobytes(This) ->
        ((get({This, '$class'})):getMaxMemoryBytes(This) div 1024).

getMaxMemoryMegabytes(This) ->
        ((get({This, '$class'})):getMaxMemoryKilobytes(This) div 1024).

getTotalMemoryBytes(This) ->
        (get({get({This, runtime}), '$class'})):totalMemory(get({This, runtime})).

getTotalMemoryKilobytes(This) ->
        ((get({This, '$class'})):getTotalMemoryBytes(This) div 1024).

getTotalMemoryMegabytes(This) ->
        ((get({This, '$class'})):getTotalMemoryKilobytes(This) div 1024).

getFreeMemoryBytesLong(This) ->
        (get({This, '$class'})):getFreeMemoryBytes(This).

getFreeMemoryKilobytesLong(This) ->
        (get({This, '$class'})):getFreeMemoryKilobytes(This).

getFreeMemoryMegabytesLong(This) ->
        (get({This, '$class'})):getFreeMemoryMegabytes(This).

getMaxMemoryBytesLong(This) ->
        (get({This, '$class'})):getMaxMemoryBytes(This).

getMaxMemoryKilobytesLong(This) ->
        (get({This, '$class'})):getMaxMemoryKilobytes(This).

getMaxMemoryMegabytesLong(This) ->
        (get({This, '$class'})):getMaxMemoryMegabytes(This).

getTotalMemoryBytesLong(This) ->
        (get({This, '$class'})):getTotalMemoryBytes(This).

getTotalMemoryKilobytesLong(This) ->
        (get({This, '$class'})):getTotalMemoryKilobytes(This).

getTotalMemoryMegabytesLong(This) ->
        (get({This, '$class'})):getTotalMemoryMegabytes(This).

getFreeMemoryBytesString(This) ->
        (fun(Target_N66681) -> (get({Target_N66681, '$class'})):toString(Target_N66681) end)((get({This, '$class'})):getFreeMemoryBytesLong(This)).

getFreeMemoryKilobytesString(This) ->
        (fun(Target_N66734) -> (get({Target_N66734, '$class'})):toString(Target_N66734) end)((get({This, '$class'})):getFreeMemoryKilobytesLong(This)).

getFreeMemoryMegabytesString(This) ->
        (fun(Target_N66787) -> (get({Target_N66787, '$class'})):toString(Target_N66787) end)((get({This, '$class'})):getFreeMemoryMegabytesLong(This)).

getMaxMemoryBytesString(This) ->
        (fun(Target_N66840) -> (get({Target_N66840, '$class'})):toString(Target_N66840) end)((get({This, '$class'})):getMaxMemoryBytesLong(This)).

getMaxMemoryKilobytesString(This) ->
        (fun(Target_N66893) -> (get({Target_N66893, '$class'})):toString(Target_N66893) end)((get({This, '$class'})):getMaxMemoryKilobytesLong(This)).

getMaxMemoryMegabytesString(This) ->
        (fun(Target_N66946) -> (get({Target_N66946, '$class'})):toString(Target_N66946) end)((get({This, '$class'})):getMaxMemoryMegabytesLong(This)).

getTotalMemoryBytesString(This) ->
        (fun(Target_N66999) -> (get({Target_N66999, '$class'})):toString(Target_N66999) end)((get({This, '$class'})):getTotalMemoryBytesLong(This)).

getTotalMemoryKilobytesString(This) ->
        (fun(Target_N67052) -> (get({Target_N67052, '$class'})):toString(Target_N67052) end)((get({This, '$class'})):getTotalMemoryKilobytesLong(This)).

getTotalMemoryMegabytesString(This) ->
        (fun(Target_N67105) -> (get({Target_N67105, '$class'})):toString(Target_N67105) end)((get({This, '$class'})):getTotalMemoryMegabytesLong(This)).

getNumberOfThreads(This) ->
        'Thread':activeCount().

getNumberOfThreadsLong(This) ->
        (get({This, '$class'})):getNumberOfThreads(This).

getNumberOfThreadsString(This) ->
        (fun(Target_N67264) -> (get({Target_N67264, '$class'})):toString(Target_N67264) end)((get({This, '$class'})):getNumberOfThreadsLong(This)).

collectGarbage(This) ->
        (get({get({This, runtime}), '$class'})):gc(get({This, runtime})).

