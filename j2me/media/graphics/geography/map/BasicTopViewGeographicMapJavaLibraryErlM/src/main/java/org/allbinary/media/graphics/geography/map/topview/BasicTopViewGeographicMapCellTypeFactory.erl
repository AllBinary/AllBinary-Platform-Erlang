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
% package org.allbinary.media.graphics.geography.map.topview
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.media.graphics.geography.map.GeographicMapCellType
% import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.HashtableUtil

-module('BasicTopViewGeographicMapCellTypeFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GeographicMapCellTypeFactory', Function, Arguments).

init_fields(This) ->
    put({This, 'BLOCK_CELL_TYPE'}, undefined),
    put({This, 'OFF_MAP_CELL_TYPE'}, undefined),
    put({This, 'FLOOR_CELL_TYPE'}, undefined),
    put({This, 'DOOR_CELL_TYPE'}, undefined),
    put({This, 'STAIRS_UP_CELL_TYPE'}, undefined),
    put({This, 'STAIRS_DOWN_CELL_TYPE'}, undefined),
    put({This, 'OTHER_CELL_TYPE'}, undefined),
    put({This, maxTileId}, 0),
    ok.


new(TileTypeToTileIdsMap, MaxTileId) when is_integer(MaxTileId) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TileTypeToTileIdsMap, MaxTileId),
    This.

