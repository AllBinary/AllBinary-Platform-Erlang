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
% import org.allbinary.graphics.CellPosition
% import org.allbinary.graphics.CellPositionFactory
% import org.allbinary.layer.AllBinaryLayer

-module('DropCellPositionHistory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'DropCellPositionHistory':new()),
    ok.

init_fields(This) ->
    put({This, cellPositionFactory}, 'CellPositionFactory':getInstance()),
    put({This, positionList}, 'BasicArrayListD':new()),
    put({This, layerList}, 'BasicArrayListD':new()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'DropCellPositionHistory', 'SINGLETON'}).

add(This, CellPosition, LayerInterface) ->
        (get({get({This, positionList}), '$class'})):add(get({This, positionList}), CellPosition),
        (get({get({This, layerList}), '$class'})):add(get({This, layerList}), LayerInterface).

addAll(This, List, LayerInterface) ->
        lists:foreach(fun(Index) ->
            (get({This, '$class'})):add(This, (get({List, '$class'})):get(List, Index), LayerInterface)
        end, lists:seq(((get({List, '$class'})):size(List) - 1), 0, -1)).

remove(This, CellPosition) ->
        Index = (get({get({This, positionList}), '$class'})):indexOf(get({This, positionList}), CellPosition),
        case (Index >= 0) of
            true ->
            (get({get({This, positionList}), '$class'})):removeAt(get({This, positionList}), Index),
            (get({get({This, layerList}), '$class'})):removeAt(get({This, layerList}), Index);
            false -> ok
        end.

removeAll(This, LayerInterface) ->
        put({local, index}, 0),
        (fun Loop() -> case (get({local, index}) =/= (-1)) of true ->
            put({local, index}, (get({get({This, layerList}), '$class'})):indexOf(get({This, layerList}), LayerInterface)),
            case (get({local, index}) >= 0) of
                true ->
                (get({get({This, positionList}), '$class'})):removeAt(get({This, positionList}), get({local, index})),
                (get({get({This, layerList}), '$class'})):removeAt(get({This, layerList}), get({local, index}));
                false -> ok
            end,
            Loop();
        false -> ok end end)().

clear(This) ->
        (get({get({This, positionList}), '$class'})):clear(get({This, positionList})),
        (get({get({This, layerList}), '$class'})):clear(get({This, layerList})).

isCellPositionWithDrop(This, CellPosition) ->
        (get({get({This, positionList}), '$class'})):contains(get({This, positionList}), CellPosition).

anyCellPositionWithDrop(This, List) ->
        try
        lists:foreach(fun(Index) ->
            case (get({This, '$class'})):isCellPositionWithDrop(This, (get({List, '$class'})):get(List, Index)) of
                true ->
                throw({'$return', true});
                false -> ok
            end
        end, lists:seq(((get({List, '$class'})):size(List) - 1), 0, -1)),
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getCellPositionWithDrop(This, List) ->
        try
        put({local, cellPosition}, undefined),
        lists:foreach(fun(Index) ->
            put({local, cellPosition}, (get({List, '$class'})):get(List, Index)),
            case (get({This, '$class'})):isCellPositionWithDrop(This, get({local, cellPosition})) of
                true ->
                throw({'$return', get({local, cellPosition})});
                false -> ok
            end
        end, lists:seq(((get({List, '$class'})):size(List) - 1), 0, -1)),
        get({get({This, cellPositionFactory}), 'NONE'})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getLayerInterface(This, CellPosition) ->
        try
        Index = (get({get({This, positionList}), '$class'})):indexOf(get({This, positionList}), CellPosition),
        case (Index >= 0) of
            true ->
            throw({'$return', (get({get({This, layerList}), '$class'})):get(get({This, layerList}), Index)});
            false ->
            throw({'$return', get({'AllBinaryLayer', 'NULL_ALLBINARY_LAYER'})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

