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
% package org.allbinary.business.advertisement.search.website

-module('BasicAdvertisementWebsite').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AdvertisementWebsiteInterface

init_fields(This) ->
    put({This, websiteId}, undefined),
    ok.


new(WebsiteId) when (is_list(WebsiteId) orelse WebsiteId =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, WebsiteId),
    This.

'$init'(This, WebsiteId) when (is_list(WebsiteId) orelse WebsiteId =:= undefined) ->
    init_fields(This),
        put({This, websiteId}, WebsiteId).

toString(This) ->
        get({This, websiteId}).

