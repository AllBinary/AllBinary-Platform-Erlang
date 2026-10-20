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
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.util.BasicArrayListUtil

-module('ThreadPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'ROOT_NAME'}, "-PooledThread-"),
    put({?MODULE, 'NORMAL_PRIORITY'}, get({'Thread', 'NORM_PRIORITY'})),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, 'NULL_RUNNABLE'}, 'NullRunnable':getInstance()),
    put({This, threadPoolStrings}, 'ThreadPoolStrings':getInstance()),
    put({This, threadObjectUtil}, 'ThreadObjectUtil':getInstance()),
    put({This, poolName}, undefined),
    put({This, priority}, 0),
    put({This, isAlive}, false),
    put({This, taskQueue}, (fun(Target_N66198) -> (get({Target_N66198, '$class'})):getImmutableInstance(Target_N66198) end)('BasicArrayListUtil':getInstance())),
    put({This, threadID}, 0),
    put({This, numThreads}, 0),
    put({This, runningTask}, false),
    ok.


new(PoolName, NumThreads, Priority) when (is_list(PoolName) orelse PoolName =:= undefined), is_integer(NumThreads), is_integer(Priority) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PoolName, NumThreads, Priority),
    This.

'$init'(This, PoolName, NumThreads, Priority) when (is_list(PoolName) orelse PoolName =:= undefined), is_integer(NumThreads), is_integer(Priority) ->
    init_fields(This),
        put({This, poolName}, PoolName),
        put({This, priority}, Priority),
        put({This, numThreads}, NumThreads).

init(This) ->
        case (not get({This, isAlive})) of
            true ->
            put({This, isAlive}, true),
            put({This, taskQueue}, 'BasicArrayListD':new()),
            put({local, pooledThread}, undefined),
            lists:foreach(fun(I) ->
                put({local, pooledThread}, 'PooledThread':new(This)),
                (get({get({local, pooledThread}), '$class'})):setPriority(get({local, pooledThread}), get({This, priority})),
                (get({get({local, pooledThread}), '$class'})):start(get({local, pooledThread}))
            end, lists:seq(0, get({This, numThreads}) - 1));
            false -> ok
        end.

% throws Exception
runAPriorityTask(This) ->
        erlang:error({'RuntimeException'}).

runTaskWithPriority(This, Task) ->
        begin % synchronized
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
                end,
                (get({This, '$class'})):notify(This);
                false -> ok
            end
        end.

runTask(This, Task) ->
        begin % synchronized
            case (not get({This, isAlive})) of
                true ->
                (get({This, '$class'})):init(This);
                false -> ok
            end,
            case (Task =/= undefined) of
                true ->
                (get({get({This, taskQueue}), '$class'})):add(get({This, taskQueue}), Task),
                (get({This, '$class'})):notify(This);
                false -> ok
            end
        end.

% throws InterruptedException
getTask(This) ->
        try
        begin % synchronized
            (fun Loop() -> case ((get({get({This, taskQueue}), '$class'})):size(get({This, taskQueue})) =:= 0) of true ->
                case (not get({This, isAlive})) of
                    true ->
                    throw({'$return', get({This, 'NULL_RUNNABLE'})});
                    false -> ok
                end,
                (get({This, '$class'})):wait(This),
                Loop();
            false -> ok end end)(),
            Runnable = (get({get({This, taskQueue}), '$class'})):removeAt(get({This, taskQueue}), 0),
            throw({'$return', Runnable})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

clear(This) ->
        begin % synchronized
            case get({This, isAlive}) of
                true ->
                (get({get({This, taskQueue}), '$class'})):clear(get({This, taskQueue}));
                false -> ok
            end
        end.

close(This) ->
        begin % synchronized
            case get({This, isAlive}) of
                true ->
                put({This, isAlive}, false),
                (get({get({This, taskQueue}), '$class'})):clear(get({This, taskQueue}));
                false -> ok
            end
        end.

join(This) ->
        begin % synchronized
            put({This, isAlive}, false),
            (get({get({This, taskQueue}), '$class'})):clear(get({This, taskQueue})),
            (get({This, '$class'})):notifyAll(This)
        end.

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
            (get({get({This, taskQueue}), '$class'})):clear(get({This, taskQueue}));
            false -> ok
        end.

startTask(This, Task) ->
        ok.

completedTask(This, Task) ->
        ok.

createName(This) ->
        (fun(Target_N68637) -> (get({Target_N68637, '$class'})):toString(Target_N68637) end)((fun(Target_N68644) -> (get({Target_N68644, '$class'})):appendint(Target_N68644, allbinary_java:first(get({This, threadID}), put({This, threadID}, get({This, threadID}) + 1))) end)((fun(Target_N68651) -> (get({Target_N68651, '$class'})):append(Target_N68651, get({'ThreadPool', 'ROOT_NAME'})) end)((fun(Target_N68658) -> (get({Target_N68658, '$class'})):append(Target_N68658, get({This, poolName})) end)('StringMaker':new())))).

