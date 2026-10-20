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
% import javax.microedition.lcdui.NullImage
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.math.PrimitiveIntUtil
% import org.allbinary.util.CircularIndexUtil

-module('VectorAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements VectorAnimationInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('IndexedAnimation', Function, Arguments).

init_fields(This) ->
    put({This, currentPoints}, get({'NullUtil':getInstance(), 'NULL_INT_ARRAY_ARRAY_ARRAY'})),
    put({This, circularIndexUtil}, 'CircularIndexUtil':createInstance(0)),
    ok.


createVectorAnimation(CurrentPoints2, BasicColor, AnimationBehavior) when (is_tuple(CurrentPoints2) orelse CurrentPoints2 =:= undefined) ->
        CurrentPoints = ok % Otherwise - newArray - 3
,
        Size = array:size(CurrentPoints2),
        lists:foreach(fun(Index) ->
            array:set(0, array:set(Index, array:set(0, array:get(0, array:get(Index, CurrentPoints2)), array:get(Index, array:get(0, CurrentPoints))), array:get(0, CurrentPoints)), CurrentPoints),
            array:set(0, array:set(Index, array:set(1, array:get(1, array:get(Index, CurrentPoints2)), array:get(Index, array:get(0, CurrentPoints))), array:get(0, CurrentPoints)), CurrentPoints)
        end, lists:seq(0, Size - 1)),
        'VectorAnimation':new(CurrentPoints, BasicColor, AnimationBehavior).

new(CurrentPoints, BasicColor, AnimationBehavior) when (is_tuple(CurrentPoints) orelse CurrentPoints =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CurrentPoints, BasicColor, AnimationBehavior),
    This.

'$init'(This, CurrentPoints, BasicColor, AnimationBehavior) when (is_tuple(CurrentPoints) orelse CurrentPoints =:= undefined) ->
        'IndexedAnimation':'$init'(This, AnimationBehavior),
        init_fields(This),
        (get({This, '$class'})):setPoints(This, CurrentPoints),
        (get({This, '$class'})):setBasicColorP(This, BasicColor).

setBasicColorP(This, BasicColor) ->
        put({local, changed}, false),
        case (((get({This, '$class'})):getBasicColorP(This) =:= undefined) orelse ((fun(Target_N66628) -> (get({Target_N66628, '$class'})):intValue(Target_N66628) end)((get({This, '$class'})):getBasicColorP(This)) =/= (get({BasicColor, '$class'})):intValue(BasicColor))) of
            true ->
            put({local, changed}, true);
            false -> ok
        end,
        'IndexedAnimation':setBasicColorP(This, BasicColor),
        case get({local, changed}) of
            true ->
            (get({This, '$class'})):updateModifiers(This);
            false -> ok
        end.

changeBasicColor(This, BasicColor) ->
        put({local, changed}, false),
        case (((get({This, '$class'})):getChangeBasicColor(This) =:= undefined) orelse ((fun(Target_N66878) -> (get({Target_N66878, '$class'})):intValue(Target_N66878) end)((get({This, '$class'})):getChangeBasicColor(This)) =/= (get({BasicColor, '$class'})):intValue(BasicColor))) of
            true ->
            put({local, changed}, true);
            false -> ok
        end,
        'IndexedAnimation':changeBasicColor(This, BasicColor),
        case get({local, changed}) of
            true ->
            (get({This, '$class'})):updateModifiers(This);
            false -> ok
        end.

setAlpha(This, Alpha) when is_integer(Alpha) ->
        put({local, changed}, false),
        case (get({This, alphaP}) =/= Alpha) of
            true ->
            put({local, changed}, true);
            false -> ok
        end,
        'IndexedAnimation':setAlpha(This, Alpha),
        case get({local, changed}) of
            true ->
            (get({This, '$class'})):updateModifiers(This);
            false -> ok
        end.

setScale(This, ScaleX, ScaleY) when is_number(ScaleX), is_number(ScaleY) ->
        ok.

setMaxScale(This, MaxScaleX, MaxScaleY) when is_number(MaxScaleX), is_number(MaxScaleY) ->
        ok.

updateModifiers(This) ->
        ok.

% throws Exception
getAnimationSize(This) ->
        (get({This, '$class'})):getSize(This).

getSize(This) ->
        array:size(get({This, currentPoints})).

setSequence(This, Sequence) when (is_tuple(Sequence) orelse Sequence =:= undefined) ->
        ok.

getSequence(This) ->
        'PrimitiveIntUtil':getArrayInstance().

nextFrame(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):next(get({This, circularIndexUtil})).

previousFrame(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):previous(get({This, circularIndexUtil})).

paintVectors(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
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

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP(get({This, basicSetColorUtil}), Graphics, get({This, basicColor})),
        (get({This, '$class'})):paintVectors(This, Graphics, X, Y).

getFrame(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})).

setFrame(This, Index) when is_integer(Index) ->
        (get({get({This, circularIndexUtil}), '$class'})):setIndex(get({This, circularIndexUtil}), Index).

getPoints(This, Frame) when is_integer(Frame) ->
        array:get(Frame, get({This, currentPoints})).

setPoints(This, CurrentPoints) when (is_tuple(CurrentPoints) orelse CurrentPoints =:= undefined) ->
        put({This, currentPoints}, CurrentPoints),
        put({This, circularIndexUtil}, 'CircularIndexUtil':createInstance(array:size(CurrentPoints))).

