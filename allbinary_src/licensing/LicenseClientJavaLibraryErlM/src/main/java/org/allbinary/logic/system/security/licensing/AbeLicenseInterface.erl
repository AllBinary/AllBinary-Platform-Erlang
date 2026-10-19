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
% package org.allbinary.logic.system.security.licensing
% import org.allbinary.util.BasicArrayList

-module('AbeLicenseInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


hasKey(This) ->
    erlang:error({abstract_method, hasKey}).

getKey(This, KeyName) when (is_list(KeyName) orelse KeyName =:= undefined) ->
    erlang:error({abstract_method, getKey}).

getLicenseId(This) ->
    erlang:error({abstract_method, getLicenseId}).

getServers(This) ->
    erlang:error({abstract_method, getServers}).

getSpecial(This) ->
    erlang:error({abstract_method, getSpecial}).

getLicenseType(This) ->
    erlang:error({abstract_method, getLicenseType}).

isValid(This) ->
    erlang:error({abstract_method, isValid}).

toString(This) ->
    erlang:error({abstract_method, toString}).

