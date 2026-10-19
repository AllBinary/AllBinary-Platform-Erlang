% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.platform
% import org.allbinary.logic.StdUtil
% import org.allbinary.util.ABHashtable

-module('ThreedObjResources').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ThreedObjResources':new()),
    ok.

init_fields(This) ->
    put({This, hashtable}, (fun(Target_N65754) -> (get({Target_N65754, '$class'})):createHashtable(Target_N65754) end)('StdUtil':getInstance())),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'ThreedObjResources', instance}).

get(This, ResourceName) when (is_list(ResourceName) orelse ResourceName =:= undefined) ->
        try
        ResourceName2 = (get({get({This, hashtable}), '$class'})):get(get({This, hashtable}), ResourceName),
        case (ResourceName2 =/= undefined) of
            true ->
            throw({'$return', ResourceName2});
            false -> ok
        end,
        ResourceName
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

