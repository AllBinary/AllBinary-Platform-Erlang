% Generated Code Do Not Modify
% package org.allbinary.media.graphics.geography.pathfinding
% import org.allbinary.logic.util.cache.BaseBasicArrayListCache
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListS

-module('BasicGeographicMapExtractedPathCacheFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseBasicArrayListCache', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'BasicGeographicMapExtractedPathCacheFactory':new()),
    ok.

init_fields(This) ->
    put({This, maxConcurrentPaths}, 0),
    put({This, maxPaths}, 0),
    ok.


getInstance() ->
        get({'BasicGeographicMapExtractedPathCacheFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'BaseBasicArrayListCache':init(This),
    init_fields(This),
        ok.

init(This, MaxConcurrentPaths, MaxPaths) when is_integer(MaxConcurrentPaths), is_integer(MaxPaths) ->
        case (MaxConcurrentPaths =/= get({This, maxConcurrentPaths})) of
            true ->
            lists:foreach(fun(Index) ->
                (get({get({This, list}), '$class'})):add(get({This, list}), 'BasicArrayListS':new(MaxPaths))
            end, lists:seq(MaxConcurrentPaths, get({This, maxConcurrentPaths}), -1)),
            put({This, maxConcurrentPaths}, MaxConcurrentPaths);
            false -> ok
        end,
        put({This, maxPaths}, MaxPaths).

getPath(This) ->
        try
        case ((get({get({This, list}), '$class'})):size(get({This, list})) > 0) of
            true ->
            throw({'$return', (get({get({This, list}), '$class'})):removeAt(get({This, list}), 0)});
            false ->
            throw({'$return', 'BasicArrayListS':new(get({This, maxPaths}))})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

release(This, List) ->
        (get({List, '$class'})):clear(List),
        (get({get({This, list}), '$class'})):add(get({This, list}), List).

