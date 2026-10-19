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
% package org.allbinary.input.automation.module
% import org.allbinary.input.media.image.capture.CaptureWorkerInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.media.image.comparison.ImageComparisonWorker
% import org.allbinary.media.image.comparison.motion.MotionRectanglesWorker
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings
% import org.allbinary.thread.RunnableInterface
% import org.allbinary.time.TimeDelayHelper

-module('AbstractInputAutomationWorker').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements RunnableInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, index}, 0),
    put({This, running}, false),
    put({This, inputAutomationActionInterface}, undefined),
    put({This, captureWorkerInterface}, undefined),
    put({This, imageComparisonWorker}, undefined),
    put({This, motionRectanglesWorker}, undefined),
    put({This, captureThread}, undefined),
    ok.


new(InputAutomationActionInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, InputAutomationActionInterface),
    This.

init(This, InputAutomationActionInterface) ->
    init_fields(This),
        ok.

% throws Exception
setThread(This, Thread) ->
        ok.

isRunning(This) ->
        get({This, running}).

setRunning(This, Running) when is_boolean(Running) ->
        put({This, running}, Running).

isAnyDataWorkerRunning(This) ->
        try
        case ((get({This, captureThread}) =/= undefined) andalso (((((get({get({This, captureThread}), '$class'})):isAlive(get({This, captureThread})) orelse (fun(Target_N66446) -> (get({Target_N66446, '$class'})):isRunning(Target_N66446) end)((get({This, '$class'})):getCaptureWorker(This))) orelse (fun(Target_N66466) -> (get({Target_N66466, '$class'})):isRunning(Target_N66466) end)((get({This, '$class'})):getMotionRectanglesWorker(This))) orelse (fun(Target_N66486) -> (get({Target_N66486, '$class'})):isRunning(Target_N66486) end)((get({This, '$class'})):getImageComparisonWorker(This))))) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
startDataWorkers(This) ->
        case (not (get({This, '$class'})):isAnyDataWorkerRunning(This)) of
            true ->
            put({This, captureThread}, 'Thread':new((get({This, '$class'})):getCaptureWorker(This))),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Starting CaptureWorkers - Need more images - Thread State: ", (fun(Target_N66660) -> (get({Target_N66660, '$class'})):toString(Target_N66660) end)((get({get({This, captureThread}), '$class'})):getState(get({This, captureThread})))]), This, "startCaptureWorkers"),
            (get({get({This, captureThread}), '$class'})):start(get({This, captureThread}));
            false -> ok
        end.

% throws Exception
waitForDataWorkers(This) ->
        (fun Loop() -> case (get({This, '$class'})):isAnyDataWorkerRunning(This) of true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Waiting", This, get({get({This, commonStrings}), 'RUN'})),
            timer:sleep(250),
            Loop();
        false -> ok end end)().

% throws Exception
stopDataWorkers(This) ->
        (fun(Target_N66905) -> (get({Target_N66905, '$class'})):setRunning(Target_N66905, false) end)((get({This, '$class'})):getCaptureWorker(This)).

% throws Exception
process(This) ->
        erlang:error({'RuntimeException'}).

run(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'RUN'})),
            (get({This, '$class'})):setRunning(This, true),
            TimeHelper = 'TimeDelayHelper':new(1000),
            (fun Loop() -> case (get({This, '$class'})):isRunning(This) of true ->
                (get({TimeHelper, '$class'})):setStartTimeTNT(TimeHelper),
                (get({This, '$class'})):process(This),
                put({This, index}, get({This, index}) + 1),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([(get({'CommonLabels':getInstance(), 'ELAPSED'}) + (get({TimeHelper, '$class'})):getElapsedTNT(TimeHelper)), " Index: "]), get({This, index})]), This, get({get({This, commonStrings}), 'RUN'})),
                Loop();
            false -> ok end end)(),
            (get({This, '$class'})):stopDataWorkers(This),
            (get({This, '$class'})):waitForDataWorkers(This),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END'}), This, get({get({This, commonStrings}), 'RUN'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'RUN'}), E)
        end.

getInputAutomationActionInterface(This) ->
        get({This, inputAutomationActionInterface}).

setInputAutomationActionInterface(This, InputAutomationActionInterface) ->
        put({This, inputAutomationActionInterface}, InputAutomationActionInterface).

getCaptureWorker(This) ->
        get({This, captureWorkerInterface}).

setCaptureWorker(This, CaptureWorkerInterface) ->
        put({This, captureWorkerInterface}, CaptureWorkerInterface).

getImageComparisonWorker(This) ->
        get({This, imageComparisonWorker}).

setImageComparisonWorker(This, ImageComparisonWorker) ->
        put({This, imageComparisonWorker}, ImageComparisonWorker).

getMotionRectanglesWorker(This) ->
        get({This, motionRectanglesWorker}).

setMotionRectanglesWorker(This, MotionRectanglesWorker) ->
        put({This, motionRectanglesWorker}, MotionRectanglesWorker).

