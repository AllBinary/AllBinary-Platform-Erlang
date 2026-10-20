% 
% AllBinary Open License Version 1 
% Copyright (c) 2003 AllBinary 
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
% import org.allbinary.game.collision.CollisionType
% import org.allbinary.game.collision.CollisionTypeFactory
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableBehavior

-module('CollidableRTSBehavior').
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

isCollision(This, OwnerLayer, CollidableInterfaceCompositeInterface) ->
        try
        CollisionTypeFactory = 'CollisionTypeFactory':getInstance(),
        CollisionType = (fun(Target_N65830) -> (get({Target_N65830, '$class'})):getCollisionTypeWith(Target_N65830, OwnerLayer) end)((get({CollidableInterfaceCompositeInterface, '$class'})):getCollidableInferface(CollidableInterfaceCompositeInterface)),
        case (CollisionType =:= get({CollisionTypeFactory, 'PICKUP'})) of
            true ->
            ok;
            false ->
            case (CollisionType =:= get({CollisionTypeFactory, 'COLLISION'})) of
            true ->
            throw({'$return', 'CollidableDestroyableDamageableBehavior':isCollision(This, OwnerLayer, CollidableInterfaceCompositeInterface)});
            false ->
            case (((((get({CollidableInterfaceCompositeInterface, '$class'})):getX2(CollidableInterfaceCompositeInterface) =< (get({OwnerLayer, '$class'})):getXP(OwnerLayer)) orelse ((get({CollidableInterfaceCompositeInterface, '$class'})):getY2(CollidableInterfaceCompositeInterface) =< (get({OwnerLayer, '$class'})):getYP(OwnerLayer))) orelse ((get({CollidableInterfaceCompositeInterface, '$class'})):getYP(CollidableInterfaceCompositeInterface) >= (get({OwnerLayer, '$class'})):getY2(OwnerLayer))) orelse ((get({CollidableInterfaceCompositeInterface, '$class'})):getXP(CollidableInterfaceCompositeInterface) >= (get({OwnerLayer, '$class'})):getX2(OwnerLayer))) of
                true ->
                throw({'$return', false});
                false ->
                throw({'$return', true})
            end
        end
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
collide(This, OwnerLayer, CollidableInterfaceCompositeInterface) ->
        CollisionTypeFactory = 'CollisionTypeFactory':getInstance(),
        CollisionType = (fun(Target_N66371) -> (get({Target_N66371, '$class'})):getCollisionTypeWith(Target_N66371, OwnerLayer) end)((get({CollidableInterfaceCompositeInterface, '$class'})):getCollidableInferface(CollidableInterfaceCompositeInterface)),
        case (CollisionType =:= get({CollisionTypeFactory, 'PICKUP'})) of
            true ->
            ok;
            false ->
            case (CollisionType =:= get({CollisionTypeFactory, 'COLLISION'})) of
            true ->
            'CollidableDestroyableDamageableBehavior':collide(This, OwnerLayer, CollidableInterfaceCompositeInterface);
            false ->
            (get({This, '$class'})):collideNone(This, OwnerLayer, CollidableInterfaceCompositeInterface)
        end
        end.

% throws Exception
collideNone(This, OwnerLayer, CollidableInterface) ->
        ok.

