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
% package org.allbinary.game.combat.weapon

-module('SimpleWeaponProperties').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, damage}, 0),
    put({This, dissipation}, 0),
    put({This, range}, 0),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


set(This, SimpleWeaponProperties) ->
        (get({This, '$class'})):setDamage(This, (get({SimpleWeaponProperties, '$class'})):getDamage(SimpleWeaponProperties)),
        (get({This, '$class'})):setDissipation(This, (get({SimpleWeaponProperties, '$class'})):getDissipation(SimpleWeaponProperties)),
        (get({This, '$class'})):setRange(This, (get({SimpleWeaponProperties, '$class'})):getRange(SimpleWeaponProperties)).

setDamage(This, Damage) when is_integer(Damage) ->
        put({This, damage}, Damage).

getDamage(This) ->
        get({This, damage}).

setDissipation(This, Dissipation) when is_integer(Dissipation) ->
        put({This, dissipation}, Dissipation).

getDissipation(This) ->
        get({This, dissipation}).

getRange(This) ->
        get({This, range}).

setRange(This, Range) when is_integer(Range) ->
        put({This, range}, Range).

