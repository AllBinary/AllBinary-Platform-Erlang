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
% package org.allbinary.media.image.search
% import java.awt.image.BufferedImage
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.handler.BasicEventHandler
% import org.allbinary.media.image.comparison.ImageComparisonResult
% import org.allbinary.media.image.comparison.ImageComparisonResultsEvent
% import org.allbinary.media.image.comparison.ImageComparisonResultsListener
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings
% import org.allbinary.time.TimeDelayHelper

-module('ImageComparisonSearchWorker').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ImageComparisonResultsListener

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicEventHandler', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, imageComparisonInfoVector}, undefined),
    put({This, index}, 0),
    put({This, running}, false),
    put({This, imageSearchConstraintsInterface}, undefined),
    ok.


new(ImageSearchConstraintsInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ImageSearchConstraintsInterface),
    This.

init(This, ImageSearchConstraintsInterface) ->
    'BasicEventHandler':init(This),
    init_fields(This),
        put({This, imageComparisonInfoVector}, 'BasicArrayListD':new()),
        put({This, imageSearchConstraintsInterface}, ImageSearchConstraintsInterface).

onImageComparisonResultsEvent(This, ImageComparisonResultsEvent) ->
        (get({get({This, imageComparisonInfoVector}), '$class'})):add(get({This, imageComparisonInfoVector}), (get({ImageComparisonResultsEvent, '$class'})):getImageComparisonResult(ImageComparisonResultsEvent)),
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
            ImageComparisonInfo = (get({get({This, imageComparisonInfoVector}), '$class'})):get(get({This, imageComparisonInfoVector}), 0),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({ImageComparisonInfo, '$class'})):toString(ImageComparisonInfo), This, get({get({This, commonStrings}), 'RUN'})),
            LatestBufferedImage = array:get(1, (get({ImageComparisonInfo, '$class'})):getBufferedImages(ImageComparisonInfo)),
            (get({get({This, imageComparisonInfoVector}), '$class'})):remove(get({This, imageComparisonInfoVector}), ImageComparisonInfo),
            put({This, index}, get({This, index}) + 1),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({'CommonLabels':getInstance(), 'ELAPSED'}) + (get({TimeHelper, '$class'})):getElapsedTNT(TimeHelper)), This, get({get({This, commonStrings}), 'RUN'})),
            (get({This, '$class'})):setRunning(This, false),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END'}), This, get({get({This, commonStrings}), 'RUN'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'RUN'}), E)
        end.

