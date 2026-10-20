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
% package org.allbinary.animation.image.sprite
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Image
% import javax.microedition.lcdui.game.Sprite
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.animation.RotationAnimation
% import org.allbinary.logic.math.PrimitiveIntUtil
% import org.allbinary.math.AngleInfo
% import org.allbinary.util.CircularIndexUtil

-module('HackRotationSpriteIndexedAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RotationAnimation', Function, Arguments).

init_fields(This) ->
    put({This, sprite}, undefined),
    put({This, image}, undefined),
    ok.


new(Sprite, Image, AngleInfo, AnimationBehavior) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Sprite, Image, AngleInfo, AnimationBehavior),
    This.

'$init'(This, Sprite, Image, AngleInfo, AnimationBehavior) ->
        'RotationAnimation':'$init'(This, AngleInfo, 'CircularIndexUtil':createInstance((360 / (fun(Target_N65924) -> (get({Target_N65924, '$class'})):getAngleIncrement(Target_N65924) end)((get({AngleInfo, '$class'})):getAngleIncrementInfo(AngleInfo)))), AnimationBehavior),
        init_fields(This),
        put({This, sprite}, Sprite),
        put({This, image}, Image).

% throws Exception
getAnimationSize(This) ->
        (get({This, '$class'})):getSize(This).

paintFrame(This, G, Frame, X, Y) when is_integer(Frame), is_integer(X), is_integer(Y) ->
        (get({This, '$class'})):setFrame(This, Frame),
        (get({This, '$class'})):paintXY(This, G, X, Y).

paintXY(This, G, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, sprite}), '$class'})):setPosition(get({This, sprite}), X, Y),
        (get({This, '$class'})):paint(This, G).

paint(This, G) ->
        (get({get({This, sprite}), '$class'})):paint(get({This, sprite}), G).

nextRotation(This) ->
        (get({get({This, sprite}), '$class'})):nextFrame(get({This, sprite})).

previousRotation(This) ->
        (get({get({This, sprite}), '$class'})):prevFrame(get({This, sprite})).

getSize(This) ->
        (get({get({This, sprite}), '$class'})):getRawFrameCount(get({This, sprite})).

setFrame(This, Frame) when is_integer(Frame) ->
        (get({get({This, sprite}), '$class'})):setFrame(get({This, sprite}), Frame).

getFrame(This) ->
        (get({get({This, sprite}), '$class'})):getFrame(get({This, sprite})).

setSequence(This, Sequence) when (is_tuple(Sequence) orelse Sequence =:= undefined) ->
        ok.

getSequence(This) ->
        'PrimitiveIntUtil':getArrayInstance().

