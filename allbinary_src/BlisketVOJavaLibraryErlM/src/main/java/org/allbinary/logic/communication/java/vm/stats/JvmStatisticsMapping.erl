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
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tables.TableMappingInterface
% import org.allbinary.logic.StdUtil

-module('JvmStatisticsMapping').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TableMappingInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('JvmStatistics', Function, Arguments).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'JvmStatistics':init(This).

toHashMap(This) ->
        HashMap = (fun(Target_N65790) -> (get({Target_N65790, '$class'})):createHashMap(Target_N65790) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'JvmStatisticsData', 'FREE_MEMORY_BYTES'}), (get({This, '$class'})):getFreeMemoryBytesString(This)),
        (get({HashMap, '$class'})):put(HashMap, get({'JvmStatisticsData', 'FREE_MEMORY_KILOBYTES'}), (get({This, '$class'})):getFreeMemoryKilobytesString(This)),
        (get({HashMap, '$class'})):put(HashMap, get({'JvmStatisticsData', 'FREE_MEMORY_MEGABYTES'}), (get({This, '$class'})):getFreeMemoryMegabytesString(This)),
        (get({HashMap, '$class'})):put(HashMap, get({'JvmStatisticsData', 'MAX_MEMORY_BYTES'}), (get({This, '$class'})):getMaxMemoryBytesString(This)),
        (get({HashMap, '$class'})):put(HashMap, get({'JvmStatisticsData', 'MAX_MEMORY_KILOBYTES'}), (get({This, '$class'})):getMaxMemoryKilobytesString(This)),
        (get({HashMap, '$class'})):put(HashMap, get({'JvmStatisticsData', 'MAX_MEMORY_MEGABYTES'}), (get({This, '$class'})):getMaxMemoryMegabytesString(This)),
        (get({HashMap, '$class'})):put(HashMap, get({'JvmStatisticsData', 'NUMBER_OF_THREADS'}), (get({This, '$class'})):getNumberOfThreadsString(This)),
        (get({HashMap, '$class'})):put(HashMap, get({'JvmStatisticsData', 'TOTAL_MEMORY_BYTES'}), (get({This, '$class'})):getTotalMemoryBytesString(This)),
        (get({HashMap, '$class'})):put(HashMap, get({'JvmStatisticsData', 'TOTAL_MEMORY_KILOBYTES'}), (get({This, '$class'})):getTotalMemoryKilobytesString(This)),
        (get({HashMap, '$class'})):put(HashMap, get({'JvmStatisticsData', 'TOTAL_MEMORY_MEGABYTES'}), (get({This, '$class'})):getTotalMemoryMegabytesString(This)),
        HashMap.

% throws Exception
getKey(This) ->
        get({'JvmStatisticsData', 'NAME'}).

% throws Exception
toVector(This) ->
        Vector = 'BasicArrayListD':new(),
        (get({Vector, '$class'})):add(Vector, (get({This, '$class'})):getFreeMemoryBytesString(This)),
        (get({Vector, '$class'})):add(Vector, (get({This, '$class'})):getFreeMemoryKilobytesString(This)),
        (get({Vector, '$class'})):add(Vector, (get({This, '$class'})):getFreeMemoryMegabytesString(This)),
        (get({Vector, '$class'})):add(Vector, (get({This, '$class'})):getMaxMemoryBytesString(This)),
        (get({Vector, '$class'})):add(Vector, (get({This, '$class'})):getMaxMemoryKilobytesString(This)),
        (get({Vector, '$class'})):add(Vector, (get({This, '$class'})):getMaxMemoryMegabytesString(This)),
        (get({Vector, '$class'})):add(Vector, (get({This, '$class'})):getNumberOfThreadsString(This)),
        (get({Vector, '$class'})):add(Vector, (get({This, '$class'})):getTotalMemoryBytesString(This)),
        (get({Vector, '$class'})):add(Vector, (get({This, '$class'})):getTotalMemoryKilobytesString(This)),
        (get({Vector, '$class'})):add(Vector, (get({This, '$class'})):getTotalMemoryMegabytesString(This)),
        Vector.

