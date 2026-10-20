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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.media.image.comparison.ImageComparisonResult
% import org.allbinary.media.image.comparison.pixel.PixelDelta

-module('AllMotionRectangles').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('MotionRectangles', Function, Arguments).

static_init() ->
    put({?MODULE, 'NAME'}, "allMotionRectangles_"),
    ok.

init_fields(This) ->
    ok.


new(ImageComparisonResult) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ImageComparisonResult),
    This.

'$init'(This, ImageComparisonResult) ->
        'MotionRectangles':'$init'(This, get({'AllMotionRectangles', 'NAME'}), ImageComparisonResult),
        (get({This, '$class'})):createMotionRectangles(This, ImageComparisonResult).

% throws Exception
createMotionRectangles(This, ImageComparisonInfo) ->
        Vector = (get({ImageComparisonInfo, '$class'})):getNonMatchingPixelVector(ImageComparisonInfo),
        Size = (get({Vector, '$class'})):size(Vector),
        lists:foreach(fun(Index) ->
            PixelDelta = (get({Vector, '$class'})):get(Vector, Index),
            (get({This, '$class'})):addPixelDeltaToAMotionRectangle(This, PixelDelta)
        end, lists:seq(0, Size - 1)).

% throws Exception
addPixelDeltaToExistingMotionRectangle(This, PixelDelta) ->
        try
        Vector = (get({This, '$class'})):getVector(This),
        Size = (get({Vector, '$class'})):size(Vector),
        lists:foreach(fun(Index) ->
            MotionRectangle = (get({Vector, '$class'})):get(Vector, Index),
            case (get({This, '$class'})):shouldPixelDeltaPartOfMotionRectangle(This, MotionRectangle, PixelDelta) of
                true ->
                put({local, newWidth}, ((fun(Target_N66438) -> (get({Target_N66438, '$class'})):getX(Target_N66438) end)((get({PixelDelta, '$class'})):getPoint(PixelDelta)) - get({(get({MotionRectangle, '$class'})):getRectangle(MotionRectangle), x}))),
                put({local, newHeight}, ((fun(Target_N66518) -> (get({Target_N66518, '$class'})):getY(Target_N66518) end)((get({PixelDelta, '$class'})):getPoint(PixelDelta)) - get({(get({MotionRectangle, '$class'})):getRectangle(MotionRectangle), y}))),
                case (get({local, newWidth}) < get({(get({MotionRectangle, '$class'})):getRectangle(MotionRectangle), width})) of
                    true ->
                    put({local, newWidth}, get({(get({MotionRectangle, '$class'})):getRectangle(MotionRectangle), width}));
                    false -> ok
                end,
                case (get({local, newHeight}) < get({(get({MotionRectangle, '$class'})):getRectangle(MotionRectangle), height})) of
                    true ->
                    put({local, newHeight}, get({(get({MotionRectangle, '$class'})):getRectangle(MotionRectangle), height}));
                    false -> ok
                end,
                (fun(Target_N66760) -> (get({Target_N66760, '$class'})):setSize(Target_N66760, get({local, newWidth}), get({local, newHeight})) end)((get({MotionRectangle, '$class'})):getRectangle(MotionRectangle)),
                throw({'$return', true});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
addPixelDeltaToAMotionRectangle(This, PixelDelta) ->
        case (not (get({This, '$class'})):addPixelDeltaToExistingMotionRectangle(This, PixelDelta)) of
            true ->
            NewRectangle = 'Rectangle':new((fun(Target_N67010) -> (get({Target_N67010, '$class'})):getX(Target_N67010) end)((get({PixelDelta, '$class'})):getPoint(PixelDelta)), (fun(Target_N67034) -> (get({Target_N67034, '$class'})):getY(Target_N67034) end)((get({PixelDelta, '$class'})):getPoint(PixelDelta)), 1, 1),
            MotionRectangle = 'MotionRectangle':new(NewRectangle),
            (fun(Target_N67137) -> (get({Target_N67137, '$class'})):add(Target_N67137, PixelDelta) end)((get({MotionRectangle, '$class'})):getPixelDeltaVector(MotionRectangle)),
            (fun(Target_N67176) -> (get({Target_N67176, '$class'})):add(Target_N67176, MotionRectangle) end)((get({This, '$class'})):getVector(This));
            false -> ok
        end.

% throws Exception
shouldPixelDeltaPartOfMotionRectangle(This, MotionRectangle, PixelDelta) ->
        try
        put({local, isPixelLeftOfTheRectangle}, false),
        case (get({(get({MotionRectangle, '$class'})):getRectangle(MotionRectangle), y}) > (fun(Target_N67332) -> (get({Target_N67332, '$class'})):getY(Target_N67332) end)((get({PixelDelta, '$class'})):getPoint(PixelDelta))) of
            true ->
            erlang:error({'Exception', "PixelAboveTheRectangle"});
            false -> ok
        end,
        case (get({(get({MotionRectangle, '$class'})):getRectangle(MotionRectangle), x}) > (fun(Target_N67419) -> (get({Target_N67419, '$class'})):getX(Target_N67419) end)((get({PixelDelta, '$class'})):getPoint(PixelDelta))) of
            true ->
            put({local, isPixelLeftOfTheRectangle}, true);
            false -> ok
        end,
        case (not get({local, isPixelLeftOfTheRectangle})) of
            true ->
            throw({'$return', (get({This, '$class'})):isPixelDeltaLikelyPartOfMotionRectangle(This, MotionRectangle, PixelDelta)});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
isPixelDeltaLikelyPartOfMotionRectangle(This, MotionRectangle, PixelDelta) ->
        try
        MaxX = (get({(get({MotionRectangle, '$class'})):getRectangle(MotionRectangle), x}) + get({(get({MotionRectangle, '$class'})):getRectangle(MotionRectangle), width})),
        MaxY = (get({(get({MotionRectangle, '$class'})):getRectangle(MotionRectangle), y}) + get({(get({MotionRectangle, '$class'})):getRectangle(MotionRectangle), height})),
        HorizontalDistance = ((fun(Target_N67792) -> (get({Target_N67792, '$class'})):getX(Target_N67792) end)((get({PixelDelta, '$class'})):getPoint(PixelDelta)) - MaxX),
        VerticalDistance = ((fun(Target_N67852) -> (get({Target_N67852, '$class'})):getY(Target_N67852) end)((get({PixelDelta, '$class'})):getPoint(PixelDelta)) - MaxY),
        case ((HorizontalDistance < get({This, 'MAX_PIXEL_DISTANCE_THRESHOLD'})) andalso (VerticalDistance < get({This, 'MAX_PIXEL_DISTANCE_THRESHOLD'}))) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

