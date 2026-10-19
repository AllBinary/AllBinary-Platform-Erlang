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
% package org.allbinary.thread
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('MusicThreadPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ThreadPool', Function, Arguments).

static_init() ->
    put({?MODULE, 'THREAD_POOL'}, 'ThreadPool':new("Music", 2, get({'ThreadPool', 'NORMAL_PRIORITY'}))),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'MusicThreadPool', 'THREAD_POOL'}).

new(PoolName, NumThreads, Priority) when (is_list(PoolName) orelse PoolName =:= undefined), is_integer(NumThreads), is_integer(Priority) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PoolName, NumThreads, Priority),
    This.

init(This, PoolName, NumThreads, Priority) when (is_list(PoolName) orelse PoolName =:= undefined), is_integer(NumThreads), is_integer(Priority) ->
        'ThreadPool':init(This, PoolName, NumThreads, Priority).

runTask(This, Task) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N65975) -> (get({Target_N65975, '$class'})):toString(Target_N65975) end)((fun(Target_N65982) -> (get({Target_N65982, '$class'})):appendlong(Target_N65982, trunc(erlang:system_time(millisecond))) end)((fun(Target_N65989) -> (get({Target_N65989, '$class'})):append(Target_N65989, (fun(Target_N66010) -> (get({Target_N66010, '$class'})):toString(Target_N66010, Task) end)('StringUtil':getInstance())) end)('StringMaker':new()))), This, get({get({This, threadPoolStrings}), 'ADD_TASK'})),
        'ThreadPool':runTask(This, Task).

startTask(This, Task) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66198) -> (get({Target_N66198, '$class'})):toString(Target_N66198) end)((fun(Target_N66205) -> (get({Target_N66205, '$class'})):appendlong(Target_N66205, trunc(erlang:system_time(millisecond))) end)((fun(Target_N66212) -> (get({Target_N66212, '$class'})):append(Target_N66212, (fun(Target_N66263) -> (get({Target_N66263, '$class'})):toString(Target_N66263, Task) end)('StringUtil':getInstance())) end)((fun(Target_N66219) -> (get({Target_N66219, '$class'})):append(Target_N66219, get({get({This, threadPoolStrings}), 'START_TASK'})) end)('StringMaker':new())))), This, get({get({This, commonStrings}), 'RUN'})).

completedTask(This, Task) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66425) -> (get({Target_N66425, '$class'})):toString(Target_N66425) end)((fun(Target_N66432) -> (get({Target_N66432, '$class'})):appendlong(Target_N66432, trunc(erlang:system_time(millisecond))) end)((fun(Target_N66439) -> (get({Target_N66439, '$class'})):append(Target_N66439, (fun(Target_N66490) -> (get({Target_N66490, '$class'})):toString(Target_N66490, Task) end)('StringUtil':getInstance())) end)((fun(Target_N66446) -> (get({Target_N66446, '$class'})):append(Target_N66446, get({get({This, threadPoolStrings}), 'COMPLETE_TASK'})) end)('StringMaker':new())))), This, get({get({This, commonStrings}), 'RUN'})).

