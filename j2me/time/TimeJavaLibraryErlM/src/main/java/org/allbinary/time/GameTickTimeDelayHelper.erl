% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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

-module('GameTickTimeDelayHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, timeDelta}, 0),
    put({This, startTime}, 0),
    put({This, lastStartTime}, 0),
    ok.


new(StartTime) when is_integer(StartTime) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, StartTime),
    This.

init(This, StartTime) when is_integer(StartTime) ->
    init_fields(This),
        put({This, startTime}, StartTime),
        put({This, lastStartTime}, 0).

setStartTime(This) ->
        put({This, startTime}, erlang:system_time(millisecond)),
        get({This, startTime}).

loop(This) ->
        case (get({This, lastStartTime}) =:= get({'Long', 'MIN_VALUE'})) of
            true ->
            put({This, timeDelta}, 0);
            false ->
            put({This, timeDelta}, (erlang:system_time(millisecond) - get({This, lastStartTime})))
        end.

getTimeFromStart(This) ->
        (get({This, startTime}) - get({This, lastStartTime})).

