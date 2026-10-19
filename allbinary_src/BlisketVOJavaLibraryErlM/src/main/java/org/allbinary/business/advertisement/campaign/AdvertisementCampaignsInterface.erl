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
% package org.allbinary.business.advertisement.campaign
% import org.allbinary.business.advertisement.AdvertisementInterface

-module('AdvertisementCampaignsInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


add(This, AdvertisementInterface) ->
    erlang:error({abstract_method, add}).

get(This, Index) when is_integer(Index) ->
    erlang:error({abstract_method, get}).

size(This) ->
    erlang:error({abstract_method, size}).

isEnabled(This) ->
    erlang:error({abstract_method, isEnabled}).

