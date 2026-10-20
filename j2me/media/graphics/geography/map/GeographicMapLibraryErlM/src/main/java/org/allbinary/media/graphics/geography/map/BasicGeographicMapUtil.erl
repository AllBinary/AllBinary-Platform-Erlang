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
% import org.allbinary.layer.Layer
% import org.allbinary.logic.communication.log.LogUtil

-module('BasicGeographicMapUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'BasicGeographicMapUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'BasicGeographicMapUtil', instance}).

% throws Exception
getBorderingRow(This, Direction, OldGeographicMapCellPosition) when is_integer(Direction) ->
        try
        LOCATION_CHANGE = 1,
        begin
            Switch_N65849 = Direction,
            case lists:member(Switch_N65849, [0]) of true ->
                throw({'$return', (get({OldGeographicMapCellPosition, '$class'})):getRow(OldGeographicMapCellPosition)}); false ->
            case lists:member(Switch_N65849, [1]) of true ->
                throw({'$return', (get({OldGeographicMapCellPosition, '$class'})):getRow(OldGeographicMapCellPosition)}); false ->
            case lists:member(Switch_N65849, [2]) of true ->
                throw({'$return', ((get({OldGeographicMapCellPosition, '$class'})):getRow(OldGeographicMapCellPosition) + LOCATION_CHANGE)}); false ->
            case lists:member(Switch_N65849, [3]) of true ->
                throw({'$return', ((get({OldGeographicMapCellPosition, '$class'})):getRow(OldGeographicMapCellPosition) - LOCATION_CHANGE)}); false ->
            begin
                erlang:error({'Exception', "Only Four Directions"}) end end end end end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getBorderingColumn(This, Direction, OldGeographicMapCellPosition) when is_integer(Direction) ->
        try
        LOCATION_CHANGE = 1,
        begin
            Switch_N66184 = Direction,
            case lists:member(Switch_N66184, [0]) of true ->
                throw({'$return', ((get({OldGeographicMapCellPosition, '$class'})):getColumn(OldGeographicMapCellPosition) - LOCATION_CHANGE)}); false ->
            case lists:member(Switch_N66184, [1]) of true ->
                throw({'$return', ((get({OldGeographicMapCellPosition, '$class'})):getColumn(OldGeographicMapCellPosition) + LOCATION_CHANGE)}); false ->
            case lists:member(Switch_N66184, [2]) of true ->
                throw({'$return', (get({OldGeographicMapCellPosition, '$class'})):getColumn(OldGeographicMapCellPosition)}); false ->
            case lists:member(Switch_N66184, [3]) of true ->
                throw({'$return', (get({OldGeographicMapCellPosition, '$class'})):getColumn(OldGeographicMapCellPosition)}); false ->
            begin
                erlang:error({'Exception', "Only Four Directions"}) end end end end end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
isSameCellPosition(This, FromGeographicMapCellPosition, ToGeographicMapCellPosition) ->
        try
        FromColumn = (get({FromGeographicMapCellPosition, '$class'})):getColumn(FromGeographicMapCellPosition),
        FromRow = (get({FromGeographicMapCellPosition, '$class'})):getRow(FromGeographicMapCellPosition),
        GoColumn = (get({ToGeographicMapCellPosition, '$class'})):getColumn(ToGeographicMapCellPosition),
        GoRow = (get({ToGeographicMapCellPosition, '$class'})):getRow(ToGeographicMapCellPosition),
        case ((FromColumn =:= GoColumn) andalso (FromRow =:= GoRow)) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

createAllBinaryTiledLayerArray(This, GeographicMapInterfaceArray) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined) ->
        TiledLayerArray = array:new(array:size(GeographicMapInterfaceArray), {default, undefined}),
        (get({This, '$class'})):getAllBinaryTiledLayerArray(This, GeographicMapInterfaceArray, TiledLayerArray, 0).

getAllBinaryTiledLayerArray(This, GeographicMapInterfaceArray, TiledLayerArray, StartIndex) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(TiledLayerArray) orelse TiledLayerArray =:= undefined), is_integer(StartIndex) ->
        put({local, geographicMapInterface}, undefined),
        Size = array:size(GeographicMapInterfaceArray),
        put({local, count}, 0),
        put({local, index}, (Size + StartIndex)),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= StartIndex) of true ->
            put({local, geographicMapInterface}, array:get(get({local, index}), GeographicMapInterfaceArray)),
            array:set(allbinary_java:first(get({local, count}), put({local, count}, get({local, count}) + 1)), (get({get({local, geographicMapInterface}), '$class'})):getAllBinaryTiledLayer(get({local, geographicMapInterface})), TiledLayerArray),
            Loop();
        false -> ok end end)(),
        TiledLayerArray.

move(This, GeographicMapInterfaceArray, Dx, Dy) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), is_integer(Dx), is_integer(Dy) ->
        put({local, geographicMapInterface}, undefined),
        Size = array:size(GeographicMapInterfaceArray),
        put({local, index}, Size),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, geographicMapInterface}, array:get(get({local, index}), GeographicMapInterfaceArray)),
            (fun(Target_N67533) -> (get({Target_N67533, '$class'})):moveDXY(Target_N67533, Dx, Dy) end)((get({get({local, geographicMapInterface}), '$class'})):getAllBinaryTiledLayer(get({local, geographicMapInterface}))),
            Loop();
        false -> ok end end)().

setPosition(This, GeographicMapInterfaceArray, X, Y) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), is_integer(X), is_integer(Y) ->
        put({local, geographicMapInterface}, undefined),
        Size = array:size(GeographicMapInterfaceArray),
        put({local, index}, Size),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, geographicMapInterface}, array:get(get({local, index}), GeographicMapInterfaceArray)),
            (fun(Target_N67854) -> (get({Target_N67854, '$class'})):setPosition(Target_N67854, X, Y, (fun(Target_N67895) -> (get({Target_N67895, '$class'})):getZP(Target_N67895) end)((get({get({local, geographicMapInterface}), '$class'})):getAllBinaryTiledLayer(get({local, geographicMapInterface})))) end)((get({get({local, geographicMapInterface}), '$class'})):getAllBinaryTiledLayer(get({local, geographicMapInterface}))),
            Loop();
        false -> ok end end)().

