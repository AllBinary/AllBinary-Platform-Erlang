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
% import java.awt
% import java.awt.image.BufferedImage
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.color.ColorCacheFactory
% import org.allbinary.graphics.color.ColorCacheable
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.util.cache.AutomaticCacheInterface
% import org.allbinary.media.image.comparison.pixel.PixelDeltaFactory

-module('ImageComparator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, imageComparatorConstraintsInterface}, undefined),
    ok.


new(ImageComparatorConstraintsInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ImageComparatorConstraintsInterface),
    This.

'$init'(This, ImageComparatorConstraintsInterface) ->
    init_fields(This),
        put({This, imageComparatorConstraintsInterface}, ImageComparatorConstraintsInterface).

% throws Exception
process(This, ImageComparisonInfo, Point) ->
        IsCollsionWithAvoidRectangles = (get({get({This, imageComparatorConstraintsInterface}), '$class'})):isCollisionWithAvoidRectangles(get({This, imageComparatorConstraintsInterface}), Point),
        case (not IsCollsionWithAvoidRectangles) of
            true ->
            Rgb1 = (fun(Target_N66093) -> (get({Target_N66093, '$class'})):getRGB(Target_N66093, (get({Point, '$class'})):getX(Point), (get({Point, '$class'})):getY(Point)) end)(array:get(0, (get({ImageComparisonInfo, '$class'})):getBufferedImages(ImageComparisonInfo))),
            Rgb2 = (fun(Target_N66190) -> (get({Target_N66190, '$class'})):getRGB(Target_N66190, (get({Point, '$class'})):getX(Point), (get({Point, '$class'})):getY(Point)) end)(array:get(1, (get({ImageComparisonInfo, '$class'})):getBufferedImages(ImageComparisonInfo))),
            AutomaticCacheInterface = 'ColorCacheFactory':getInstance(),
            ColorInteger = allbinary_java:to_string(Rgb1),
            ColorCacheable = (get({AutomaticCacheInterface, '$class'})):get(AutomaticCacheInterface, ColorInteger),
            Color = (get({ColorCacheable, '$class'})):getColor(ColorCacheable),
            ColorInteger2 = allbinary_java:to_string(Rgb2),
            ColorCacheable2 = (get({AutomaticCacheInterface, '$class'})):get(AutomaticCacheInterface, ColorInteger),
            Color2 = (get({ColorCacheable, '$class'})):getColor(ColorCacheable),
            case ((get({get({This, imageComparatorConstraintsInterface}), '$class'})):isColorAllowed(get({This, imageComparatorConstraintsInterface}), 0, Point, Color) orelse (get({get({This, imageComparatorConstraintsInterface}), '$class'})):isColorAllowed(get({This, imageComparatorConstraintsInterface}), 1, Point, Color2)) of
                true ->
                case (erlang:abs((Rgb1 - Rgb2)) =< (get({ImageComparisonInfo, '$class'})):getTolerance(ImageComparisonInfo)) of
                    true ->
                    put({ImageComparisonInfo, pixelsThatMatch}, get({ImageComparisonInfo, pixelsThatMatch}) + 1);
                    false ->
                    (get({ImageComparisonInfo, '$class'})):add(ImageComparisonInfo, 'PixelDeltaFactory':getInstance((get({Point, '$class'})):getX(Point), (get({Point, '$class'})):getY(Point), Rgb1, Rgb2))
                end;
                false -> ok
            end;
            false ->
            put({ImageComparisonInfo, pixelsIgnored}, get({ImageComparisonInfo, pixelsIgnored}) + 1)
        end.

% throws Exception
compare(This, BufferedImage1, BufferedImage2, FrameOne, FrameTwo, Tolerance) when is_integer(Tolerance) ->
        (get({This, '$class'})):compare(This, BufferedImage1, BufferedImage2, FrameOne, FrameTwo, Tolerance, get({'StringUtil':getInstance(), 'EMPTY_STRING'})).

% throws Exception
compare(This, BufferedImage1, BufferedImage2, FrameOne, FrameTwo, Tolerance, Name) when is_integer(Tolerance), (is_list(Name) orelse Name =:= undefined) ->
        case ((BufferedImage1 =:= undefined) orelse (BufferedImage2 =:= undefined)) of
            true ->
            erlang:error({'Exception', "Input images must not be null."});
            false -> ok
        end,
        ImageComparisonInfo = 'ImageComparisonResult':new(Name, BufferedImage1, BufferedImage2, FrameOne, FrameTwo, Tolerance),
        lists:foreach(fun(IndexY) ->
            lists:foreach(fun(IndexX) ->
                (get({This, '$class'})):process(This, ImageComparisonInfo, (fun(Target_N67536) -> (get({Target_N67536, '$class'})):createXY(Target_N67536, IndexX, IndexY) end)('PointFactory':getInstance())),
                case ((fun(Target_N67589) -> (get({Target_N67589, '$class'})):size(Target_N67589) end)((get({ImageComparisonInfo, '$class'})):getNonMatchingPixelVector(ImageComparisonInfo)) > (get({get({This, imageComparatorConstraintsInterface}), '$class'})):getMaxNonMatchingPixelDeltas(get({This, imageComparatorConstraintsInterface}))) of
                    true ->
                    throw('$break');
                    false -> ok
                end
            end, lists:seq(0, get({ImageComparisonInfo, imageWidth}) - 1))
        end, lists:seq(0, get({ImageComparisonInfo, imageHeight}) - 1)),
        ImageComparisonInfo.

