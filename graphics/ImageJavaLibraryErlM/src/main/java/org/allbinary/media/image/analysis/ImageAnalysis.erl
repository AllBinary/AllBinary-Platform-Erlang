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
% package org.allbinary.media.image.analysis
% import java.awt
% import java.awt.image.BufferedImage
% import org.allbinary.graphics.color.ColorCacheFactory
% import org.allbinary.graphics.color.ColorCacheable
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings

-module('ImageAnalysis').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageAnalysis':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'ImageAnalysis', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
process(This, BufferedImageArray, ColorRangeInterface) when (is_tuple(BufferedImageArray) orelse BufferedImageArray =:= undefined) ->
        CommonStrings = 'CommonStrings':getInstance(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({'CommonLabels':getInstance(), 'START'}), (get({ColorRangeInterface, '$class'})):toString(ColorRangeInterface)]), This, get({CommonStrings, 'PROCESS'})),
        ImageAnalysisResultsArray = array:new(array:size(BufferedImageArray), {default, undefined}),
        lists:foreach(fun(Index) ->
            array:set(Index, 'ImageAnalysis':process(array:get(Index, BufferedImageArray), ColorRangeInterface), ImageAnalysisResultsArray)
        end, lists:seq(0, array:size(BufferedImageArray) - 1)),
        ImageAnalysisResultsArray.

% throws Exception
process(BufferedImage, ColorRangeInterface) ->
        ImageAnalysisResults = 'ImageAnalysisResults':new(),
        put({local, redTotal}, 0),
        put({local, greenTotal}, 0),
        put({local, blueTotal}, 0),
        lists:foreach(fun(IndexY) ->
            lists:foreach(fun(IndexX) ->
                KeyInteger = allbinary_java:to_string((get({BufferedImage, '$class'})):getRGB(BufferedImage, IndexX, IndexY)),
                ColorCacheable = (fun(Target_N66653) -> (get({Target_N66653, '$class'})):get(Target_N66653, KeyInteger) end)('ColorCacheFactory':getInstance()),
                Color = (get({ColorCacheable, '$class'})):getColor(ColorCacheable),
                'ImageAnalysis':processColorRangeResults(ImageAnalysisResults, ColorRangeInterface, Color),
                'ImageAnalysis':processImageColorResults((get({ImageAnalysisResults, '$class'})):getImageColorResults(ImageAnalysisResults), ColorRangeInterface, Color),
                put({local, redTotal}, (get({local, redTotal}) + (get({Color, '$class'})):getRed(Color))),
                put({local, greenTotal}, (get({local, greenTotal}) + (get({Color, '$class'})):getGreen(Color))),
                put({local, blueTotal}, (get({local, blueTotal}) + (get({Color, '$class'})):getBlue(Color)))
            end, lists:seq(0, (get({BufferedImage, '$class'})):getWidth(BufferedImage) - 1))
        end, lists:seq(0, (get({BufferedImage, '$class'})):getHeight(BufferedImage) - 1)),
        TotalPixels = (fun(Target_N67116) -> (get({Target_N67116, '$class'})):getTotalPixelsChecked(Target_N67116) end)((get({ImageAnalysisResults, '$class'})):getImageColorRangeResults(ImageAnalysisResults)),
        ColorAverage = (fun(Target_N67170) -> (get({Target_N67170, '$class'})):getColorAverage(Target_N67170) end)((get({ImageAnalysisResults, '$class'})):getImageColorResults(ImageAnalysisResults)),
        (get({ColorAverage, '$class'})):setAvgRed(ColorAverage, (float(get({local, redTotal})) / float(TotalPixels))),
        (get({ColorAverage, '$class'})):setAvgGreen(ColorAverage, (float(get({local, greenTotal})) / float(TotalPixels))),
        (get({ColorAverage, '$class'})):setAvgBlue(ColorAverage, (float(get({local, blueTotal})) / float(TotalPixels))),
        ImageAnalysisResults.

