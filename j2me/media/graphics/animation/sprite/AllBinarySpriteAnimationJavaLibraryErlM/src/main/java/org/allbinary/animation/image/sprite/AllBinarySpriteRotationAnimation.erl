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
% import javax.microedition.lcdui.Image
% import javax.microedition.lcdui.game.Sprite
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.direction.Direction
% import org.allbinary.math.Angle
% import org.allbinary.math.AngleFactory
% import org.allbinary.math.AngleInfo

-module('AllBinarySpriteRotationAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HackRotationSpriteIndexedAnimation', Function, Arguments).

init_fields(This) ->
    ok.


new(Sprite, Image, AnimationBehavior) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Sprite, Image, AnimationBehavior),
    This.

'$init'(This, Sprite, Image, AnimationBehavior) ->
        'HackRotationSpriteIndexedAnimation':'$init'(This, Sprite, Image, 'AngleInfo':getInstance(trunc(((get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'}) / (get({Sprite, '$class'})):getRawFrameCount(Sprite))))), AnimationBehavior),
        (get({get({This, angleInfo}), '$class'})):adjustAngle(get({This, angleInfo}), (get({get({This, sprite}), '$class'})):getFrame(get({This, sprite}))).

nextRotation(This) ->
        (get({get({This, sprite}), '$class'})):nextFrame(get({This, sprite})),
        (get({get({This, angleInfo}), '$class'})):adjustAngle(get({This, angleInfo}), (get({get({This, sprite}), '$class'})):getFrame(get({This, sprite}))).

previousRotation(This) ->
        (get({get({This, sprite}), '$class'})):prevFrame(get({This, sprite})),
        (get({get({This, angleInfo}), '$class'})):adjustAngle(get({This, angleInfo}), (get({get({This, sprite}), '$class'})):getFrame(get({This, sprite}))).

setFrameByDirection(This, Direction) ->
        Angle = (get({get({This, directionUtil}), '$class'})):getFrameAngle(get({This, directionUtil}), Direction),
        (get({This, '$class'})):adjustFrameToAngle(This, Angle).

setFrameToAngle(This, Angle) ->
        (get({This, '$class'})):adjustFrameToAngle(This, Angle).

setFrame(This, Index) when is_integer(Index) ->
        (get({get({This, sprite}), '$class'})):setFrame(get({This, sprite}), Index),
        (get({get({This, angleInfo}), '$class'})):adjustAngle(get({This, angleInfo}), (get({This, '$class'})):getFrame(This)).

adjustFrameToAngle(This, Angle) ->
        (get({This, '$class'})):adjustFrame(This, (get({Angle, '$class'})):getValue(Angle)).

adjustFrame(This, Angle) when is_integer(Angle) ->
        (get({This, '$class'})):setFrame(This, (get({get({This, frameUtil}), '$class'})):getFrameForAngle(get({This, frameUtil}), Angle, trunc((fun(Target_N66749) -> (get({Target_N66749, '$class'})):getAngleIncrement(Target_N66749) end)((get({get({This, angleInfo}), '$class'})):getAngleIncrementInfo(get({This, angleInfo})))))).

