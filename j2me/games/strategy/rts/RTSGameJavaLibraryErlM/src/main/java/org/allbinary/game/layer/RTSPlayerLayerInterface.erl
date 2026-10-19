% 
% AllBinary Open License Version 1 
% Copyright (c) 2003 AllBinary 
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
% package org.allbinary.game.layer
% import org.allbinary.game.ag.layer.hud.basic.notification.GameNotificationHudCompositeInterface
% import org.allbinary.game.input.BuildMenuCompositeInterface
% import org.allbinary.game.input.form.RTSFormInput
% import org.allbinary.game.layer.capital.Capital
% import org.allbinary.game.combat.destroy.event.DestroyedEventListenerInterface
% import org.allbinary.game.input.PlayerGameInputCompositeInterface
% import org.allbinary.game.tick.TickableInterface
% import org.allbinary.media.audio.Sound

-module('RTSPlayerLayerInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('GameNotificationHudCompositeInterface', Function, Arguments).


getCapital(This) ->
    erlang:error({abstract_method, getCapital}).

getRTSFormInput(This) ->
    erlang:error({abstract_method, getRTSFormInput}).

add(This, Sound) ->
    erlang:error({abstract_method, add}).

getPlayerOwnedRTSLayers(This) ->
    erlang:error({abstract_method, getPlayerOwnedRTSLayers}).

implmentsArtificialIntelligenceCompositeInterface(This) ->
    erlang:error({abstract_method, implmentsArtificialIntelligenceCompositeInterface}).

