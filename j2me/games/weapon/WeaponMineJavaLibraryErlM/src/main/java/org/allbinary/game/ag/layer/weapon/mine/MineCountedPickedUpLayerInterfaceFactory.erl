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
% import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory
% import org.allbinary.game.combat.weapon.WeaponProperties
% import org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactory
% import org.allbinary.game.layer.pickup.IconLayerFactory
% import org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface
% import org.allbinary.game.layer.pickup.PickedUpLayerTypeFactory
% import org.allbinary.game.layer.weapon.WeaponLayerCircularPool
% import org.allbinary.game.score.ScoreableInterface
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.util.ABHashtable

-module('MineCountedPickedUpLayerInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CountedPickedUpLayerInterfaceFactory', Function, Arguments).

static_init() ->
    put({?MODULE, pickedUpLayerInterfaceFactoryInterface}, get({'CountedPickedUpLayerInterfaceFactory', 'NULL_COUNTED_PICKUP_LAYER_FACTORY'})),
    ok.

init_fields(This) ->
    put({This, weaponLayerCircularStaticPool}, 'MineLayerCircularStaticPool':getInstance()),
    put({This, weaponProperties}, 'WeaponProperties':new((-1), (-1), 0, 8000, 10)),
    put({This, smallIntegerSingletonFactory}, 'SmallIntegerSingletonFactory':getInstance()),
    ok.


% throws Exception
init() ->
        put({'MineCountedPickedUpLayerInterfaceFactory', pickedUpLayerInterfaceFactoryInterface}, 'MineCountedPickedUpLayerInterfaceFactory':new()).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'CountedPickedUpLayerInterfaceFactory':'$init'(This, get({'PickedUpLayerTypeFactory':getInstance(), 'MINE'}), 'IconLayerFactory':getInstance((fun(Target_N66186) -> (get({Target_N66186, '$class'})):getInstance(Target_N66186, 0) end)((fun(Target_N66193) -> (get({Target_N66193, '$class'})):get(Target_N66193, get({'MineWeaponResources':getInstance(), 'DROP_ICON_RESOURCE'})) end)('FeaturedAnimationInterfaceFactoryInterfaceFactory':getInstance())), 10, 10), (fun(Target_N66262) -> (get({Target_N66262, '$class'})):getInstance(Target_N66262, 0) end)((fun(Target_N66269) -> (get({Target_N66269, '$class'})):get(Target_N66269, get({'MineWeaponResources':getInstance(), 'DROP_RESOURCE'})) end)('FeaturedAnimationInterfaceFactoryInterfaceFactory':getInstance()))),
        init_fields(This).

getInstance() ->
        get({'MineCountedPickedUpLayerInterfaceFactory', pickedUpLayerInterfaceFactoryInterface}).

getTotal(This) ->
        3.

% throws Exception
getNextInstance(This, Hashtable, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        SourceLayerInterface = (get({Hashtable, '$class'})):get(Hashtable, (get({get({This, smallIntegerSingletonFactory}), '$class'})):getAt(get({This, smallIntegerSingletonFactory}), 0)),
        Angle = (get({Hashtable, '$class'})):get(Hashtable, (get({get({This, smallIntegerSingletonFactory}), '$class'})):getAt(get({This, smallIntegerSingletonFactory}), 1)),
        ScoreableInterface = SourceLayerInterface,
        (get({get({This, weaponLayerCircularStaticPool}), '$class'})):getInstanceWeaponLayer(get({This, weaponLayerCircularStaticPool}), SourceLayerInterface, X, Y, Z, trunc((get({Angle, '$class'})):intValue(Angle)), 0, get({This, weaponProperties}), ScoreableInterface).

