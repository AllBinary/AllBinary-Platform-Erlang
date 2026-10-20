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
% package org.allbinary.graphics.color
% import org.allbinary.logic.StdUtil
% import org.allbinary.util.ABHashtable

-module('BasicColorCacheFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'BasicColorCacheFactory':new()),
    ok.

init_fields(This) ->
    put({This, hashtable}, (fun(Target_N65756) -> (get({Target_N65756, '$class'})):createHashtable(Target_N65756) end)('StdUtil':getInstance())),
    ok.


getInstance() ->
        get({'BasicColorCacheFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

add(This, BasicDefaultColor) ->
        (get({get({This, hashtable}), '$class'})):put(get({This, hashtable}), (get({BasicDefaultColor, '$class'})):intValue(BasicDefaultColor), BasicDefaultColor).

getAndOrCreate(This, Integer) ->
        put({local, basicColor}, (get({get({This, hashtable}), '$class'})):get(get({This, hashtable}), Integer)),
        case (get({local, basicColor}) =:= undefined) of
            true ->
            put({local, basicColor}, (fun(Target_N66069) -> (get({Target_N66069, '$class'})):createInstance(Target_N66069, (get({Integer, '$class'})):intValue(Integer)) end)('BasicColorFactory':getInstance())),
            (get({get({This, hashtable}), '$class'})):put(get({This, hashtable}), Integer, get({local, basicColor}));
            false -> ok
        end,
        get({local, basicColor}).