init(This, TileTypeToTileIdsMap, MaxTileId) when is_integer(MaxTileId) ->
    'GeographicMapCellTypeFactory':init(This),
    init_fields(This),
        CommonStrings = 'CommonStrings':getInstance(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({CommonStrings, 'START'}), This, get({CommonStrings, 'CONSTRUCTOR'})),
        put({This, maxTileId}, MaxTileId),
        BasicTopViewGeographicMapStrings = 'BasicTopViewGeographicMapStrings':getInstance(),
        GeographicMapCellTypeFactory = 'GeographicMapCellTypeFactory':getInstance(),
        GeographicMapCellTypeArray = (get({GeographicMapCellTypeFactory, '$class'})):getGeographicMapCellTypeArray(GeographicMapCellTypeFactory),
        put({local, type}, 0),
        case (array:get(get({local, type}), GeographicMapCellTypeArray) =:= undefined) of
            true ->
            'RaceTrackGeographicMapCellType':new(get({'CommonStrings':getInstance(), 'UNKNOWN'}), get({local, type}), 999, 0);
            false ->
            ok
        end,
        put({local, 'BLOCK_CELL_TYPE'}, 'BasicTopViewGeographicMapCellType':createType(get({BasicTopViewGeographicMapStrings, 'DEFAULT'}), 1, 1)),
        put({local, 'OFF_MAP_CELL_TYPE'}, get({local, 'BLOCK_CELL_TYPE'})),
        put({local, 'FLOOR_CELL_TYPE'}, get({local, 'BLOCK_CELL_TYPE'})),
        put({local, 'DOOR_CELL_TYPE'}, get({local, 'BLOCK_CELL_TYPE'})),
        put({local, 'STAIRS_UP_CELL_TYPE'}, get({local, 'BLOCK_CELL_TYPE'})),
        put({local, 'STAIRS_DOWN_CELL_TYPE'}, get({local, 'BLOCK_CELL_TYPE'})),
        put({local, 'OTHER_CELL_TYPE'}, get({local, 'BLOCK_CELL_TYPE'})),
        KeyArray = (fun(Target_N66868) -> (get({Target_N66868, '$class'})):getKeysAsArray(Target_N66868, TileTypeToTileIdsMap) end)('HashtableUtil':getInstance()),
        Size = array:size(KeyArray),
        put({local, idsWithTypeList}, undefined),
        put({local, key}, undefined),
        put({local, basicPlatormGeographicMapCellType}, undefined),
        lists:foreach(fun(Index) ->
            put({local, key}, array:get(Index, KeyArray)),
            put({local, idsWithTypeList}, (get({TileTypeToTileIdsMap, '$class'})):get(TileTypeToTileIdsMap, get({local, key}))),
            case (get({local, key}) =:= get({BasicTopViewGeographicMapStrings, 'WALL'})) of
                true ->
                put({local, basicPlatormGeographicMapCellType}, 'BasicTopViewGeographicMapCellType':new(get({BasicTopViewGeographicMapStrings, 'WALL'}), get({local, idsWithTypeList}), 1000)),
                put({local, 'BLOCK_CELL_TYPE'}, get({local, basicPlatormGeographicMapCellType}));
                false ->
                case (get({local, key}) =:= get({BasicTopViewGeographicMapStrings, 'OFF_MAP'})) of
                true ->
                put({local, basicPlatormGeographicMapCellType}, 'BasicTopViewGeographicMapCellType':new(get({BasicTopViewGeographicMapStrings, 'OFF_MAP'}), get({local, idsWithTypeList}), 1001)),
                put({local, 'OFF_MAP_CELL_TYPE'}, get({local, basicPlatormGeographicMapCellType}));
                false ->
                case (get({local, key}) =:= get({BasicTopViewGeographicMapStrings, 'FLOOR'})) of
                true ->
                put({local, basicPlatormGeographicMapCellType}, 'BasicTopViewGeographicMapCellType':new(get({BasicTopViewGeographicMapStrings, 'FLOOR'}), get({local, idsWithTypeList}), 1)),
                put({local, 'FLOOR_CELL_TYPE'}, get({local, basicPlatormGeographicMapCellType}));
                false ->
                case (get({local, key}) =:= get({BasicTopViewGeographicMapStrings, 'DOOR'})) of
                true ->
                put({local, basicPlatormGeographicMapCellType}, 'BasicTopViewGeographicMapCellType':new(get({BasicTopViewGeographicMapStrings, 'DOOR'}), get({local, idsWithTypeList}), 1)),
                put({local, 'DOOR_CELL_TYPE'}, get({local, basicPlatormGeographicMapCellType}));
                false ->
                case (get({local, key}) =:= get({BasicTopViewGeographicMapStrings, 'STAIRS_UP'})) of
                true ->
                put({local, basicPlatormGeographicMapCellType}, 'BasicTopViewGeographicMapCellType':new(get({BasicTopViewGeographicMapStrings, 'STAIRS_UP'}), get({local, idsWithTypeList}), 1)),
                put({local, 'STAIRS_UP_CELL_TYPE'}, get({local, basicPlatormGeographicMapCellType}));
                false ->
                case (get({local, key}) =:= get({BasicTopViewGeographicMapStrings, 'STAIRS_DOWN'})) of
                true ->
                put({local, basicPlatormGeographicMapCellType}, 'BasicTopViewGeographicMapCellType':new(get({BasicTopViewGeographicMapStrings, 'STAIRS_DOWN'}), get({local, idsWithTypeList}), 1)),
                put({local, 'STAIRS_DOWN_CELL_TYPE'}, get({local, basicPlatormGeographicMapCellType}));
                false ->
                case (get({local, key}) =:= get({BasicTopViewGeographicMapStrings, 'OTHER'})) of
                true ->
                put({local, basicPlatormGeographicMapCellType}, 'BasicTopViewGeographicMapCellType':new(get({BasicTopViewGeographicMapStrings, 'OTHER'}), get({local, idsWithTypeList}), 1)),
                put({local, 'OTHER_CELL_TYPE'}, get({local, basicPlatormGeographicMapCellType}));
                false -> ok
            end
            end
            end
            end
            end
            end
            end
        end, lists:seq(0, Size - 1)),
        put({This, 'BLOCK_CELL_TYPE'}, get({local, 'BLOCK_CELL_TYPE'})),
        put({This, 'OFF_MAP_CELL_TYPE'}, get({local, 'OFF_MAP_CELL_TYPE'})),
        put({This, 'FLOOR_CELL_TYPE'}, get({local, 'FLOOR_CELL_TYPE'})),
        put({This, 'DOOR_CELL_TYPE'}, get({local, 'DOOR_CELL_TYPE'})),
        put({This, 'STAIRS_UP_CELL_TYPE'}, get({local, 'STAIRS_UP_CELL_TYPE'})),
        put({This, 'STAIRS_DOWN_CELL_TYPE'}, get({local, 'STAIRS_DOWN_CELL_TYPE'})),
        put({This, 'OTHER_CELL_TYPE'}, get({local, 'OTHER_CELL_TYPE'})),
        put({local, type}, (get({This, maxTileId}) - 1)),
        case (array:get(get({local, type}), GeographicMapCellTypeArray) =:= undefined) of
            true ->
            'RaceTrackGeographicMapCellType':new(get({CommonStrings, 'START'}), get({local, type}), 1, 0);
            false ->
            ok
        end,
        put({local, type}, (get({This, maxTileId}) - 2)),
        case (array:get(get({local, type}), GeographicMapCellTypeArray) =:= undefined) of
            true ->
            'RaceTrackGeographicMapCellType':new(get({CommonStrings, 'START'}), get({local, type}), 1, 0);
            false ->
            ok
        end.

