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
% package org.allbinary.media.graphics.geography.map.drop
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.game.rand.MyRandomFactory
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.NullUtil
% import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap

-module('AnyRandomDropCellPositionGenerator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseDropCellPositionGenerator', Function, Arguments).

init_fields(This) ->
    put({This, list}, 'BasicArrayListD':new()),
    put({This, geographicMapInterface}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'BaseDropCellPositionGenerator':'$init'(This),
    init_fields(This).


% throws Exception
update(This, AllBinaryGameLayerManager, GeographicMapInterface) ->
        put({This, geographicMapInterface}, GeographicMapInterface),
        BasicGeographicMapCellPositionFactory = (get({GeographicMapInterface, '$class'})):getGeographicMapCellPositionFactory(GeographicMapInterface),
        RandomFactory = 'MyRandomFactory':getInstance(),
        TiledLayer = (get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface),
        Total = ((get({TiledLayer, '$class'})):getColumns(TiledLayer) * (get({TiledLayer, '$class'})):getRows(TiledLayer)),
        put({local, randomColumn}, 0),
        put({local, randomRow}, 0),
        put({local, geographicMapCellPosition}, undefined),
        put({local, index}, Total),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, randomColumn}, (get({RandomFactory, '$class'})):getAbsoluteNextInt(RandomFactory, (get({TiledLayer, '$class'})):getColumns(TiledLayer))),
            put({local, randomRow}, (get({RandomFactory, '$class'})):getAbsoluteNextInt(RandomFactory, (get({TiledLayer, '$class'})):getRows(TiledLayer))),
            put({local, geographicMapCellPosition}, (get({BasicGeographicMapCellPositionFactory, '$class'})):getAt(BasicGeographicMapCellPositionFactory, get({local, randomColumn}), get({local, randomRow}))),
            case (get({This, '$class'})):isDropAllowedAt(This, get({local, geographicMapCellPosition})) of
                true ->
                (get({get({This, list}), '$class'})):add(get({This, list}), get({local, geographicMapCellPosition}));
                false -> ok
            end,
            Loop();
        false -> ok end end)().

% throws Exception
processTick(This, AllBinaryLayerManager) ->
        ok.

