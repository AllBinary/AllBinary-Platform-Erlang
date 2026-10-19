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
% package org.allbinary.game.combat.damage

-module('ExplosionResources').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ExplosionResources':new()),
    ok.

init_fields(This) ->
    put({This, 'EXPLOSION_90_RESOURCE'}, "/explosion_sprite_90_by_90.png"),
    put({This, 'EXPLOSION_60_RESOURCE'}, "/explosion_sprite_60_by_60.png"),
    put({This, 'HALF_EXPLOSION_RESOURCE'}, "/explosion_sprite_30_by_30.png"),
    put({This, 'THIRD_EXPLOSION_RESOURCE'}, "/explosion_sprite_15_by_15.png"),
    ok.


getInstance() ->
        get({'ExplosionResources', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

