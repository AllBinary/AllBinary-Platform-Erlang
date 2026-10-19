% Generated Code Do Not Modify
% package org.allbinary.thread

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
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'ThreadObjectUtil', instance}).

notifyObject(This, AnyType) ->
        ok.

% throws Exception
waitObject(This, AnyType) ->
        ok.

% throws Exception
waitObjectFor(This, AnyType, Delay) when is_integer(Delay) ->
        ok.

processThread(This, Runnable) ->
        (get({Runnable, '$class'})):run(Runnable).

