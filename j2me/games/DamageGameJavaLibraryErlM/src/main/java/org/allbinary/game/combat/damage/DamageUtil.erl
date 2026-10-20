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
% import org.allbinary.game.layer.CollidableCompositeLayer
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker

-module('DamageUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'DamageUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'COLLIDE'}, "collide"),
    ok.


getInstance() ->
        get({'DamageUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
process(This, DamageableInterface, DamageableInterface2) ->
        (get({DamageableInterface, '$class'})):damage(DamageableInterface, (get({DamageableInterface2, '$class'})):getDamage(DamageableInterface2, 0), 0).

% throws Exception
debugDamage(This, CollidableInterfaceCompositeInterface1, CollidableInterfaceCompositeInterface) ->
        CollidableDestroyableDamageableLayer = CollidableInterfaceCompositeInterface,
        Damage = (get({CollidableDestroyableDamageableLayer, '$class'})):getDamage(CollidableDestroyableDamageableLayer, 0),
        case (Damage > 20000) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Collision "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({CollidableInterfaceCompositeInterface1, '$class'})):toString(CollidableInterfaceCompositeInterface1)),
            (get({StringBuffer, '$class'})):append(StringBuffer, " with: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({CollidableInterfaceCompositeInterface, '$class'})):toString(CollidableInterfaceCompositeInterface)),
            (get({StringBuffer, '$class'})):append(StringBuffer, " damage: "),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, Damage),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), CollidableInterfaceCompositeInterface1, get({This, 'COLLIDE'}));
            false -> ok
        end.

