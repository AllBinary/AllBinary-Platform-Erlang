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
% package org.allbinary.game.ag.layer.pickup.points
% import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory
% import org.allbinary.game.configuration.GameConfigurationUtil
% import org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactory
% import org.allbinary.game.layer.pickup.IconLayerFactory
% import org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactory
% import org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface
% import org.allbinary.game.layer.pickup.PickedUpLayerTypeFactory
% import org.allbinary.game.layer.pickup.PickupProcessorInterface
% import org.allbinary.layer.AllBinaryLayer

-module('Points20kPickedUpLayerInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements PickupProcessorInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('PickedUpLayerInterfaceFactory', Function, Arguments).

static_init() ->
    put({?MODULE, pickedUpLayerInterfaceFactoryInterface}, get({'CountedPickedUpLayerInterfaceFactory', 'NULL_COUNTED_PICKUP_LAYER_FACTORY'})),
    ok.

init_fields(This) ->
    put({This, pool}, 'PointsLayerCircularStaticPool':new('PointsLayerFactory':new(((fun(Target_N66082) -> (get({Target_N66082, '$class'})):getCompetitionValue(Target_N66082) end)('GameConfigurationUtil':getInstance()) * 20000)), 1)),
    ok.


% throws Exception
init() ->
        put({'Points20kPickedUpLayerInterfaceFactory', pickedUpLayerInterfaceFactoryInterface}, 'Points20kPickedUpLayerInterfaceFactory':new()).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'PickedUpLayerInterfaceFactory':init(This, get({'PickedUpLayerTypeFactory':getInstance(), 'POINTS'}), 'IconLayerFactory':getInstance((fun(Target_N66189) -> (get({Target_N66189, '$class'})):getInstance(Target_N66189, 0) end)((fun(Target_N66196) -> (get({Target_N66196, '$class'})):get(Target_N66196, get({'PointsResources':getInstance(), 'RESOURCE_2'})) end)('FeaturedAnimationInterfaceFactoryInterfaceFactory':getInstance())), 10, 10), (fun(Target_N66265) -> (get({Target_N66265, '$class'})):getInstance(Target_N66265, 0) end)((fun(Target_N66272) -> (get({Target_N66272, '$class'})):get(Target_N66272, get({'PointsResources':getInstance(), 'RESOURCE_2'})) end)('FeaturedAnimationInterfaceFactoryInterfaceFactory':getInstance()))),
        init_fields(This).

getTotal(This) ->
        1.

getInstance() ->
        get({'Points20kPickedUpLayerInterfaceFactory', pickedUpLayerInterfaceFactoryInterface}).

% throws Exception
process(This, SourceLayerInterface) ->
        (get({get({This, pool}), '$class'})):visit(get({This, pool}), SourceLayerInterface).

