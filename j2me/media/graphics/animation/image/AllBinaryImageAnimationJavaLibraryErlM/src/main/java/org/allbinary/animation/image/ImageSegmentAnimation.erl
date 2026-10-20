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
% package org.allbinary.animation.image
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Image
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.util.CircularIndexUtil

-module('ImageSegmentAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ImageAnimation', Function, Arguments).

init_fields(This) ->
    put({This, startX}, 0),
    put({This, startY}, 0),
    put({This, drawWidth}, 0),
    put({This, drawHeight}, 0),
    put({This, circularIndexUtil}, undefined),
    put({This, sequenceArray}, undefined),
    ok.


new(Image, SequenceArray, AnimationBehavior) when (is_tuple(SequenceArray) orelse SequenceArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Image, SequenceArray, AnimationBehavior),
    This.

'$init'(This, Image, SequenceArray, AnimationBehavior) when (is_tuple(SequenceArray) orelse SequenceArray =:= undefined) ->
        'ImageAnimation':'$init'(This, Image, AnimationBehavior),
        init_fields(This),
        put({This, startX}, 0),
        put({This, startY}, 0),
        put({This, drawWidth}, (fun(Target_N65965) -> (get({Target_N65965, '$class'})):getWidth(Target_N65965) end)((get({This, '$class'})):getImage(This))),
        put({This, drawHeight}, (fun(Target_N66004) -> (get({Target_N66004, '$class'})):getHeight(Target_N66004) end)((get({This, '$class'})):getImage(This))),
        put({This, circularIndexUtil}, 'CircularIndexUtil':createInstance(get({This, drawHeight}))),
        put({This, sequenceArray}, SequenceArray).

nextFrame(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):next(get({This, circularIndexUtil})).

previousFrame(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):previous(get({This, circularIndexUtil})).

setFrame(This, Index) when is_integer(Index) ->
        (get({get({This, circularIndexUtil}), '$class'})):setIndex(get({This, circularIndexUtil}), Index).

getFrame(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})).

getSize(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):getSize(get({This, circularIndexUtil})).

setSequence(This, SequenceArray) when (is_tuple(SequenceArray) orelse SequenceArray =:= undefined) ->
        put({This, sequenceArray}, SequenceArray).

getSequence(This) ->
        get({This, sequenceArray}).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        ok.

getStartX(This) ->
        get({This, startX}).

setStartX(This, StartX) when is_integer(StartX) ->
        put({This, startX}, StartX).

getStartY(This) ->
        get({This, startY}).

setStartY(This, StartY) when is_integer(StartY) ->
        put({This, startY}, StartY).

getDrawWidth(This) ->
        get({This, drawWidth}).

setDrawWidth(This, DrawWidth) when is_integer(DrawWidth) ->
        put({This, drawWidth}, DrawWidth).

getDrawHeight(This) ->
        get({This, drawHeight}).

setDrawHeight(This, DrawHeight) when is_integer(DrawHeight) ->
        put({This, drawHeight}, DrawHeight).

