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
% package org.allbinary.media.image.comparison.motion
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings
% import org.allbinary.time.TimeDelayHelper

-module('SaveMotionRectanglesResultsWorker').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements MotionRectanglesResultsListener

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, running}, false),
    put({This, motionRectanglesVector}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        put({This, motionRectanglesVector}, 'BasicArrayListD':new()).

getMotionRectanglesVector(This) ->
        get({This, motionRectanglesVector}).

onMotionRectanglesImageComparisonResultsEvent(This, MotionRectanglesResultsEvent) ->
        (fun(Target_N66090) -> (get({Target_N66090, '$class'})):add(Target_N66090, MotionRectanglesResultsEvent) end)((get({This, '$class'})):getMotionRectanglesVector(This)),
        (get({This, '$class'})):run(This).

onEvent(This, AllBinaryEventObject) ->
        (get({This, '$class'})):onMotionRectanglesImageComparisonResultsEvent(This, AllBinaryEventObject).

isRunning(This) ->
        get({This, running}).

setRunning(This, Running) when is_boolean(Running) ->
        put({This, running}, Running).

run(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'RUN'})),
            (get({This, '$class'})):setRunning(This, true),
            TimeHelper = 'TimeDelayHelper':new(1000),
            (get({TimeHelper, '$class'})):setStartTimeTNT(TimeHelper),
            MotionRectanglesResultsEvent = (fun(Target_N66559) -> (get({Target_N66559, '$class'})):get(Target_N66559, 0) end)((get({This, '$class'})):getMotionRectanglesVector(This)),
            MotionRectangles = (get({MotionRectanglesResultsEvent, '$class'})):getMotionRectangles(MotionRectanglesResultsEvent),
            (fun(Target_N66656) -> (get({Target_N66656, '$class'})):save(Target_N66656, MotionRectangles, (get({MotionRectanglesResultsEvent, '$class'})):getFrame(MotionRectanglesResultsEvent)) end)('MotionRectanglesImageInputOutput':new()),
            (fun(Target_N66707) -> (get({Target_N66707, '$class'})):remove(Target_N66707, MotionRectangles) end)((get({This, '$class'})):getMotionRectanglesVector(This)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({'CommonLabels':getInstance(), 'ELAPSED'}) + (get({TimeHelper, '$class'})):getElapsedTNT(TimeHelper)), This, get({get({This, commonStrings}), 'RUN'})),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END'}), This, get({get({This, commonStrings}), 'RUN'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'RUN'}), E)
        end.

