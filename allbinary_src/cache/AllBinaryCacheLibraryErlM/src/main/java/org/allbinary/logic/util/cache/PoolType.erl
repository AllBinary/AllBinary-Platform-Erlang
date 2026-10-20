% 
% AllBinary Open License Version 1 
% Copyright (c) 2007 AllBinary 
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

-module('PoolType').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, cacheType}, undefined),
    ok.


new(CacheType) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CacheType),
    This.

'$init'(This, CacheType) ->
    init_fields(This),
        put({This, cacheType}, CacheType).

getCacheType(This) ->
        get({This, cacheType}).

toString(This) ->
        POOL_TYPE = "PoolType: ",
        lists:concat([POOL_TYPE, (fun(Target_N65795) -> (get({Target_N65795, '$class'})):toString(Target_N65795) end)((get({This, '$class'})):getCacheType(This))]).

