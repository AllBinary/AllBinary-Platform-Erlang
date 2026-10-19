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
% package org.allbinary
% import java.util.HashMap
% import java.util.Map
% import java.util.Set

-module('J2SEUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'J2SEUtil':new()),
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
        get({'J2SEUtil', instance}).

getHashMapAsArray(This, HashMap) ->
        ObjectArray = (fun(Target_N65771) -> (get({Target_N65771, '$class'})):toArray(Target_N65771) end)((get({HashMap, '$class'})):keySet(HashMap)),
        ObjectArray.

getMapAsArray(This, Map) ->
        ObjectArray = (fun(Target_N65927) -> (get({Target_N65927, '$class'})):toArray(Target_N65927) end)((get({Map, '$class'})):keySet(Map)),
        ObjectArray.

getSetAsArray(This, Set) ->
        ObjectArray = (get({Set, '$class'})):toArray(Set),
        ObjectArray.

