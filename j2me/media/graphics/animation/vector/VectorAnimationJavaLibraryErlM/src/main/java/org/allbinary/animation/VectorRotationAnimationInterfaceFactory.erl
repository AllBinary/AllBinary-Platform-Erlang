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
% import org.allbinary.logic.NullUtil
% import org.allbinary.media.ScaleProperties

-module('VectorRotationAnimationInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AnimationInterfaceFactoryInterface

init_fields(This) ->
    put({This, currentPoints}, get({'NullUtil':getInstance(), 'NULL_INT_ARRAY_ARRAY_ARRAY'})),
    put({This, basicColor}, get({'BasicColorFactory':getInstance(), 'WHITE'})),
    put({This, animationBehaviorFactory}, undefined),
    ok.


new(CurrentPoints, BasicColor, AnimationBehaviorFactory) when (is_tuple(CurrentPoints) orelse CurrentPoints =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CurrentPoints, BasicColor, AnimationBehaviorFactory),
    This.

'$init'(This, CurrentPoints, BasicColor, AnimationBehaviorFactory) when (is_tuple(CurrentPoints) orelse CurrentPoints =:= undefined) ->
    init_fields(This),
        put({This, currentPoints}, CurrentPoints),
        (get({This, '$class'})):setBasicColorP(This, BasicColor),
        put({This, animationBehaviorFactory}, AnimationBehaviorFactory).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        'VectorRotationAnimation':new(get({This, currentPoints}), (get({This, '$class'})):getBasicColorP(This), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory}))).

setBasicColorP(This, BasicColor) ->
        put({This, basicColor}, BasicColor).

getBasicColorP(This) ->
        get({This, basicColor}).

setInitialScale(This, ScaleProperties) ->
        ok.

