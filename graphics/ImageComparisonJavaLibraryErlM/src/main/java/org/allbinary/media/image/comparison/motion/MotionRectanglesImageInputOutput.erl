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
% import java.awt
% import java.awt.image.BufferedImage
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.input.automation.ImageOutputData
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.java.number.LongUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.cache.AutomaticCacheInterface
% import org.allbinary.logic.util.cache.PoolInterface
% import org.allbinary.logic.visual.media.MediaDataFactory
% import org.allbinary.media.image.ImagePersistanceUtil
% import org.allbinary.media.image.cache.BufferedImageCacheable
% import org.allbinary.media.image.cache.BufferedImageInfo
% import org.allbinary.media.image.cache.BufferedImageInfoFactory
% import org.allbinary.media.image.cache.BufferedImagePoolSingleton
% import org.allbinary.media.image.comparison.ImageComparisonResult
% import org.allbinary.media.image.io.ImageIOInterface
% import org.allbinary.string.CommonStrings

-module('MotionRectanglesImageInputOutput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ImageIOInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'NUMBER_OF_IMAGES'}, 1),
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
        put({local, motionRectanglesResultsFrameCacheable}, (fun(Target_N66372) -> (get({Target_N66372, '$class'})):get(Target_N66372, Frame) end)(('AllMotionRectanglesResultsCacheSingleton':getInstance()))),
        case (get({local, motionRectanglesResultsFrameCacheable}) =/= undefined) of
            true ->
            put({local, motionRectangles}, (get({get({local, motionRectanglesResultsFrameCacheable}), '$class'})):getMotionRectangles(get({local, motionRectanglesResultsFrameCacheable}))),
            (get({This, '$class'})):save(This, get({local, motionRectangles}), Frame),
            put({local, motionRectanglesResultsFrameCacheable}, (fun(Target_N66636) -> (get({Target_N66636, '$class'})):get(Target_N66636, Frame) end)(('ConsolidatedMotionRectanglesResultsCacheSingleton':getInstance()))),
            put({local, motionRectangles}, (get({get({local, motionRectanglesResultsFrameCacheable}), '$class'})):getMotionRectangles(get({local, motionRectanglesResultsFrameCacheable}))),
            (get({This, '$class'})):save(This, get({local, motionRectangles}), Frame),
            put({local, motionRectanglesResultsFrameCacheable}, (fun(Target_N66783) -> (get({Target_N66783, '$class'})):get(Target_N66783, Frame) end)(('ConstrainedMotionRectanglesResultsCacheSingleton':getInstance()))),
            put({local, motionRectangles}, (get({get({local, motionRectanglesResultsFrameCacheable}), '$class'})):getMotionRectangles(get({local, motionRectanglesResultsFrameCacheable}))),
            (get({This, '$class'})):save(This, get({local, motionRectangles}), Frame);
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["No Motion Rectangle Results for Frame: ", Frame]), This, get({CommonStrings, 'SAVE'}))
        end.

