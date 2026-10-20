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
% import org.allbinary.input.media.image.capture.CapturedImageWorkerResultsEvent
% import org.allbinary.input.media.image.capture.CapturedImageWorkerResultsListener
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.handler.BasicEventHandler
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings
% import org.allbinary.time.TimeDelayHelper

-module('ImageComparisonWorker').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CapturedImageWorkerResultsListener

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicEventHandler', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, bufferedImageVector}, 'BasicArrayListD':new()),
    put({This, imageComparatorConstraintsInterface}, undefined),
    put({This, imageComparator}, undefined),
    put({This, running}, false),
    put({This, index2}, 0),
    ok.


new(ImageComparatorConstraintsInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ImageComparatorConstraintsInterface),
    This.

'$init'(This, ImageComparatorConstraintsInterface) ->
    'BasicEventHandler':'$init'(This),
    init_fields(This),
        put({This, imageComparatorConstraintsInterface}, ImageComparatorConstraintsInterface),
        put({This, imageComparator}, 'ImageComparator':new(ImageComparatorConstraintsInterface)).

isRunning(This) ->
        get({This, running}).

setRunning(This, Running) when is_boolean(Running) ->
        put({This, running}, Running).

onCaptureEvent(This, CapturedImageWorkerResultsEvent) ->
        (get({get({This, bufferedImageVector}), '$class'})):add(get({This, bufferedImageVector}), CapturedImageWorkerResultsEvent),
        case ((get({get({This, bufferedImageVector}), '$class'})):size(get({This, bufferedImageVector})) > 1) of
            true ->
            (get({This, '$class'})):run(This);
            false -> ok
        end.

onEvent(This, AllBinaryEventObject) ->
        (get({This, '$class'})):onCaptureEvent(This, AllBinaryEventObject).

run(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'RUN'})),
            (get({This, '$class'})):setRunning(This, true),
            TimeHelper = 'TimeDelayHelper':new(1000),
            (get({TimeHelper, '$class'})):setStartTimeTNT(TimeHelper),
            case (get({get({This, imageComparatorConstraintsInterface}), '$class'})):isFrameAllowed(get({This, imageComparatorConstraintsInterface}), get({This, index2})) of
                true ->
                CapturedImageWorkerResultsEvent = array:new(2, {default, undefined}),
                array:set(0, (get({get({This, bufferedImageVector}), '$class'})):get(get({This, bufferedImageVector}), 0), CapturedImageWorkerResultsEvent),
                array:set(1, (get({get({This, bufferedImageVector}), '$class'})):get(get({This, bufferedImageVector}), 1), CapturedImageWorkerResultsEvent),
                case ((get({get({This, imageComparatorConstraintsInterface}), '$class'})):isImageValid(get({This, imageComparatorConstraintsInterface}), (fun(Target_N67160) -> (get({Target_N67160, '$class'})):getBufferedImage(Target_N67160) end)(array:get(0, CapturedImageWorkerResultsEvent))) andalso (get({get({This, imageComparatorConstraintsInterface}), '$class'})):isImageValid(get({This, imageComparatorConstraintsInterface}), (fun(Target_N67206) -> (get({Target_N67206, '$class'})):getBufferedImage(Target_N67206) end)(array:get(1, CapturedImageWorkerResultsEvent)))) of
                    true ->
                    ImageComparisonResult = (get({get({This, imageComparator}), '$class'})):compare(get({This, imageComparator}), (fun(Target_N67335) -> (get({Target_N67335, '$class'})):getBufferedImage(Target_N67335) end)(array:get(0, CapturedImageWorkerResultsEvent)), (fun(Target_N67359) -> (get({Target_N67359, '$class'})):getBufferedImage(Target_N67359) end)(array:get(1, CapturedImageWorkerResultsEvent)), (fun(Target_N67383) -> (get({Target_N67383, '$class'})):getFrame(Target_N67383) end)(array:get(0, CapturedImageWorkerResultsEvent)), (fun(Target_N67407) -> (get({Target_N67407, '$class'})):getFrame(Target_N67407) end)(array:get(1, CapturedImageWorkerResultsEvent)), 0),
                    Frame = (fun(Target_N67471) -> (get({Target_N67471, '$class'})):getFrame(Target_N67471) end)(array:get(1, CapturedImageWorkerResultsEvent)),
                    ImageComparisonResultFrameCacheable = 'ImageComparisonResultFrameCacheable':new(ImageComparisonResult, Frame),
                    (fun(Target_N67579) -> (get({Target_N67579, '$class'})):add(Target_N67579, ImageComparisonResultFrameCacheable) end)('ImageComparisonResultCacheSingleton':getInstance()),
                    (get({This, '$class'})):fireEvent(This, 'ImageComparisonResultsEvent':new(This, ImageComparisonResult)),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67682) -> (get({Target_N67682, '$class'})):toString(Target_N67682) end)((fun(Target_N67689) -> (get({Target_N67689, '$class'})):appendlong(Target_N67689, Frame) end)((fun(Target_N67696) -> (get({Target_N67696, '$class'})):append(Target_N67696, " for frame: ") end)((fun(Target_N67703) -> (get({Target_N67703, '$class'})):append(Target_N67703, (get({ImageComparisonResult, '$class'})):toString(ImageComparisonResult)) end)((fun(Target_N67710) -> (get({Target_N67710, '$class'})):append(Target_N67710, "Image Comparison Result: ") end)('StringMaker':new()))))), This, get({get({This, commonStrings}), 'RUN'}));
                    false ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "An Image Was Not Valid: Image Worker Event Processing terminated", This, get({get({This, commonStrings}), 'RUN'}))
                end;
                false -> ok
            end,
            (get({get({This, bufferedImageVector}), '$class'})):remove(get({This, bufferedImageVector}), 0),
            put({This, index2}, get({This, index2}) + 1),
            Message = (fun(Target_N67881) -> (get({Target_N67881, '$class'})):toString(Target_N67881) end)((fun(Target_N67888) -> (get({Target_N67888, '$class'})):appendlong(Target_N67888, trunc((get({TimeHelper, '$class'})):getElapsedTNT(TimeHelper))) end)((fun(Target_N67895) -> (get({Target_N67895, '$class'})):append(Target_N67895, get({'CommonLabels':getInstance(), 'ELAPSED'})) end)((fun(Target_N67902) -> (get({Target_N67902, '$class'})):appendint(Target_N67902, get({This, index2})) end)((fun(Target_N67909) -> (get({Target_N67909, '$class'})):append(Target_N67909, "Frame: ") end)('StringMaker':new()))))),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Message, This, get({get({This, commonStrings}), 'RUN'})),
            (get({This, '$class'})):setRunning(This, false),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END'}), This, get({get({This, commonStrings}), 'RUN'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'RUN'}), E)
        end.

