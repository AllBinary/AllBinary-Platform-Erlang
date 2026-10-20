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
% import org.allbinary.DisposalUtil
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.animation.IndexedAnimation
% import org.allbinary.graphics.Anchor
% import org.allbinary.logic.math.PrimitiveIntUtil
% import org.allbinary.util.CircularIndexUtil

-module('TweenedImageAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('IndexedAnimation', Function, Arguments).

init_fields(This) ->
    put({This, image}, undefined),
    put({This, dx}, 0),
    put({This, dy}, 0),
    put({This, totalFrames}, 0),
    put({This, circularIndexUtil}, undefined),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    ok.


new(Image, Dx, Dy, TotalFrames, AnimationBehavior) when is_integer(Dx), is_integer(Dy), is_integer(TotalFrames) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Image, Dx, Dy, TotalFrames, AnimationBehavior),
    This.

'$init'(This, Image, Dx, Dy, TotalFrames, AnimationBehavior) when is_integer(Dx), is_integer(Dy), is_integer(TotalFrames) ->
        'IndexedAnimation':'$init'(This, AnimationBehavior),
        init_fields(This),
        put({This, image}, Image),
        put({This, dx}, Dx),
        put({This, dy}, Dy),
        put({This, totalFrames}, TotalFrames),
        put({This, circularIndexUtil}, 'CircularIndexUtil':createInstance(get({This, totalFrames}))).

% throws Exception
getAnimationSize(This) ->
        (get({This, '$class'})):getSize(This).

nextFrame(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):next(get({This, circularIndexUtil})).

previousFrame(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):previous(get({This, circularIndexUtil})).

setFrame(This, Index) when is_integer(Index) ->
        (get({get({This, circularIndexUtil}), '$class'})):setIndex(get({This, circularIndexUtil}), Index).

getFrame(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})).

getSize(This) ->
        get({This, totalFrames}).

setSequence(This, Sequence) when (is_tuple(Sequence) orelse Sequence =:= undefined) ->
        ok.

getSequence(This) ->
        'PrimitiveIntUtil':getArrayInstance().

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        Frame = (get({This, '$class'})):getFrame(This),
        CurrentX = (get({This, dx}) * Frame),
        CurrentY = (get({This, dy}) * Frame),
        (get({Graphics, '$class'})):drawImage(Graphics, get({This, image}), (X + CurrentX), (Y + CurrentY), get({This, anchor})).

% throws Exception
close(This) ->
        (fun(Target_N67123) -> (get({Target_N67123, '$class'})):disposeImage(Target_N67123, get({This, image})) end)('DisposalUtil':getInstance()).

% throws Throwable
finalize(This) ->
        (fun(Target_N67201) -> (get({Target_N67201, '$class'})):disposeImage(Target_N67201, get({This, image})) end)('DisposalUtil':getInstance()).

