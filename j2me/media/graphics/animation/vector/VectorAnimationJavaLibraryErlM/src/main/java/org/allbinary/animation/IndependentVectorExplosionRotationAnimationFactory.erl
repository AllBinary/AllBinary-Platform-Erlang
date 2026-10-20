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
% import org.allbinary.logic.NullUtil
% import org.allbinary.vector.VectorInfo

-module('IndependentVectorExplosionRotationAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ProceduralAnimationInterfaceFactoryInterface

init_fields(This) ->
    put({This, framePoints}, get({'NullUtil':getInstance(), 'NULL_INT_ARRAY_ARRAY_ARRAY'})),
    put({This, vectorInfo}, undefined),
    put({This, basicColor}, undefined),
    put({This, vectorAnimationFactoryInterface}, undefined),
    put({This, vectorExplosionGenerator}, 'VectorExplosionGenerator':getInstance()),
    ok.


new(VectorInfo, BasicColor, VectorAnimationFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, VectorInfo, BasicColor, VectorAnimationFactoryInterface),
    This.

'$init'(This, VectorInfo, BasicColor, VectorAnimationFactoryInterface) ->
    init_fields(This),
        put({This, vectorInfo}, VectorInfo),
        put({This, basicColor}, BasicColor),
        put({This, vectorAnimationFactoryInterface}, VectorAnimationFactoryInterface),
        (get({This, '$class'})):init(This).

% throws Exception
init(This) ->
        put({This, framePoints}, (fun(Target_N66036) -> (get({Target_N66036, '$class'})):getInstance(Target_N66036, get({This, vectorInfo})) end)('VectorRotationGenerator':getInstance())).

% throws Exception
getInstanceAnimation(This, AnimationInterface) ->
        put({local, frame}, 0),
        case (AnimationInterface =/= undefined) of
            true ->
            RotationAnimationInterface = AnimationInterface,
            put({local, frame}, (get({RotationAnimationInterface, '$class'})):getFrame(RotationAnimationInterface));
            false -> ok
        end,
        Points = (get({get({This, vectorExplosionGenerator}), '$class'})):getInstance(get({This, vectorExplosionGenerator}), array:get(get({local, frame}), get({This, framePoints})), 6, get({get({This, vectorExplosionGenerator}), 'ROTATION'})),
        (get({get({This, vectorAnimationFactoryInterface}), '$class'})):getInstance(get({This, vectorAnimationFactoryInterface}), Points, get({This, basicColor})).

