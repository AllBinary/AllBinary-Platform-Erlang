% 
% AllBinary Open License Version 1 
% Copyright (c) 2002 AllBinary 
%  
% By agreeing to this license you and any business entity you represent are 
% legally bound to the AllBinary Open License Version 1 legal agreement. 
%  
% You may obtain the AllBinary Open License Version 1 legal agreement from 
% AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
%  
% Created By: Travis Berthelot  
% Generated Code Do Not Modify
% package org.allbinary.game.layer.waypoint.event
% import org.allbinary.game.layer.RTSLayerEvent
% import org.allbinary.logic.util.event.EventListenerInterface

-module('WaypointEventListenerInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('EventListenerInterface', Function, Arguments).


% throws Exception
onWaypointEvent(This, Event) ->
    erlang:error({abstract_method, onWaypointEvent}).

