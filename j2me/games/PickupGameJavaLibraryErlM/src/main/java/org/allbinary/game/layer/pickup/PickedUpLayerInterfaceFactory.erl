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
% package org.allbinary.game.layer.pickup
% import org.allbinary.animation.Animation
% import org.allbinary.layer.AllBinaryLayer

-module('PickedUpLayerInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PickedUpLayerInterfaceFactoryBase', Function, Arguments).

init_fields(This) ->
    put({This, pickedUpLayerType}, undefined),
    put({This, iconLayer}, undefined),
    put({This, animationInterface}, undefined),
    ok.


new(PickeUpLayerType, IconLayer, AnimationInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PickeUpLayerType, IconLayer, AnimationInterface),
    This.

'$init'(This, PickeUpLayerType, IconLayer, AnimationInterface) ->
    'PickedUpLayerInterfaceFactoryBase':'$init'(This),
    init_fields(This),
        put({This, pickedUpLayerType}, PickeUpLayerType),
        put({This, animationInterface}, AnimationInterface),
        put({This, iconLayer}, IconLayer).

getIconLayer(This) ->
        get({This, iconLayer}).

getAnimationInterface(This) ->
        get({This, animationInterface}).

getPickedUpLayerType(This) ->
        get({This, pickedUpLayerType}).

