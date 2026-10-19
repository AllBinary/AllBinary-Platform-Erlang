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
% package org.allbinary.time
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonLabels

-module('TimeDelayHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, startTime}, (-1)),
    put({This, elapsedTimeAtPause}, get({'Long', 'MIN_VALUE'})),
    put({This, delay}, 0),
    ok.


new(Delay) when is_integer(Delay) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Delay),
    This.

init(This, Delay) when is_integer(Delay) ->
    init_fields(This),
        put({This, delay}, Delay),
        (get({This, '$class'})):setStartTimeTNT(This).

isTimeTNT(This) ->
        try
        CurrentTime = erlang:system_time(millisecond),
        case ((CurrentTime - get({This, startTime})) > get({This, delay})) of
            true ->
            put({This, startTime}, CurrentTime),
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isTimeSinceTNT(This, Delay) when is_integer(Delay) ->
        try
        CurrentTime = erlang:system_time(millisecond),
        case ((CurrentTime - get({This, startTime})) > Delay) of
            true ->
            put({This, startTime}, CurrentTime),
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isTime(This, CurrentTime) when is_integer(CurrentTime) ->
        try
        case ((CurrentTime - get({This, startTime})) > get({This, delay})) of
            true ->
            put({This, startTime}, CurrentTime),
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isTimeWithoutReset(This, CurrentTime) when is_integer(CurrentTime) ->
        try
        case ((CurrentTime - get({This, startTime})) > get({This, delay})) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isTimeSince(This, Delay, CurrentTime) when is_integer(Delay), is_integer(CurrentTime) ->
        try
        case ((CurrentTime - get({This, startTime})) > get({This, delay})) of
            true ->
            put({This, startTime}, CurrentTime),
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getElapsedTNT(This) ->
        (erlang:system_time(millisecond) - get({This, startTime})).

getElapsed(This, CurrentTime) when is_integer(CurrentTime) ->
        (CurrentTime - get({This, startTime})).

isElapsed(This, CurrentTime, Time) when is_integer(CurrentTime), is_integer(Time) ->
        try
        case ((get({This, '$class'})):getElapsed(This, CurrentTime) > Time) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isElapsedTNT(This, Time) when is_integer(Time) ->
        try
        case ((get({This, '$class'})):getElapsedTNT(This) > Time) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setStartTime(This, StartTime) when is_integer(StartTime) ->
        put({This, startTime}, StartTime).

getStartTime(This) ->
        get({This, startTime}).

setStartTimeTNT(This) ->
        put({This, startTime}, erlang:system_time(millisecond)).

pause(This) ->
        put({This, elapsedTimeAtPause}, (get({This, '$class'})):getElapsedTNT(This)),
        put({This, startTime}, get({'Long', 'MAX_VALUE'})).

resume(This) ->
        try
        case (get({This, elapsedTimeAtPause}) =/= get({'Long', 'MIN_VALUE'})) of
            true ->
            put({This, startTime}, (erlang:system_time(millisecond) + get({This, elapsedTimeAtPause}))),
            put({This, elapsedTimeAtPause}, get({'Long', 'MIN_VALUE'})),
            (get({This, '$class'})):setStartTimeTNT(This),
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toStringAt(This, CurrentTime) when is_integer(CurrentTime) ->
        try
        Elapsed = (get({This, '$class'})):getElapsed(This, CurrentTime),
        case (Elapsed > 0) of
            true ->
            CommonLabels = 'CommonLabels':getInstance(),
            ElapsedAsString = allbinary_java:to_string(Elapsed),
            throw({'$return', (fun(Target_N67617) -> (get({Target_N67617, '$class'})):toString(Target_N67617) end)((fun(Target_N67624) -> (get({Target_N67624, '$class'})):append(Target_N67624, ElapsedAsString) end)((fun(Target_N67631) -> (get({Target_N67631, '$class'})):append(Target_N67631, get({CommonLabels, 'ELAPSED'})) end)((fun(Target_N67638) -> (get({Target_N67638, '$class'})):appendlong(Target_N67638, CurrentTime) end)((fun(Target_N67645) -> (get({Target_N67645, '$class'})):append(Target_N67645, get({CommonLabels, 'CURRENT'})) end)((fun(Target_N67652) -> (get({Target_N67652, '$class'})):appendlong(Target_N67652, get({This, startTime})) end)((fun(Target_N67659) -> (get({Target_N67659, '$class'})):append(Target_N67659, get({CommonLabels, 'START'})) end)('StringMaker':new())))))))});
            false ->
            throw({'$return', get({'StringUtil':getInstance(), 'EMPTY_STRING'})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toString(This) ->
        try
        CurrentTime = erlang:system_time(millisecond),
        Elapsed = (get({This, '$class'})):getElapsed(This, CurrentTime),
        case (Elapsed > 0) of
            true ->
            CommonLabels = 'CommonLabels':getInstance(),
            ElapsedAsString = allbinary_java:to_string(Elapsed),
            throw({'$return', (fun(Target_N68086) -> (get({Target_N68086, '$class'})):toString(Target_N68086) end)((fun(Target_N68093) -> (get({Target_N68093, '$class'})):append(Target_N68093, ElapsedAsString) end)((fun(Target_N68100) -> (get({Target_N68100, '$class'})):append(Target_N68100, get({CommonLabels, 'ELAPSED'})) end)((fun(Target_N68107) -> (get({Target_N68107, '$class'})):appendlong(Target_N68107, CurrentTime) end)((fun(Target_N68114) -> (get({Target_N68114, '$class'})):append(Target_N68114, get({CommonLabels, 'CURRENT'})) end)((fun(Target_N68121) -> (get({Target_N68121, '$class'})):appendlong(Target_N68121, get({This, startTime})) end)((fun(Target_N68128) -> (get({Target_N68128, '$class'})):append(Target_N68128, get({CommonLabels, 'START'})) end)('StringMaker':new())))))))});
            false ->
            throw({'$return', get({'StringUtil':getInstance(), 'EMPTY_STRING'})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

