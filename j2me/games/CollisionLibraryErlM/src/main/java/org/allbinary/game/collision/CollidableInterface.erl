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
% import org.allbinary.layer.NamedInterface

-module('CollidableInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('NamedInterface', Function, Arguments).


% throws Exception
isCollidable(This, OwnerLayer) ->
    erlang:error({abstract_method, isCollidable}).

% throws Exception
isCollision(This, OwnerLayer, CollidableInterfaceCompositeInterface) ->
    erlang:error({abstract_method, isCollision}).

% throws Exception
collide(This, OwnerLayer, CollidableInterfaceCompositeInterface) ->
    erlang:error({abstract_method, collide}).

getCollisionTypeWith(This, LayerInterface) ->
    erlang:error({abstract_method, getCollisionTypeWith}).

