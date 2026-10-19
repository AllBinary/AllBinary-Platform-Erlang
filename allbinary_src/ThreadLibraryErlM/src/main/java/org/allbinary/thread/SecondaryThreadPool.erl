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
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('SecondaryThreadPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ThreadPool', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'SecondaryThreadPool':new("Secondary", 1, get({'ThreadPool', 'NORMAL_PRIORITY'}))),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'SecondaryThreadPool', instance}).

new(PoolName, NumThreads, Priority) when (is_list(PoolName) orelse PoolName =:= undefined), is_integer(NumThreads), is_integer(Priority) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PoolName, NumThreads, Priority),
    This.

init(This, PoolName, NumThreads, Priority) when (is_list(PoolName) orelse PoolName =:= undefined), is_integer(NumThreads), is_integer(Priority) ->
        'ThreadPool':init(This, PoolName, NumThreads, Priority).

runTask(This, Task) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N65971) -> (get({Target_N65971, '$class'})):toString(Target_N65971) end)((fun(Target_N65978) -> (get({Target_N65978, '$class'})):appendlong(Target_N65978, trunc(erlang:system_time(millisecond))) end)((fun(Target_N65985) -> (get({Target_N65985, '$class'})):append(Target_N65985, (fun(Target_N66006) -> (get({Target_N66006, '$class'})):toString(Target_N66006, Task) end)('StringUtil':getInstance())) end)('StringMaker':new()))), This, get({get({This, threadPoolStrings}), 'ADD_TASK'})),
        'ThreadPool':runTask(This, Task).

startTask(This, Task) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66194) -> (get({Target_N66194, '$class'})):toString(Target_N66194) end)((fun(Target_N66201) -> (get({Target_N66201, '$class'})):appendlong(Target_N66201, trunc(erlang:system_time(millisecond))) end)((fun(Target_N66208) -> (get({Target_N66208, '$class'})):append(Target_N66208, (fun(Target_N66259) -> (get({Target_N66259, '$class'})):toString(Target_N66259, Task) end)('StringUtil':getInstance())) end)((fun(Target_N66215) -> (get({Target_N66215, '$class'})):append(Target_N66215, get({get({This, threadPoolStrings}), 'START_TASK'})) end)('StringMaker':new())))), This, get({get({This, commonStrings}), 'RUN'})).

completedTask(This, Task) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66421) -> (get({Target_N66421, '$class'})):toString(Target_N66421) end)((fun(Target_N66428) -> (get({Target_N66428, '$class'})):appendlong(Target_N66428, trunc(erlang:system_time(millisecond))) end)((fun(Target_N66435) -> (get({Target_N66435, '$class'})):append(Target_N66435, (fun(Target_N66486) -> (get({Target_N66486, '$class'})):toString(Target_N66486, Task) end)('StringUtil':getInstance())) end)((fun(Target_N66442) -> (get({Target_N66442, '$class'})):append(Target_N66442, get({get({This, threadPoolStrings}), 'COMPLETE_TASK'})) end)('StringMaker':new())))), This, get({get({This, commonStrings}), 'RUN'})).

