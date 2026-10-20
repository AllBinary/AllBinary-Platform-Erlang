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
% package org.allbinary.game.layer.pickup
% import org.allbinary.game.health.HealthInterfaceCompositeInterface
% import org.allbinary.game.layer.CollidableCompositeLayer
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.game.part.CountedLayerInterfaceFactoryPart
% import org.allbinary.game.part.PartInterface
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.string.CommonStrings

-module('PickupBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements PickupBehaviorInterface

static_init() ->
    put({?MODULE, 'NULL_PICKUP_BEHAVIOR'}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, countedIndex}, 0),
    put({This, ownerLayerInterface}, undefined),
    ok.


getNullInstance() ->
        case (get({'PickupBehavior', 'NULL_PICKUP_BEHAVIOR'}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'PickupBehavior', 'NULL_PICKUP_BEHAVIOR'}, 'PickupBehavior':new('CollidableCompositeLayer':getNullInstance(), 0));
            false -> ok
        end,
        get({'PickupBehavior', 'NULL_PICKUP_BEHAVIOR'}).

new(OwnerLayerInterface, CountedIndex) when is_integer(CountedIndex) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, OwnerLayerInterface, CountedIndex),
    This.

'$init'(This, OwnerLayerInterface, CountedIndex) when is_integer(CountedIndex) ->
    init_fields(This),
        put({This, ownerLayerInterface}, OwnerLayerInterface),
        put({This, countedIndex}, CountedIndex).

