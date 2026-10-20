% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% import org.allbinary.string.CommonStrings

-module('PooledThread').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Thread', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, threadObjectUtil}, 'ThreadObjectUtil':getInstance()),
    put({This, threadPool}, undefined),
    put({This, 'INTERRUPT_EXCEPTION'}, "Exit InterruptedException"),
    ok.


new(ThreadPool) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ThreadPool),
    This.

'$init'(This, ThreadPool) ->
        'Thread':'$init'(This, (get({ThreadPool, '$class'})):createName(ThreadPool)),
        init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'CONSTRUCTOR'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        put({This, threadPool}, ThreadPool).

run(This) ->
        (get({get({This, threadPool}), '$class'})):threadStarted(get({This, threadPool})),
        (fun Loop() -> case true of true ->
            put({local, task2}, get({get({This, threadObjectUtil}), 'NULL_PRIORITY_RUNNABLE'})),
            try
                put({local, task2}, (get({get({This, threadPool}), '$class'})):getTask(get({This, threadPool}))),
                put({get({This, threadPool}), runningTask}, true),
                (get({get({This, threadPool}), '$class'})):startTask(get({This, threadPool}), get({local, task2}))
            catch _:Ex when Ex =/= '$break', Ex =/= '$continue', (not is_tuple(Ex) orelse element(1, Ex) =/= '$return') ->
                put({local, logUtil}, 'LogUtil':getInstance()),
                (get({get({local, logUtil}), '$class'})):putF(get({local, logUtil}), get({This, 'INTERRUPT_EXCEPTION'}), This, get({get({This, commonStrings}), 'RUN'})),
                throw('$break')
            end,
            case (get({local, task2}) =:= get({get({This, threadObjectUtil}), 'NULL_PRIORITY_RUNNABLE'})) of
                true ->
                throw('$break');
                false -> ok
            end,
            try
                (get({get({local, task2}), '$class'})):run(get({local, task2})),
                (get({get({This, threadPool}), '$class'})):completedTask(get({This, threadPool}), get({local, task2})),
                put({get({This, threadPool}), runningTask}, false)
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                put({local, logUtil}, 'LogUtil':getInstance()),
                (get({get({local, logUtil}), '$class'})):put(get({local, logUtil}), (fun(Target_N66675) -> (get({Target_N66675, '$class'})):toString(Target_N66675) end)((fun(Target_N66682) -> (get({Target_N66682, '$class'})):append(Target_N66682, (fun(Target_N66733) -> (get({Target_N66733, '$class'})):toString(Target_N66733, get({local, task2})) end)('StringUtil':getInstance())) end)((fun(Target_N66689) -> (get({Target_N66689, '$class'})):append(Target_N66689, get({get({This, commonStrings}), 'EXCEPTION_LABEL'})) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'RUN'}), E)
            end,
            Loop();
        false -> ok end end)(),
        (get({get({This, threadPool}), '$class'})):threadStopped(get({This, threadPool})).

