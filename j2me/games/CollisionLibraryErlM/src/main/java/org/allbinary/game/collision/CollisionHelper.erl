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

-module('CollisionHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, sourceLayerInterface}, undefined),
    ok.


new(SourceLayerInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, SourceLayerInterface),
    This.

'$init'(This, SourceLayerInterface) ->
    init_fields(This),
        put({This, sourceLayerInterface}, SourceLayerInterface).

isCollidable(This, LayerInterface) ->
        true.

getOwnerLayerInterface(This) ->
        get({This, sourceLayerInterface}).

setOwnerLayerInterface(This, SourceLayerInterface) ->
        put({This, sourceLayerInterface}, SourceLayerInterface).

