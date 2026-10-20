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
% package org.allbinary.game.layer.special
% import org.allbinary.game.collision.CollidableBaseBehavior
% import org.allbinary.game.collision.CollidableInterfaceCompositeInterface
% import org.allbinary.game.combat.damage.DamageUtil
% import org.allbinary.game.layer.CollidableCompositeLayer
% import org.allbinary.logic.communication.log.ForcedLogUtil

-module('CollidableDestroyableDamageableBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CollidableBaseBehavior', Function, Arguments).

init_fields(This) ->
    put({This, damageUtil}, 'DamageUtil':getInstance()),
    ok.


new(Collidable) when is_boolean(Collidable) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Collidable),
    This.

'$init'(This, Collidable) when is_boolean(Collidable) ->
        'CollidableBaseBehavior':'$init'(This, Collidable),
        init_fields(This).

isCollision(This, OwnerLayer, CollisionLayer) ->
        try
        case (array:get(0, (get({OwnerLayer, '$class'})):getGroupInterface(OwnerLayer)) =/= array:get(0, (get({CollisionLayer, '$class'})):getGroupInterface(CollisionLayer))) of
            true ->
            throw({'$return', 'CollidableBaseBehavior':isCollision(This, OwnerLayer, CollisionLayer)});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
collide(This, OwnerLayer, CollidableInterfaceCompositeInterface) ->
        OwnerCollidableDestroyableDamageableLayer = OwnerLayer,
        CollidableDestroyableDamageableLayer = CollidableInterfaceCompositeInterface,
        (get({OwnerCollidableDestroyableDamageableLayer, '$class'})):damage(OwnerCollidableDestroyableDamageableLayer, (get({CollidableDestroyableDamageableLayer, '$class'})):getDamage(CollidableDestroyableDamageableLayer, 0), 0).

isCollisionInterface(This, OwnerLayer, CollidableInterfaceCompositeInterface) ->
        'ForcedLogUtil':log("No Longer Used", This),
        false.

% throws Exception
collideInterface(This, OwnerLayer, CollidableInterfaceCompositeInterface) ->
        'ForcedLogUtil':log("No Longer Used", This).

