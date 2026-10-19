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
% package org.allbinary.business.time

-module('Time').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, timeLong}, undefined),
    ok.


new(Time) when (is_list(Time) orelse Time =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Time),
    This;
new(Time) when is_integer(Time) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Time),
    This.

init(This, Time) when (is_list(Time) orelse Time =:= undefined) ->
    init_fields(This),
        put({This, timeLong}, Time);
init(This, Time) when is_integer(Time) ->
    init_fields(This),
        put({This, timeLong}, Time).


getLong(This) ->
        get({This, timeLong}).

getlong(This) ->
        (get({get({This, timeLong}), '$class'})):longValue(get({This, timeLong})).

toString(This) ->
        (fun(Target_N65881) -> (get({Target_N65881, '$class'})):toString(Target_N65881) end)((get({This, '$class'})):getLong(This)).