% throws Exception
save(This, MotionRectangles, Frame) ->
        CommonStrings = 'CommonStrings':getInstance(),
        FilePathStringBuffer = 'StringMaker':new(),
        (get({FilePathStringBuffer, '$class'})):append(FilePathStringBuffer, get({'ImageOutputData', 'SAVE_PATH'})),
        (get({FilePathStringBuffer, '$class'})):append(FilePathStringBuffer, 'LongUtil':fillIn((get({Frame, '$class'})):toString(Frame))),
        (get({FilePathStringBuffer, '$class'})):append(FilePathStringBuffer, "_"),
        (get({FilePathStringBuffer, '$class'})):append(FilePathStringBuffer, (get({MotionRectangles, '$class'})):getName(MotionRectangles)),
        FilePathStringBuffer1 = 'StringMaker':new(),
        (get({FilePathStringBuffer1, '$class'})):append(FilePathStringBuffer1, (get({FilePathStringBuffer, '$class'})):toString(FilePathStringBuffer)),
        (get({FilePathStringBuffer1, '$class'})):append(FilePathStringBuffer1, "_1"),
        (get({FilePathStringBuffer1, '$class'})):append(FilePathStringBuffer1, (fun(Target_N67355) -> (get({Target_N67355, '$class'})):getExtension(Target_N67355) end)(get({'MediaDataFactory':getInstance(), 'JPG'}))),
        FilePathStringBuffer2 = 'StringMaker':new(),
        (get({FilePathStringBuffer2, '$class'})):append(FilePathStringBuffer2, (get({FilePathStringBuffer, '$class'})):toString(FilePathStringBuffer)),
        (get({FilePathStringBuffer2, '$class'})):append(FilePathStringBuffer2, "_2"),
        (get({FilePathStringBuffer2, '$class'})):append(FilePathStringBuffer2, (fun(Target_N67515) -> (get({Target_N67515, '$class'})):getExtension(Target_N67515) end)(get({'MediaDataFactory':getInstance(), 'JPG'}))),
        FilePathStringBuffer3 = 'StringMaker':new(),
        (get({FilePathStringBuffer3, '$class'})):append(FilePathStringBuffer3, (get({FilePathStringBuffer, '$class'})):toString(FilePathStringBuffer)),
        (get({FilePathStringBuffer3, '$class'})):append(FilePathStringBuffer3, (fun(Target_N67648) -> (get({Target_N67648, '$class'})):getExtension(Target_N67648) end)(get({'MediaDataFactory':getInstance(), 'JPG'}))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Motion Image File Path 1: ", (get({FilePathStringBuffer1, '$class'})):toString(FilePathStringBuffer1)]), This, get({CommonStrings, 'SAVE'})),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Motion Image File Path 2: ", (get({FilePathStringBuffer2, '$class'})):toString(FilePathStringBuffer2)]), This, get({CommonStrings, 'SAVE'})),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Motion Image File Path 2: ", (get({FilePathStringBuffer3, '$class'})):toString(FilePathStringBuffer3)]), This, get({CommonStrings, 'SAVE'})),
        BufferedImageCacheables = array:new(get({This, 'NUMBER_OF_IMAGES'}), {default, undefined}),
        ImageComparisonInfo = (get({MotionRectangles, '$class'})):getImageComparisonResult(MotionRectangles),
        OriginalBufferedImage = array:get(0, (get({ImageComparisonInfo, '$class'})):getBufferedImages(ImageComparisonInfo)),
        BufferedImageInfo = 'BufferedImageInfoFactory':getInstance(get({ImageComparisonInfo, imageWidth}), get({ImageComparisonInfo, imageHeight}), (get({OriginalBufferedImage, '$class'})):getType(OriginalBufferedImage)),
        PoolInterface = 'BufferedImagePoolSingleton':getInstance(),
        lists:foreach(fun(Index) ->
            array:set(Index, (get({PoolInterface, '$class'})):remove(PoolInterface, BufferedImageInfo), BufferedImageCacheables)
        end, lists:seq(0, get({This, 'NUMBER_OF_IMAGES'}) - 1)),
        (fun(Target_N68334) -> (get({Target_N68334, '$class'})):setData(Target_N68334, (fun(Target_N68367) -> (get({Target_N68367, '$class'})):getData(Target_N68367) end)(array:get(1, (get({ImageComparisonInfo, '$class'})):getBufferedImages(ImageComparisonInfo)))) end)((fun(Target_N68341) -> (get({Target_N68341, '$class'})):getBufferedImage(Target_N68341) end)(array:get(0, BufferedImageCacheables))),
        case (get({This, 'NUMBER_OF_IMAGES'}) > 1) of
            true ->
            (fun(Target_N68433) -> (get({Target_N68433, '$class'})):setData(Target_N68433, (fun(Target_N68466) -> (get({Target_N68466, '$class'})):getData(Target_N68466) end)(array:get(1, (get({ImageComparisonInfo, '$class'})):getBufferedImages(ImageComparisonInfo)))) end)((fun(Target_N68440) -> (get({Target_N68440, '$class'})):getBufferedImage(Target_N68440) end)(array:get(1, BufferedImageCacheables)));
            false -> ok
        end,
        put({local, bufferedImageGraphicsArray}, undefined),
        put({local, bufferedImageGraphicsArray}, array:new(get({This, 'NUMBER_OF_IMAGES'}), {default, undefined})),
        lists:foreach(fun(Index) ->
            put({local, bufferedImageGraphicsArray}, array:set(Index, (fun(Target_N68622) -> (get({Target_N68622, '$class'})):getGraphics(Target_N68622) end)((fun(Target_N68629) -> (get({Target_N68629, '$class'})):getBufferedImage(Target_N68629) end)(array:get(Index, BufferedImageCacheables))), get({local, bufferedImageGraphicsArray})))
        end, lists:seq(0, get({This, 'NUMBER_OF_IMAGES'}) - 1)),
        RectangelList = (get({MotionRectangles, '$class'})):getVector(MotionRectangles),
        Size = (get({RectangelList, '$class'})):size(RectangelList),
        lists:foreach(fun(Index2) ->
            MotionRectangle = (get({RectangelList, '$class'})):get(RectangelList, Index2),
            Rectangle = (get({MotionRectangle, '$class'})):getRectangle(MotionRectangle),
            lists:foreach(fun(Index) ->
                (fun(Target_N68953) -> (get({Target_N68953, '$class'})):setColor(Target_N68953, get({'Color', 'ORANGE'})) end)(array:get(Index, get({local, bufferedImageGraphicsArray}))),
                (fun(Target_N69004) -> (get({Target_N69004, '$class'})):drawRect(Target_N69004, get({Rectangle, x}), get({Rectangle, y}), get({Rectangle, width}), get({Rectangle, height})) end)(array:get(Index, get({local, bufferedImageGraphicsArray})))
            end, lists:seq(0, get({This, 'NUMBER_OF_IMAGES'}) - 1))
        end, lists:seq(0, Size - 1)),
        ImagePersistanceUtil = 'ImagePersistanceUtil':getInstance(),
        case (get({This, 'NUMBER_OF_IMAGES'}) > 1) of
            true ->
            (get({ImagePersistanceUtil, '$class'})):saveWithImageIO(ImagePersistanceUtil, (get({FilePathStringBuffer1, '$class'})):toString(FilePathStringBuffer1), (fun(Target_N69349) -> (get({Target_N69349, '$class'})):getBufferedImage(Target_N69349) end)(array:get(1, BufferedImageCacheables)));
            false -> ok
        end,
        (get({ImagePersistanceUtil, '$class'})):saveWithImageIO(ImagePersistanceUtil, (get({FilePathStringBuffer2, '$class'})):toString(FilePathStringBuffer2), (fun(Target_N69415) -> (get({Target_N69415, '$class'})):getBufferedImage(Target_N69415) end)(array:get(0, BufferedImageCacheables))),
        case (get({This, 'NUMBER_OF_IMAGES'}) > 2) of
            true ->
            (get({ImagePersistanceUtil, '$class'})):saveWithImageIO(ImagePersistanceUtil, (get({FilePathStringBuffer3, '$class'})):toString(FilePathStringBuffer3), (fun(Target_N69510) -> (get({Target_N69510, '$class'})):getBufferedImage(Target_N69510) end)(array:get(2, BufferedImageCacheables)));
            false -> ok
        end.