doPickup(This, PickupProcessorInterface) ->
        try
            HealthInterfaceCompositeInterface = get({This, ownerLayerInterface}),
            case (fun(Target_N66437) -> (get({Target_N66437, '$class'})):isAlive(Target_N66437) end)((get({HealthInterfaceCompositeInterface, '$class'})):getHealthInterface(HealthInterfaceCompositeInterface)) of
                true ->
                (get({PickupProcessorInterface, '$class'})):process(PickupProcessorInterface, get({This, ownerLayerInterface}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "doPickup", E)
        end.

doPickupLayer(This, PickupLayerInterface) ->
        try
            PickedUpLayerInterfaceFactoryInterface = (get({PickupLayerInterface, '$class'})):getPickedUpLayerInterfaceFactoryInterface(PickupLayerInterface),
            PickedUpLayerType = (get({PickedUpLayerInterfaceFactoryInterface, '$class'})):getPickedUpLayerType(PickedUpLayerInterfaceFactoryInterface),
            PickedUpLayerTypeFactory = 'PickedUpLayerTypeFactory':getInstance(),
            case ((((PickedUpLayerType =:= get({PickedUpLayerTypeFactory, 'BEAM'})) orelse (PickedUpLayerType =:= get({PickedUpLayerTypeFactory, 'MINE'}))) orelse (PickedUpLayerType =:= get({PickedUpLayerTypeFactory, 'PROJECTILE'}))) orelse (PickedUpLayerType =:= get({PickedUpLayerTypeFactory, 'ENHANCEMENT'}))) of
                true ->
                (get({This, '$class'})):add(This, PickedUpLayerInterfaceFactoryInterface);
                false ->
                case ((get({PickedUpLayerInterfaceFactoryInterface, '$class'})):getPickedUpLayerType(PickedUpLayerInterfaceFactoryInterface) =:= get({PickedUpLayerTypeFactory, 'PART'})) of
                true ->
                CollidableDestroyableDamageableLayer = get({This, ownerLayerInterface}),
                (get({CollidableDestroyableDamageableLayer, '$class'})):addPart(CollidableDestroyableDamageableLayer, PickedUpLayerInterfaceFactoryInterface);
                false ->
                case (PickedUpLayerType =:= get({PickedUpLayerTypeFactory, 'NONE'})) of
                true ->
                ok;
                false ->
                PickupProcessorInterface = PickedUpLayerInterfaceFactoryInterface,
                (get({This, '$class'})):doPickup(This, PickupProcessorInterface)
            end
            end
            end,
            (get({PickupLayerInterface, '$class'})):setPickedUp(PickupLayerInterface)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            'PreLogUtil':putOE(get({CommonStrings, 'EXCEPTION'}), This, "doPickup", E)
        end.

add(This, CountedPickedUpLayerInterfaceFactoryInterface) ->
        PartIndex = ((get({CountedPickedUpLayerInterfaceFactoryInterface, '$class'})):getId(CountedPickedUpLayerInterfaceFactoryInterface) + get({This, countedIndex})),
        (get({This, '$class'})):addAt(This, CountedPickedUpLayerInterfaceFactoryInterface, PartIndex).

addAt(This, CountedPickedUpLayerInterfaceFactoryInterface, PartIndex) when is_integer(PartIndex) ->
        CollidableDestroyableDamageableLayer = get({This, ownerLayerInterface}),
        CountedLayerInterfaceFactory = array:get(PartIndex, (get({CollidableDestroyableDamageableLayer, '$class'})):getPartInterfaceArray(CollidableDestroyableDamageableLayer)),
        (get({CountedLayerInterfaceFactory, '$class'})):setTotal(CountedLayerInterfaceFactory, ((get({CountedLayerInterfaceFactory, '$class'})):getTotal(CountedLayerInterfaceFactory) + (get({CountedPickedUpLayerInterfaceFactoryInterface, '$class'})):getTotal(CountedPickedUpLayerInterfaceFactoryInterface))).

getFirstAvailableCountedLayerInterfaceFactory(This, PickedUpLayerTypeArray) when (is_tuple(PickedUpLayerTypeArray) orelse PickedUpLayerTypeArray =:= undefined) ->
        try
        CollidableDestroyableDamageableLayer = get({This, ownerLayerInterface}),
        PartInterfaceArray = (get({CollidableDestroyableDamageableLayer, '$class'})):getPartInterfaceArray(CollidableDestroyableDamageableLayer),
        Size = array:size(PartInterfaceArray),
        put({local, nextCountedLayerInterfaceFactory}, undefined),
        put({local, countedPickedUpLayerInterfaceFactory}, undefined),
        lists:foreach(fun(Index) ->
            put({local, nextCountedLayerInterfaceFactory}, array:get(Index, (get({CollidableDestroyableDamageableLayer, '$class'})):getPartInterfaceArray(CollidableDestroyableDamageableLayer))),
            put({local, countedPickedUpLayerInterfaceFactory}, (get({get({local, nextCountedLayerInterfaceFactory}), '$class'})):getCountedPickedUpLayerInterfaceFactory(get({local, nextCountedLayerInterfaceFactory}))),
            put({local, index2}, array:size(PickedUpLayerTypeArray)),
            (fun Loop() -> case (begin put({local, index2}, get({local, index2}) - 1), get({local, index2}) end >= 0) of true ->
                case ((get({get({local, countedPickedUpLayerInterfaceFactory}), '$class'})):getPickedUpLayerType(get({local, countedPickedUpLayerInterfaceFactory})) =:= array:get(get({local, index2}), PickedUpLayerTypeArray)) of
                    true ->
                    case ((get({get({local, nextCountedLayerInterfaceFactory}), '$class'})):getTotal(get({local, nextCountedLayerInterfaceFactory})) > 0) of
                        true ->
                        throw({'$return', get({local, nextCountedLayerInterfaceFactory})});
                        false -> ok
                    end;
                    false -> ok
                end,
                Loop();
            false -> ok end end)()
        end, lists:seq(get({This, countedIndex}), Size - 1)),
        get({'CountedLayerInterfaceFactoryPart', 'NULL_COUNTED_LAYER_INTERFACE_FACTORY'})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getCountedLayerInterfaceFactoryForSlot(This, SlotIndex) when is_integer(SlotIndex) ->
        try
        put({local, currentSlot}, 0),
        CollidableDestroyableDamageableLayer = get({This, ownerLayerInterface}),
        PartInterfaceArray = (get({CollidableDestroyableDamageableLayer, '$class'})):getPartInterfaceArray(CollidableDestroyableDamageableLayer),
        Size = array:size(PartInterfaceArray),
        put({local, nextCountedLayerInterfaceFactory}, undefined),
        lists:foreach(fun(Index) ->
            put({local, nextCountedLayerInterfaceFactory}, array:get(Index, (get({CollidableDestroyableDamageableLayer, '$class'})):getPartInterfaceArray(CollidableDestroyableDamageableLayer))),
            case ((get({get({local, nextCountedLayerInterfaceFactory}), '$class'})):getTotal(get({local, nextCountedLayerInterfaceFactory})) > 0) of
                true ->
                case (get({local, currentSlot}) =:= SlotIndex) of
                    true ->
                    throw({'$return', get({local, nextCountedLayerInterfaceFactory})});
                    false ->
                    put({local, currentSlot}, get({local, currentSlot}) + 1)
                end;
                false -> ok
            end
        end, lists:seq(get({This, countedIndex}), Size - 1)),
        get({'CountedLayerInterfaceFactoryPart', 'NULL_COUNTED_LAYER_INTERFACE_FACTORY'})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getCountedIndex(This) ->
        get({This, countedIndex}).

