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
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.layer.Layer
% import org.allbinary.logic.math.MathUtil
% import org.allbinary.util.BasicArrayList

-module('BasicGeographicMap').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements GeographicMapInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('SimpleGeographicMap', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_BASIC_GEOGRAPHIC_MAP_ARRAY'}, array:new(0, {default, undefined})),
    ok.

init_fields(This) ->
    put({This, mathUtil}, 'MathUtil':getInstance()),
    put({This, geographicMapCellPositionFactory}, undefined),
    put({This, geographicMapCellPositionFactoryInterface}, undefined),
    put({This, geographicMapCellTypeFactory}, undefined),
    ok.


new(Id, Name, CellTypeIdToGeographicMapCellType, TiledLayer, ForegroundBasicColor, BackgroundBasicColor, GeographicMapCellPositionFactoryInterface, GeographicMapCellPositionBaseFactory, GeographicMapCellTypeFactory) when (is_list(Name) orelse Name =:= undefined), (is_tuple(CellTypeIdToGeographicMapCellType) orelse CellTypeIdToGeographicMapCellType =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Id, Name, CellTypeIdToGeographicMapCellType, TiledLayer, ForegroundBasicColor, BackgroundBasicColor, GeographicMapCellPositionFactoryInterface, GeographicMapCellPositionBaseFactory, GeographicMapCellTypeFactory),
    This.

init(This, Id, Name, CellTypeIdToGeographicMapCellType, TiledLayer, ForegroundBasicColor, BackgroundBasicColor, GeographicMapCellPositionFactoryInterface, GeographicMapCellPositionBaseFactory, GeographicMapCellTypeFactory) when (is_list(Name) orelse Name =:= undefined), (is_tuple(CellTypeIdToGeographicMapCellType) orelse CellTypeIdToGeographicMapCellType =:= undefined) ->
        'SimpleGeographicMap':init(This, Id, Name, CellTypeIdToGeographicMapCellType, TiledLayer, ForegroundBasicColor, BackgroundBasicColor),
        init_fields(This),
        put({This, geographicMapCellPositionFactoryInterface}, GeographicMapCellPositionFactoryInterface),
        put({This, geographicMapCellPositionFactory}, (get({GeographicMapCellPositionBaseFactory, '$class'})):getInstance(GeographicMapCellPositionBaseFactory, This)),
        put({This, geographicMapCellTypeFactory}, GeographicMapCellTypeFactory).

% throws Exception
getCellPosition(This, Direction, OldGeographicMapCellPosition) when is_integer(Direction) ->
        try
        begin
            Switch_N66388 = Direction,
            case lists:member(Switch_N66388, [0]) of true ->
                throw({'$return', (get({get({This, geographicMapCellPositionFactory}), '$class'})):getAt(get({This, geographicMapCellPositionFactory}), ((get({OldGeographicMapCellPosition, '$class'})):getColumn(OldGeographicMapCellPosition) - 1), (get({OldGeographicMapCellPosition, '$class'})):getRow(OldGeographicMapCellPosition))}); false ->
            case lists:member(Switch_N66388, [1]) of true ->
                throw({'$return', (get({get({This, geographicMapCellPositionFactory}), '$class'})):getAt(get({This, geographicMapCellPositionFactory}), ((get({OldGeographicMapCellPosition, '$class'})):getColumn(OldGeographicMapCellPosition) + 1), (get({OldGeographicMapCellPosition, '$class'})):getRow(OldGeographicMapCellPosition))}); false ->
            case lists:member(Switch_N66388, [2]) of true ->
                throw({'$return', (get({get({This, geographicMapCellPositionFactory}), '$class'})):getAt(get({This, geographicMapCellPositionFactory}), (get({OldGeographicMapCellPosition, '$class'})):getColumn(OldGeographicMapCellPosition), ((get({OldGeographicMapCellPosition, '$class'})):getRow(OldGeographicMapCellPosition) - 1))}); false ->
            case lists:member(Switch_N66388, [3]) of true ->
                throw({'$return', (get({get({This, geographicMapCellPositionFactory}), '$class'})):getAt(get({This, geographicMapCellPositionFactory}), (get({OldGeographicMapCellPosition, '$class'})):getColumn(OldGeographicMapCellPosition), ((get({OldGeographicMapCellPosition, '$class'})):getRow(OldGeographicMapCellPosition) + 1))}); false ->
            begin
                erlang:error({'Exception', "Only Four Directions"}) end end end end end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getCellPositionNoThrow(This, Direction, OldGeographicMapCellPosition) when is_integer(Direction) ->
        try
        begin
            Switch_N66859 = Direction,
            case lists:member(Switch_N66859, [0]) of true ->
                case (((get({OldGeographicMapCellPosition, '$class'})):getColumn(OldGeographicMapCellPosition) - 1) >= 0) of
                    true ->
                    throw({'$return', (get({get({This, geographicMapCellPositionFactory}), '$class'})):getAt(get({This, geographicMapCellPositionFactory}), ((get({OldGeographicMapCellPosition, '$class'})):getColumn(OldGeographicMapCellPosition) - 1), (get({OldGeographicMapCellPosition, '$class'})):getRow(OldGeographicMapCellPosition))});
                    false ->
                    throw({'$return', get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})})
                end; false ->
            case lists:member(Switch_N66859, [1]) of true ->
                case (((get({OldGeographicMapCellPosition, '$class'})):getColumn(OldGeographicMapCellPosition) + 1) < (fun(Target_N67073) -> (get({Target_N67073, '$class'})):getColumns(Target_N67073) end)((get({This, '$class'})):getAllBinaryTiledLayer(This))) of
                    true ->
                    throw({'$return', (get({get({This, geographicMapCellPositionFactory}), '$class'})):getAt(get({This, geographicMapCellPositionFactory}), ((get({OldGeographicMapCellPosition, '$class'})):getColumn(OldGeographicMapCellPosition) + 1), (get({OldGeographicMapCellPosition, '$class'})):getRow(OldGeographicMapCellPosition))});
                    false ->
                    throw({'$return', get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})})
                end; false ->
            case lists:member(Switch_N66859, [2]) of true ->
                case (((get({OldGeographicMapCellPosition, '$class'})):getRow(OldGeographicMapCellPosition) - 1) >= 0) of
                    true ->
                    throw({'$return', (get({get({This, geographicMapCellPositionFactory}), '$class'})):getAt(get({This, geographicMapCellPositionFactory}), (get({OldGeographicMapCellPosition, '$class'})):getColumn(OldGeographicMapCellPosition), ((get({OldGeographicMapCellPosition, '$class'})):getRow(OldGeographicMapCellPosition) - 1))});
                    false ->
                    throw({'$return', get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})})
                end; false ->
            case lists:member(Switch_N66859, [3]) of true ->
                case (((get({OldGeographicMapCellPosition, '$class'})):getRow(OldGeographicMapCellPosition) + 1) < (fun(Target_N67398) -> (get({Target_N67398, '$class'})):getRows(Target_N67398) end)((get({This, '$class'})):getAllBinaryTiledLayer(This))) of
                    true ->
                    throw({'$return', (get({get({This, geographicMapCellPositionFactory}), '$class'})):getAt(get({This, geographicMapCellPositionFactory}), (get({OldGeographicMapCellPosition, '$class'})):getColumn(OldGeographicMapCellPosition), ((get({OldGeographicMapCellPosition, '$class'})):getRow(OldGeographicMapCellPosition) + 1))});
                    false ->
                    throw({'$return', get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})})
                end; false ->
            begin
                throw({'$return', get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})}) end end end end end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
