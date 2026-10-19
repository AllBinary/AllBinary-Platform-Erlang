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
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.GameFeatureFactory
% import org.allbinary.graphics.opengles.OpenGLFeatureUtil
% import org.allbinary.layer.AllBinaryLayer

-module('LayerCollisionUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LayerCollisionUtil':new()),
    ok.

init_fields(This) ->
    put({This, collisionProcessor}, undefined),
    ok.


getInstance() ->
        get({'LayerCollisionUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        Features = 'Features':getInstance(),
        GameFeatureFactory = 'GameFeatureFactory':getInstance(),
        case ((fun(Target_N65947) -> (get({Target_N65947, '$class'})):isAnyThreed(Target_N65947) end)('OpenGLFeatureUtil':getInstance()) andalso (not (get({Features, '$class'})):isFeature(Features, get({GameFeatureFactory, 'COLLISIONS_FORCED_TWO_DIMENSIONAL'})))) of
            true ->
            put({This, collisionProcessor}, 'CollisionThreedProcessor':new());
            false ->
            put({This, collisionProcessor}, 'Collision2DProcessor':new())
        end.

isCollision(This, MyLayer, MyLayer2) ->
        (get({get({This, collisionProcessor}), '$class'})):isCollision(get({This, collisionProcessor}), MyLayer, MyLayer2).

