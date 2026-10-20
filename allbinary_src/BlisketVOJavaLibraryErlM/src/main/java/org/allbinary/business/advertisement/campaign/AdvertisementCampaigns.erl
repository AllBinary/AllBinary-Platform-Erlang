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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.advertisement.AdvertisementInterface
% import org.allbinary.business.advertisement.AdvertisementsInterface
% import org.allbinary.business.advertisement.search.AdvertisementSearchInterface

-module('AdvertisementCampaigns').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AdvertisementCampaignsInterface

init_fields(This) ->
    put({This, advertisementsVector}, undefined),
    ok.


new(Vector) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Vector),
    This.

'$init'(This, Vector) ->
    init_fields(This),
        put({This, advertisementsVector}, get({This, advertisementsVector})).

add(This, AdvertisementInterface) ->
        (get({get({This, advertisementsVector}), '$class'})):add(get({This, advertisementsVector}), AdvertisementInterface).

get(This, Index) when is_integer(Index) ->
        (get({get({This, advertisementsVector}), '$class'})):get(get({This, advertisementsVector}), Index).

size(This) ->
        (get({get({This, advertisementsVector}), '$class'})):size(get({This, advertisementsVector})).

isEnabled(This) ->
        true.

search(This, AdvertisementSearchInterface) ->
        undefined.