isOfFourDirections(This, OldGeographicMapCellPosition, NewGeographicMapCellPosition) ->
        try
        lists:foreach(fun(Index) ->
            case (NewGeographicMapCellPosition =:= (get({This, '$class'})):getCellPositionNoThrow(This, Index, OldGeographicMapCellPosition)) of
                true ->
                throw({'$return', true});
                false -> ok
            end
        end, lists:seq(0, 4 - 1)),
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getCellPositionAtXY(This, X, Y) when is_integer(X), is_integer(Y) ->
        AllBinaryTiledLayer = (get({This, '$class'})):getAllBinaryTiledLayer(This),
        I_column = (get({get({This, mathUtil}), '$class'})):abs(get({This, mathUtil}), (X / (get({AllBinaryTiledLayer, '$class'})):getCellHeight(AllBinaryTiledLayer))),
        I_row = (get({get({This, mathUtil}), '$class'})):abs(get({This, mathUtil}), (Y / (get({AllBinaryTiledLayer, '$class'})):getCellWidth(AllBinaryTiledLayer))),
        (get({get({This, geographicMapCellPositionFactory}), '$class'})):getAt(get({This, geographicMapCellPositionFactory}), I_column, I_row).

getCellPositionAtXYNoThrow(This, X, Y) when is_integer(X), is_integer(Y) ->
        try
        AllBinaryTiledLayer = (get({This, '$class'})):getAllBinaryTiledLayer(This),
        I_column = (get({get({This, mathUtil}), '$class'})):abs(get({This, mathUtil}), (X / (get({AllBinaryTiledLayer, '$class'})):getCellHeight(AllBinaryTiledLayer))),
        I_row = (get({get({This, mathUtil}), '$class'})):abs(get({This, mathUtil}), (Y / (get({AllBinaryTiledLayer, '$class'})):getCellWidth(AllBinaryTiledLayer))),
        case (((get({AllBinaryTiledLayer, '$class'})):getColumns(AllBinaryTiledLayer) > I_column) andalso ((get({AllBinaryTiledLayer, '$class'})):getRows(AllBinaryTiledLayer) > I_row)) of
            true ->
            try
                throw({'$return', (get({get({This, geographicMapCellPositionFactory}), '$class'})):getAt(get({This, geographicMapCellPositionFactory}), I_column, I_row)})
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                throw({'$return', get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})})
            end;
            false ->
            throw({'$return', get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
isOnMap(This, GeographicMapCellPosition) ->
        try
        AllBinaryTiledLayer = (get({This, '$class'})):getAllBinaryTiledLayer(This),
        I_column = (get({GeographicMapCellPosition, '$class'})):getColumn(GeographicMapCellPosition),
        I_row = (get({GeographicMapCellPosition, '$class'})):getRow(GeographicMapCellPosition),
        case (((get({AllBinaryTiledLayer, '$class'})):getColumns(AllBinaryTiledLayer) > I_column) andalso ((get({AllBinaryTiledLayer, '$class'})):getRows(AllBinaryTiledLayer) > I_row)) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getCellPositionAtNoThrow(This, X, Y, X2, Y2, GeographicMapCellPositionList) when is_integer(X), is_integer(Y), is_integer(X2), is_integer(Y2) ->
        (get({GeographicMapCellPositionList, '$class'})):clear(GeographicMapCellPositionList),
        AllBinaryTiledLayer = (get({This, '$class'})):getAllBinaryTiledLayer(This),
        I_columnMin = (get({get({This, mathUtil}), '$class'})):abs(get({This, mathUtil}), (X / (get({AllBinaryTiledLayer, '$class'})):getCellHeight(AllBinaryTiledLayer))),
        I_rowMin = (get({get({This, mathUtil}), '$class'})):abs(get({This, mathUtil}), (Y / (get({AllBinaryTiledLayer, '$class'})):getCellWidth(AllBinaryTiledLayer))),
        I_columnMax = ((get({get({This, mathUtil}), '$class'})):abs(get({This, mathUtil}), (X2 / (get({AllBinaryTiledLayer, '$class'})):getCellHeight(AllBinaryTiledLayer))) + 1),
        I_rowMax = ((get({get({This, mathUtil}), '$class'})):abs(get({This, mathUtil}), (Y2 / (get({AllBinaryTiledLayer, '$class'})):getCellWidth(AllBinaryTiledLayer))) + 1),
        lists:foreach(fun(ColumnIndex) ->
            lists:foreach(fun(RowIndex) ->
                case (((get({AllBinaryTiledLayer, '$class'})):getColumns(AllBinaryTiledLayer) > ColumnIndex) andalso ((get({AllBinaryTiledLayer, '$class'})):getRows(AllBinaryTiledLayer) > RowIndex)) of
                    true ->
                    (get({GeographicMapCellPositionList, '$class'})):add(GeographicMapCellPositionList, (get({get({This, geographicMapCellPositionFactory}), '$class'})):getAt(get({This, geographicMapCellPositionFactory}), ColumnIndex, RowIndex));
                    false -> ok
                end
            end, lists:seq(I_rowMin, I_rowMax - 1))
        end, lists:seq(I_columnMin, I_columnMax - 1)),
        GeographicMapCellPositionList.

% throws Exception
getCellPositionsAt(This, Layer, CurrentCellPositionArray, CellPositionArray) when (is_tuple(CurrentCellPositionArray) orelse CurrentCellPositionArray =:= undefined), (is_tuple(CellPositionArray) orelse CellPositionArray =:= undefined) ->
        put({local, hasChanged}, false),
        Size = array:size(CellPositionArray),
        Size2 = array:size(array:get(0, CellPositionArray)),
        XPortion = ((get({Layer, '$class'})):getXP(Layer) / ((Size - 1))),
        YPortion = ((get({Layer, '$class'})):getYP(Layer) / ((Size - 1))),
        lists:foreach(fun(Index) ->
            lists:foreach(fun(Index2) ->
                X = (XPortion * Index),
                Y = (YPortion * Index),
                array:set(Index, array:set(Index2, (get({This, '$class'})):getCellPositionAtXY(This, X, Y), array:get(Index, CellPositionArray)), CellPositionArray),
                case (array:get(Index2, array:get(Index, CurrentCellPositionArray)) =/= array:get(Index2, array:get(Index, CellPositionArray))) of
                    true ->
                    put({local, hasChanged}, true);
                    false -> ok
                end
            end, lists:seq(0, Size2 - 1))
        end, lists:seq(0, Size - 1)),
        get({local, hasChanged}).

% throws Exception
getCellTypeAtXY(This, X, Y) when is_integer(X), is_integer(Y) ->
        CellPosition = (get({This, '$class'})):getCellPositionAtXY(This, X, Y),
        (get({This, '$class'})):getCellTypeAt(This, CellPosition).

getGeographicMapCellPositionFactory(This) ->
        get({This, geographicMapCellPositionFactory}).

getGeographicMapCellPositionFactoryInterface(This) ->
        get({This, geographicMapCellPositionFactoryInterface}).

getGeographicMapCellTypeFactory(This) ->
        get({This, geographicMapCellTypeFactory}).

