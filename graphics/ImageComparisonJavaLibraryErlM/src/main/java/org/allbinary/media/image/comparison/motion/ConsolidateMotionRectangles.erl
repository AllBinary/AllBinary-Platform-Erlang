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
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil

-module('ConsolidateMotionRectangles').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('MotionRectangles', Function, Arguments).

static_init() ->
    put({?MODULE, 'NAME'}, "consolidatedMotionRectangles_"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new(MotionRectangles) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, MotionRectangles),
    This.

init(This, MotionRectangles) ->
        'MotionRectangles':init(This, get({'ConsolidateMotionRectangles', 'NAME'}), (get({MotionRectangles, '$class'})):getImageComparisonResult(MotionRectangles)),
        init_fields(This),
        Vector = (get({MotionRectangles, '$class'})):getVector(MotionRectangles),
        Size = (get({Vector, '$class'})):size(Vector),
        lists:foreach(fun(Index) ->
            MotionRectangle = (get({Vector, '$class'})):get(Vector, Index),
            (get({Vector, '$class'})):add(Vector, (get({MotionRectangle, '$class'})):clone(MotionRectangle))
        end, lists:seq(0, Size - 1)),
        (get({This, '$class'})):consolidateMotionRectangles(This).

consolidateMotionRectangles(This) ->
        Vector = (get({This, '$class'})):getVector(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Start - Size Before: ", (get({Vector, '$class'})):size(Vector)]), This, "consolidateMotionRectangleConstraints"),
        RemoveVector = 'BasicArrayListD':new(),
        Size = (get({Vector, '$class'})):size(Vector),
        lists:foreach(fun(Index) ->
            MotionRectangle = (get({Vector, '$class'})):get(Vector, Index),
            lists:foreach(fun(I) ->
                MotionRectangle2 = (get({Vector, '$class'})):get(Vector, I),
                Rectangle = (get({MotionRectangle, '$class'})):getRectangle(MotionRectangle),
                Rectangle2 = (get({MotionRectangle2, '$class'})):getRectangle(MotionRectangle2),
                X2 = (get({Rectangle, x}) + get({Rectangle, width})),
                Y2 = (get({Rectangle, y}) + get({Rectangle, height})),
                RightX = (get({Rectangle2, x}) + get({Rectangle2, width})),
                BottomY = (get({Rectangle2, y}) + get({Rectangle2, height})),
                case ((((get({Rectangle, x}) =< get({Rectangle2, x})) andalso (get({Rectangle, y}) =< get({Rectangle2, y}))) andalso (X2 >= RightX)) andalso (Y2 >= BottomY)) of
                    true ->
                    (get({RemoveVector, '$class'})):add(RemoveVector, MotionRectangle2);
                    false -> ok
                end
            end, lists:seq((Index + 1), (get({Vector, '$class'})):size(Vector) - 1))
        end, lists:seq(0, Size - 1)),
        (get({This, '$class'})):remove(This, RemoveVector).

remove(This, RemoveVector) ->
        Vector = (get({This, '$class'})):getVector(This),
        Size = (get({RemoveVector, '$class'})):size(RemoveVector),
        lists:foreach(fun(Index) ->
            (get({Vector, '$class'})):remove(Vector, (get({RemoveVector, '$class'})):get(RemoveVector, Index))
        end, lists:seq(0, Size - 1)).

