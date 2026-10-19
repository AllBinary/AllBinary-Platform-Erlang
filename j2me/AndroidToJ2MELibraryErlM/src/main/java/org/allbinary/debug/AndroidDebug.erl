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
% package org.allbinary.debug
% import android.os.Debug

-module('AndroidDebug').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DebugInterface

init_fields(This) ->
    put({This, startTime}, get({'Long', 'MAX_VALUE'})),
    put({This, running}, false),
    put({This, bufferSize}, ((32 * 1024) * 1024)),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


start(This) ->
        (get({This, '$class'})):setStartTime(This, erlang:system_time(millisecond)),
        'Debug':startMethodTracing("trace", get({This, bufferSize})),
        (get({This, '$class'})):setRunning(This, true).

stop(This) ->
        put({This, startTime}, get({'Long', 'MAX_VALUE'})),
        'Debug':stopMethodTracing(),
        (get({This, '$class'})):setRunning(This, false).

getMaxTime(This) ->
        120000.

setStartTime(This, StartTime) when is_integer(StartTime) ->
        put({This, startTime}, StartTime).

getStartTime(This) ->
        get({This, startTime}).

setRunning(This, Running) when is_boolean(Running) ->
        put({This, running}, Running).

isRunning(This) ->
        get({This, running}).

