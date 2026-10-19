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
% package org.allbinary.media.image
% import java.awt
% import java.awt.image.BufferedImage
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonLabels

-module('ImagesRatioUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImagesRatioUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, imageUtil}, 'ImageUtil':getInstance()),
    ok.


getInstance() ->
        get({'ImagesRatioUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

isEqual(This, BufferedImageArray, TotalImages) when (is_tuple(BufferedImageArray) orelse BufferedImageArray =:= undefined), is_integer(TotalImages) ->
        try
        put({local, 'end'}, TotalImages),
        case (array:size(BufferedImageArray) < TotalImages) of
            true ->
            put({local, 'end'}, array:size(BufferedImageArray));
            false -> ok
        end,
        Ratio = ((float((fun(Target_N66042) -> (get({Target_N66042, '$class'})):getWidth(Target_N66042) end)(array:get(0, BufferedImageArray))) / (fun(Target_N66071) -> (get({Target_N66071, '$class'})):getHeight(Target_N66071) end)(array:get(0, BufferedImageArray)))),
        lists:foreach(fun(Index) ->
            case (Ratio =/= ((float((fun(Target_N66142) -> (get({Target_N66142, '$class'})):getWidth(Target_N66142) end)(array:get(Index, BufferedImageArray))) / (fun(Target_N66175) -> (get({Target_N66175, '$class'})):getHeight(Target_N66175) end)(array:get(Index, BufferedImageArray))))) of
                true ->
                throw({'$return', false});
                false -> ok
            end
        end, lists:seq(1, get({local, 'end'}) - 1)),
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getAverage(This, BufferedImageArray, TotalImages) when (is_tuple(BufferedImageArray) orelse BufferedImageArray =:= undefined), is_integer(TotalImages) ->
        put({local, ratio}, 0.0),
        put({local, 'end'}, TotalImages),
        case (array:size(BufferedImageArray) < TotalImages) of
            true ->
            put({local, 'end'}, array:size(BufferedImageArray));
            false -> ok
        end,
        lists:foreach(fun(Index) ->
            put({local, ratio}, (get({local, ratio}) + ((float((fun(Target_N66531) -> (get({Target_N66531, '$class'})):getWidth(Target_N66531) end)(array:get(Index, BufferedImageArray))) / (fun(Target_N66564) -> (get({Target_N66564, '$class'})):getHeight(Target_N66564) end)(array:get(Index, BufferedImageArray))))))
        end, lists:seq(0, get({local, 'end'}) - 1)),
        ((get({local, ratio}) / float(get({local, 'end'})))).

% throws Exception
fudge(This, BufferedImage, Ratio) when is_number(Ratio) ->
        ImageRatio = ((float((get({BufferedImage, '$class'})):getWidth(BufferedImage)) / (get({BufferedImage, '$class'})):getHeight(BufferedImage))),
        Point = 'Point':new(),
        put({local, newHeight}, (get({BufferedImage, '$class'})):getHeight(BufferedImage)),
        put({local, newWidth}, (get({BufferedImage, '$class'})):getWidth(BufferedImage)),
        case (Ratio > ImageRatio) of
            true ->
            put({local, newWidth}, trunc(((float((get({BufferedImage, '$class'})):getHeight(BufferedImage)) * Ratio)))),
            put({Point, x}, (((get({local, newWidth}) - (get({BufferedImage, '$class'})):getWidth(BufferedImage))) / 2));
            false ->
            put({local, newHeight}, trunc(((float((get({BufferedImage, '$class'})):getWidth(BufferedImage)) / Ratio)))),
            put({Point, y}, (((get({local, newHeight}) - (get({BufferedImage, '$class'})):getHeight(BufferedImage))) / 2))
        end,
        CommonLabels = 'CommonLabels':getInstance(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat([lists:concat([lists:concat([lists:concat([lists:concat([lists:concat([(get({CommonLabels, 'WIDTH_LABEL'}) + (get({BufferedImage, '$class'})):getWidth(BufferedImage)), " newWidth: "]), get({local, newWidth})]), get({CommonLabels, 'HEIGHT_LABEL'})]), (get({BufferedImage, '$class'})):getHeight(BufferedImage)]), " newHeight: "]), get({local, newHeight})]), " needed ratio: "]), ((float(get({local, newWidth})) / float(get({local, newHeight}))))]), This, "fudge"),
        NewBufferedImage = (get({get({This, imageUtil}), '$class'})):create(get({This, imageUtil}), get({local, newWidth}), get({local, newHeight})),
        G = (get({NewBufferedImage, '$class'})):createGraphics(NewBufferedImage),
        case (get({Point, x}) > 0) of
            true ->
            FirstColumnBufferedImage = (get({BufferedImage, '$class'})):getSubimage(BufferedImage, 0, 0, 1, (get({BufferedImage, '$class'})):getHeight(BufferedImage)),
            LastColumnBufferedImage = (get({BufferedImage, '$class'})):getSubimage(BufferedImage, ((get({BufferedImage, '$class'})):getWidth(BufferedImage) - 1), 0, 1, (get({BufferedImage, '$class'})):getHeight(BufferedImage)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Draw some columns to fill in gap", This, "fudge"),
            lists:foreach(fun(Index) ->
                (get({G, '$class'})):drawImage(G, FirstColumnBufferedImage, Index, 0, undefined),
                (get({G, '$class'})):drawImage(G, LastColumnBufferedImage, (get({local, newWidth}) - Index), 0, undefined)
            end, lists:seq(0, get({Point, x}) - 1));
            false -> ok
        end,
        case (get({Point, y}) > 0) of
            true ->
            FirstRowBufferedImage = (get({BufferedImage, '$class'})):getSubimage(BufferedImage, 0, 0, (get({BufferedImage, '$class'})):getWidth(BufferedImage), 1),
            LastRowBufferedImage = (get({BufferedImage, '$class'})):getSubimage(BufferedImage, 0, ((get({BufferedImage, '$class'})):getHeight(BufferedImage) - 1), (get({BufferedImage, '$class'})):getWidth(BufferedImage), 1),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Draw some rows to fill in gap", This, "fudge"),
            lists:foreach(fun(Index) ->
                (get({G, '$class'})):drawImage(G, FirstRowBufferedImage, 0, Index, undefined),
                (get({G, '$class'})):drawImage(G, LastRowBufferedImage, 0, (get({local, newHeight}) - Index), undefined)
            end, lists:seq(0, get({Point, y}) - 1));
            false -> ok
        end,
        (get({G, '$class'})):drawImage(G, BufferedImage, get({Point, x}), get({Point, y}), (get({BufferedImage, '$class'})):getWidth(BufferedImage), (get({BufferedImage, '$class'})):getHeight(BufferedImage), undefined),
        NewBufferedImage.

% throws Exception
fudge(This, BufferedImageArray, TotalImages, Ratio) when (is_tuple(BufferedImageArray) orelse BufferedImageArray =:= undefined), is_integer(TotalImages), is_number(Ratio) ->
        put({local, 'end'}, TotalImages),
        case (array:size(BufferedImageArray) < TotalImages) of
            true ->
            put({local, 'end'}, array:size(BufferedImageArray));
            false -> ok
        end,
        FudgedBufferedImageArray = array:new(get({local, 'end'}), {default, undefined}),
        lists:foreach(fun(Index) ->
            array:set(Index, (get({This, '$class'})):fudge(This, array:get(Index, BufferedImageArray), Ratio), FudgedBufferedImageArray)
        end, lists:seq(0, get({local, 'end'}) - 1)),
        FudgedBufferedImageArray.

