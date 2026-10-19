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
% package org.allbinary.input.media.image.capture
% import java.awt.image.BufferedImage
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.handler.BasicEventHandler
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings
% import org.allbinary.time.TimeDelayHelper

-module('SaveCapturedImageWorker').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CapturedImageWorkerResultsListener

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicEventHandler', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, running}, false),
    put({This, capturedImageWorkerResultsEventVector}, 'BasicArrayListD':new()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'BasicEventHandler':init(This),
    init_fields(This),
        ok.

isRunning(This) ->
        get({This, running}).

setRunning(This, Running) when is_boolean(Running) ->
        put({This, running}, Running).

onCaptureEvent(This, CapturedImageEvent) ->
        (get({get({This, capturedImageWorkerResultsEventVector}), '$class'})):add(get({This, capturedImageWorkerResultsEventVector}), CapturedImageEvent),
        (get({This, '$class'})):run(This).

onEvent(This, AllBinaryEventObject) ->
        (get({This, '$class'})):onCaptureEvent(This, AllBinaryEventObject).

run(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'RUN'})),
            (get({This, '$class'})):setRunning(This, true),
            TimeHelper = 'TimeDelayHelper':new(1000),
            (get({TimeHelper, '$class'})):setStartTimeTNT(TimeHelper),
            CapturedImageWorkerResultsEvent = ((get({get({This, capturedImageWorkerResultsEventVector}), '$class'})):get(get({This, capturedImageWorkerResultsEventVector}), 0)),
            ScreenBufferedImage = (get({CapturedImageWorkerResultsEvent, '$class'})):getBufferedImage(CapturedImageWorkerResultsEvent),
            (fun(Target_N66678) -> (get({Target_N66678, '$class'})):save(Target_N66678, ScreenBufferedImage, (get({CapturedImageWorkerResultsEvent, '$class'})):getFrame(CapturedImageWorkerResultsEvent)) end)('CapturedImageInputOutput':new()),
            (get({get({This, capturedImageWorkerResultsEventVector}), '$class'})):remove(get({This, capturedImageWorkerResultsEventVector}), CapturedImageWorkerResultsEvent),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({'CommonLabels':getInstance(), 'ELAPSED'}) + (get({TimeHelper, '$class'})):getElapsedTNT(TimeHelper)), This, get({get({This, commonStrings}), 'RUN'})),
            (get({This, '$class'})):setRunning(This, false),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END'}), This, get({get({This, commonStrings}), 'RUN'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'RUN'}), E)
        end.

