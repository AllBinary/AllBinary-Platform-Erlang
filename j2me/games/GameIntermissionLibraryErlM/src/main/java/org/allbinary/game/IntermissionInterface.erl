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
% package org.allbinary.game
% import org.allbinary.time.TimeDelayHelper

-module('IntermissionInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getTimeDelayHelper(This) ->
    erlang:error({abstract_method, getTimeDelayHelper}).

isEnabled(This) ->
    erlang:error({abstract_method, isEnabled}).

setEnabled(This, Value) when is_boolean(Value) ->
    erlang:error({abstract_method, setEnabled}).

setListener(This, EnableListener) ->
    erlang:error({abstract_method, setListener}).

