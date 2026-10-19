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

-module('SourceCollisionHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CollisionHelper', Function, Arguments).

init_fields(This) ->
    ok.


new(LayerInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, LayerInterface),
    This.

init(This, LayerInterface) ->
        'CollisionHelper':init(This, LayerInterface).

isCollidable(This, LayerInterface) ->
        try
        case (get({This, sourceLayerInterface}) =/= LayerInterface) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

