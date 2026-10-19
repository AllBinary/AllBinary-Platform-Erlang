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
% package org.allbinary.game.health

-module('HealthInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


isAlive(This) ->
    erlang:error({abstract_method, isAlive}).

damage(This, Ahealth) when is_integer(Ahealth) ->
    erlang:error({abstract_method, damage}).

heal(This, Ahealth) when is_integer(Ahealth) ->
    erlang:error({abstract_method, heal}).

healMax(This) ->
    erlang:error({abstract_method, healMax}).

getMaxHealth(This) ->
    erlang:error({abstract_method, getMaxHealth}).

setMaxHealth(This, MaxHealth) when is_integer(MaxHealth) ->
    erlang:error({abstract_method, setMaxHealth}).

getHealth(This) ->
    erlang:error({abstract_method, getHealth}).

addListener(This, HealthListenerInterface) ->
    erlang:error({abstract_method, addListener}).

