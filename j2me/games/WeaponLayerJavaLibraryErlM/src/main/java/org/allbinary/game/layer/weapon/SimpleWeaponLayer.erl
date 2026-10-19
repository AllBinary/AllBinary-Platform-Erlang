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
% package org.allbinary.game.layer.weapon
% import org.allbinary.animation.Animation
% import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory
% import org.allbinary.animation.NullIndexedAnimationFactory
% import org.allbinary.game.combat.damage.ExplosionResources
% import org.allbinary.game.multiplayer.layer.RemoteInfo
% import org.allbinary.graphics.Rectangle
% import org.allbinary.physics.movement.Movement
% import org.allbinary.view.ViewPositionBase

-module('SimpleWeaponLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('WeaponLayer', Function, Arguments).

init_fields(This) ->
    ok.


% throws Exception
createDestroyed() ->
        (fun(Target_N65835) -> (get({Target_N65835, '$class'})):getInstanceAnimation(Target_N65835, (fun(Target_N65895) -> (get({Target_N65895, '$class'})):getInstance(Target_N65895, 0) end)('NullIndexedAnimationFactory':getFactoryInstance())) end)((fun(Target_N65842) -> (get({Target_N65842, '$class'})):getProcedural(Target_N65842, get({'ExplosionResources':getInstance(), 'THIRD_EXPLOSION_RESOURCE'})) end)('FeaturedAnimationInterfaceFactoryInterfaceFactory':getInstance())).

new(Name, RemoteInfo, MultiPlayerType, Movement, AnimationInterface, DestroyedAnimationInterface, Rectangle, ViewPosition) when (is_list(Name) orelse Name =:= undefined), is_integer(MultiPlayerType) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, RemoteInfo, MultiPlayerType, Movement, AnimationInterface, DestroyedAnimationInterface, Rectangle, ViewPosition),
    This.

init(This, Name, RemoteInfo, MultiPlayerType, Movement, AnimationInterface, DestroyedAnimationInterface, Rectangle, ViewPosition) when (is_list(Name) orelse Name =:= undefined), is_integer(MultiPlayerType) ->
        'WeaponLayer':init(This, Name, RemoteInfo, MultiPlayerType, Movement, AnimationInterface, DestroyedAnimationInterface, Rectangle, ViewPosition),
        (get({This, '$class'})):setCollidableInferface(This, 'CollidableWeaponBehavior':new(true)).

