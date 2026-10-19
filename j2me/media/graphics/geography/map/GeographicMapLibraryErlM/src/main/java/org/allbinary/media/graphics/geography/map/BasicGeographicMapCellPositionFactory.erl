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
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('BasicGeographicMapCellPositionFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, geographicMapCellPositionArray}, undefined),
    put({This, geographicMapInterface}, undefined),
    put({This, geographicMapCellPositionFactoryInterface}, undefined),
    put({This, columns}, 0),
    put({This, rows}, 0),
    put({This, tiledLayer}, undefined),
    ok.


new(GeographicMapInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GeographicMapInterface),
    This.

init(This, GeographicMapInterface) ->
    init_fields(This),
        put({This, geographicMapInterface}, GeographicMapInterface),
        put({This, geographicMapCellPositionFactoryInterface}, (get({get({This, geographicMapInterface}), '$class'})):getGeographicMapCellPositionFactoryInterface(get({This, geographicMapInterface}))),
        put({This, tiledLayer}, (get({get({This, geographicMapInterface}), '$class'})):getAllBinaryTiledLayer(get({This, geographicMapInterface}))),
        put({This, columns}, (get({get({This, tiledLayer}), '$class'})):getColumns(get({This, tiledLayer}))),
        put({This, rows}, (get({get({This, tiledLayer}), '$class'})):getRows(get({This, tiledLayer}))),
        put({This, geographicMapCellPositionArray}, array:new(get({This, rows}), {default, array:new(get({This, columns}), {default, undefined})})),
        (get({This, '$class'})):init(This).

% throws Exception
init(This) ->
        TiledLayer = get({This, tiledLayer}),
        Columns = (get({This, '$class'})):getColumns(This),
        Rows = (get({This, '$class'})):getRows(This),
        Width = (get({TiledLayer, '$class'})):getCellWidth(TiledLayer),
        Height = (get({TiledLayer, '$class'})):getCellHeight(TiledLayer),
        lists:foreach(fun(Column) ->
            lists:foreach(fun(Row) ->
                (get({This, '$class'})):createInstance(This, Column, Row, Width, Height)
            end, lists:seq(0, Rows - 1))
        end, lists:seq(0, Columns - 1)).

% throws Exception
visit(This, GeographicMapCelPositionFactoryInitVisitorInterface) ->
        TiledLayer = get({This, tiledLayer}),
        Columns = (get({This, '$class'})):getColumns(This),
        Rows = (get({This, '$class'})):getRows(This),
        try
            put({local, cellPosition}, undefined),
            lists:foreach(fun(Column) ->
                lists:foreach(fun(Row) ->
                    put({local, cellPosition}, (get({This, '$class'})):getAt(This, Column, Row)),
                    (get({GeographicMapCelPositionFactoryInitVisitorInterface, '$class'})):visit(GeographicMapCelPositionFactoryInitVisitorInterface, TiledLayer, get({local, cellPosition}))
                end, lists:seq(0, Rows - 1))
            end, lists:seq(0, Columns - 1))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonSeps = 'CommonSeps':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (fun(Target_N67259) -> (get({Target_N67259, '$class'})):toString(Target_N67259) end)((fun(Target_N67266) -> (get({Target_N67266, '$class'})):append(Target_N67266, get({CommonSeps, 'BRACKET_CLOSE'})) end)((fun(Target_N67273) -> (get({Target_N67273, '$class'})):appendint(Target_N67273, Columns) end)((fun(Target_N67280) -> (get({Target_N67280, '$class'})):append(Target_N67280, get({CommonSeps, 'BRACKET_OPEN'})) end)((fun(Target_N67287) -> (get({Target_N67287, '$class'})):append(Target_N67287, get({CommonSeps, 'BRACKET_CLOSE'})) end)((fun(Target_N67294) -> (get({Target_N67294, '$class'})):appendint(Target_N67294, Rows) end)((fun(Target_N67301) -> (get({Target_N67301, '$class'})):append(Target_N67301, get({CommonSeps, 'BRACKET_OPEN'})) end)('StringMaker':new()))))))), This, "visit", E),
            erlang:error(E)
        end.

% throws Exception
getAt(This, I_column, I_row) when is_integer(I_column), is_integer(I_row) ->
        array:get(I_column, array:get(I_row, get({This, geographicMapCellPositionArray}))).

% throws Exception
getInstance(This, AnotherMapGeographicMapCellPosition) ->
        (get({This, '$class'})):getAt(This, (get({AnotherMapGeographicMapCellPosition, '$class'})):getColumn(AnotherMapGeographicMapCellPosition), (get({AnotherMapGeographicMapCellPosition, '$class'})):getRow(AnotherMapGeographicMapCellPosition)).

% throws Exception
createInstance(This, I_column, I_row, Width, Height) when is_integer(I_column), is_integer(I_row), is_integer(Width), is_integer(Height) ->
        put({local, cellPositionCanBeNull}, array:get(I_column, array:get(I_row, get({This, geographicMapCellPositionArray})))),
        case (get({local, cellPositionCanBeNull}) =:= undefined) of
            true ->
            put({local, cellPositionCanBeNull}, (get({get({This, geographicMapCellPositionFactoryInterface}), '$class'})):getInstance(get({This, geographicMapCellPositionFactoryInterface}), get({This, geographicMapInterface}), I_column, I_row, get({This, columns}), get({This, rows}), Width, Height)),
            put({This, geographicMapCellPositionArray}, array:set(I_row, array:set(I_column, get({local, cellPositionCanBeNull}), array:get(I_row, get({This, geographicMapCellPositionArray}))), get({This, geographicMapCellPositionArray})));
            false -> ok
        end,
        get({local, cellPositionCanBeNull}).

getColumns(This) ->
        get({This, columns}).

getRows(This) ->
        get({This, rows}).

