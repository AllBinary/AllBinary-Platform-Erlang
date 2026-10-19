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
% package org.allbinary.business.quoterequest

-module('QuoteRequestData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'QuoteRequestData':new()),
    ok.

init_fields(This) ->
    put({This, 'ID'}, "QUOTEREQUEST_ID"),
    put({This, 'PROJECT_INFO'}, "QUOTEREQUEST_PROJECT_INFO"),
    put({This, 'CUSTOMER_COMMENTS'}, "QUOTEREQUEST_CUSTOMER_COMMENTS"),
    put({This, 'BUDGET'}, "QUOTEREQUEST_BUDGET"),
    put({This, 'TIMEFRAME'}, "QUOTEREQUEST_TIMEFRAME"),
    put({This, 'COMMENTS'}, "QUOTEREQUEST_COMMENTS"),
    ok.


getInstance() ->
        get({'QuoteRequestData', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

