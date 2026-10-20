% Generated Code Do Not Modify
% package org.allbinary.game.layer.weapon
% import org.allbinary.animation.Animation
% import org.allbinary.game.combat.weapon.WeaponProperties
% import org.allbinary.game.multiplayer.layer.RemoteInfo
% import org.allbinary.graphics.Rectangle
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.physics.movement.Movement
% import org.allbinary.time.GameTickTimeDelayHelperFactory
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.view.ViewPositionBase

-module('TempExplosionWeaponLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('SimpleWeaponLayer', Function, Arguments).

init_fields(This) ->
    put({This, weaponProperties}, 'WeaponProperties':new((-1), (-1), 0, 1000, 0)),
    put({This, timeDelayHelper}, 'TimeDelayHelper':new(0)),
    ok.


new(Name, Movement, AnimationInterface, Rectangle, ViewPosition, TimeDelay) when (is_list(Name) orelse Name =:= undefined), is_integer(TimeDelay) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name, Movement, AnimationInterface, Rectangle, ViewPosition, TimeDelay),
    This.

'$init'(This, Name, Movement, AnimationInterface, Rectangle, ViewPosition, TimeDelay) when (is_list(Name) orelse Name =:= undefined), is_integer(TimeDelay) ->
        'SimpleWeaponLayer':'$init'(This, Name, get({'RemoteInfo', 'REMOTE_INFO'}), (-1), Movement, AnimationInterface, 'SimpleWeaponLayer':createDestroyed(), Rectangle, ViewPosition),
        init_fields(This),
        put({get({This, timeDelayHelper}), delay}, TimeDelay).

% throws Exception
processTick(This, AllBinaryLayerManager) ->
        case (get({get({This, timeDelayHelper}), '$class'})):isTime(get({This, timeDelayHelper}), get({'GameTickTimeDelayHelperFactory':getInstance(), startTime})) of
            true ->
            (fun(Target_N66355) -> (get({Target_N66355, '$class'})):collide(Target_N66355, This, This) end)((get({This, '$class'})):getCollidableInferface(This)),
            put({This, totalDamage}, ((get({This, '$class'})):getInitDamage(This) + 1));
            false -> ok
        end,
        'SimpleWeaponLayer':processTick(This, AllBinaryLayerManager).

