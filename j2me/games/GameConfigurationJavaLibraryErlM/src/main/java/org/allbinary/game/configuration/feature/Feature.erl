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
% package org.allbinary.game.configuration.feature
% import org.allbinary.game.configuration.event.ChangedGameFeatureListener
% import org.allbinary.logic.StdUtil
% import org.allbinary.util.ABHashtable

-module('Feature').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, hashtable}, (fun(Target_N65692) -> (get({Target_N65692, '$class'})):createHashtable(Target_N65692) end)('StdUtil':getInstance())),
    ok.

init_fields(This) ->
    put({This, name}, undefined),
    ok.


new(Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name),
    This.

init(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        put({This, name}, Name),
        'Feature':add(Name, This),
        (fun(Target_N65857) -> (get({Target_N65857, '$class'})):add(Target_N65857, This) end)('ChangedGameFeatureListener':getInstance()).

getInstance(Name) when (is_list(Name) orelse Name =:= undefined) ->
        (get({get({'Feature', hashtable}), '$class'})):get(get({'Feature', hashtable}), Name).

add(Name, GameFeature) when (is_list(Name) orelse Name =:= undefined) ->
        (get({get({'Feature', hashtable}), '$class'})):put(get({'Feature', hashtable}), Name, GameFeature).

toString(This) ->
        (get({This, '$class'})):getName(This).

getName(This) ->
        get({This, name}).

