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

-module('PathFindingThreadPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ThreadPool', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'PathFindingThreadPool':new("PathFinding", 1, 1)),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'PathFindingThreadPool', instance}).

new(PoolName, NumThreads, Priority) when (is_list(PoolName) orelse PoolName =:= undefined), is_integer(NumThreads), is_integer(Priority) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PoolName, NumThreads, Priority),
    This.

init(This, PoolName, NumThreads, Priority) when (is_list(PoolName) orelse PoolName =:= undefined), is_integer(NumThreads), is_integer(Priority) ->
        'ThreadPool':init(This, PoolName, NumThreads, get({'ThreadPool', 'NORMAL_PRIORITY'})).

runTaskWithPriority(This, Task) ->
        'ThreadPool':runTaskWithPriority(This, Task).

runTask(This, Task) ->
        'ThreadPool':runTask(This, Task).

startTask(This, Task) ->
        ok.

completedTask(This, Task) ->
        ok.

