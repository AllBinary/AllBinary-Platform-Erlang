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
% import org.allbinary.media.image.ImageUtil
% import org.allbinary.media.image.comparison.pixel.PixelDelta
% import org.allbinary.string.CommonStrings

-module('ImageComparisonSearch').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, isSameHeight}, false),
    put({This, isSameWidth}, false),
    put({This, pixelsThatMatch}, 0),
    put({This, pixelsIgnored}, 0),
    put({This, imageHeight}, 0),
    put({This, imageWidth}, 0),
    put({This, tolerance}, 0),
    put({This, nonMatchingPixelVector}, undefined),
    put({This, bufferedImages}, undefined),
    put({This, matchingPercent}, float((-1))),
    ok.


new(BufferedImage, BufferedImage2, Tolerance) when is_integer(Tolerance) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, BufferedImage, BufferedImage2, Tolerance),
    This.

init(This, BufferedImage, BufferedImage2, Tolerance) when is_integer(Tolerance) ->
    init_fields(This),
        put({This, nonMatchingPixelVector}, 'BasicArrayListD':new()),
        (get({This, '$class'})):setBufferedImages(This, array:new(2, {default, undefined})),
        array:set(0, BufferedImage, (get({This, '$class'})):getBufferedImages(This)),
        array:set(1, BufferedImage2, (get({This, '$class'})):getBufferedImages(This)),
        put({This, imageHeight}, (get({BufferedImage, '$class'})):getHeight(BufferedImage)),
        put({This, imageWidth}, (get({BufferedImage, '$class'})):getWidth(BufferedImage)),
        case ((get({BufferedImage, '$class'})):getHeight(BufferedImage) =/= (get({BufferedImage2, '$class'})):getHeight(BufferedImage2)) of
            true ->
            put({This, isSameHeight}, false),
            case (get({This, imageHeight}) > (get({BufferedImage2, '$class'})):getHeight(BufferedImage2)) of
                true ->
                put({This, imageHeight}, (get({BufferedImage2, '$class'})):getHeight(BufferedImage2));
                false -> ok
            end;
            false ->
            put({This, isSameHeight}, true)
        end,
        case ((get({BufferedImage, '$class'})):getWidth(BufferedImage) =/= (get({BufferedImage2, '$class'})):getWidth(BufferedImage2)) of
            true ->
            put({This, isSameWidth}, false),
            case (get({This, imageWidth}) > (get({BufferedImage2, '$class'})):getWidth(BufferedImage2)) of
                true ->
                put({This, imageWidth}, (get({BufferedImage2, '$class'})):getWidth(BufferedImage2));
                false -> ok
            end;
            false ->
            put({This, isSameWidth}, true)
        end,
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
        lists:concat([lists:concat([lists:concat([lists:concat([lists:concat([lists:concat([lists:concat([lists:concat(["ImageComparisonInfo: ", " Number Of Matching Pixels: "]), get({This, pixelsThatMatch})]), "\nNumber Of Non-Matching Pixels: "]), (fun(Target_N67516) -> (get({Target_N67516, '$class'})):size(Target_N67516) end)((get({This, '$class'})):getNonMatchingPixelVector(This))]), "\nNumber Of Pixels Ignored: "]), get({This, pixelsIgnored})]), "\nMatching Percentage: "]), (get({This, '$class'})):getMatchingPercent(This)]).

getBufferedImages(This) ->
        get({This, bufferedImages}).

setBufferedImages(This, BufferedImages) when (is_tuple(BufferedImages) orelse BufferedImages =:= undefined) ->
        put({This, bufferedImages}, BufferedImages).

getTolerance(This) ->
        get({This, tolerance}).

setTolerance(This, Tolerance) when is_integer(Tolerance) ->
        put({This, tolerance}, Tolerance).

