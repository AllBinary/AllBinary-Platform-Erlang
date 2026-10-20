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
% package org.allbinary.media.image.comparison
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings
% import org.allbinary.time.TimeDelayHelper

-module('SaveImageComparisonWorker').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ImageComparisonResultsListener

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, running}, false),
    put({This, imageComparisonInfoVector}, 'BasicArrayListD':new()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

onImageComparisonResultsEvent(This, ImageComparisonResultsEvent) ->
        (get({get({This, imageComparisonInfoVector}), '$class'})):add(get({This, imageComparisonInfoVector}), ImageComparisonResultsEvent),
        (get({This, '$class'})):run(This).

onEvent(This, AllBinaryEventObject) ->
        (get({This, '$class'})):onImageComparisonResultsEvent(This, AllBinaryEventObject).

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
            ImageComparisonResultsEvent = (get({get({This, imageComparisonInfoVector}), '$class'})):get(get({This, imageComparisonInfoVector}), 0),
            ImageComparisonInfo = (get({ImageComparisonResultsEvent, '$class'})):getImageComparisonResult(ImageComparisonResultsEvent),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({ImageComparisonInfo, '$class'})):toString(ImageComparisonInfo), This, get({get({This, commonStrings}), 'RUN'})),
            (fun(Target_N66692) -> (get({Target_N66692, '$class'})):save(Target_N66692, ImageComparisonInfo, (get({ImageComparisonInfo, '$class'})):getFrameTwo(ImageComparisonInfo)) end)('ComparisonImageInputOutput':new()),
            (get({get({This, imageComparisonInfoVector}), '$class'})):remove(get({This, imageComparisonInfoVector}), ImageComparisonInfo),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({'CommonLabels':getInstance(), 'ELAPSED'}) + (get({TimeHelper, '$class'})):getElapsedTNT(TimeHelper)), This, get({get({This, commonStrings}), 'RUN'})),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END'}), This, get({get({This, commonStrings}), 'RUN'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'RUN'}), E)
        end.

