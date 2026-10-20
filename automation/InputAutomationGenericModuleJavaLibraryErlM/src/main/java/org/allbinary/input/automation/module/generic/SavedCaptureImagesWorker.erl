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
% package org.allbinary.input.automation.module.generic
% import java.awt.image.BufferedImage
% import java.io.File
% import javax.imageio.ImageIO
% import org.allbinary.input.automation.module.generic.configuration.profile.SavedCaptureGenericProfileDataWorkerType
% import org.allbinary.input.media.image.capture.CaptureWorkerInterface
% import org.allbinary.input.media.image.capture.CapturedBufferedImagesCacheSingleton
% import org.allbinary.input.media.image.capture.CapturedImageWorkerResultsEvent
% import org.allbinary.input.media.image.capture.ProcessingFrameIndexFactory
% import org.allbinary.input.media.image.capture.ScreenScavangerRobot
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.java.number.LongUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.event.handler.BasicEventHandler
% import org.allbinary.logic.visual.media.MediaDataFactory
% import org.allbinary.media.image.cache.BufferedImageFrameCacheable
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings
% import org.allbinary.time.TimeDelayHelper

-module('SavedCaptureImagesWorker').
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
    put({This, savedCaptureGenericProfileDataWorkerType}, undefined),
    ok.


new(SavedCaptureGenericProfileDataWorkerType) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, SavedCaptureGenericProfileDataWorkerType),
    This.

'$init'(This, SavedCaptureGenericProfileDataWorkerType) ->
    'BasicEventHandler':'$init'(This),
    init_fields(This),
        put({This, savedCaptureGenericProfileDataWorkerType}, SavedCaptureGenericProfileDataWorkerType),
        put({This, screenScavangerRobot}, 'ScreenScavangerRobot':new()),
        put({'SavedCaptureImagesWorker', index}, 'ProcessingFrameIndexFactory':next()).

% throws Exception
setThread(This, Thread) ->
        ok.

isRunning(This) ->
        get({This, running}).

setRunning(This, Running) when is_boolean(Running) ->
        put({This, running}, Running).

run(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'RUN'})),
            (get({This, '$class'})):setRunning(This, true),
            TimeHelper = 'TimeDelayHelper':new(1000),
            (fun Loop() -> case (get({This, '$class'})):isRunning(This) of true ->
                (get({TimeHelper, '$class'})):setStartTimeTNT(TimeHelper),
                Frame = get({'SavedCaptureImagesWorker', index}),
                FilePathStringBuffer = 'StringMaker':new(),
                (get({FilePathStringBuffer, '$class'})):append(FilePathStringBuffer, (get({get({This, savedCaptureGenericProfileDataWorkerType}), '$class'})):getPath(get({This, savedCaptureGenericProfileDataWorkerType}))),
                (get({FilePathStringBuffer, '$class'})):append(FilePathStringBuffer, 'LongUtil':fillIn((get({Frame, '$class'})):toString(Frame))),
                (get({FilePathStringBuffer, '$class'})):append(FilePathStringBuffer, (fun(Target_N67143) -> (get({Target_N67143, '$class'})):getExtension(Target_N67143) end)(get({'MediaDataFactory':getInstance(), 'JPG'}))),
                FilePath = (get({FilePathStringBuffer, '$class'})):toString(FilePathStringBuffer),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Loading Image File Path: ", FilePath]), This, get({get({This, commonStrings}), 'RUN'})),
                File = 'File':new(FilePath),
                case (get({File, '$class'})):isFile(File) of
                    true ->
                    BufferedImage = 'ImageIO':read(File),
                    put({'SavedCaptureImagesWorker', index}, get({'SavedCaptureImagesWorker', index}) + 1),
                    (fun(Target_N67514) -> (get({Target_N67514, '$class'})):add(Target_N67514, 'BufferedImageFrameCacheable':new(BufferedImage, Frame)) end)('CapturedBufferedImagesCacheSingleton':getInstance()),
                    CapturedImageEvent = 'CapturedImageWorkerResultsEvent':new(This, Frame, BufferedImage),
                    (get({This, '$class'})):fireEvent(This, CapturedImageEvent);
                    false ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Could Not Load File: ", FilePath]), This, get({get({This, commonStrings}), 'RUN'}))
                end,
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({'CommonLabels':getInstance(), 'ELAPSED'}) + (get({TimeHelper, '$class'})):getElapsedTNT(TimeHelper)), This, get({get({This, commonStrings}), 'RUN'})),
                (get({This, '$class'})):setRunning(This, false),
                Loop();
            false -> ok end end)(),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END'}), This, get({get({This, commonStrings}), 'RUN'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'RUN'}), E)
        end.

