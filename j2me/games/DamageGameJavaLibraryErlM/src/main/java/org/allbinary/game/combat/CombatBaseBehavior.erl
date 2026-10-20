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
% package org.allbinary.game.combat
% import org.allbinary.game.combat.damage.DamageableBaseBehavior
% import org.allbinary.game.combat.destroy.DestroyableBaseBehavior

-module('CombatBaseBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NULL_COMBAT_BEHAVIOR'}, 'CombatBaseBehavior':new('DamageableBaseBehavior':getInstance(), 'DestroyableBaseBehavior':getInstance())),
    ok.

init_fields(This) ->
    put({This, damageableBaseBehavior}, undefined),
    put({This, destroyableBaseBehavior}, undefined),
    put({This, readyForExplosion}, false),
    ok.


new(DamageableBaseBehavior, DestroyableBaseBehavior) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, DamageableBaseBehavior, DestroyableBaseBehavior),
    This.

'$init'(This, DamageableBaseBehavior, DestroyableBaseBehavior) ->
    init_fields(This),
        put({This, damageableBaseBehavior}, DamageableBaseBehavior),
        put({This, destroyableBaseBehavior}, DestroyableBaseBehavior).

getDamageableBaseBehavior(This) ->
        get({This, damageableBaseBehavior}).

getDestroyableBaseBehavior(This) ->
        get({This, destroyableBaseBehavior}).

isReadyForExplosion(This) ->
        get({This, readyForExplosion}).

setReadyForExplosion(This, ReadyForExplosion) when is_boolean(ReadyForExplosion) ->
        put({This, readyForExplosion}, ReadyForExplosion).

