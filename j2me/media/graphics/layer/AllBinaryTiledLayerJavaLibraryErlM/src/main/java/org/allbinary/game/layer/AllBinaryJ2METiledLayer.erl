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
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.game.TiledLayer
% import org.allbinary.string.CommonSeps
% import org.allbinary.logic.string.StringMaker

-module('AllBinaryJ2METiledLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryTiledLayer', Function, Arguments).

init_fields(This) ->
    put({This, tiledLayerP}, undefined),
    put({This, debugColor}, 0),
    put({This, font2}, 'Font':getFont(get({'Font', 'FACE_SYSTEM'}), get({'Font', 'STYLE_PLAIN'}), 4)),
    ok.


new(DataId, TiledLayer, MapTwoDArray, DebugColor) when (is_tuple(MapTwoDArray) orelse MapTwoDArray =:= undefined), is_integer(DebugColor) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, DataId, TiledLayer, MapTwoDArray, DebugColor),
    This.

init(This, DataId, TiledLayer, MapTwoDArray, DebugColor) when (is_tuple(MapTwoDArray) orelse MapTwoDArray =:= undefined), is_integer(DebugColor) ->
        'AllBinaryTiledLayer':init(This, DataId, (get({TiledLayer, '$class'})):getWidth(TiledLayer), (get({TiledLayer, '$class'})):getHeight(TiledLayer), (get({TiledLayer, '$class'})):getCellWidth(TiledLayer), (get({TiledLayer, '$class'})):getCellHeight(TiledLayer)),
        init_fields(This),
        put({This, tiledLayerP}, TiledLayer),
        put({This, debugColor}, DebugColor),
        (get({This, '$class'})):setCells(This, MapTwoDArray).

paint(This, Graphics) ->
        (get({get({This, tiledLayerP}), '$class'})):paint(get({This, tiledLayerP}), Graphics).

paintDebug(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        (get({Graphics, '$class'})):setFont(Graphics, get({This, font2})),
        (get({Graphics, '$class'})):setColor(Graphics, get({This, debugColor})),
        put({local, x}, (get({get({This, tiledLayerP}), '$class'})):getX(get({This, tiledLayerP}))),
        put({local, y}, (get({get({This, tiledLayerP}), '$class'})):getY(get({This, tiledLayerP}))),
        FirstColumn = 0,
        FirstRow = 0,
        TotalColumns = (get({get({This, tiledLayerP}), '$class'})):getColumns(get({This, tiledLayerP})),
        TotalRows = (get({get({This, tiledLayerP}), '$class'})):getRows(get({This, tiledLayerP})),
        X0 = get({local, x}),
        put({local, tile}, 0),
        TileHeight = (get({get({This, tiledLayerP}), '$class'})):getCellHeight(get({This, tiledLayerP})),
        TileWidth = (get({get({This, tiledLayerP}), '$class'})):getCellWidth(get({This, tiledLayerP})),
        CommonSeps = 'CommonSeps':getInstance(),
        StringMaker = 'StringMaker':new(),
        put({local, rowIndex}, FirstRow),
        (fun Loop() -> case (get({local, rowIndex}) < TotalRows) of true ->
            put({local, x}, X0),
            put({local, columnIndex}, FirstColumn),
            (fun Loop() -> case (get({local, columnIndex}) < TotalColumns) of true ->
                try
                put({local, tile}, (get({get({This, tiledLayerP}), '$class'})):getCell(get({This, tiledLayerP}), get({local, columnIndex}), get({local, rowIndex}))),
                case (get({local, tile}) < 0) of
                    true ->
                    put({local, tile}, (get({get({This, tiledLayerP}), '$class'})):getAnimatedTile(get({This, tiledLayerP}), get({local, tile})));
                    false -> ok
                end,
                case (get({local, tile}) =:= 0) of
                    true ->
                    throw('$continue');
                    false -> ok
                end,
                put({local, tile}, get({local, tile}) - 1),
                (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                (get({Graphics, '$class'})):drawString(Graphics, (fun(Target_N67180) -> (get({Target_N67180, '$class'})):toString(Target_N67180) end)((fun(Target_N67187) -> (get({Target_N67187, '$class'})):appendint(Target_N67187, get({local, tile})) end)((fun(Target_N67194) -> (get({Target_N67194, '$class'})):append(Target_N67194, get({CommonSeps, 'COLON'})) end)((fun(Target_N67201) -> (get({Target_N67201, '$class'})):appendint(Target_N67201, get({local, rowIndex})) end)((fun(Target_N67208) -> (get({Target_N67208, '$class'})):append(Target_N67208, get({CommonSeps, 'COMMA'})) end)((get({StringMaker, '$class'})):appendint(StringMaker, get({local, columnIndex}))))))), (get({local, x}) + 5), (get({local, y}) + 10), 0)
                catch throw:'$continue' -> ok end,
                put({local, columnIndex}, get({local, columnIndex}) + 1),
                put({local, x}, (get({local, x}) + TileWidth)),
                Loop();
            false -> ok end end)(),
            put({local, rowIndex}, get({local, rowIndex}) + 1),
            put({local, y}, (get({local, y}) + TileHeight)),
            Loop();
        false -> ok end end)(),
        (get({Graphics, '$class'})):setFont(Graphics, Font).

moveDXY(This, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        (get({get({This, tiledLayerP}), '$class'})):move(get({This, tiledLayerP}), Dx, Dy),
        'AllBinaryTiledLayer':moveDXY(This, (-Dx), (-Dy)).

setPosition(This, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        (get({get({This, tiledLayerP}), '$class'})):setPosition(get({This, tiledLayerP}), X, Y),
        'AllBinaryTiledLayer':setPosition(This, (-X), (-Y), Z).

getTiledLayer(This) ->
        get({This, tiledLayerP}).

getCellWidth(This) ->
        (get({get({This, tiledLayerP}), '$class'})):getCellWidth(get({This, tiledLayerP})).

getCellHeight(This) ->
        (get({get({This, tiledLayerP}), '$class'})):getCellHeight(get({This, tiledLayerP})).

getCell(This, Col, Row) when is_integer(Col), is_integer(Row) ->
        (get({get({This, tiledLayerP}), '$class'})):getCell(get({This, tiledLayerP}), Col, Row).

getColumns(This) ->
        (get({get({This, tiledLayerP}), '$class'})):getColumns(get({This, tiledLayerP})).

getRows(This) ->
        (get({get({This, tiledLayerP}), '$class'})):getRows(get({This, tiledLayerP})).

setCell(This, Col, Row, Index) when is_integer(Col), is_integer(Row), is_integer(Index) ->
        (get({get({This, tiledLayerP}), '$class'})):setCell(get({This, tiledLayerP}), Col, Row, Index).

getAnimatedTile(This, AnimationTileIndex) when is_integer(AnimationTileIndex) ->
        (get({get({This, tiledLayerP}), '$class'})):getAnimatedTile(get({This, tiledLayerP}), AnimationTileIndex).

