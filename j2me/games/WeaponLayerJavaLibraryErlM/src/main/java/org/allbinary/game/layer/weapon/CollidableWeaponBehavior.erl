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
% import org.allbinary.game.collision.CollidableHelperFactory
% import org.allbinary.game.collision.CollidableInterfaceCompositeInterface
% import org.allbinary.game.collision.CollisionHelper
% import org.allbinary.game.collision.CollisionType
% import org.allbinary.game.collision.CollisionTypeFactory
% import org.allbinary.game.combat.damage.DamageableInterface
% import org.allbinary.game.layer.CollidableCompositeLayer
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableBehavior
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.NullUtil

-module('CollidableWeaponBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CollidableDestroyableDamageableBehavior', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_COLLIDABLE_WEAPON_BEHAVIOR'}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, collided}, false),
    put({This, collisionHelper}, undefined),
    ok.


getNullInstance() ->
        case (get({'CollidableWeaponBehavior', 'NULL_COLLIDABLE_WEAPON_BEHAVIOR'}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'CollidableWeaponBehavior', 'NULL_COLLIDABLE_WEAPON_BEHAVIOR'}, 'CollidableWeaponBehavior':new(false));
            false -> ok
        end,
        get({'CollidableWeaponBehavior', 'NULL_COLLIDABLE_WEAPON_BEHAVIOR'}).

new(Collidable) when is_boolean(Collidable) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Collidable),
    This.

init(This, Collidable) when is_boolean(Collidable) ->
        'CollidableDestroyableDamageableBehavior':init(This, Collidable),
        init_fields(This),
        (get({This, '$class'})):setCollided(This, false),
        (get({This, '$class'})):setCollidable(This, true),
        put({This, collisionHelper}, 'CollidableHelperFactory':getInstance()).

init(This, SourceLayerInterface) ->
        (get({This, '$class'})):setCollided(This, false),
        (get({get({This, collisionHelper}), '$class'})):setOwnerLayerInterface(get({This, collisionHelper}), SourceLayerInterface).

isCollision(This, OwnerLayer, CollisionLayer) ->
        try
        case (get({get({This, collisionHelper}), '$class'})):isCollidable(get({This, collisionHelper}), CollisionLayer) of
            true ->
            case (array:get(0, (get({OwnerLayer, '$class'})):getGroupInterface(OwnerLayer)) =/= array:get(0, (get({CollisionLayer, '$class'})):getGroupInterface(CollisionLayer))) of
                true ->
                throw({'$return', 'CollidableDestroyableDamageableBehavior':isCollision(This, OwnerLayer, CollisionLayer)});
                false -> ok
            end;
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
collide(This, OwnerLayer, CollisionLayer) ->
        'CollidableDestroyableDamageableBehavior':collide(This, OwnerLayer, CollisionLayer),
        put({This, collided}, true).

isCollisionInterface(This, OwnerLayer, CollidableInterfaceCompositeInterface) ->
        try
        case (get({get({This, collisionHelper}), '$class'})):isCollidable(get({This, collisionHelper}), CollidableInterfaceCompositeInterface) of
            true ->
            LayerInterface = CollidableInterfaceCompositeInterface,
            case (array:get(0, (get({OwnerLayer, '$class'})):getGroupInterface(OwnerLayer)) =/= array:get(0, (get({LayerInterface, '$class'})):getGroupInterface(LayerInterface))) of
                true ->
                case (get({get({This, layerCollisionUtil}), '$class'})):isCollision(get({This, layerCollisionUtil}), OwnerLayer, LayerInterface) of
                    true ->
                    throw({'$return', true});
                    false -> ok
                end;
                false -> ok
            end;
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
collideInterface(This, OwnerLayer, CollidableInterfaceCompositeInterface) ->
        OwnerDamageableInterface = OwnerLayer,
        DamageableInterface = CollidableInterfaceCompositeInterface,
        (get({get({This, damageUtil}), '$class'})):process(get({This, damageUtil}), OwnerDamageableInterface, DamageableInterface),
        put({This, collided}, true).

getCollisionTypeWith(This, LayerInterface) ->
        get({'CollisionTypeFactory':getInstance(), 'COLLISION'}).

isCollided(This) ->
        get({This, collided}).

setCollided(This, Collided) when is_boolean(Collided) ->
        put({This, collided}, Collided).

