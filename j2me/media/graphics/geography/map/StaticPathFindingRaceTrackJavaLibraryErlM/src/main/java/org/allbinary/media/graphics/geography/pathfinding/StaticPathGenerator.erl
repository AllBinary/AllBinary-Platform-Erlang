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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.graphics.CellPosition
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.PathData
% import org.allbinary.util.BasicArrayListUtil

-module('StaticPathGenerator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements PathGeneratorInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicArrayListUtil}, 'BasicArrayListUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        'PreLogUtil':put("Using Static Path Finding", This, get({'CommonStrings':getInstance(), 'CONSTRUCTOR'})).

% throws Exception
init(This, GeographicMapInterface, TotalPaths) when is_integer(TotalPaths) ->
        ok.

% throws Exception
getGeographicMapCellPositionListFromBasicGeographicMapCellPositionList(This, GeographicMapCellPositionFactory, PathList) ->
        List = 'BasicArrayListD':new(),
        Size = (get({PathList, '$class'})):size(PathList),
        put({local, basicGeographicMapCellPosition}, undefined),
        put({local, geographicMapCellPosition}, undefined),
        lists:foreach(fun(Index) ->
            put({local, basicGeographicMapCellPosition}, (get({PathList, '$class'})):get(PathList, Index)),
            put({local, geographicMapCellPosition}, (get({GeographicMapCellPositionFactory, '$class'})):getAt(GeographicMapCellPositionFactory, (get({get({local, basicGeographicMapCellPosition}), '$class'})):getColumn(get({local, basicGeographicMapCellPosition})), (get({get({local, basicGeographicMapCellPosition}), '$class'})):getRow(get({local, basicGeographicMapCellPosition})))),
            (get({List, '$class'})):add(List, get({local, geographicMapCellPosition}))
        end, lists:seq(0, Size - 1)),
        List.

% throws Exception
createList(This, GeographicMapInterface, GeographicMapCellHistory, PathFindingInfo, TotalPaths) when is_integer(TotalPaths) ->
        CommonStrings = 'CommonStrings':getInstance(),
        try
            PathCacheFactory = 'PathCacheFactory':getInstance(),
            MapIdInteger = (fun(Target_N66965) -> (get({Target_N66965, '$class'})):getDataId(Target_N66965) end)((get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface)),
            put({local, list}, (get({PathCacheFactory, '$class'})):getOrCreate(PathCacheFactory, MapIdInteger)),
            case (get({local, list}) =:= (get({get({This, basicArrayListUtil}), '$class'})):getImmutableInstance(get({This, basicArrayListUtil}))) of
                true ->
                put({local, list}, 'BasicArrayListD':new()),
                SmallIntegerSingletonFactory = 'SmallIntegerSingletonFactory':getInstance(),
                GeographicMapCellPositionFactory = (get({GeographicMapInterface, '$class'})):getGeographicMapCellPositionFactory(GeographicMapInterface),
                Id = (get({'PathData':getInstance(), 'OFFSET'}) + (get({MapIdInteger, '$class'})):intValue(MapIdInteger)),
                BasicList = (get({PathCacheFactory, '$class'})):getOrCreate(PathCacheFactory, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, Id)),
                Size = (get({BasicList, '$class'})):size(BasicList),
                put({local, pathList}, undefined),
                lists:foreach(fun(Index) ->
                    put({local, pathList}, (get({This, '$class'})):getGeographicMapCellPositionListFromBasicGeographicMapCellPositionList(This, GeographicMapCellPositionFactory, (get({BasicList, '$class'})):get(BasicList, Index))),
                    (get({get({local, list}), '$class'})):add(get({local, list}), get({local, pathList}))
                end, lists:seq(0, Size - 1)),
                (get({PathCacheFactory, '$class'})):add(PathCacheFactory, MapIdInteger, get({local, list})),
                (get({PathCacheFactory, '$class'})):remove(PathCacheFactory, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, Id));
                false -> ok
            end,
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67754) -> (get({Target_N67754, '$class'})):toString(Target_N67754) end)((fun(Target_N67761) -> (get({Target_N67761, '$class'})):append(Target_N67761, (fun(Target_N67797) -> (get({Target_N67797, '$class'})):toString(Target_N67797, get({local, list})) end)('StringUtil':getInstance())) end)((fun(Target_N67768) -> (get({Target_N67768, '$class'})):append(Target_N67768, "Using Cached Path(s): ") end)('StringMaker':new()))), This, get({CommonStrings, 'GET_INSTANCE'})),
            get({local, list})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'GET_INSTANCE'}), E),
            'BasicArrayListD':new()
        end.

