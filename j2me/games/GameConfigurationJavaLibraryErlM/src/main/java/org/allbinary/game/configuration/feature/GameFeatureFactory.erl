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
% package org.allbinary.game.configuration.feature

-module('GameFeatureFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GameFeatureFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'SOUND'}, 'GameFeature':new("Sound")),
    put({This, 'MUSIC'}, 'GameFeature':new("Music")),
    put({This, 'SCREEN_SHAKE'}, 'Feature':new("Screen Shake")),
    put({This, 'POST_IMAGE_LOADING_MODIFICATION'}, 'Feature':new("Post Image Loading Modification (Scaling, Rotation, or Other)")),
    put({This, 'HEALTH_BARS'}, 'GameFeature':new("Health Bars")),
    put({This, 'DAMAGE_FLOATERS'}, 'GameFeature':new("Damage Floaters")),
    put({This, 'GAME_INPUT_LAYER_PROCESSOR'}, 'GameFeature':new("Game Input Layer Processor")),
    put({This, 'ARTIFICIAL_INTELLEGENCE_PROCESSOR'}, 'GameFeature':new("Artificial Intelligence Layer Processor")),
    put({This, 'COLLIDABLE_INTERFACE_LAYER_PROCESSOR'}, 'GameFeature':new("Collidable Interface Layer Processor")),
    put({This, 'TICKABLE_LAYER_PROCESSOR'}, 'GameFeature':new("Tickable Layer Processor")),
    put({This, 'CHEATING'}, 'GameFeature':new("Cheating")),
    put({This, 'DROPPED_ITEMS'}, 'GameFeature':new("Drops")),
    put({This, 'DROPPED_ITEMS_FROM_DEATH'}, 'GameFeature':new("Drops from Dead")),
    put({This, 'TEST_DESTROYED_LAYER_PROCESSOR'}, 'GameFeature':new("Destroyed Layer Processor")),
    put({This, 'COLLISIONS_WITH_SOURCE'}, 'GameFeature':new("Allow Collisions With Source")),
    put({This, 'COLLISIONS_FORCED_TWO_DIMENSIONAL'}, 'GameFeature':new("Collisions Forced Two Dimensional")),
    ok.


getInstance() ->
        get({'GameFeatureFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

