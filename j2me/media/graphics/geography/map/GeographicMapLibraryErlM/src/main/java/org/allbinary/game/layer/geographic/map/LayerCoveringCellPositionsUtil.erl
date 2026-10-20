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
% import org.allbinary.media.graphics.geography.map.CellPositionsUtil
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition

-module('LayerCoveringCellPositionsUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LayerCoveringCellPositionsUtil':new()),
    ok.

init_fields(This) ->
    put({This, cellPositionsUtil}, 'CellPositionsUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'LayerCoveringCellPositionsUtil', instance}).

% throws Exception
getAllXY(This, GeographicMapInterface, LayerInterface, X, Y, ReusableList) when is_integer(X), is_integer(Y) ->
        TopLeftGeographicMapCellPosition = (get({GeographicMapInterface, '$class'})):getCellPositionAtXY(GeographicMapInterface, X, Y),
        (get({This, '$class'})):getAll(This, GeographicMapInterface, TopLeftGeographicMapCellPosition, LayerInterface, ReusableList).

% throws Exception
getAll(This, GeographicMapInterface, TopLeftGeographicMapCellPosition, LayerInterface, ReusableList) ->
        (get({ReusableList, '$class'})):clear(ReusableList),
        put({local, columns}, ((get({LayerInterface, '$class'})):getWidth(LayerInterface) / (fun(Target_N66267) -> (get({Target_N66267, '$class'})):getCellWidth(Target_N66267) end)((get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface)))),
        put({local, rows}, ((get({LayerInterface, '$class'})):getHeight(LayerInterface) / (fun(Target_N66335) -> (get({Target_N66335, '$class'})):getCellHeight(Target_N66335) end)((get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface)))),
        case (get({local, columns}) =:= 0) of
            true ->
            put({local, columns}, 1);
            false -> ok
        end,
        case (get({local, rows}) =:= 0) of
            true ->
            put({local, rows}, 1);
            false -> ok
        end,
        (get({get({This, cellPositionsUtil}), '$class'})):getAll(get({This, cellPositionsUtil}), GeographicMapInterface, TopLeftGeographicMapCellPosition, get({local, columns}), get({local, rows}), ReusableList).

