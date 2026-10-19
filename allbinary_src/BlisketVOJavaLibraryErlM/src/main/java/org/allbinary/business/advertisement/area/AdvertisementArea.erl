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
% import java.util.HashMap
% import org.allbinary.business.advertisement.campaign.AdvertisementCampaignData
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.w3c.dom.Document

-module('AdvertisementArea').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AdvertisementAreaInterface

init_fields(This) ->
    put({This, name}, undefined),
    put({This, storeName}, undefined),
    put({This, description}, undefined),
    put({This, advertisementAreaConstraintsInterface}, undefined),
    put({This, campaign}, undefined),
    ok.


new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HashMap),
    This.

init(This, HashMap) ->
    init_fields(This),
        put({This, name}, (get({HashMap, '$class'})):get(HashMap, get({'AdvertisementAreaData':getInstance(), 'NAME'}))),
        put({This, storeName}, (get({HashMap, '$class'})):get(HashMap, get({'StoreFrontData':getInstance(), 'NAME'}))),
        put({This, description}, (get({HashMap, '$class'})):get(HashMap, get({'AdvertisementAreaData':getInstance(), 'DESCRIPTION'}))),
        ConstraintsDomString = (get({HashMap, '$class'})):get(HashMap, get({'AdvertisementAreaData':getInstance(), 'CONSTRAINTS'})),
        Document = 'DomDocumentHelper':create(ConstraintsDomString),
        put({This, advertisementAreaConstraintsInterface}, 'AdvertisementAreaConstraints':new(Document)),
        put({This, campaign}, (get({HashMap, '$class'})):get(HashMap, get({'AdvertisementCampaignData':getInstance(), 'NAME'}))).

getName(This) ->
        get({This, name}).

getStoreName(This) ->
        get({This, storeName}).

getDescription(This) ->
        get({This, description}).

getConstraints(This) ->
        get({This, advertisementAreaConstraintsInterface}).

getCampaign(This) ->
        get({This, campaign}).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({This, name}, Name).

setStoreName(This, StoreName) when (is_list(StoreName) orelse StoreName =:= undefined) ->
        put({This, storeName}, StoreName).

setDescription(This, Description) when (is_list(Description) orelse Description =:= undefined) ->
        put({This, description}, Description).

setConstraints(This, AdvertisementConstraintsInterface) ->
        put({This, advertisementAreaConstraintsInterface}, get({This, advertisementAreaConstraintsInterface})).

setCampaign(This, Campaign) when (is_list(Campaign) orelse Campaign =:= undefined) ->
        put({This, campaign}, Campaign).

