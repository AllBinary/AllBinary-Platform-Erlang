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
% import java.awt.image.BufferedImage
% import org.allbinary.input.automation.ImageOutputData
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.java.number.LongUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.cache.AutomaticCacheInterface
% import org.allbinary.logic.visual.media.MediaDataFactory
% import org.allbinary.media.image.ImagePersistanceUtil
% import org.allbinary.media.image.cache.BufferedImageCacheable
% import org.allbinary.media.image.io.ImageIOInterface
% import org.allbinary.string.CommonStrings

-module('ComparisonImageInputOutput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements ImageIOInterface

static_init() ->
    put({?MODULE, 'ROOT_NAME'}, "_Changed_"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
save(This, Frame) ->
        CommonStrings = 'CommonStrings':getInstance(),
        case (Frame > 0) of
            true ->
            ImageComparisonResultFrameCacheable = (fun(Target_N66232) -> (get({Target_N66232, '$class'})):get(Target_N66232, Frame) end)(('ImageComparisonResultCacheSingleton':getInstance())),
            case (ImageComparisonResultFrameCacheable =/= undefined) of
                true ->
                ImageComparisonResult = (get({ImageComparisonResultFrameCacheable, '$class'})):getImageComparisonResult(ImageComparisonResultFrameCacheable),
                (get({This, '$class'})):save(This, ImageComparisonResult, (get({ImageComparisonResultFrameCacheable, '$class'})):getFrame(ImageComparisonResultFrameCacheable));
                false ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Comparison Results Not Available for Output: ", Frame]), This, get({CommonStrings, 'SAVE'}))
            end;
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["No Comparison Results: for first frame: ", Frame]), This, get({CommonStrings, 'SAVE'}))
        end.

% throws Exception
save(This, ImageComparisonResult, Frame) ->
        CommonStrings = 'CommonStrings':getInstance(),
        FilePathStringBuffer = 'StringMaker':new(),
        (get({FilePathStringBuffer, '$class'})):append(FilePathStringBuffer, get({'ImageOutputData', 'SAVE_PATH'})),
        (get({FilePathStringBuffer, '$class'})):append(FilePathStringBuffer, 'LongUtil':fillIn((get({Frame, '$class'})):toString(Frame))),
        (get({FilePathStringBuffer, '$class'})):append(FilePathStringBuffer, get({'ComparisonImageInputOutput', 'ROOT_NAME'})),
        FilePathStringBuffer1 = 'StringMaker':new(),
        (get({FilePathStringBuffer1, '$class'})):append(FilePathStringBuffer1, (get({FilePathStringBuffer, '$class'})):toString(FilePathStringBuffer)),
        (get({FilePathStringBuffer1, '$class'})):append(FilePathStringBuffer1, "_1"),
        (get({FilePathStringBuffer1, '$class'})):append(FilePathStringBuffer1, (fun(Target_N66926) -> (get({Target_N66926, '$class'})):getExtension(Target_N66926) end)(get({'MediaDataFactory':getInstance(), 'JPG'}))),
        FilePath1 = (get({FilePathStringBuffer1, '$class'})):toString(FilePathStringBuffer1),
        FilePathStringBuffer2 = 'StringMaker':new(),
        (get({FilePathStringBuffer2, '$class'})):append(FilePathStringBuffer2, (get({FilePathStringBuffer, '$class'})):toString(FilePathStringBuffer)),
        (get({FilePathStringBuffer2, '$class'})):append(FilePathStringBuffer2, "_2"),
        (get({FilePathStringBuffer2, '$class'})):append(FilePathStringBuffer2, (fun(Target_N67136) -> (get({Target_N67136, '$class'})):getExtension(Target_N67136) end)(get({'MediaDataFactory':getInstance(), 'JPG'}))),
        FilePath2 = (get({FilePathStringBuffer2, '$class'})):toString(FilePathStringBuffer2),
        BufferedImageCacheables = 'ChangedPixelsUtil':generateBufferedImageChacheables(ImageComparisonResult),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Comparison Image File Path 1: ", FilePath1]), This, get({CommonStrings, 'SAVE'})),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Comparison Image File Path 2: ", FilePath2]), This, get({CommonStrings, 'SAVE'})),
        BufferedImageArray = array:new(2, {default, undefined}),
        array:set(0, (fun(Target_N67489) -> (get({Target_N67489, '$class'})):getBufferedImage(Target_N67489) end)(array:get(0, BufferedImageCacheables)), BufferedImageArray),
        array:set(1, (fun(Target_N67538) -> (get({Target_N67538, '$class'})):getBufferedImage(Target_N67538) end)(array:get(1, BufferedImageCacheables)), BufferedImageArray),
        ImagePersistanceUtil = 'ImagePersistanceUtil':getInstance(),
        (get({ImagePersistanceUtil, '$class'})):saveWithImageIO(ImagePersistanceUtil, FilePath1, array:get(0, BufferedImageArray)),
        (get({ImagePersistanceUtil, '$class'})):saveWithImageIO(ImagePersistanceUtil, FilePath2, array:get(1, BufferedImageArray)).

