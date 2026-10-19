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
% package org.allbinary.logic.util.event.handler
% import jsinterop.annotations.JsType
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventListenerInterface
% import org.allbinary.util.BasicArrayList
% import jsinterop.annotations.JsMethod

-module('BasicEventHandlerInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


addListenerInterface(This, EventListenerInterface) ->
    erlang:error({abstract_method, addListenerInterface}).

addListeners(This, BasicArrayList) ->
    erlang:error({abstract_method, addListeners}).

% throws Exception
fireEvent(This, EventObject) ->
    erlang:error({abstract_method, fireEvent}).

removeAllListeners(This) ->
    erlang:error({abstract_method, removeAllListeners}).

removeListener(This, EventListenerInterface) ->
    erlang:error({abstract_method, removeListener}).

