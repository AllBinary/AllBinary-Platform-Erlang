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
% import org.allbinary.logic.system.os.GenericOperatingSystem
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList

-module('AbeClientInformationInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


init(This) ->
    erlang:error({abstract_method, init}).

getOperatingSystemInterface(This) ->
    erlang:error({abstract_method, getOperatingSystemInterface}).

getName(This) ->
    erlang:error({abstract_method, getName}).

getSpecialName(This) ->
    erlang:error({abstract_method, getSpecialName}).

getVersion(This) ->
    erlang:error({abstract_method, getVersion}).

getLicenseId(This) ->
    erlang:error({abstract_method, getLicenseId}).

getLicenseServers(This) ->
    erlang:error({abstract_method, getLicenseServers}).

getLicenseServer(This, Index) when is_integer(Index) ->
    erlang:error({abstract_method, getLicenseServer}).

getNumberOfLicenseServers(This) ->
    erlang:error({abstract_method, getNumberOfLicenseServers}).

toHashtable(This) ->
    erlang:error({abstract_method, toHashtable}).

isSameId(This, AlicenseId) when (is_list(AlicenseId) orelse AlicenseId =:= undefined) ->
    erlang:error({abstract_method, isSameId}).

isLargerOrDifferentServerList(This, Vector) ->
    erlang:error({abstract_method, isLargerOrDifferentServerList}).

isHardSale(This) ->
    erlang:error({abstract_method, isHardSale}).

toShortString(This) ->
    erlang:error({abstract_method, toShortString}).

