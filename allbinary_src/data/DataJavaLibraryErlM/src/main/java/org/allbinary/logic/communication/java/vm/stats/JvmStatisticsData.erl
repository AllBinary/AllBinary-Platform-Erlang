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

-module('JvmStatisticsData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'JVM_STATISTICS'}, "JVM_STATISTICS_"),
    put({?MODULE, 'NAME'}, lists:concat([get({'JvmStatisticsData', 'JVM_STATISTICS'}), "NAME"])),
    put({?MODULE, 'TOTAL_MEMORY_BYTES'}, lists:concat([get({'JvmStatisticsData', 'JVM_STATISTICS'}), "TOTAL_MEMORY_BYTES"])),
    put({?MODULE, 'TOTAL_MEMORY_KILOBYTES'}, lists:concat([get({'JvmStatisticsData', 'JVM_STATISTICS'}), "TOTAL_MEMORY_KILOBYTES"])),
    put({?MODULE, 'TOTAL_MEMORY_MEGABYTES'}, lists:concat([get({'JvmStatisticsData', 'JVM_STATISTICS'}), "TOTAL_MEMORY_MEGABYTES"])),
    put({?MODULE, 'FREE_MEMORY_BYTES'}, lists:concat([get({'JvmStatisticsData', 'JVM_STATISTICS'}), "FREE_MEMORY_BYTES"])),
    put({?MODULE, 'FREE_MEMORY_KILOBYTES'}, lists:concat([get({'JvmStatisticsData', 'JVM_STATISTICS'}), "FREE_MEMORY_KILOBYTES"])),
    put({?MODULE, 'FREE_MEMORY_MEGABYTES'}, lists:concat([get({'JvmStatisticsData', 'JVM_STATISTICS'}), "FREE_MEMORY_MEGABYTES"])),
    put({?MODULE, 'MAX_MEMORY_BYTES'}, lists:concat([get({'JvmStatisticsData', 'JVM_STATISTICS'}), "MAX_MEMORY_BYTES"])),
    put({?MODULE, 'MAX_MEMORY_KILOBYTES'}, lists:concat([get({'JvmStatisticsData', 'JVM_STATISTICS'}), "MAX_MEMORY_KILOBYTES"])),
    put({?MODULE, 'MAX_MEMORY_MEGABYTES'}, lists:concat([get({'JvmStatisticsData', 'JVM_STATISTICS'}), "MAX_MEMORY_MEGABYTES"])),
    put({?MODULE, 'NUMBER_OF_THREADS'}, lists:concat([get({'JvmStatisticsData', 'JVM_STATISTICS'}), "NUMBER_OF_THREADS"])),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        ok.

