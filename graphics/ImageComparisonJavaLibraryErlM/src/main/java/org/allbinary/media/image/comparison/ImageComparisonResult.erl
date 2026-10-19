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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.media.image.ImageUtil
% import org.allbinary.media.image.comparison.pixel.PixelDelta
% import org.allbinary.string.CommonStrings

-module('ImageComparisonResult').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, bufferedImages}, array:new(2, {default, undefined})),
    put({This, name}, undefined),
    put({This, isSameHeight}, false),
    put({This, isSameWidth}, false),
    put({This, imageHeight}, 0),
    put({This, imageWidth}, 0),
    put({This, nonMatchingPixelVector}, undefined),
    put({This, frameOne}, undefined),
    put({This, frameTwo}, undefined),
    put({This, pixelsThatMatch}, 0),
    put({This, pixelsIgnored}, 0),
    put({This, tolerance}, 0),
    put({This, matchingPercent}, float((-1))),
    ok.


new(Name, BufferedImage, BufferedImage2, FrameOne, FrameTwo, Tolerance) when (is_list(Name) orelse Name =:= undefined), is_integer(Tolerance) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, BufferedImage, BufferedImage2, FrameOne, FrameTwo, Tolerance),
    This.

init(This, Name, BufferedImage, BufferedImage2, FrameOne, FrameTwo, Tolerance) when (is_list(Name) orelse Name =:= undefined), is_integer(Tolerance) ->
    init_fields(This),
        put({This, name}, Name),
        put({This, nonMatchingPixelVector}, 'BasicArrayListD':new()),
        put({This, bufferedImages}, array:set(0, BufferedImage, get({This, bufferedImages}))),
        put({This, bufferedImages}, array:set(1, BufferedImage2, get({This, bufferedImages}))),
        put({This, frameOne}, FrameOne),
        put({This, frameTwo}, FrameTwo),
        (get({This, '$class'})):setTolerance(This, 0),
        put({local, imageHeight}, (get({BufferedImage, '$class'})):getHeight(BufferedImage)),
        put({local, imageWidth}, (get({BufferedImage, '$class'})):getWidth(BufferedImage)),
        case ((get({BufferedImage, '$class'})):getHeight(BufferedImage) =/= (get({BufferedImage2, '$class'})):getHeight(BufferedImage2)) of
            true ->
            put({This, isSameHeight}, false),
            case (get({local, imageHeight}) > (get({BufferedImage2, '$class'})):getHeight(BufferedImage2)) of
                true ->
                put({local, imageHeight}, (get({BufferedImage2, '$class'})):getHeight(BufferedImage2));
                false -> ok
            end;
            false ->
            put({This, isSameHeight}, true)
        end,
        case ((get({BufferedImage, '$class'})):getWidth(BufferedImage) =/= (get({BufferedImage2, '$class'})):getWidth(BufferedImage2)) of
            true ->
            put({This, isSameWidth}, false),
            case (get({local, imageWidth}) > (get({BufferedImage2, '$class'})):getWidth(BufferedImage2)) of
                true ->
                put({local, imageWidth}, (get({BufferedImage2, '$class'})):getWidth(BufferedImage2));
                false -> ok
            end;
            false ->
            put({This, isSameWidth}, true)
        end,
        put({This, imageWidth}, get({local, imageWidth})),
        put({This, imageHeight}, get({local, imageHeight})),
        case ((not get({This, isSameWidth})) orelse (not get({This, isSameHeight}))) of
            true ->
            ImageUtil = 'ImageUtil':getInstance(),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Images were not the same size? Most likely a resolution change.", This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["1: ", (get({ImageUtil, '$class'})):toString(ImageUtil, BufferedImage)]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["2: ", (get({ImageUtil, '$class'})):toString(ImageUtil, BufferedImage2)]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end.

getMatchingPercent(This) ->
        case (get({This, matchingPercent}) =:= float((-1))) of
            true ->
            put({This, matchingPercent}, (float(get({This, pixelsThatMatch})) / float(((get({This, imageWidth}) * get({This, imageHeight}))))));
            false -> ok
        end,
        get({This, matchingPercent}).

add(This, Pixel) ->
        (get({get({This, nonMatchingPixelVector}), '$class'})):add(get({This, nonMatchingPixelVector}), Pixel).

getNonMatchingPixelVector(This) ->
        get({This, nonMatchingPixelVector}).

toString(This) ->
        (fun(Target_N67845) -> (get({Target_N67845, '$class'})):toString(Target_N67845) end)((fun(Target_N67852) -> (get({Target_N67852, '$class'})):appendfloat(Target_N67852, (get({This, '$class'})):getMatchingPercent(This)) end)((fun(Target_N67859) -> (get({Target_N67859, '$class'})):append(Target_N67859, "\nMatching Percentage: ") end)((fun(Target_N67866) -> (get({Target_N67866, '$class'})):appendint(Target_N67866, get({This, pixelsIgnored})) end)((fun(Target_N67873) -> (get({Target_N67873, '$class'})):append(Target_N67873, "\nNumber Of Pixels Ignored: ") end)((fun(Target_N67880) -> (get({Target_N67880, '$class'})):appendint(Target_N67880, (fun(Target_N67990) -> (get({Target_N67990, '$class'})):size(Target_N67990) end)((get({This, '$class'})):getNonMatchingPixelVector(This))) end)((fun(Target_N67887) -> (get({Target_N67887, '$class'})):append(Target_N67887, "\nNumber Of Non-Matching Pixels: ") end)((fun(Target_N67894) -> (get({Target_N67894, '$class'})):appendint(Target_N67894, get({This, pixelsThatMatch})) end)((fun(Target_N67901) -> (get({Target_N67901, '$class'})):append(Target_N67901, " Number Of Matching Pixels: ") end)((fun(Target_N67908) -> (get({Target_N67908, '$class'})):append(Target_N67908, get({This, name})) end)((fun(Target_N67915) -> (get({Target_N67915, '$class'})):append(Target_N67915, "ImageComparisonInfo: ") end)('StringMaker':new()))))))))))).

getBufferedImages(This) ->
        get({This, bufferedImages}).

getTolerance(This) ->
        get({This, tolerance}).

setTolerance(This, Tolerance) when is_integer(Tolerance) ->
        put({This, tolerance}, Tolerance).

getFrameOne(This) ->
        get({This, frameOne}).

getFrameTwo(This) ->
        get({This, frameTwo}).

