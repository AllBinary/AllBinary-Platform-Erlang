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
% package org.allbinary.media.graphics.geography.pathfinding
% import org.allbinary.logic.StdUtil
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListUtil

-module('PathCacheFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, pathFactory}, 'PathCacheFactory':new()),
    ok.

init_fields(This) ->
    put({This, basicArrayListUtil}, 'BasicArrayListUtil':getInstance()),
    put({This, hashtable}, (fun(Target_N65808) -> (get({Target_N65808, '$class'})):createHashtable(Target_N65808) end)('StdUtil':getInstance())),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getInstance() ->
        get({'PathCacheFactory', pathFactory}).

getSize(This) ->
        (get({get({This, hashtable}), '$class'})):size(get({This, hashtable})).

add(This, PathId, List) ->
        (get({get({This, hashtable}), '$class'})):put(get({This, hashtable}), PathId, List).

remove(This, PathId) ->
        (get({get({This, hashtable}), '$class'})):remove(get({This, hashtable}), PathId).

% throws Exception
removeAll(This) ->
        (get({get({This, hashtable}), '$class'})):clear(get({This, hashtable})),
        case ((get({get({This, hashtable}), '$class'})):size(get({This, hashtable})) > 0) of
            true ->
            erlang:error({'Exception', "Did not clear"});
            false -> ok
        end.

% throws Exception
getOrCreate(This, PathIdInteger) ->
        put({local, listCanBeNull}, (get({get({This, hashtable}), '$class'})):get(get({This, hashtable}), PathIdInteger)),
        case (get({local, listCanBeNull}) =:= undefined) of
            true ->
            put({local, listCanBeNull}, (get({get({This, basicArrayListUtil}), '$class'})):getImmutableInstance(get({This, basicArrayListUtil})));
            false -> ok
        end,
        get({local, listCanBeNull}).

