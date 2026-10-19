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
% import org.allbinary.game.multiplayer.layer.RemoteInfo
% import org.allbinary.graphics.Rectangle
% import org.allbinary.physics.movement.Movement
% import org.allbinary.view.ViewPositionBase

-module('DamageWeaponLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('WeaponLayer', Function, Arguments).

init_fields(This) ->
    ok.


new(Name, RemoteInfo, Movement, AnimationInterface, DestroyedAnimationInterface, Rectangle, ViewPosition, Username, ActorSessionId, Id, MultiPlayerType) when (is_list(Name) orelse Name =:= undefined), (is_list(Username) orelse Username =:= undefined), is_integer(ActorSessionId), is_integer(Id), is_integer(MultiPlayerType) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, RemoteInfo, Movement, AnimationInterface, DestroyedAnimationInterface, Rectangle, ViewPosition, Username, ActorSessionId, Id, MultiPlayerType),
    This.

init(This, Name, RemoteInfo, Movement, AnimationInterface, DestroyedAnimationInterface, Rectangle, ViewPosition, Username, ActorSessionId, Id, MultiPlayerType) when (is_list(Name) orelse Name =:= undefined), (is_list(Username) orelse Username =:= undefined), is_integer(ActorSessionId), is_integer(Id), is_integer(MultiPlayerType) ->
        'WeaponLayer':init(This, Name, RemoteInfo, MultiPlayerType, Movement, AnimationInterface, DestroyedAnimationInterface, Rectangle, ViewPosition),
        (get({This, '$class'})):setCollidableInferface(This, 'CollidableDamageWeaponBehavior':new(true)).

