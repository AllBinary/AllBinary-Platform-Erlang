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
% package org.allbinary.game.collision.layer
% import org.allbinary.game.collision.CollidableBaseBehavior
% import org.allbinary.game.collision.CollidableInterfaceCompositeInterface
% import org.allbinary.game.layer.CollidableCompositeLayer
% import org.allbinary.layer.LayerManager

-module('AllBinaryCollisionManager').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, allBinaryCollisionManager}, 'AllBinaryCollisionManager':new()),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getInstance() ->
        get({'AllBinaryCollisionManager', allBinaryCollisionManager}).

% throws Exception
process(This, LayerManager, CollidableInterfaceCompositeInterface, StartIndex) when is_integer(StartIndex) ->
        Size = (get({LayerManager, '$class'})):getSize(LayerManager),
        lists:foreach(fun(Index) ->
            CollidableInterfaceCompositeInterface2 = (get({LayerManager, '$class'})):getLayerAt(LayerManager, Index),
            (get({This, '$class'})):collide(This, LayerManager, CollidableInterfaceCompositeInterface, CollidableInterfaceCompositeInterface2)
        end, lists:seq((StartIndex + 1), Size - 1)).

% throws Exception
collide(This, LayerManager, CollidableInterfaceCompositeInterface, CollidableInterfaceCompositeInterface2) ->
        CollidableBase2 = (get({CollidableInterfaceCompositeInterface2, '$class'})):getCollidableInferface(CollidableInterfaceCompositeInterface2),
        CollidableBase = (get({CollidableInterfaceCompositeInterface, '$class'})):getCollidableInferface(CollidableInterfaceCompositeInterface),
        case (get({CollidableBase2, '$class'})):isCollidable(CollidableBase2, CollidableInterfaceCompositeInterface) of
            true ->
            case (get({CollidableBase, '$class'})):isCollisionInterface(CollidableBase, CollidableInterfaceCompositeInterface, CollidableInterfaceCompositeInterface2) of
                true ->
                (get({CollidableBase, '$class'})):collideInterface(CollidableBase, CollidableInterfaceCompositeInterface, CollidableInterfaceCompositeInterface2),
                (get({CollidableBase2, '$class'})):collideInterface(CollidableBase2, CollidableInterfaceCompositeInterface, CollidableInterfaceCompositeInterface);
                false -> ok
            end;
            false -> ok
        end.

