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
% package org.allbinary.logic.util.cache

-module('CachePolicyFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'CachePolicyFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'NAME'}, "lru"),
    put({This, 'MAX_TIME_THOUSAND_MAX'}, 'CachePolicy':new(get({This, 'NAME'}), get({'Long', 'MAX_VALUE'}), 1000)),
    put({This, 'THIRTY_MINUTES_TEN_THOUSAND_MAX'}, 'CachePolicy':new(get({This, 'NAME'}), ((1000 * 60) * 30), 10000)),
    put({This, 'THIRTY_MINUTES_FIFTY_THOUSAND_MAX'}, 'CachePolicy':new(get({This, 'NAME'}), ((1000 * 60) * 30), 100000)),
    put({This, 'ONE_MINUTE_FIVE_MAX'}, 'CachePolicy':new(get({This, 'NAME'}), ((1000 * 60) * 1), 5)),
    put({This, 'ONE_MINUTE_TEN_MAX'}, 'CachePolicy':new(get({This, 'NAME'}), ((1000 * 60) * 1), 10)),
    put({This, 'ONE_MINUTE_ONE_HUNDRED_MAX'}, 'CachePolicy':new(get({This, 'NAME'}), ((1000 * 60) * 1), 100)),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'CachePolicyFactory', instance}).

