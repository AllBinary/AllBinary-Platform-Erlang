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
% import java.util.HashMap
% import org.allbinary.business.DynamicObjectData
% import org.allbinary.business.advertisement.AdvertisementsInterface
% import org.allbinary.business.advertisement.search.AdvertisementSearchInterface

-module('AdvertisementCampaign').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AdvertisementCampaignInterface

init_fields(This) ->
    put({This, hashMap}, undefined),
    ok.


new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap),
    This.

'$init'(This, HashMap) ->
    init_fields(This),
        put({This, hashMap}, HashMap).

getComponent(This) ->
        undefined.

getName(This) ->
        (get({get({This, hashMap}), '$class'})):get(get({This, hashMap}), get({'AdvertisementCampaignData':getInstance(), 'NAME'})).

setComponentName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        (get({get({This, hashMap}), '$class'})):put(get({This, hashMap}), get({'DynamicObjectData', 'NAME'}), Name).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        (get({get({This, hashMap}), '$class'})):put(get({This, hashMap}), get({'AdvertisementCampaignData':getInstance(), 'NAME'}), Name).

search(This, AdvertisementSearchInterface) ->
        undefined.

