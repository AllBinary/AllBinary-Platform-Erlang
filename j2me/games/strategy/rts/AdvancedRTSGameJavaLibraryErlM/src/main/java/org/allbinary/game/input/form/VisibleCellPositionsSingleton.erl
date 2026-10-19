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
% package org.allbinary.game.input.form
% import javax.microedition.lcdui.game.SimpleTiledLayer
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.layer.RTSLayerEvent
% import org.allbinary.game.layer.building.event.BuildingEventListenerInterface
% import org.allbinary.game.layer.building.event.LocalPlayerBuildingEventHandler
% import org.allbinary.util.BasicArrayList
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.graphics.CellPosition
% import org.allbinary.layer.event.ScrollMapEvent
% import org.allbinary.layer.event.ScrollMapEventHandler
% import org.allbinary.layer.event.ScrollMapEventListenerInterface
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings

-module('VisibleCellPositionsSingleton').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements BuildingEventListenerInterface
% implements ScrollMapEventListenerInterface

static_init() ->
    put({?MODULE, instance}, 'VisibleCellPositionsSingleton':new()),
    ok.

init_fields(This) ->
    put({This, stationaryVisibleCellPositions}, get({'NullUtil':getInstance(), 'NULL_SHORT_ARRAY_ARRAY'})),
    put({This, visibleCellPositions}, get({'NullUtil':getInstance(), 'NULL_SHORT_ARRAY_ARRAY'})),
    put({This, currentlyVisibleCellPositions}, get({'NullUtil':getInstance(), 'NULL_SHORT_ARRAY_ARRAY'})),
    put({This, 'ALL_VISIBLE_TILEDLAYER'}, 'SimpleTiledLayer':new(0, 0, 0, 0)),
    put({This, simpleTiledLayer}, get({This, 'ALL_VISIBLE_TILEDLAYER'})),
    put({This, paintSimpleTiledLayer}, get({This, 'ALL_VISIBLE_TILEDLAYER'})),
    put({This, currentIndex}, 0),
    ok.


