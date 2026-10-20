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
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.layer.CollidableCompositeLayer
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings

-module('CollidableBaseBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CollidableInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, layerCollisionUtil}, 'LayerCollisionUtil':getInstance()),
    put({This, collidable}, true),
    ok.


new(Collidable) when is_boolean(Collidable) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Collidable),
    This.

'$init'(This, Collidable) when is_boolean(Collidable) ->
    init_fields(This),
        put({This, collidable}, Collidable).

update(This) ->
        ok.

getName(This) ->
        atom_to_list(get({This, '$class'})).

setCollidable(This, Collidable) when is_boolean(Collidable) ->
        put({This, collidable}, Collidable).

isCollidable(This, OwnerLayer) ->
        get({This, collidable}).

% throws Exception
collide(This, OwnerLayer, AllbinaryCollidableLayer) ->
        erlang:error({'Exception', (fun(Target_N66307) -> (get({Target_N66307, '$class'})):toString(Target_N66307) end)((fun(Target_N66314) -> (get({Target_N66314, '$class'})):append(Target_N66314, atom_to_list(get({This, '$class'}))) end)((fun(Target_N66321) -> (get({Target_N66321, '$class'})):append(Target_N66321, get({'CommonLabels':getInstance(), 'COLON_SEP'})) end)((fun(Target_N66328) -> (get({Target_N66328, '$class'})):append(Target_N66328, get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})) end)('StringMaker':new()))))}).

isCollision(This, OwnerLayer, CollisionLayer) ->
        (get({get({This, layerCollisionUtil}), '$class'})):isCollision(get({This, layerCollisionUtil}), OwnerLayer, CollisionLayer).

isCollisionInterface(This, OwnerLayer, CollidableInterfaceCompositeInterface) ->
        (get({get({This, layerCollisionUtil}), '$class'})):isCollision(get({This, layerCollisionUtil}), OwnerLayer, CollidableInterfaceCompositeInterface).

% throws Exception
collideInterface(This, OwnerLayer, CollidableInterfaceCompositeInterface) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

paint(This, OwnerLayer, Graphics) ->
        ok.

getCollisionTypeWith(This, LayerInterface) ->
        get({'CollisionTypeFactory':getInstance(), 'NONE'}).

