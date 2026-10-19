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
% package org.allbinary.media.graphics.geography.map
% import org.allbinary.util.BasicArrayList
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.util.BasicArrayListS

-module('CellPositionsUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'CellPositionsUtil':new()),
    ok.

init_fields(This) ->
    put({This, reusableSingleThreadedSurroundingList}, 'BasicArrayListS':new(8)),
    put({This, surroundArray}, array:from_list([array:from_list([(-1), (-1)]), array:from_list([0, (-1)]), array:from_list([1, (-1)]), array:from_list([(-1), 1]), array:from_list([0, 1]), array:from_list([1, 1]), array:from_list([1, 0]), array:from_list([(-1), 0])])),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'CellPositionsUtil', instance}).

% throws Exception
getAll(This, GeographicMapInterface, TopRightGeographicMapCellPosition, Columns, Rows, ReusableList) when is_integer(Columns), is_integer(Rows) ->
        try
        (get({ReusableList, '$class'})):clear(ReusableList),
        GeographicMapCellPositionFactory = (get({GeographicMapInterface, '$class'})):getGeographicMapCellPositionFactory(GeographicMapInterface),
        LastColumn = ((get({TopRightGeographicMapCellPosition, '$class'})):getColumn(TopRightGeographicMapCellPosition) + Columns),
        LastRow = ((get({TopRightGeographicMapCellPosition, '$class'})):getRow(TopRightGeographicMapCellPosition) + Rows),
        case ((((Columns > 1) andalso (LastColumn > (fun(Target_N66024) -> (get({Target_N66024, '$class'})):getColumns(Target_N66024) end)((get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface))))) orelse (((Rows > 1) andalso (LastRow > (fun(Target_N66087) -> (get({Target_N66087, '$class'})):getRows(Target_N66087) end)((get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface)))))) of
            true ->
            throw({'$return', ReusableList});
            false -> ok
        end,
        lists:foreach(fun(RowIndex) ->
            lists:foreach(fun(ColumnIndex) ->
                GeographicMapCellPosition = (get({GeographicMapCellPositionFactory, '$class'})):getAt(GeographicMapCellPositionFactory, ((get({TopRightGeographicMapCellPosition, '$class'})):getColumn(TopRightGeographicMapCellPosition) + ColumnIndex), ((get({TopRightGeographicMapCellPosition, '$class'})):getRow(TopRightGeographicMapCellPosition) + RowIndex)),
                (get({ReusableList, '$class'})):add(ReusableList, GeographicMapCellPosition)
            end, lists:seq(0, Columns - 1))
        end, lists:seq(0, Rows - 1)),
        ReusableList
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getAllSurrounding(This, GeographicMapInterface, OccupyList, ReusableList) ->
        (get({ReusableList, '$class'})):clear(ReusableList),
        lists:foreach(fun(Index) ->
            LayerGeographicMapCellPosition = (get({OccupyList, '$class'})):get(OccupyList, Index),
            SurroundingGeographicMapCellPositionList = (get({This, '$class'})):getAllSurroundingAt(This, GeographicMapInterface, LayerGeographicMapCellPosition, get({This, reusableSingleThreadedSurroundingList})),
            lists:foreach(fun(Index2) ->
                GeographicMapCellPosition = (get({SurroundingGeographicMapCellPositionList, '$class'})):get(SurroundingGeographicMapCellPositionList, Index2),
                case ((not (get({ReusableList, '$class'})):contains(ReusableList, GeographicMapCellPosition)) andalso (not (get({OccupyList, '$class'})):contains(OccupyList, GeographicMapCellPosition))) of
                    true ->
                    (get({ReusableList, '$class'})):add(ReusableList, GeographicMapCellPosition);
                    false -> ok
                end
            end, lists:seq(((get({SurroundingGeographicMapCellPositionList, '$class'})):size(SurroundingGeographicMapCellPositionList) - 1), 0, -1))
        end, lists:seq(((get({OccupyList, '$class'})):size(OccupyList) - 1), 0, -1)),
        ReusableList.

% throws Exception
getAllSurroundingAt(This, GeographicMapInterface, LayerGeographicMapCellPosition, ReusableSurroundingList) ->
        (get({ReusableSurroundingList, '$class'})):clear(ReusableSurroundingList),
        GeographicMapCellPositionFactory = (get({GeographicMapInterface, '$class'})):getGeographicMapCellPositionFactory(GeographicMapInterface),
        TiledLayer = (get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface),
        put({local, row}, 0),
        put({local, column}, 0),
        lists:foreach(fun(Index) ->
            put({local, column}, ((get({LayerGeographicMapCellPosition, '$class'})):getColumn(LayerGeographicMapCellPosition) + array:get(0, array:get(Index, get({This, surroundArray}))))),
            put({local, row}, ((get({LayerGeographicMapCellPosition, '$class'})):getRow(LayerGeographicMapCellPosition) + array:get(1, array:get(Index, get({This, surroundArray}))))),
            case (get({TiledLayer, '$class'})):isOnTileLayer(TiledLayer, get({local, column}), get({local, row})) of
                true ->
                GeographicMapCellPosition = (get({GeographicMapCellPositionFactory, '$class'})):getAt(GeographicMapCellPositionFactory, get({local, column}), get({local, row})),
                (get({ReusableSurroundingList, '$class'})):add(ReusableSurroundingList, GeographicMapCellPosition);
                false -> ok
            end
        end, lists:seq(0, 8 - 1)),
        ReusableSurroundingList.

