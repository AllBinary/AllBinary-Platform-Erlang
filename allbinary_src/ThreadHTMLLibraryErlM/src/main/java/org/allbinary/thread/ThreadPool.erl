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
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('ThreadPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NORMAL_PRIORITY'}, 5),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, 'NULL_RUNNABLE'}, 'NullRunnable':getInstance()),
    put({This, threadPoolStrings}, 'ThreadPoolStrings':getInstance()),
    put({This, threadObjectUtil}, 'ThreadObjectUtil':getInstance()),
    put({This, isAlive}, false),
    put({This, taskQueue}, 'BasicArrayListD':new()),
    put({This, numThreads}, 0),
    put({This, runningTask}, false),
    put({This, currentPriorityRunnable}, get({get({This, threadObjectUtil}), 'NULL_PRIORITY_RUNNABLE'})),
    ok.


new(PoolName, NumThreads, Priority) when (is_list(PoolName) orelse PoolName =:= undefined), is_integer(NumThreads), is_integer(Priority) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PoolName, NumThreads, Priority),
    This.

init(This, PoolName, NumThreads, Priority) when (is_list(PoolName) orelse PoolName =:= undefined), is_integer(NumThreads), is_integer(Priority) ->
    init_fields(This),
        ok.

% throws Exception
runAPriorityTask(This) ->
        try
        case (not (get({get({This, currentPriorityRunnable}), '$class'})):isDone(get({This, currentPriorityRunnable}))) of
            true ->
            (get({get({This, currentPriorityRunnable}), '$class'})):run(get({This, currentPriorityRunnable}));
            false ->
            Runnable = (get({This, '$class'})):getTask(This),
            case (Runnable =:= get({This, 'NULL_RUNNABLE'})) of
                true ->
                throw({'$return', ok});
                false -> ok
            end,
            put({This, currentPriorityRunnable}, Runnable),
            case (not ((get({This, currentPriorityRunnable}) =:= get({get({This, threadObjectUtil}), 'NULL_PRIORITY_RUNNABLE'})))) of
                true ->
                (get({get({This, currentPriorityRunnable}), '$class'})):reset(get({This, currentPriorityRunnable})),
                (get({get({This, currentPriorityRunnable}), '$class'})):run(get({This, currentPriorityRunnable}));
                false -> ok
            end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
runATask(This) ->
        Runnable = (get({This, '$class'})):getTask(This),
        case (Runnable =/= undefined) of
            true ->
            (get({Runnable, '$class'})):run(Runnable);
            false -> ok
        end.

init(This) ->
        case (not get({This, isAlive})) of
            true ->
            put({This, isAlive}, true),
            put({This, taskQueue}, 'BasicArrayListD':new());
            false -> ok
        end.

runTaskWithPriority(This, Task) ->
        case (not get({This, isAlive})) of
            true ->
            (get({This, '$class'})):init(This);
            false -> ok
        end,
        case (Task =/= undefined) of
            true ->
            Size = (get({get({This, taskQueue}), '$class'})):size(get({This, taskQueue})),
            put({local, runnable}, undefined),
            put({local, lowerPriorityRunnable}, get({get({This, threadObjectUtil}), 'NULL_PRIORITY_RUNNABLE'})),
            lists:foreach(fun(Index) ->
                put({local, runnable}, (get({get({This, taskQueue}), '$class'})):get(get({This, taskQueue}), Index)),
                case ((get({get({local, runnable}), '$class'})):getPriority(get({local, runnable})) > (get({Task, '$class'})):getPriority(Task)) of
                    true ->
                    put({local, lowerPriorityRunnable}, get({local, runnable})),
                    throw('$break');
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            case (get({local, lowerPriorityRunnable}) =:= get({get({This, threadObjectUtil}), 'NULL_PRIORITY_RUNNABLE'})) of
                true ->
                (get({get({This, taskQueue}), '$class'})):add(get({This, taskQueue}), Task);
                false ->
                put({local, index}, (get({get({This, taskQueue}), '$class'})):indexOf(get({This, taskQueue}), get({local, lowerPriorityRunnable}))),
                (get({get({This, taskQueue}), '$class'})):addAt(get({This, taskQueue}), get({local, index}), Task)
            end;
            false -> ok
        end.

runTask(This, Task) ->
        case (not get({This, isAlive})) of
            true ->
            (get({This, '$class'})):init(This);
            false -> ok
        end,
        case (Task =/= undefined) of
            true ->
            (get({get({This, taskQueue}), '$class'})):add(get({This, taskQueue}), Task);
            false -> ok
        end.

% throws InterruptedException
getTask(This) ->
        try
        case (get({get({This, taskQueue}), '$class'})):isEmpty(get({This, taskQueue})) of
            true ->
            throw({'$return', get({This, 'NULL_RUNNABLE'})});
            false -> ok
        end,
        (get({get({This, taskQueue}), '$class'})):removeAt(get({This, taskQueue}), 0)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

clear(This) ->
        (get({get({This, taskQueue}), '$class'})):clear(get({This, taskQueue})).

close(This) ->
        case get({This, isAlive}) of
            true ->
            put({This, isAlive}, false),
            (get({get({This, taskQueue}), '$class'})):clear(get({This, taskQueue})),
            put({This, currentPriorityRunnable}, get({get({This, threadObjectUtil}), 'NULL_PRIORITY_RUNNABLE'}));
            false -> ok
        end.

join(This) ->
        put({This, isAlive}, false),
        (get({get({This, taskQueue}), '$class'})):clear(get({This, taskQueue})),
        put({This, currentPriorityRunnable}, get({get({This, threadObjectUtil}), 'NULL_PRIORITY_RUNNABLE'})).

isBusy(This) ->
        try
        case (not get({This, isAlive})) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        case ((get({get({This, taskQueue}), '$class'})):size(get({This, taskQueue})) > 0) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        case get({This, runningTask}) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

threadStarted(This) ->
        ok.

threadStopped(This) ->
        case (get({This, numThreads}) =:= 1) of
            true ->
            put({This, isAlive}, false),
            (get({get({This, taskQueue}), '$class'})):clear(get({This, taskQueue})),
            put({This, currentPriorityRunnable}, get({get({This, threadObjectUtil}), 'NULL_PRIORITY_RUNNABLE'}));
            false -> ok
        end.

startTask(This, Task) ->
        ok.

completedTask(This, Task) ->
        ok.

