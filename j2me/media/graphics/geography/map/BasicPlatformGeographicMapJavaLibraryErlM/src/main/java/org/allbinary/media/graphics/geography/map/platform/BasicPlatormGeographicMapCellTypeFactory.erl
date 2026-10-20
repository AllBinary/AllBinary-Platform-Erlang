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
% package org.allbinary.media.graphics.geography.map.platform
% import java.util.Enumeration
% import org.allbinary.string.CommonStrings
% import org.allbinary.media.graphics.geography.map.GeographicMapCellType
% import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.EnumerationUtil

-module('BasicPlatormGeographicMapCellTypeFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GeographicMapCellTypeFactory', Function, Arguments).

init_fields(This) ->
    put({This, enumerationUtil}, 'EnumerationUtil':getInstance()),
    put({This, 'BLOCK_CELL_TYPE'}, undefined),
    put({This, 'JUMP_THRU_CELL_TYPE'}, undefined),
    put({This, 'LADDER_CELL_TYPE'}, undefined),
    put({This, maxTileId}, 0),
    ok.


new(TileTypeToTileIdsMap, MaxTileId) when is_integer(MaxTileId) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TileTypeToTileIdsMap, MaxTileId),
    This.

'$init'(This, TileTypeToTileIdsMap, MaxTileId) when is_integer(MaxTileId) ->
    'GeographicMapCellTypeFactory':'$init'(This),
    init_fields(This),
        CommonStrings = 'CommonStrings':getInstance(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({CommonStrings, 'START'}), This, get({CommonStrings, 'INIT'})),
        put({This, maxTileId}, MaxTileId),
        'GeographicMapCellType':new(0, 0),
        put({local, 'BLOCK_CELL_TYPE'}, 'BasicPlatormGeographicMapCellType':createType(1)),
        put({local, 'JUMP_THRU_CELL_TYPE'}, get({local, 'BLOCK_CELL_TYPE'})),
        put({local, 'LADDER_CELL_TYPE'}, get({local, 'BLOCK_CELL_TYPE'})),
        PLATFORM = "Platform",
        JUMP_TRHU = "JumpThru",
        LADDER = "Ladder",
        Enumeration = (get({TileTypeToTileIdsMap, '$class'})):keys(TileTypeToTileIdsMap),
        put({local, idsWithTypeList}, undefined),
        put({local, key}, undefined),
        put({local, basicPlatormGeographicMapCellType}, undefined),
        (fun Loop() -> case (get({get({This, enumerationUtil}), '$class'})):hasMoreElements(get({This, enumerationUtil}), Enumeration) of true ->
            put({local, key}, (get({get({This, enumerationUtil}), '$class'})):nextElement(get({This, enumerationUtil}), Enumeration)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({local, key}), This, get({CommonStrings, 'INIT'})),
            put({local, idsWithTypeList}, (get({TileTypeToTileIdsMap, '$class'})):get(TileTypeToTileIdsMap, get({local, key}))),
            put({local, basicPlatormGeographicMapCellType}, 'BasicPlatormGeographicMapCellType':new(get({local, idsWithTypeList}))),
            case (get({local, key}) =:= PLATFORM) of
                true ->
                put({local, 'BLOCK_CELL_TYPE'}, get({local, basicPlatormGeographicMapCellType}));
                false -> ok
            end,
            case (get({local, key}) =:= JUMP_TRHU) of
                true ->
                put({local, 'JUMP_THRU_CELL_TYPE'}, get({local, basicPlatormGeographicMapCellType}));
                false -> ok
            end,
            case (get({local, key}) =:= LADDER) of
                true ->
                put({local, 'LADDER_CELL_TYPE'}, get({local, basicPlatormGeographicMapCellType}));
                false -> ok
            end,
            Loop();
        false -> ok end end)(),
        put({This, 'BLOCK_CELL_TYPE'}, get({local, 'BLOCK_CELL_TYPE'})),
        put({This, 'JUMP_THRU_CELL_TYPE'}, get({local, 'JUMP_THRU_CELL_TYPE'})),
        put({This, 'LADDER_CELL_TYPE'}, get({local, 'LADDER_CELL_TYPE'})),
        'GeographicMapCellType':new((get({This, maxTileId}) - 1), 0),
        'GeographicMapCellType':new((get({This, maxTileId}) - 2), 0).

getStartType(This) ->
        (get({This, maxTileId}) - 1).

getEndType(This) ->
        (get({This, maxTileId}) - 2).

getEmptyType(This) ->
        0.

isPath(This, CellType) ->
        try
        case ((get({CellType, '$class'})):getType(CellType) =:= 0) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

