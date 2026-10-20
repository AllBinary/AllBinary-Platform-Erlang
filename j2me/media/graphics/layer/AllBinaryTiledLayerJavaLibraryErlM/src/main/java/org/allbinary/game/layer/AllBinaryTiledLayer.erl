% 
% AllBinary Open License Version 1 
% Copyright (c) 2006 AllBinary 
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
% package org.allbinary.game.layer
% import javax.microedition.lcdui.Graphics
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.graphics.paint.PaintableInterface
% import org.allbinary.layer.Layer
% import org.allbinary.layer.NamedInterface
% import org.allbinary.string.CommonStrings

-module('AllBinaryTiledLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements NamedInterface
% implements PaintableInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Layer', Function, Arguments).

init_fields(This) ->
    put({This, cellWidth}, 0),
    put({This, cellHeight}, 0),
    put({This, halfWidth}, 0),
    put({This, halfHeight}, 0),
    put({This, halfCellWidth}, 0),
    put({This, halfCellHeight}, 0),
    put({This, dataId}, undefined),
    ok.


new(DataId, Width, Height, CellWidth, CellHeight) when is_integer(Width), is_integer(Height), is_integer(CellWidth), is_integer(CellHeight) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, DataId, Width, Height, CellWidth, CellHeight),
    This.

'$init'(This, DataId, Width, Height, CellWidth, CellHeight) when is_integer(Width), is_integer(Height), is_integer(CellWidth), is_integer(CellHeight) ->
        'Layer':'$init'(This, 0, 0),
        init_fields(This),
        put({This, dataId}, DataId),
        (get({This, '$class'})):setLayerWidth(This, Width),
        (get({This, '$class'})):setLayerHeight(This, Height),
        'Layer':setPosition(This, 0, 0, 0),
        put({This, cellWidth}, CellWidth),
        put({This, cellHeight}, CellHeight),
        put({This, halfWidth}, (((get({This, '$class'})):getWidth(This) bsr 1))),
        put({This, halfHeight}, (((get({This, '$class'})):getHeight(This) bsr 1))),
        put({This, halfCellWidth}, ((CellWidth bsr 1))),
        put({This, halfCellHeight}, ((CellHeight bsr 1))).

setCells(This, MapTwoDArray) when (is_tuple(MapTwoDArray) orelse MapTwoDArray =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Start: r: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, array:size(MapTwoDArray)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " c: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, array:size(array:get(0, MapTwoDArray))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " rows: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getRows(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " columns: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getColumns(This)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "setCells"),
        Rows = (get({This, '$class'})):getRows(This),
        Columns = (get({This, '$class'})):getColumns(This),
        lists:foreach(fun(Col) ->
            lists:foreach(fun(Row) ->
                (get({This, '$class'})):setCell(This, Col, Row, array:get(Col, array:get(Row, MapTwoDArray)))
            end, lists:seq(0, Rows - 1))
        end, lists:seq(0, Columns - 1)).

updateCells(This, MapTwoDArray, FromTileId, ToTileId) when (is_tuple(MapTwoDArray) orelse MapTwoDArray =:= undefined), is_integer(FromTileId), is_integer(ToTileId) ->
        Rows = (get({This, '$class'})):getRows(This),
        Columns = (get({This, '$class'})):getColumns(This),
        lists:foreach(fun(Col) ->
            lists:foreach(fun(Row) ->
                case (FromTileId =:= array:get(Col, array:get(Row, MapTwoDArray))) of
                    true ->
                    array:set(Row, array:set(Col, ToTileId, array:get(Row, MapTwoDArray)), MapTwoDArray),
                    (get({This, '$class'})):setCell(This, Col, Row, array:get(Col, array:get(Row, MapTwoDArray)));
                    false -> ok
                end
            end, lists:seq(0, Rows - 1))
        end, lists:seq(0, Columns - 1)).

getName(This) ->
        atom_to_list(get({This, '$class'})).

paint(This, Graphics) ->
        ok.

paintThreed(This, Graphics) ->
        ok.

getX2(This) ->
        (get({This, x}) + (get({This, '$class'})):getWidth(This)).

getY2(This) ->
        (get({This, y}) + (get({This, '$class'})):getHeight(This)).

getZ2(This) ->
        trunc(((get({This, z}) + (get({This, '$class'})):getDepth(This)))).

getCellWidth(This) ->
        get({This, cellWidth}).

getCellHeight(This) ->
        get({This, cellHeight}).

getCell(This, Col, Row) when is_integer(Col), is_integer(Row) ->
        (-1).

getColumns(This) ->
        (-1).

getRows(This) ->
        (-1).

setCell(This, Col, Row, TileIndex) when is_integer(Col), is_integer(Row), is_integer(TileIndex) ->
        ok.

getHalfWidth(This) ->
        get({This, halfWidth}).

getHalfHeight(This) ->
        get({This, halfHeight}).

getDataId(This) ->
        get({This, dataId}).

getHalfCellWidth(This) ->
        get({This, halfCellWidth}).

getHalfCellHeight(This) ->
        get({This, halfCellHeight}).

isOnTileLayer(This, Column, Row) when is_integer(Column), is_integer(Row) ->
        try
        case (((((get({This, '$class'})):getColumns(This) > Column) andalso ((get({This, '$class'})):getRows(This) > Row)) andalso (Row >= 0)) andalso (Column >= 0)) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getAnimatedTile(This, AnimationTileIndex) when is_integer(AnimationTileIndex) ->
        AnimationTileIndex.

