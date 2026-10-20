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
% import org.allbinary.logic.util.cache.PoolInterface
% import org.allbinary.media.image.cache.BufferedImageCacheable
% import org.allbinary.media.image.cache.BufferedImageInfo
% import org.allbinary.media.image.cache.BufferedImageInfoFactory
% import org.allbinary.media.image.cache.BufferedImagePoolSingleton
% import org.allbinary.media.image.comparison.pixel.PixelDelta

-module('ChangedPixelsUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'START_X'}, 0),
    put({?MODULE, 'START_Y'}, 0),
    put({?MODULE, 'OFFSET'}, 0),
    put({?MODULE, 'SCAN_SIZE'}, 0),
    put({?MODULE, 'CLEAR_INT_ARRAY'}, array:new((1800 * 1600), {default, 0})),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
generateBufferedImageChacheables(ImageComparisonInfo) ->
        put({local, bufferedImageCacheables}, undefined),
        OriginalBufferedImage = array:get(0, (get({ImageComparisonInfo, '$class'})):getBufferedImages(ImageComparisonInfo)),
        put({local, bufferedImageCacheables}, array:new(2, {default, undefined})),
        BufferedImageInfo = 'BufferedImageInfoFactory':getInstance(get({ImageComparisonInfo, imageWidth}), get({ImageComparisonInfo, imageHeight}), (get({OriginalBufferedImage, '$class'})):getType(OriginalBufferedImage)),
        PoolInterface = 'BufferedImagePoolSingleton':getInstance(),
        lists:foreach(fun(Index) ->
            BufferedImageCacheable = (get({PoolInterface, '$class'})):remove(PoolInterface, BufferedImageInfo),
            put({local, bufferedImageCacheables}, array:set(Index, BufferedImageCacheable, get({local, bufferedImageCacheables}))),
            (fun(Target_N66501) -> (get({Target_N66501, '$class'})):setRGB(Target_N66501, get({'ChangedPixelsUtil', 'START_X'}), get({'ChangedPixelsUtil', 'START_Y'}), (get({BufferedImageInfo, '$class'})):getWidth(BufferedImageInfo), (get({BufferedImageInfo, '$class'})):getHeight(BufferedImageInfo), get({'ChangedPixelsUtil', 'CLEAR_INT_ARRAY'}), get({'ChangedPixelsUtil', 'OFFSET'}), get({'ChangedPixelsUtil', 'SCAN_SIZE'})) end)((fun(Target_N66508) -> (get({Target_N66508, '$class'})):getBufferedImage(Target_N66508) end)(array:get(Index, get({local, bufferedImageCacheables}))))
        end, lists:seq(0, array:size(get({local, bufferedImageCacheables})) - 1)),
        Vector = (get({ImageComparisonInfo, '$class'})):getNonMatchingPixelVector(ImageComparisonInfo),
        Size = (get({Vector, '$class'})):size(Vector),
        lists:foreach(fun(Index) ->
            PixelDelta = (get({Vector, '$class'})):get(Vector, Index),
            case ((get({PixelDelta, '$class'})):getColorDelta(PixelDelta) =:= undefined) of
                true ->
                io:format("~ts", [allbinary_java:to_string("ColorDelta")]),
                erlang:halt(0);
                false -> ok
            end,
            (fun(Target_N67001) -> (get({Target_N67001, '$class'})):setRGB(Target_N67001, (fun(Target_N67034) -> (get({Target_N67034, '$class'})):getX(Target_N67034) end)((get({PixelDelta, '$class'})):getPoint(PixelDelta)), (fun(Target_N67058) -> (get({Target_N67058, '$class'})):getY(Target_N67058) end)((get({PixelDelta, '$class'})):getPoint(PixelDelta)), (fun(Target_N67082) -> (get({Target_N67082, '$class'})):getRgb1(Target_N67082) end)((get({PixelDelta, '$class'})):getColorDelta(PixelDelta))) end)((fun(Target_N67008) -> (get({Target_N67008, '$class'})):getBufferedImage(Target_N67008) end)(array:get(0, get({local, bufferedImageCacheables})))),
            (fun(Target_N67112) -> (get({Target_N67112, '$class'})):setRGB(Target_N67112, (fun(Target_N67145) -> (get({Target_N67145, '$class'})):getX(Target_N67145) end)((get({PixelDelta, '$class'})):getPoint(PixelDelta)), (fun(Target_N67169) -> (get({Target_N67169, '$class'})):getY(Target_N67169) end)((get({PixelDelta, '$class'})):getPoint(PixelDelta)), (fun(Target_N67193) -> (get({Target_N67193, '$class'})):getRgb2(Target_N67193) end)((get({PixelDelta, '$class'})):getColorDelta(PixelDelta))) end)((fun(Target_N67119) -> (get({Target_N67119, '$class'})):getBufferedImage(Target_N67119) end)(array:get(1, get({local, bufferedImageCacheables}))))
        end, lists:seq(0, Size - 1)),
        get({local, bufferedImageCacheables}).

