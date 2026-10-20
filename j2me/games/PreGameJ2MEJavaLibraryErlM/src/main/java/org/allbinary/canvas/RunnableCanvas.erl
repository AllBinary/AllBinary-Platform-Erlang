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
% package org.allbinary.canvas
% import javax.microedition.lcdui.CommandListener
% import org.allbinary.TsUtil
% import org.allbinary.game.displayable.canvas.NullWaitGameRunnable
% import org.allbinary.graphics.displayable.MyCanvas
% import org.allbinary.logic.ABSystemWrapper
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings
% import org.allbinary.thread.NullThread
% import org.allbinary.thread.RunnableInterface
% import org.allbinary.thread.ThreadObjectUtil
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.BasicArrayList

-module('RunnableCanvas').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements RunnableInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('MyCanvas', Function, Arguments).

init_fields(This) ->
    put({This, nullUtil}, 'NullUtil':getInstance()),
    put({This, stdUtil}, 'StdUtil':getInstance()),
    put({This, systemWrapper}, 'ABSystemWrapper':getInstance()),
    put({This, tsUtil}, 'TsUtil':getInstance()),
    put({This, thread}, get({'NullThread', 'NULL_THREAD'})),
    put({This, currentThread}, get({'NullThread', 'NULL_THREAD'})),
    put({This, running}, false),
    put({This, loopTimeHelper}, 'TimeDelayHelper':new(get({'NullWaitGameRunnable':getInstance(), 'WAIT'}))),
    put({This, runnableCanvasRefreshHelper}, 'Processor':getInstance()),
    put({This, commonLabels}, 'CommonLabels':getInstance()),
    put({This, threadObjectUtil}, 'ThreadObjectUtil':getInstance()),
    put({This, 'SET_RUNNING'}, "setRunning"),
    put({This, 'IS_RUNNING'}, "isRunning"),
    put({This, 'THREAD'}, "Thread: "),
    put({This, 'NOT_EQUAL'}, " != "),
    put({This, 'PAUSE_SLEEP'}, "pause sleep"),
    put({This, 'START_PAUSE'}, "start pause - game thread sleep at: "),
    put({This, 'END_PAUSE'}, "end pause - game thread sleep at: "),
    put({This, 'PROCESS_LOOP_SLEEP'}, "processLoopSleep"),
    put({This, pauseWait}, 0),
    put({This, notified}, false),
    ok.


new(CommandListener, ChildNameList, HasParam) when is_boolean(HasParam) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CommandListener, ChildNameList, HasParam),
    This.

'$init'(This, CommandListener, ChildNameList, HasParam) when is_boolean(HasParam) ->
        'MyCanvas':'$init'(This, get({'CommonStrings':getInstance(), 'UNKNOWN'}), ChildNameList),
        init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66948) -> (get({Target_N66948, '$class'})):toString(Target_N66948) end)((fun(Target_N66955) -> (get({Target_N66955, '$class'})):appendint(Target_N66955, trunc(get({get({This, loopTimeHelper}), delay}))) end)((fun(Target_N66962) -> (get({Target_N66962, '$class'})):append(Target_N66962, "RunnableCanvas delay: ") end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        put({This, runnableCanvasRefreshHelper}, 'RunnableCanvasRefreshHelper':new(This)),
        case (CommandListener =/= undefined) of
            true ->
            (get({This, '$class'})):initCommands(This, CommandListener);
            false ->
            case HasParam of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "commandListener was null", This, "initCommands");
            false -> ok
        end
        end.

initCommands(This, CmdListener) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'NOT_IMPLEMENTED'}), This, "initCommands").

isMainCanvas(This) ->
        try
        case ((get({This, '$class'})):getCustomCommandListener(This) =/= undefined) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setThread(This, Thread) ->
        put({This, thread}, Thread).

setRunning(This, Running) when is_boolean(Running) ->
        put({This, running}, Running),
        case (not get({This, running})) of
            true ->
            put({This, thread}, get({'NullThread', 'NULL_THREAD'})),
            begin % synchronized
                (get({get({This, threadObjectUtil}), '$class'})):notifyObject(get({This, threadObjectUtil}), This)
            end;
            false -> ok
        end,
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67707) -> (get({Target_N67707, '$class'})):toString(Target_N67707) end)((fun(Target_N67714) -> (get({Target_N67714, '$class'})):appendboolean(Target_N67714, get({This, running})) end)((fun(Target_N67721) -> (get({Target_N67721, '$class'})):append(Target_N67721, get({This, 'IS_RUNNING'})) end)('StringMaker':new()))), This, get({This, 'SET_RUNNING'})).

isRunning(This) ->
        try
        case (get({This, thread}) =:= get({This, currentThread})) of
            true ->
            throw({'$return', get({This, running})});
            false ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'THREAD'})),
            case (get({This, thread}) =/= undefined) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, thread}), '$class'})):toString(get({This, thread})));
                false -> ok
            end,
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'NOT_EQUAL'})),
            case (get({This, currentThread}) =/= undefined) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N68108) -> (get({Target_N68108, '$class'})):toString(Target_N68108, get({This, currentThread})) end)('StringUtil':getInstance()));
                false -> ok
            end,
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({This, 'IS_RUNNING'})),
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getLoopTimeHelperP(This) ->
        get({This, loopTimeHelper}).

