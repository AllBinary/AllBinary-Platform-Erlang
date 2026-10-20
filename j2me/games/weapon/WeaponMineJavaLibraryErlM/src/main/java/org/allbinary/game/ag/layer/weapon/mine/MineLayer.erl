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
% package org.allbinary.game.ag.layer.weapon.mine
% import org.allbinary.ag.weapon.media.audio.DropWeaponSound
% import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory
% import org.allbinary.game.layer.weapon.SimpleWeaponLayer
% import org.allbinary.game.multiplayer.layer.RemoteInfo
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.media.audio.SecondaryPlayerQueueFactory
% import org.allbinary.physics.movement.NoMovementFactory
% import org.allbinary.view.ViewPositionBase
% import org.allbinary.view.event.ViewPositionEventHandler

-module('MineLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('SimpleWeaponLayer', Function, Arguments).

static_init() ->
    put({?MODULE, 'NAME'}, "MineLayer"),
    ok.

init_fields(This) ->
    put({This, viewPositionEventHandler}, 'ViewPositionEventHandler':getInstance()),
    ok.


new(ViewPosition) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ViewPosition),
    This.

'$init'(This, ViewPosition) ->
        'SimpleWeaponLayer':'$init'(This, get({'MineLayer', 'NAME'}), get({'RemoteInfo', 'REMOTE_INFO'}), (-1), (fun(Target_N66031) -> (get({Target_N66031, '$class'})):getMovmentInstance(Target_N66031) end)('NoMovementFactory':getInstance()), (fun(Target_N66055) -> (get({Target_N66055, '$class'})):getInstance(Target_N66055, 0) end)((fun(Target_N66062) -> (get({Target_N66062, '$class'})):get(Target_N66062, get({'MineWeaponResources':getInstance(), 'RESOURCE'})) end)('FeaturedAnimationInterfaceFactoryInterfaceFactory':getInstance())), 'SimpleWeaponLayer':createDestroyed(), 'Rectangle':new(get({'PointFactory':getInstance(), 'ZERO_ZERO'}), 10, 10), ViewPosition),
        init_fields(This).

initXYZ(This, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        (get({This, '$class'})):setPosition(This, (X + 5), (Y + 5), Z),
        (get({get({This, viewPositionEventHandler}), '$class'})):addListener(get({This, viewPositionEventHandler}), This),
        (fun(Target_N66417) -> (get({Target_N66417, '$class'})):add(Target_N66417, 'DropWeaponSound':getInstance()) end)('SecondaryPlayerQueueFactory':getInstance()).

damage(This, Damage, DamageType) when is_integer(Damage), is_integer(DamageType) ->
        put({This, totalDamage}, ((get({This, '$class'})):getInitDamage(This) + 1)).

getDamage(This, DamageType) when is_integer(DamageType) ->
        'SimpleWeaponLayer':getDamage(This, DamageType),
        (get({This, '$class'})):getInitDamage(This).

setDestroyed(This, Destroyed) when is_boolean(Destroyed) ->
        'SimpleWeaponLayer':setDestroyed(This, Destroyed),
        case (get({This, '$class'})):isDestroyed(This) of
            true ->
            (get({get({This, viewPositionEventHandler}), '$class'})):removeListener(get({This, viewPositionEventHandler}), This);
            false -> ok
        end.

