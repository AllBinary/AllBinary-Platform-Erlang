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
% package org.allbinary.business.context.modules.storefront

-module('StoreFrontsData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'StoreFrontsData':new()),
    ok.

init_fields(This) ->
    put({This, 'TYPE'}, "STOREFRONTS_TYPE"),
    put({This, 'RETAIL'}, "STOREFRONTS_RETAIL"),
    put({This, 'SUBSCRIPTION'}, "STOREFRONTS_SUBSCRIPTION"),
    put({This, 'AUCTION'}, "STOREFRONTS_AUCTION"),
    put({This, 'NEWS'}, "STOREFRONTS_NEWS"),
    put({This, 'BLOG'}, "STOREFRONTS_BLOG"),
    put({This, 'FORUM'}, "STOREFRONTS_FORUM"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'StoreFrontsData', instance}).

