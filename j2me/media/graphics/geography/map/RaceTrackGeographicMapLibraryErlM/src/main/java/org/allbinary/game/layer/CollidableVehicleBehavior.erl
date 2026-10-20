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
% package org.allbinary.game.layer
% import org.allbinary.game.layer.pickup.PickedUpLayerInterface
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.game.collision.CollidableInterfaceCompositeInterface
% import org.allbinary.game.collision.CollisionType
% import org.allbinary.game.collision.CollisionTypeFactory
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableBehavior
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer

-module('CollidableVehicleBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CollidableDestroyableDamageableBehavior', Function, Arguments).

init_fields(This) ->
    put({This, totalImpactVelocity}, 0),
    put({This, halfImpactVelocityX}, 0),
    put({This, halfImpactVelocityY}, 0),
    ok.


new(Collidable) when is_boolean(Collidable) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Collidable),
    This.

'$init'(This, Collidable) when is_boolean(Collidable) ->
        'CollidableDestroyableDamageableBehavior':'$init'(This, Collidable),
        init_fields(This).

% throws Exception
collide(This, OwnerLayer, CollidableInterfaceCompositeInterface) ->
        CollisionTypeFactory = 'CollisionTypeFactory':getInstance(),
        CollisionType = (fun(Target_N65999) -> (get({Target_N65999, '$class'})):getCollisionTypeWith(Target_N65999, OwnerLayer) end)((get({CollidableInterfaceCompositeInterface, '$class'})):getCollidableInferface(CollidableInterfaceCompositeInterface)),
        case (CollisionType =:= get({CollisionTypeFactory, 'PICKUP'})) of
            true ->
            CollidableDestroyableDamageableLayer = (OwnerLayer),
            (fun(Target_N66275) -> (get({Target_N66275, '$class'})):doPickupLayer(Target_N66275, CollidableInterfaceCompositeInterface) end)((get({CollidableDestroyableDamageableLayer, '$class'})):getPickupBehavior(CollidableDestroyableDamageableLayer));
            false ->
            case (CollisionType =:= get({CollisionTypeFactory, 'COLLISION'})) of
            true ->
            'CollidableDestroyableDamageableBehavior':collide(This, OwnerLayer, CollidableInterfaceCompositeInterface);
            false ->
            (get({This, '$class'})):collideVehicle(This, OwnerLayer, CollidableInterfaceCompositeInterface)
        end
        end.

collideInterface(This, OwnerLayer, CollidableInterfaceCompositeInterface) ->
        'ForcedLogUtil':log("Don't Use Interface Version It Is Slower", This).

