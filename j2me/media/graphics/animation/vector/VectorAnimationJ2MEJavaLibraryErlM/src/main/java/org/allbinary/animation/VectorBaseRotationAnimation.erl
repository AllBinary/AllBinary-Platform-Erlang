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
% package org.allbinary.animation
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.math.PrimitiveIntUtil
% import org.allbinary.math.AngleInfo
% import org.allbinary.util.CircularIndexUtil

-module('VectorBaseRotationAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements VectorAnimationInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('RotationAnimation', Function, Arguments).

init_fields(This) ->
    put({This, currentPoints}, get({'NullUtil':getInstance(), 'NULL_INT_ARRAY_ARRAY_ARRAY'})),
    ok.


new(AngleInfo, CurrentPoints, BasicColor, AnimationBehavior) when (is_tuple(CurrentPoints) orelse CurrentPoints =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AngleInfo, CurrentPoints, BasicColor, AnimationBehavior),
    This.

'$init'(This, AngleInfo, CurrentPoints, BasicColor, AnimationBehavior) when (is_tuple(CurrentPoints) orelse CurrentPoints =:= undefined) ->
        'RotationAnimation':'$init'(This, AngleInfo, 'CircularIndexUtil':createInstance((360 / (fun(Target_N65872) -> (get({Target_N65872, '$class'})):getAngleIncrement(Target_N65872) end)((get({AngleInfo, '$class'})):getAngleIncrementInfo(AngleInfo)))), AnimationBehavior),
        init_fields(This),
        (get({This, '$class'})):setPoints(This, CurrentPoints),
        (get({This, '$class'})):setBasicColorP(This, BasicColor).

% throws Exception
getAnimationSize(This) ->
        (get({This, '$class'})):getSize(This).

getFrame(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})).

setFrame(This, Index) when is_integer(Index) ->
        (get({get({This, circularIndexUtil}), '$class'})):setIndex(get({This, circularIndexUtil}), Index).

nextFrame(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):next(get({This, circularIndexUtil})).

previousFrame(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):previous(get({This, circularIndexUtil})).

getSize(This) ->
        array:size(get({This, currentPoints})).

setSequence(This, Sequence) when (is_tuple(Sequence) orelse Sequence =:= undefined) ->
        ok.

getSequence(This) ->
        'PrimitiveIntUtil':getArrayInstance().

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP(get({This, basicSetColorUtil}), Graphics, get({This, basicColor})),
        try
            put({local, nextPointX}, 0),
            put({local, nextPointY}, 0),
            put({local, nextPoint}, undefined),
            put({local, point}, undefined),
            CurrentPointsFrame = array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, currentPoints})),
            Size = array:size(CurrentPointsFrame),
            put({local, index}, (Size - 2)),
            (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
                put({local, nextPoint}, array:get(get({local, index}), CurrentPointsFrame)),
                put({local, point}, array:get((get({local, index}) + 1), CurrentPointsFrame)),
                put({local, nextPointX}, array:get(0, get({local, nextPoint}))),
                put({local, nextPointY}, array:get(1, get({local, nextPoint}))),
                case (get({local, nextPointX}) =/= 1000) of
                    true ->
                    (get({Graphics, '$class'})):drawLine(Graphics, (array:get(0, get({local, point})) + X), (array:get(1, get({local, point})) + Y), (get({local, nextPointX}) + X), (get({local, nextPointY}) + Y));
                    false ->
                    put({local, index}, get({local, index}) - 1)
                end,
                Loop();
            false -> ok end end)()
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "paintVectors", E)
        end.

getPoints(This, Frame) when is_integer(Frame) ->
        array:get(Frame, get({This, currentPoints})).

setPoints(This, CurrentPoints) when (is_tuple(CurrentPoints) orelse CurrentPoints =:= undefined) ->
        put({This, currentPoints}, CurrentPoints),
        put({This, circularIndexUtil}, 'CircularIndexUtil':createInstance(array:size(get({This, currentPoints})))).

