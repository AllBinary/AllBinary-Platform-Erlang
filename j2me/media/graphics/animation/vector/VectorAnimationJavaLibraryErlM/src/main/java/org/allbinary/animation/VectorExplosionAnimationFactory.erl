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
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory

-module('VectorExplosionAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ProceduralAnimationInterfaceFactoryInterface

init_fields(This) ->
    put({This, vectorExplosionGenerator}, 'VectorExplosionGenerator':getInstance()),
    put({This, basicColor}, get({'BasicColorFactory':getInstance(), 'WHITE'})),
    put({This, animationBehaviorFactory}, undefined),
    ok.


new(BasicColor, AnimationBehaviorFactory) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, BasicColor, AnimationBehaviorFactory),
    This.

'$init'(This, BasicColor, AnimationBehaviorFactory) ->
    init_fields(This),
        put({This, animationBehaviorFactory}, AnimationBehaviorFactory),
        (get({This, '$class'})):setBasicColorP(This, BasicColor).

% throws Exception
getInstanceAnimation(This, AnimationInterface) ->
        VectorRotationAnimationInterface = AnimationInterface,
        Frame = (get({VectorRotationAnimationInterface, '$class'})):getFrame(VectorRotationAnimationInterface),
        FramePoints = (get({VectorRotationAnimationInterface, '$class'})):getPoints(VectorRotationAnimationInterface, Frame),
        Points = (get({get({This, vectorExplosionGenerator}), '$class'})):getInstance(get({This, vectorExplosionGenerator}), FramePoints, 6, get({get({This, vectorExplosionGenerator}), 'ROTATION'})),
        'VectorRotationAnimation':new(Points, (get({This, '$class'})):getBasicColorP(This), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory}))).

setBasicColorP(This, BasicColor) ->
        put({This, basicColor}, BasicColor).

getBasicColorP(This) ->
        get({This, basicColor}).