getInstance() ->
        get({'VisibleCellPositionsSingleton', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        (fun(Target_N66514) -> (get({Target_N66514, '$class'})):addListenerInterface(Target_N66514, This) end)('LocalPlayerBuildingEventHandler':getInstance()),
        (fun(Target_N66548) -> (get({Target_N66548, '$class'})):addListenerInterface(Target_N66548, This) end)('ScrollMapEventHandler':getInstance()).

init(This, SimpleTiledLayer) ->
        put({This, paintSimpleTiledLayer}, get({This, 'ALL_VISIBLE_TILEDLAYER'})),
        put({This, currentIndex}, 0),
        Rows = (get({SimpleTiledLayer, '$class'})):getRows(SimpleTiledLayer),
        Columns = (get({SimpleTiledLayer, '$class'})):getColumns(SimpleTiledLayer),
        put({This, stationaryVisibleCellPositions}, array:new(Rows, {default, array:new(Columns, {default, 0})})),
        put({This, visibleCellPositions}, array:new(Rows, {default, array:new(Columns, {default, 0})})),
        put({This, currentlyVisibleCellPositions}, array:new(Rows, {default, array:new(Columns, {default, 0})})),
        (get({This, '$class'})):setSimpleTiledLayer(This, SimpleTiledLayer).

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

% throws Exception
onBuildingEvent(This, Event) ->
        put({This, paintSimpleTiledLayer}, get({This, simpleTiledLayer})).

% throws Exception
onMoveEvent(This, ScrollMapEvent) ->
        (get({This, '$class'})):move(This, (get({ScrollMapEvent, '$class'})):getDx(ScrollMapEvent), (get({ScrollMapEvent, '$class'})):getDy(ScrollMapEvent)).

addStationaryCellPositions(This, List) ->
        lists:foreach(fun(Index) ->
            CellPosition = (get({List, '$class'})):get(List, Index),
            put({This, stationaryVisibleCellPositions}, array:set((get({CellPosition, '$class'})):getRow(CellPosition), array:set((get({CellPosition, '$class'})):getColumn(CellPosition), array:get((get({CellPosition, '$class'})):getColumn(CellPosition), array:get((get({CellPosition, '$class'})):getRow(CellPosition), get({This, stationaryVisibleCellPositions}))) + 1, array:get((get({CellPosition, '$class'})):getRow(CellPosition), get({This, stationaryVisibleCellPositions}))), get({This, stationaryVisibleCellPositions})))
        end, lists:seq(((get({List, '$class'})):size(List) - 1), 0, -1)).

removeStationaryCellPositions(This, List) ->
        lists:foreach(fun(Index) ->
            CellPosition = (get({List, '$class'})):get(List, Index),
            put({This, stationaryVisibleCellPositions}, array:set((get({CellPosition, '$class'})):getRow(CellPosition), array:set((get({CellPosition, '$class'})):getColumn(CellPosition), array:get((get({CellPosition, '$class'})):getColumn(CellPosition), array:get((get({CellPosition, '$class'})):getRow(CellPosition), get({This, stationaryVisibleCellPositions}))) - 1, array:get((get({CellPosition, '$class'})):getRow(CellPosition), get({This, stationaryVisibleCellPositions}))), get({This, stationaryVisibleCellPositions})))
        end, lists:seq(((get({List, '$class'})):size(List) - 1), 0, -1)).

update(This) ->
        case (get({This, currentIndex}) =:= 0) of
            true ->
            Temp = get({This, currentlyVisibleCellPositions}),
            put({This, currentlyVisibleCellPositions}, get({This, visibleCellPositions})),
            put({This, visibleCellPositions}, Temp),
            lists:foreach(fun(Index) ->
                lists:foreach(fun(Index2) ->
                    put({This, visibleCellPositions}, array:set(Index, array:set(Index2, array:get(Index2, array:get(Index, get({This, stationaryVisibleCellPositions}))), array:get(Index, get({This, visibleCellPositions}))), get({This, visibleCellPositions})))
                end, lists:seq((array:size(array:get(0, get({This, visibleCellPositions}))) - 1), 0, -1))
            end, lists:seq((array:size(get({This, visibleCellPositions})) - 1), 0, -1));
            false -> ok
        end,
        put({This, currentIndex}, get({This, currentIndex}) + 1),
        case (get({This, currentIndex}) > 10) of
            true ->
            put({This, currentIndex}, 0);
            false -> ok
        end.

shouldProcess(This) ->
        try
        case (get({This, currentIndex}) =:= 0) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

addCellPositions(This, List) ->
        lists:foreach(fun(Index) ->
            CellPosition = (get({List, '$class'})):get(List, Index),
            put({This, visibleCellPositions}, array:set((get({CellPosition, '$class'})):getRow(CellPosition), array:set((get({CellPosition, '$class'})):getColumn(CellPosition), array:get((get({CellPosition, '$class'})):getColumn(CellPosition), array:get((get({CellPosition, '$class'})):getRow(CellPosition), get({This, visibleCellPositions}))) + 1, array:get((get({CellPosition, '$class'})):getRow(CellPosition), get({This, visibleCellPositions}))), get({This, visibleCellPositions})))
        end, lists:seq(((get({List, '$class'})):size(List) - 1), 0, -1)).

isVisible(This, CellPosition) ->
        try
        case (array:get((get({CellPosition, '$class'})):getColumn(CellPosition), array:get((get({CellPosition, '$class'})):getRow(CellPosition), get({This, visibleCellPositions}))) > 0) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

move(This, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        (fun(Target_N68820) -> (get({Target_N68820, '$class'})):moveDXY(Target_N68820, Dx, Dy) end)((get({This, '$class'})):getSimpleTiledLayer(This)).

paint(This, Graphics) ->
        (get({get({This, paintSimpleTiledLayer}), '$class'})):paint(get({This, paintSimpleTiledLayer}), Graphics, get({This, currentlyVisibleCellPositions})).

setSimpleTiledLayer(This, SimpleTiledLayer) ->
        put({This, simpleTiledLayer}, SimpleTiledLayer).

getSimpleTiledLayer(This) ->
        get({This, simpleTiledLayer}).

