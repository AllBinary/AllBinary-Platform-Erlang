% 
% AllBinary Open License Version 1 
% Copyright (c) 2006 AllBinary 
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
% package org.allbinary.game.layer.waypoint
% import org.allbinary.game.layer.CollidableCompositeLayer
% import org.allbinary.game.layer.CollidableRTSBehavior
% import org.allbinary.game.collision.CollidableInterfaceCompositeInterface

-module('CollidableWaypointBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CollidableRTSBehavior', Function, Arguments).

init_fields(This) ->
    ok.


new(Collidable) when is_boolean(Collidable) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Collidable),
    This.

'$init'(This, Collidable) when is_boolean(Collidable) ->
        'CollidableRTSBehavior':'$init'(This, Collidable).

isCollision(This, OwnerLayer, CollisionLayer) ->
        false.

% throws Exception
collide(This, OwnerLayer, CollisionLayer) ->
        ok.

isCollisionInterface(This, OwnerLayer, CollidableInterface) ->
        false.

% throws Exception
collideInterface(This, OwnerLayer, CollidableInterface) ->
        ok.

