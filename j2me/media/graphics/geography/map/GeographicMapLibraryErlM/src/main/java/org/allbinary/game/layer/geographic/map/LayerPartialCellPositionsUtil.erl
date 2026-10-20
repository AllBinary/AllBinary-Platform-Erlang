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
% package org.allbinary.game.layer.geographic.map
% import org.allbinary.util.BasicArrayList
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory

-module('LayerPartialCellPositionsUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LayerPartialCellPositionsUtil':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


% throws Exception
getAll(This, GeographicMapInterface, LayerInterface, ReusableList) ->
        (get({ReusableList, '$class'})):clear(ReusableList),
        TopLeftGeographicMapCellPosition = (get({GeographicMapInterface, '$class'})):getCellPositionAtXYNoThrow(GeographicMapInterface, (get({LayerInterface, '$class'})):getXP(LayerInterface), (get({LayerInterface, '$class'})):getYP(LayerInterface)),
        TopRightGeographicMapCellPosition = (get({GeographicMapInterface, '$class'})):getCellPositionAtXYNoThrow(GeographicMapInterface, ((get({LayerInterface, '$class'})):getXP(LayerInterface) + (get({LayerInterface, '$class'})):getWidth(LayerInterface)), (get({LayerInterface, '$class'})):getYP(LayerInterface)),
        BottomLeftGeographicMapCellPosition = (get({GeographicMapInterface, '$class'})):getCellPositionAtXYNoThrow(GeographicMapInterface, (get({LayerInterface, '$class'})):getXP(LayerInterface), ((get({LayerInterface, '$class'})):getYP(LayerInterface) + (get({LayerInterface, '$class'})):getHeight(LayerInterface))),
        BottomRightGeographicMapCellPosition = (get({GeographicMapInterface, '$class'})):getCellPositionAtXYNoThrow(GeographicMapInterface, ((get({LayerInterface, '$class'})):getXP(LayerInterface) + (get({LayerInterface, '$class'})):getWidth(LayerInterface)), ((get({LayerInterface, '$class'})):getYP(LayerInterface) + (get({LayerInterface, '$class'})):getHeight(LayerInterface))),
        case (TopLeftGeographicMapCellPosition =/= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) of
            true ->
            (get({ReusableList, '$class'})):add(ReusableList, TopLeftGeographicMapCellPosition);
            false -> ok
        end,
        case ((TopRightGeographicMapCellPosition =/= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) andalso (TopLeftGeographicMapCellPosition =/= TopRightGeographicMapCellPosition)) of
            true ->
            (get({ReusableList, '$class'})):add(ReusableList, TopRightGeographicMapCellPosition);
            false -> ok
        end,
        case ((BottomLeftGeographicMapCellPosition =/= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) andalso (not (get({ReusableList, '$class'})):contains(ReusableList, BottomLeftGeographicMapCellPosition))) of
            true ->
            (get({ReusableList, '$class'})):add(ReusableList, BottomLeftGeographicMapCellPosition);
            false -> ok
        end,
        case ((BottomRightGeographicMapCellPosition =/= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) andalso (not (get({ReusableList, '$class'})):contains(ReusableList, BottomRightGeographicMapCellPosition))) of
            true ->
            (get({ReusableList, '$class'})):add(ReusableList, BottomRightGeographicMapCellPosition);
            false -> ok
        end,
        ReusableList.

% throws Exception
getAllDXY(This, GeographicMapInterface, LayerInterface, Dx, Dy, ReusableList) when is_integer(Dx), is_integer(Dy) ->
        (get({ReusableList, '$class'})):clear(ReusableList),
        TopLeftGeographicMapCellPosition = (get({GeographicMapInterface, '$class'})):getCellPositionAtXYNoThrow(GeographicMapInterface, ((get({LayerInterface, '$class'})):getXP(LayerInterface) + Dx), ((get({LayerInterface, '$class'})):getYP(LayerInterface) + Dy)),
        TopRightGeographicMapCellPosition = (get({GeographicMapInterface, '$class'})):getCellPositionAtXYNoThrow(GeographicMapInterface, (((get({LayerInterface, '$class'})):getXP(LayerInterface) + (get({LayerInterface, '$class'})):getWidth(LayerInterface)) + Dx), ((get({LayerInterface, '$class'})):getYP(LayerInterface) + Dy)),
        BottomLeftGeographicMapCellPosition = (get({GeographicMapInterface, '$class'})):getCellPositionAtXYNoThrow(GeographicMapInterface, ((get({LayerInterface, '$class'})):getXP(LayerInterface) + Dx), (((get({LayerInterface, '$class'})):getYP(LayerInterface) + (get({LayerInterface, '$class'})):getHeight(LayerInterface)) + Dy)),
        BottomRightGeographicMapCellPosition = (get({GeographicMapInterface, '$class'})):getCellPositionAtXYNoThrow(GeographicMapInterface, (((get({LayerInterface, '$class'})):getXP(LayerInterface) + (get({LayerInterface, '$class'})):getWidth(LayerInterface)) + Dx), (((get({LayerInterface, '$class'})):getYP(LayerInterface) + (get({LayerInterface, '$class'})):getHeight(LayerInterface)) + Dy)),
        case (TopLeftGeographicMapCellPosition =/= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) of
            true ->
            (get({ReusableList, '$class'})):add(ReusableList, TopLeftGeographicMapCellPosition);
            false -> ok
        end,
        case ((TopRightGeographicMapCellPosition =/= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) andalso (TopLeftGeographicMapCellPosition =/= TopRightGeographicMapCellPosition)) of
            true ->
            (get({ReusableList, '$class'})):add(ReusableList, TopRightGeographicMapCellPosition);
            false -> ok
        end,
        case ((BottomLeftGeographicMapCellPosition =/= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) andalso (not (get({ReusableList, '$class'})):contains(ReusableList, BottomLeftGeographicMapCellPosition))) of
            true ->
            (get({ReusableList, '$class'})):add(ReusableList, BottomLeftGeographicMapCellPosition);
            false -> ok
        end,
        case ((BottomRightGeographicMapCellPosition =/= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) andalso (not (get({ReusableList, '$class'})):contains(ReusableList, BottomRightGeographicMapCellPosition))) of
            true ->
            (get({ReusableList, '$class'})):add(ReusableList, BottomRightGeographicMapCellPosition);
            false -> ok
        end,
        ReusableList.

getInstance() ->
        get({'LayerPartialCellPositionsUtil', instance}).

