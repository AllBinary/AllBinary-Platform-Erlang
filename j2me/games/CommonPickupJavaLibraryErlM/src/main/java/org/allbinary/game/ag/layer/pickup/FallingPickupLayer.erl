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
% package org.allbinary.game.ag.layer.pickup
% import org.allbinary.animation.NullAnimationFactory
% import org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactory
% import org.allbinary.game.layer.pickup.PickupLayer
% import org.allbinary.game.multiplayer.layer.RemoteInfo
% import org.allbinary.game.tick.TickableInterface
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.view.ViewPosition

-module('FallingPickupLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements TickableInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('PickupLayer', Function, Arguments).

static_init() ->
    put({?MODULE, 'NAME'}, "FallingPickupLayer"),
    ok.

init_fields(This) ->
    ok.


new(RemoteInfo) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, RemoteInfo),
    This.

init(This, RemoteInfo) ->
        'PickupLayer':init(This, get({'FallingPickupLayer', 'NAME'}), RemoteInfo, 0, get({'CountedPickedUpLayerInterfaceFactory', 'NULL_COUNTED_PICKUP_LAYER_FACTORY'}), (fun(Target_N65975) -> (get({Target_N65975, '$class'})):getInstance(Target_N65975, 0) end)('NullAnimationFactory':getFactoryInstance()), 'Rectangle':new(get({'PointFactory':getInstance(), 'ZERO_ZERO'}), 0, 0), 'ViewPosition':getInstanceD()).

processTick(This, AllBinaryLayerManager) ->
        (get({This, '$class'})):setPosition(This, get({This, x}), (get({This, y}) + 1), get({This, z})).

implmentsTickableInterface(This) ->
        true.

