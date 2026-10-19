% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package org.allbinary.logic.system
% import java.io.InputStream
% import org.allbinary.data.resource.ResourceUtil

-module('PlatformAssetManager').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PlatformAssetManager':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'PlatformAssetManager', instance}).

% throws Exception
getResourceAsStream(This, Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
        ResourceUtil = 'ResourceUtil':getInstance(),
        InputStream = (get({ResourceUtil, '$class'})):getResourceAsStream(ResourceUtil, Resource),
        InputStream.