getStartType(This) ->
        (get({This, maxTileId}) - 1).

getEndType(This) ->
        (get({This, maxTileId}) - 2).

getEmptyType(This) ->
        array:get(0, (get({get({This, 'FLOOR_CELL_TYPE'}), '$class'})):getTypes(get({This, 'FLOOR_CELL_TYPE'}))).

isPath(This, CellType) ->
        try
        case (get({get({This, 'FLOOR_CELL_TYPE'}), '$class'})):isType(get({This, 'FLOOR_CELL_TYPE'}), CellType) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toString(This) ->
        (fun(Target_N69026) -> (get({Target_N69026, '$class'})):toString(Target_N69026) end)((fun(Target_N69033) -> (get({Target_N69033, '$class'})):append(Target_N69033, (get({get({This, 'STAIRS_UP_CELL_TYPE'}), '$class'})):toString(get({This, 'STAIRS_UP_CELL_TYPE'}))) end)((fun(Target_N69040) -> (get({Target_N69040, '$class'})):append(Target_N69040, "key: STAIRS_UP_CELL_TYPE: ") end)((fun(Target_N69047) -> (get({Target_N69047, '$class'})):append(Target_N69047, (get({get({This, 'STAIRS_DOWN_CELL_TYPE'}), '$class'})):toString(get({This, 'STAIRS_DOWN_CELL_TYPE'}))) end)((fun(Target_N69054) -> (get({Target_N69054, '$class'})):append(Target_N69054, "key: STAIRS_DOWN_CELL_TYPE: ") end)((fun(Target_N69061) -> (get({Target_N69061, '$class'})):append(Target_N69061, (get({get({This, 'DOOR_CELL_TYPE'}), '$class'})):toString(get({This, 'DOOR_CELL_TYPE'}))) end)((fun(Target_N69068) -> (get({Target_N69068, '$class'})):append(Target_N69068, "key: DOOR_CELL_TYPE: ") end)((fun(Target_N69075) -> (get({Target_N69075, '$class'})):append(Target_N69075, (get({get({This, 'OFF_MAP_CELL_TYPE'}), '$class'})):toString(get({This, 'OFF_MAP_CELL_TYPE'}))) end)((fun(Target_N69082) -> (get({Target_N69082, '$class'})):append(Target_N69082, "key: OFF_MAP_CELL_TYPE: ") end)((fun(Target_N69089) -> (get({Target_N69089, '$class'})):append(Target_N69089, (get({get({This, 'OTHER_CELL_TYPE'}), '$class'})):toString(get({This, 'OTHER_CELL_TYPE'}))) end)((fun(Target_N69096) -> (get({Target_N69096, '$class'})):append(Target_N69096, "key: OTHER_CELL_TYPE: ") end)((fun(Target_N69103) -> (get({Target_N69103, '$class'})):append(Target_N69103, (get({get({This, 'FLOOR_CELL_TYPE'}), '$class'})):toString(get({This, 'FLOOR_CELL_TYPE'}))) end)((fun(Target_N69110) -> (get({Target_N69110, '$class'})):append(Target_N69110, "key: FLOOR_CELL_TYPE: ") end)((fun(Target_N69117) -> (get({Target_N69117, '$class'})):append(Target_N69117, (get({get({This, 'BLOCK_CELL_TYPE'}), '$class'})):toString(get({This, 'BLOCK_CELL_TYPE'}))) end)((fun(Target_N69124) -> (get({Target_N69124, '$class'})):append(Target_N69124, "key: WALL/BLOCK_CELL_TYPE: ") end)('StringMaker':new()))))))))))))))).

