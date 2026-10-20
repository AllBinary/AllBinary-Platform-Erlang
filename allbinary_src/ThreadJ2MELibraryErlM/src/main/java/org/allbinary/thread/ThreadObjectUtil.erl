% Generated Code Do Not Modify
% package org.allbinary.thread
% import org.allbinary.TsUtil

-module('ThreadObjectUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ThreadObjectUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'NULL_PRIORITY_RUNNABLE'}, 'NullPriorityRunnable':new()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'ThreadObjectUtil', instance}).

notifyObject(This, AnyType) ->
        (get({AnyType, '$class'})):notify(AnyType).

% throws Exception
waitObject(This, AnyType) ->
        (get({AnyType, '$class'})):wait(AnyType).

% throws Exception
waitObjectFor(This, AnyType, Delay) when is_integer(Delay) ->
        (fun(Target_N65896) -> (get({Target_N65896, '$class'})):waitFor(Target_N65896, AnyType, Delay) end)('TsUtil':getInstance()).

processThread(This, Runnable) ->
        Thread = 'Thread':new(Runnable),
        (get({Thread, '$class'})):start(Thread).

