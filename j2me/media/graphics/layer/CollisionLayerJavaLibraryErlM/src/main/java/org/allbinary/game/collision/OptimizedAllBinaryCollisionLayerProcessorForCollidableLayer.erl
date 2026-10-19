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
% package org.allbinary.game.collision
% import org.allbinary.game.layer.CollidableCompositeLayer
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.layer.LayerManager
% import org.allbinary.layer.LayerProcessor

-module('OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('LayerProcessor', Function, Arguments).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'LayerProcessor':init(This, 'OptimizedAllBinaryCollisionLayerManager':new()).

% throws Exception
processAt(This, AllBinaryLayerManager, LayerInterface, StartIndex) when is_integer(StartIndex) ->
        CollidableInterfaceCompositeInterface = LayerInterface,
        CollidableBase = (get({CollidableInterfaceCompositeInterface, '$class'})):getCollidableInferface(CollidableInterfaceCompositeInterface),
        case (get({CollidableBase, '$class'})):isCollidable(CollidableBase, CollidableInterfaceCompositeInterface) of
            true ->
            LayerManager = (get({This, '$class'})):getLayerManager(This),
            Size = (get({LayerManager, '$class'})):getSize(LayerManager),
            put({local, collidableInterfaceCompositeInterface2}, undefined),
            put({local, collidableBase2}, undefined),
            lists:foreach(fun(Index) ->
                put({local, collidableInterfaceCompositeInterface2}, (get({LayerManager, '$class'})):getLayerAt(LayerManager, Index)),
                put({local, collidableBase2}, (get({get({local, collidableInterfaceCompositeInterface2}), '$class'})):getCollidableInferface(get({local, collidableInterfaceCompositeInterface2}))),
                case ((get({get({local, collidableBase2}), '$class'})):isCollidable(get({local, collidableBase2}), CollidableInterfaceCompositeInterface) andalso (get({CollidableBase, '$class'})):isCollision(CollidableBase, CollidableInterfaceCompositeInterface, get({local, collidableInterfaceCompositeInterface2}))) of
                    true ->
                    (get({CollidableBase, '$class'})):collide(CollidableBase, CollidableInterfaceCompositeInterface, get({local, collidableInterfaceCompositeInterface2})),
                    (get({get({local, collidableBase2}), '$class'})):collide(get({local, collidableBase2}), get({local, collidableInterfaceCompositeInterface2}), CollidableInterfaceCompositeInterface);
                    false -> ok
                end
            end, lists:seq((StartIndex + 1), Size - 1));
            false -> ok
        end.

isProcessorLayer(This, LayerInterface) ->
        try
        case (get({LayerInterface, '$class'})):implmentsCollidableInterface(LayerInterface) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

