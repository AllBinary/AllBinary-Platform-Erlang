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
% package org.allbinary.logic.util.cache

-module('CachePolicy').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, name}, undefined),
    put({This, maxTime}, 0),
    put({This, maxSize}, 0),
    ok.


new(Name, MaxTime, MaxSize) when (is_list(Name) orelse Name =:= undefined), is_integer(MaxTime), is_integer(MaxSize) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name, MaxTime, MaxSize),
    This.

'$init'(This, Name, MaxTime, MaxSize) when (is_list(Name) orelse Name =:= undefined), is_integer(MaxTime), is_integer(MaxSize) ->
    init_fields(This),
        put({This, name}, Name),
        (get({This, '$class'})):setMaxTime(This, MaxTime),
        (get({This, '$class'})):setMaxSize(This, MaxSize).

getMaxTime(This) ->
        get({This, maxTime}).

setMaxTime(This, MaxTime) when is_integer(MaxTime) ->
        put({This, maxTime}, MaxTime).

getMaxSize(This) ->
        get({This, maxSize}).

setMaxSize(This, MaxSize) when is_integer(MaxSize) ->
        put({This, maxSize}, MaxSize).

getName(This) ->
        get({This, name}).

