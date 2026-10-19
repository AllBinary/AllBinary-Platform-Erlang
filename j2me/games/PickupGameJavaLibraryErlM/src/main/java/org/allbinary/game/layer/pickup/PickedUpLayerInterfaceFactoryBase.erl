% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.allbinary.game.layer.pickup
% import org.allbinary.animation.Animation
% import org.allbinary.layer.AllBinaryLayer

-module('PickedUpLayerInterfaceFactoryBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements PickedUpLayerInterfaceFactoryInterface

static_init() ->
    put({?MODULE, 'NULL_PICKED_UP_LAYER_FACTORY_BASE'}, 'PickedUpLayerInterfaceFactoryBase':new()),
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


getIconLayer(This) ->
        erlang:error({'RuntimeException'}).

getAnimationInterface(This) ->
        erlang:error({'RuntimeException'}).

getPickedUpLayerType(This) ->
        erlang:error({'RuntimeException'}).

