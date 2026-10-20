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
% import org.allbinary.game.collision.CollidableInterfaceCompositeInterface
% import org.allbinary.game.collision.CollisionType
% import org.allbinary.game.collision.CollisionTypeFactory
% import org.allbinary.game.layer.CollidableCompositeLayer
% import org.allbinary.game.layer.pickup.PickedUpLayerInterface
% import org.allbinary.logic.communication.log.ForcedLogUtil

-module('CollidableCharacterNoDamageBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CollidableDestroyableDamageableBehavior', Function, Arguments).

init_fields(This) ->
    ok.


new(Collidable) when is_boolean(Collidable) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Collidable),
    This.

'$init'(This, Collidable) when is_boolean(Collidable) ->
        'CollidableDestroyableDamageableBehavior':'$init'(This, Collidable).

% throws Exception
collide(This, OwnerLayer, CollidableInterfaceCompositeInterface) ->
        CollisionTypeFactory = 'CollisionTypeFactory':getInstance(),
        CollisionType = (fun(Target_N65927) -> (get({Target_N65927, '$class'})):getCollisionTypeWith(Target_N65927, OwnerLayer) end)((get({CollidableInterfaceCompositeInterface, '$class'})):getCollidableInferface(CollidableInterfaceCompositeInterface)),
        case (CollisionType =:= get({CollisionTypeFactory, 'PICKUP'})) of
            true ->
            CollidableDestroyableDamageableLayer = OwnerLayer,
            (fun(Target_N66075) -> (get({Target_N66075, '$class'})):doPickupLayer(Target_N66075, CollidableInterfaceCompositeInterface) end)((get({CollidableDestroyableDamageableLayer, '$class'})):getPickupBehavior(CollidableDestroyableDamageableLayer));
            false ->
            ok
        end.

% throws Exception
collideInterface(This, OwnerLayer, CollidableInterfaceCompositeInterface) ->
        'ForcedLogUtil':log(get({get({This, commonStrings}), 'NOT_IMPLEMENTED'}), This).

