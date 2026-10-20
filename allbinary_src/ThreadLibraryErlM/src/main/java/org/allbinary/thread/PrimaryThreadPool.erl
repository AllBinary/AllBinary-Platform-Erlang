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
% package org.allbinary.thread
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('PrimaryThreadPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ThreadPool', Function, Arguments).

static_init() ->
    put({?MODULE, 'THREAD_POOL'}, 'ThreadPool':new("Primary", 1, get({'ThreadPool', 'NORMAL_PRIORITY'}))),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'PrimaryThreadPool', 'THREAD_POOL'}).

new(PoolName, NumThreads, Priority) when (is_list(PoolName) orelse PoolName =:= undefined), is_integer(NumThreads), is_integer(Priority) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PoolName, NumThreads, Priority),
    This.

'$init'(This, PoolName, NumThreads, Priority) when (is_list(PoolName) orelse PoolName =:= undefined), is_integer(NumThreads), is_integer(Priority) ->
        'ThreadPool':'$init'(This, PoolName, NumThreads, Priority).

runTask(This, Task) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N65940) -> (get({Target_N65940, '$class'})):toString(Target_N65940) end)((fun(Target_N65947) -> (get({Target_N65947, '$class'})):appendlong(Target_N65947, trunc(erlang:system_time(millisecond))) end)((fun(Target_N65954) -> (get({Target_N65954, '$class'})):append(Target_N65954, (fun(Target_N65975) -> (get({Target_N65975, '$class'})):toString(Target_N65975, Task) end)('StringUtil':getInstance())) end)('StringMaker':new()))), This, get({get({This, threadPoolStrings}), 'ADD_TASK'})),
        'ThreadPool':runTask(This, Task).

startTask(This, Task) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66163) -> (get({Target_N66163, '$class'})):toString(Target_N66163) end)((fun(Target_N66170) -> (get({Target_N66170, '$class'})):append(Target_N66170, (fun(Target_N66221) -> (get({Target_N66221, '$class'})):toString(Target_N66221, Task) end)('StringUtil':getInstance())) end)((fun(Target_N66177) -> (get({Target_N66177, '$class'})):append(Target_N66177, get({get({This, threadPoolStrings}), 'START_TASK'})) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'RUN'})).

completedTask(This, Task) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66363) -> (get({Target_N66363, '$class'})):toString(Target_N66363) end)((fun(Target_N66370) -> (get({Target_N66370, '$class'})):append(Target_N66370, (fun(Target_N66421) -> (get({Target_N66421, '$class'})):toString(Target_N66421, Task) end)('StringUtil':getInstance())) end)((fun(Target_N66377) -> (get({Target_N66377, '$class'})):append(Target_N66377, get({get({This, threadPoolStrings}), 'COMPLETE_TASK'})) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'RUN'})).

