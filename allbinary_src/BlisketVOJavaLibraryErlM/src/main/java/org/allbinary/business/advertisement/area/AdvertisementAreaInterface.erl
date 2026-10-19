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
% package org.allbinary.business.advertisement.area

-module('AdvertisementAreaInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getName(This) ->
    erlang:error({abstract_method, getName}).

getStoreName(This) ->
    erlang:error({abstract_method, getStoreName}).

getDescription(This) ->
    erlang:error({abstract_method, getDescription}).

getConstraints(This) ->
    erlang:error({abstract_method, getConstraints}).

getCampaign(This) ->
    erlang:error({abstract_method, getCampaign}).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
    erlang:error({abstract_method, setName}).

setStoreName(This, StoreName) when (is_list(StoreName) orelse StoreName =:= undefined) ->
    erlang:error({abstract_method, setStoreName}).

setDescription(This, Description) when (is_list(Description) orelse Description =:= undefined) ->
    erlang:error({abstract_method, setDescription}).

setConstraints(This, AdvertisementConstraintsInterface) ->
    erlang:error({abstract_method, setConstraints}).

setCampaign(This, Campaign) when (is_list(Campaign) orelse Campaign =:= undefined) ->
    erlang:error({abstract_method, setCampaign}).

