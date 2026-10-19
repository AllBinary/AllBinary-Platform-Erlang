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
% package org.allbinary.game.configuration
% import org.allbinary.logic.StdUtil
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('GameConfigurationSingleton').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'GameConfigurationSingleton':new()),
    ok.

init_fields(This) ->
    put({This, list}, undefined),
    put({This, hashtable}, undefined),
    ok.


getInstance() ->
        get({'GameConfigurationSingleton', 'SINGLETON'}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        put({This, list}, 'BasicArrayListD':new()),
        put({This, hashtable}, (fun(Target_N65920) -> (get({Target_N65920, '$class'})):createHashtable(Target_N65920) end)('StdUtil':getInstance())).

getInstanceByName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        (get({get({This, hashtable}), '$class'})):get(get({This, hashtable}), Name).

getOptionsBasicArrayList(This) ->
        get({This, list}).

add(This, GameConfiguration) ->
        (get({get({This, list}), '$class'})):add(get({This, list}), GameConfiguration).

getHashtable(This) ->
        get({This, hashtable}).