setWait(This, Wait) when is_integer(Wait) ->
        put({get({This, loopTimeHelper}), delay}, Wait),
        put({This, pauseWait}, (Wait * 3)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68469) -> (get({Target_N68469, '$class'})):toString(Target_N68469) end)((fun(Target_N68476) -> (get({Target_N68476, '$class'})):appendint(Target_N68476, trunc(get({get({This, loopTimeHelper}), delay}))) end)((fun(Target_N68483) -> (get({Target_N68483, '$class'})):append(Target_N68483, "setWait - delay: ") end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})).

getWait(This) ->
        get({get({This, loopTimeHelper}), delay}).

setCurrentThread(This) ->
        put({This, currentThread}, 'Thread':currentThread()).

setCurrentThreadFake(This) ->
        put({This, currentThread}, get({This, thread})).

showNotify(This) ->
        try
            (get({This, '$class'})):stopWaiting(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "showNotify", E)
        end.

% throws Exception
stopWaiting(This) ->
        put({This, notified}, true),
        begin % synchronized
            (get({get({This, threadObjectUtil}), '$class'})):notifyObject(get({This, threadObjectUtil}), This)
        end,
        (get({This, '$class'})):repaint(This).

% throws Exception
waitOnNotify(This, Wait) when is_integer(Wait) ->
        case (not get({This, notified})) of
            true ->
            case (Wait > 0) of
                true ->
                (get({get({This, threadObjectUtil}), '$class'})):waitObjectFor(get({This, threadObjectUtil}), This, Wait);
                false ->
                (get({get({This, threadObjectUtil}), '$class'})):waitObject(get({This, threadObjectUtil}), This)
            end;
            false -> ok
        end.

% throws Exception
processSleep(This) ->
        timer:sleep(get({This, pauseWait})).

isPausable(This) ->
        false.

% throws Exception
processGameSleep(This, Sleep) when is_integer(Sleep) ->
        timer:sleep(Sleep).

% throws Exception
processLoopSleep(This) ->
        try
        (get({get({This, runnableCanvasRefreshHelper}), '$class'})):process(get({This, runnableCanvasRefreshHelper})),
        case (get({This, '$class'})):isPaused(This) of
            true ->
            StringMaker = 'StringMaker':new(),
            case ((get({This, '$class'})):isRunning(This) andalso (not (get({This, '$class'})):isSingleThread(This))) of
                true ->
                (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                CurrentTimeMillis = (get({get({This, systemWrapper}), '$class'})):currentTimeMillis(get({This, systemWrapper})),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69709) -> (get({Target_N69709, '$class'})):toString(Target_N69709) end)((fun(Target_N69716) -> (get({Target_N69716, '$class'})):appendlong(Target_N69716, get({This, pauseWait})) end)((fun(Target_N69723) -> (get({Target_N69723, '$class'})):append(Target_N69723, get({This, 'PAUSE_SLEEP'})) end)((fun(Target_N69730) -> (get({Target_N69730, '$class'})):appendlong(Target_N69730, CurrentTimeMillis) end)((get({StringMaker, '$class'})):append(StringMaker, get({This, 'START_PAUSE'})))))), This, get({This, 'PROCESS_LOOP_SLEEP'})),
                (fun Loop() -> case (((get({This, '$class'})):isPaused(This) andalso (get({This, '$class'})):isRunning(This)) andalso (not (get({This, '$class'})):isSingleThread(This))) of true ->
                    (get({This, '$class'})):processSleep(This),
                    case (not (get({This, '$class'})):isPausable(This)) of
                        true ->
                        (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69940) -> (get({Target_N69940, '$class'})):toString(Target_N69940) end)((fun(Target_N69947) -> (get({Target_N69947, '$class'})):appendlong(Target_N69947, CurrentTimeMillis) end)((get({StringMaker, '$class'})):append(StringMaker, get({This, 'END_PAUSE'})))), This, get({This, 'PROCESS_LOOP_SLEEP'})),
                        throw({'$return', ok});
                        false -> ok
                    end,
                    Loop();
                false -> ok end end)();
                false -> ok
            end;
            false -> ok
        end,
        put({local, elapsedTime}, (get({get({This, loopTimeHelper}), '$class'})):getElapsedTNT(get({This, loopTimeHelper}))),
        Wait = trunc(get({get({This, loopTimeHelper}), delay})),
        case (get({local, elapsedTime}) > Wait) of
            true ->
            put({local, elapsedTime}, Wait);
            false ->
            (get({This, '$class'})):processGameSleep(This, (Wait - get({local, elapsedTime})))
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isSingleThread(This) ->
        false.

run(This) ->
        (get({This, '$class'})):setCurrentThread(This).

% throws Exception
end2(This) ->
        ok.

getType(This) ->
        (-1).