collideVehicle(This, OwnerLayer, VehiclePropertiesCompositeInterface) ->
        OwnerVehicleLayerInterface = (OwnerLayer),
        OwnerVehicleProperties = (get({OwnerVehicleLayerInterface, '$class'})):getVehicleProperties(OwnerVehicleLayerInterface),
        VehicleProperties = (get({VehiclePropertiesCompositeInterface, '$class'})):getVehicleProperties(VehiclePropertiesCompositeInterface),
        ImpactVelocityX = ((fun(Target_N66773) -> (get({Target_N66773, '$class'})):getUnscaled(Target_N66773) end)((fun(Target_N66780) -> (get({Target_N66780, '$class'})):getVelocityXBasicDecimalP(Target_N66780) end)((get({OwnerVehicleProperties, '$class'})):getVelocityProperties(OwnerVehicleProperties))) - (fun(Target_N66805) -> (get({Target_N66805, '$class'})):getUnscaled(Target_N66805) end)((fun(Target_N66812) -> (get({Target_N66812, '$class'})):getVelocityXBasicDecimalP(Target_N66812) end)((get({VehicleProperties, '$class'})):getVelocityProperties(VehicleProperties)))),
        ImpactVelocityY = ((fun(Target_N66876) -> (get({Target_N66876, '$class'})):getUnscaled(Target_N66876) end)((fun(Target_N66883) -> (get({Target_N66883, '$class'})):getVelocityYBasicDecimalP(Target_N66883) end)((get({OwnerVehicleProperties, '$class'})):getVelocityProperties(OwnerVehicleProperties))) - (fun(Target_N66908) -> (get({Target_N66908, '$class'})):getUnscaled(Target_N66908) end)((fun(Target_N66915) -> (get({Target_N66915, '$class'})):getVelocityYBasicDecimalP(Target_N66915) end)((get({VehicleProperties, '$class'})):getVelocityProperties(VehicleProperties)))),
        case (ImpactVelocityX =/= 0) of
            true ->
            put({This, halfImpactVelocityX}, ((ImpactVelocityX bsr 1))),
            (fun(Target_N67029) -> (get({Target_N67029, '$class'})):addlong(Target_N67029, get({This, halfImpactVelocityX})) end)((fun(Target_N67036) -> (get({Target_N67036, '$class'})):getVelocityXBasicDecimalP(Target_N67036) end)((get({OwnerVehicleProperties, '$class'})):getVelocityProperties(OwnerVehicleProperties))),
            (fun(Target_N67079) -> (get({Target_N67079, '$class'})):addlong(Target_N67079, get({This, halfImpactVelocityX})) end)((fun(Target_N67086) -> (get({Target_N67086, '$class'})):getVelocityXBasicDecimalP(Target_N67086) end)((get({VehicleProperties, '$class'})):getVelocityProperties(VehicleProperties)));
            false ->
            ok
        end,
        case (ImpactVelocityY =/= 0) of
            true ->
            put({This, halfImpactVelocityY}, ((ImpactVelocityY bsr 1))),
            (fun(Target_N67209) -> (get({Target_N67209, '$class'})):addlong(Target_N67209, get({This, halfImpactVelocityY})) end)((fun(Target_N67216) -> (get({Target_N67216, '$class'})):getVelocityYBasicDecimalP(Target_N67216) end)((get({OwnerVehicleProperties, '$class'})):getVelocityProperties(OwnerVehicleProperties))),
            (fun(Target_N67259) -> (get({Target_N67259, '$class'})):addlong(Target_N67259, get({This, halfImpactVelocityY})) end)((fun(Target_N67266) -> (get({Target_N67266, '$class'})):getVelocityXBasicDecimalP(Target_N67266) end)((get({VehicleProperties, '$class'})):getVelocityProperties(VehicleProperties)));
            false ->
            ok
        end,
        (get({This, '$class'})):collideFriction(This, OwnerVehicleLayerInterface),
        (get({This, '$class'})):collideFriction(This, VehiclePropertiesCompositeInterface),
        put({This, totalImpactVelocity}, (ImpactVelocityX + ImpactVelocityY)).

collideFriction(This, VehiclePropertiesCompositeInterface) ->
        VehicleFrictionProperties = (fun(Target_N67504) -> (get({Target_N67504, '$class'})):getVehicleFrictionProperties(Target_N67504) end)((get({VehiclePropertiesCompositeInterface, '$class'})):getVehicleProperties(VehiclePropertiesCompositeInterface)),
        (fun(Target_N67547) -> (get({Target_N67547, '$class'})):friction(Target_N67547, (fun(Target_N67580) -> (get({Target_N67580, '$class'})):getVelocityProperties(Target_N67580) end)((get({VehiclePropertiesCompositeInterface, '$class'})):getVehicleProperties(VehiclePropertiesCompositeInterface)), (get({VehicleFrictionProperties, '$class'})):getCrashFrictionNominator(VehicleFrictionProperties)) end)((fun(Target_N67554) -> (get({Target_N67554, '$class'})):getVehicleFrictionProperties(Target_N67554) end)((get({VehiclePropertiesCompositeInterface, '$class'})):getVehicleProperties(VehiclePropertiesCompositeInterface))).