processColorRangeResults(ImageAnalysisResults, ColorRangeInterface, Color) ->
        case (get({ColorRangeInterface, '$class'})):isInRange(ColorRangeInterface, Color) of
            true ->
            (fun(Target_N67501) -> (get({Target_N67501, '$class'})):addMatchingPixelsChecked(Target_N67501) end)((get({ImageAnalysisResults, '$class'})):getImageColorRangeResults(ImageAnalysisResults));
            false ->
            ok
        end,
        (fun(Target_N67532) -> (get({Target_N67532, '$class'})):addTotalPixelsChecked(Target_N67532) end)((get({ImageAnalysisResults, '$class'})):getImageColorRangeResults(ImageAnalysisResults)).

processImageColorResults(ImageColorResults, ColorRangeInterface, Color) ->
        case ((get({Color, '$class'})):getRed(Color) < (fun(Target_N67663) -> (get({Target_N67663, '$class'})):getMinRed(Target_N67663) end)((get({ImageColorResults, '$class'})):getColorRange(ImageColorResults))) of
            true ->
            (fun(Target_N67696) -> (get({Target_N67696, '$class'})):setMinRed(Target_N67696, (get({Color, '$class'})):getRed(Color)) end)((get({ImageColorResults, '$class'})):getColorRange(ImageColorResults));
            false -> ok
        end,
        case ((get({Color, '$class'})):getGreen(Color) < (fun(Target_N67766) -> (get({Target_N67766, '$class'})):getMinGreen(Target_N67766) end)((get({ImageColorResults, '$class'})):getColorRange(ImageColorResults))) of
            true ->
            (fun(Target_N67799) -> (get({Target_N67799, '$class'})):setMinGreen(Target_N67799, (get({Color, '$class'})):getGreen(Color)) end)((get({ImageColorResults, '$class'})):getColorRange(ImageColorResults));
            false -> ok
        end,
        case ((get({Color, '$class'})):getBlue(Color) < (fun(Target_N67869) -> (get({Target_N67869, '$class'})):getMinBlue(Target_N67869) end)((get({ImageColorResults, '$class'})):getColorRange(ImageColorResults))) of
            true ->
            (fun(Target_N67902) -> (get({Target_N67902, '$class'})):setMinBlue(Target_N67902, (get({Color, '$class'})):getBlue(Color)) end)((get({ImageColorResults, '$class'})):getColorRange(ImageColorResults));
            false -> ok
        end,
        case ((get({Color, '$class'})):getRed(Color) > (fun(Target_N67972) -> (get({Target_N67972, '$class'})):getMaxRed(Target_N67972) end)((get({ImageColorResults, '$class'})):getColorRange(ImageColorResults))) of
            true ->
            (fun(Target_N68005) -> (get({Target_N68005, '$class'})):setMaxRed(Target_N68005, (get({Color, '$class'})):getRed(Color)) end)((get({ImageColorResults, '$class'})):getColorRange(ImageColorResults));
            false -> ok
        end,
        case ((get({Color, '$class'})):getGreen(Color) > (fun(Target_N68075) -> (get({Target_N68075, '$class'})):getMaxGreen(Target_N68075) end)((get({ImageColorResults, '$class'})):getColorRange(ImageColorResults))) of
            true ->
            (fun(Target_N68108) -> (get({Target_N68108, '$class'})):setMaxGreen(Target_N68108, (get({Color, '$class'})):getGreen(Color)) end)((get({ImageColorResults, '$class'})):getColorRange(ImageColorResults));
            false -> ok
        end,
        case ((get({Color, '$class'})):getBlue(Color) > (fun(Target_N68178) -> (get({Target_N68178, '$class'})):getMaxBlue(Target_N68178) end)((get({ImageColorResults, '$class'})):getColorRange(ImageColorResults))) of
            true ->
            (fun(Target_N68211) -> (get({Target_N68211, '$class'})):setMaxBlue(Target_N68211, (get({Color, '$class'})):getBlue(Color)) end)((get({ImageColorResults, '$class'})):getColorRange(ImageColorResults));
            false -> ok
        end.

