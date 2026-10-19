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
% import org.allbinary.game.layer.weapon.WeaponLayerCircularPool
% import org.allbinary.view.ViewPositionFactoryInterface

-module('MineLayerCircularStaticPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'WEAPON_LAYER_CIRCULAR_STATIC_POOL'}, 'WeaponLayerCircularPool':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


% throws Exception
init(ViewPositionFactoryInterface) ->
        'MineCountedPickedUpLayerInterfaceFactory':init(),
        (get({get({'MineLayerCircularStaticPool', 'WEAPON_LAYER_CIRCULAR_STATIC_POOL'}), '$class'})):initAllBinaryLayerCircularPool(get({'MineLayerCircularStaticPool', 'WEAPON_LAYER_CIRCULAR_STATIC_POOL'}), 'MineLayerFactory':new(ViewPositionFactoryInterface), 20).

getInstance() ->
        get({'MineLayerCircularStaticPool', 'WEAPON_LAYER_CIRCULAR_STATIC_POOL'}).

