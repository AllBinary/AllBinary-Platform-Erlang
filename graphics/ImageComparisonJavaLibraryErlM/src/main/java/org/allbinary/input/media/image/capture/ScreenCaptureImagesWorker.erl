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
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.util.event.handler.BasicEventHandler
% import org.allbinary.media.image.cache.BufferedImageFrameCacheable
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings
% import org.allbinary.time.TimeDelayHelper

-module('ScreenCaptureImagesWorker').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements CaptureWorkerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicEventHandler', Function, Arguments).

static_init() ->
    put({?MODULE, index}, 0),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, running}, false),
    put({This, screenScavangerRobot}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'BasicEventHandler':'$init'(This),
    init_fields(This),
        put({This, screenScavangerRobot}, 'ScreenScavangerRobot':new()),
        put({'ScreenCaptureImagesWorker', index}, 'ProcessingFrameIndexFactory':next()).

isRunning(This) ->
        get({This, running}).

setRunning(This, Running) when is_boolean(Running) ->
        put({This, running}, Running).

% throws Exception
setThread(This, Thread) ->
        ok.

run(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'RUN'})),
            (get({This, '$class'})):setRunning(This, true),
            TimeHelper = 'TimeDelayHelper':new(1000),
            (fun Loop() -> case (get({This, '$class'})):isRunning(This) of true ->
                (get({TimeHelper, '$class'})):setStartTimeTNT(TimeHelper),
                BufferedImage = array:get(0, (get({get({This, screenScavangerRobot}), '$class'})):getScreenAsBufferedImages(get({This, screenScavangerRobot}))),
                Frame = get({'ScreenCaptureImagesWorker', index}),
                put({'ScreenCaptureImagesWorker', index}, get({'ScreenCaptureImagesWorker', index}) + 1),
                (fun(Target_N66595) -> (get({Target_N66595, '$class'})):add(Target_N66595, 'BufferedImageFrameCacheable':new(BufferedImage, Frame)) end)('CapturedBufferedImagesCacheSingleton':getInstance()),
                CapturedImageEvent = 'CapturedImageWorkerResultsEvent':new(This, Frame, BufferedImage),
                (get({This, '$class'})):fireEvent(This, CapturedImageEvent),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({'CommonLabels':getInstance(), 'ELAPSED'}) + (get({TimeHelper, '$class'})):getElapsedTNT(TimeHelper)), This, get({get({This, commonStrings}), 'RUN'})),
                (get({This, '$class'})):setRunning(This, false),
                Loop();
            false -> ok end end)(),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END'}), This, get({get({This, commonStrings}), 'RUN'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'RUN'}), E)
        end.

