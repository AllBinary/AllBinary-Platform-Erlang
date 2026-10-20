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
% package org.allbinary.input.automation.module
% import java.awt.Color
% import java.awt.Rectangle
% import java.awt.image.BufferedImage
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.collision.RectangleCollisionUtil
% import org.allbinary.graphics.GPoint
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.media.image.comparison.ImageComparatorConstraintsInterface

-module('ImageComparatorConstraints').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ImageComparatorConstraintsInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, avoidVector}, undefined),
    put({This, maxNonMatchingPixelDeltas}, 0),
    put({This, doImageComparisonEveryNthFrame}, 0),
    ok.


new(DoImageComparisonEveryNthFrame) when is_integer(DoImageComparisonEveryNthFrame) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, DoImageComparisonEveryNthFrame),
    This.

'$init'(This, DoImageComparisonEveryNthFrame) when is_integer(DoImageComparisonEveryNthFrame) ->
    init_fields(This),
        put({This, doImageComparisonEveryNthFrame}, DoImageComparisonEveryNthFrame),
        (get({This, '$class'})):setAvoidVector(This, 'BasicArrayListD':new()).

getAvoidVector(This) ->
        get({This, avoidVector}).

isColorAllowed(This, Frame, Point, Color) when is_integer(Frame) ->
        erlang:error({'RuntimeException'}).

isCollisionWithAvoidRectangles(This, Rectangle) ->
        put({local, isCollsionWithAvoidRectangles}, false),
        AvoidVector = (get({This, '$class'})):getAvoidVector(This),
        Size = (get({AvoidVector, '$class'})):size(AvoidVector),
        lists:foreach(fun(Index) ->
            AvoidRectangle = (get({AvoidVector, '$class'})):get(AvoidVector, Index),
            case 'RectangleCollisionUtil':isCollision(AvoidRectangle, Rectangle) of
                true ->
                put({local, isCollsionWithAvoidRectangles}, true);
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        get({local, isCollsionWithAvoidRectangles});
isCollisionWithAvoidRectangles(This, Point) ->
        put({local, isCollsionWithAvoidRectangles}, false),
        AvoidVector = (get({This, '$class'})):getAvoidVector(This),
        Size = (get({AvoidVector, '$class'})):size(AvoidVector),
        lists:foreach(fun(Index) ->
            AvoidRectangle = (get({AvoidVector, '$class'})):get(AvoidVector, Index),
            case 'RectangleCollisionUtil':isCollision(AvoidRectangle, Point) of
                true ->
                put({local, isCollsionWithAvoidRectangles}, true),
                throw('$break');
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        get({local, isCollsionWithAvoidRectangles}).


setAvoidVector(This, AvoidVector) ->
        put({This, avoidVector}, AvoidVector).

getMaxNonMatchingPixelDeltas(This) ->
        get({This, maxNonMatchingPixelDeltas}).

setMaxNonMatchingPixelDeltas(This, MaxNonMatchingPixelDeltas) when is_integer(MaxNonMatchingPixelDeltas) ->
        put({This, maxNonMatchingPixelDeltas}, MaxNonMatchingPixelDeltas).

isFrameAllowed(This, Frame) when is_integer(Frame) ->
        try
        Remainder = ((((Frame + 1)) rem get({This, doImageComparisonEveryNthFrame}))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat([lists:concat([lists:concat([" Frame: ", Frame]), " remainder: "]), Remainder]), " this.doImageComparisonEveryNthFrame: "]), get({This, doImageComparisonEveryNthFrame})]), This, "isCollisionWithAvoidRectangles"),
        case (Remainder =:= 0) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
isImageValid(This, BufferedImage) ->
        erlang:error({'RuntimeException'}).

log(This) ->
        AvoidVector = (get({This, '$class'})):getAvoidVector(This),
        Size = (get({AvoidVector, '$class'})):size(AvoidVector),
        lists:foreach(fun(Index) ->
            AvoidRectangle = (get({AvoidVector, '$class'})):get(AvoidVector, Index),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Avoid Rectangle: ", AvoidRectangle]), This, "log")
        end, lists:seq(0, Size - 1)).

