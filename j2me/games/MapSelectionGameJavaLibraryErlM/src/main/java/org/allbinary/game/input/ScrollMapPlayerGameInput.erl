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
% package org.allbinary.game.input
% import javax.microedition.lcdui.Canvas
% import javax.microedition.lcdui.Graphics
% import org.allbinary.util.BasicArrayList
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.InputFeatureFactory
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.layer.event.ScrollMapEvent
% import org.allbinary.layer.event.ScrollMapEventHandler
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.util.BasicArrayListD

-module('ScrollMapPlayerGameInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PlayerGameInput', Function, Arguments).

init_fields(This) ->
    put({This, inputProcessorArray}, array:new(get({'InputFactory':getInstance(), 'MAX'}), {default, undefined})),
    put({This, border}, 150),
    put({This, inputList}, undefined),
    put({This, isSingleKeyProcessing}, ((fun(Target_N66191) -> (get({Target_N66191, '$class'})):isFeature(Target_N66191, get({'InputFeatureFactory':getInstance(), 'SINGLE_KEY_REPEAT_PRESS'})) end)('Features':getInstance()) orelse (fun(Target_N66242) -> (get({Target_N66242, '$class'})):isFeature(Target_N66242, get({'InputFeatureFactory':getInstance(), 'SINGLE_KEY_PRESS'})) end)('Features':getInstance()))),
    put({This, geographicMapInterface}, undefined),
    put({This, maxBottom}, 0),
    put({This, maxRight}, 0),
    put({This, scrollMapEvent}, 'ScrollMapEvent':new(This)),
    ok.


new(GeographicMapInterface, List, PlayerInputId) when is_integer(PlayerInputId) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GeographicMapInterface, List, PlayerInputId),
    This.

init(This, GeographicMapInterface, List, PlayerInputId) when is_integer(PlayerInputId) ->
        'PlayerGameInput':init(This, List, 'BasicArrayListD':new(), PlayerInputId),
        init_fields(This),
        (get({This, '$class'})):initInputProcessors(This),
        put({This, geographicMapInterface}, GeographicMapInterface),
        put({This, inputList}, List),
        (get({This, '$class'})):init(This).

% throws Exception
move(This, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        TerrainTiledLayer = (get({get({This, geographicMapInterface}), '$class'})):getAllBinaryTiledLayer(get({This, geographicMapInterface})),
        (get({TerrainTiledLayer, '$class'})):moveDXY(TerrainTiledLayer, (-Dx), (-Dy)),
        (get({get({This, scrollMapEvent}), '$class'})):setDxDy(get({This, scrollMapEvent}), (-Dx), (-Dy)),
        (fun(Target_N66795) -> (get({Target_N66795, '$class'})):fireEvent(Target_N66795, get({This, scrollMapEvent})) end)('ScrollMapEventHandler':getInstance()).

init(This) ->
        put({This, maxBottom}, (get({This, '$class'})):getSpecialHeight(This)),
        put({This, maxRight}, (get({This, '$class'})):getSpecialWidth(This)).

% throws Exception
scrollMiddleX(This) ->
        TerrainTiledLayer = (get({get({This, geographicMapInterface}), '$class'})):getAllBinaryTiledLayer(get({This, geographicMapInterface})),
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        (get({This, '$class'})):move(This, (-(get({TerrainTiledLayer, '$class'})):getXP(TerrainTiledLayer)), 0),
        case ((get({TerrainTiledLayer, '$class'})):getWidth(TerrainTiledLayer) < (get({DisplayInfo, '$class'})):getLastWidth(DisplayInfo)) of
            true ->
            put({local, diffX}, (((((get({DisplayInfo, '$class'})):getLastWidth(DisplayInfo) - (get({TerrainTiledLayer, '$class'})):getWidth(TerrainTiledLayer))) bsr 1))),
            (get({This, '$class'})):move(This, (-get({local, diffX})), 0);
            false ->
            put({local, diffX}, (((((get({TerrainTiledLayer, '$class'})):getWidth(TerrainTiledLayer) - (get({DisplayInfo, '$class'})):getLastWidth(DisplayInfo))) bsr 1))),
            (get({This, '$class'})):move(This, get({local, diffX}), 0)
        end.

% throws Exception
scrollY(This, Anchor) when is_integer(Anchor) ->
        TerrainTiledLayer = (get({get({This, geographicMapInterface}), '$class'})):getAllBinaryTiledLayer(get({This, geographicMapInterface})),
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        case (Anchor =:= get({'Graphics', 'TOP'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Top", This, "scrollY");
            false ->
            case (Anchor =:= get({'Graphics', 'BOTTOM'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Bottom", This, "scrollY"),
            put({local, diffY}, (((get({TerrainTiledLayer, '$class'})):getHeight(TerrainTiledLayer) - (get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo)))),
            (get({This, '$class'})):move(This, 0, get({local, diffY}));
            false ->
            case (Anchor =:= get({'Graphics', 'VCENTER'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Center", This, "scrollY"),
            put({local, diffY}, ((((get({TerrainTiledLayer, '$class'})):getHeight(TerrainTiledLayer) - (get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo))) / 2)),
            (get({This, '$class'})):move(This, 0, get({local, diffY}));
            false ->
            erlang:error({'Exception', "No Such Anchor Supported"})
        end
        end
        end.

% throws Exception
up(This) ->
        Y = ((fun(Target_N68054) -> (get({Target_N68054, '$class'})):getYP(Target_N68054) end)((get({get({This, geographicMapInterface}), '$class'})):getAllBinaryTiledLayer(get({This, geographicMapInterface}))) - 10),
        case (get({This, '$class'})):keepOnMapMinY(This, Y) of
            true ->
            (get({This, '$class'})):move(This, 0, (-10));
            false -> ok
        end.

% throws Exception
down(This) ->
        Y = ((-(fun(Target_N68217) -> (get({Target_N68217, '$class'})):getYP(Target_N68217) end)((get({get({This, geographicMapInterface}), '$class'})):getAllBinaryTiledLayer(get({This, geographicMapInterface})))) + 10),
        case (get({This, '$class'})):keepOnMapMaxY(This, Y) of
            true ->
            (get({This, '$class'})):move(This, 0, 10);
            false -> ok
        end.

% throws Exception
right(This) ->
        X = ((fun(Target_N68372) -> (get({Target_N68372, '$class'})):getYP(Target_N68372) end)((get({get({This, geographicMapInterface}), '$class'})):getAllBinaryTiledLayer(get({This, geographicMapInterface}))) + 10),
        case (get({This, '$class'})):keepOnMapMinX(This, X) of
            true ->
            (get({This, '$class'})):move(This, 10, 0);
            false -> ok
        end.

% throws Exception
left(This) ->
        X = ((-(fun(Target_N68530) -> (get({Target_N68530, '$class'})):getYP(Target_N68530) end)((get({get({This, geographicMapInterface}), '$class'})):getAllBinaryTiledLayer(get({This, geographicMapInterface})))) - 10),
        case (get({This, '$class'})):keepOnMapMaxX(This, X) of
            true ->
            (get({This, '$class'})):move(This, (-10), 0);
            false -> ok
        end.

initInputProcessors(This) ->
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'UP'}), 'ScrollMapUpGameInputProcessor':new(This), get({This, inputProcessorArray}))),
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'DOWN'}), 'ScrollMapDownGameInputProcessor':new(This), get({This, inputProcessorArray}))),
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'KEY_NUM9'}), 'ScrollMapRightGameInputProcessor':new(This), get({This, inputProcessorArray}))),
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'KEY_NUM7'}), 'ScrollMapLeftGameInputProcessor':new(This), get({This, inputProcessorArray}))),
        'GameInputProcessorUtil':init(get({This, inputProcessorArray})).

% throws Exception
processInputKey(This, Key) when is_integer(Key) ->
        (fun(Target_N68969) -> (get({Target_N68969, '$class'})):processEvent(Target_N68969, 'AllBinaryGameLayerManager':getNullInstance(), get({'GameKeyEvent', 'NONE'})) end)(array:get(Key, get({This, inputProcessorArray}))).

% throws Exception
processInput(This, LayerManager) ->
        try
            Size = (get({get({This, inputList}), '$class'})):size(get({This, inputList})),
            put({local, key}, 0),
            lists:foreach(fun(Index) ->
                GameKeyEvent = (get({get({This, inputList}), '$class'})):get(get({This, inputList}), Index),
                put({local, key}, (get({GameKeyEvent, '$class'})):getKey(GameKeyEvent)),
                (get({This, '$class'})):processInputKey(This, get({local, key}))
            end, lists:seq(0, Size - 1)),
            case get({This, isSingleKeyProcessing}) of
                true ->
                (get({This, '$class'})):clear(This);
                false ->
                (get({This, '$class'})):update(This)
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, gameInputStrings}), 'PROCESS_INPUT'}), E)
        end.

getSpecialHeight(This) ->
        try
        TerrainTiledLayer = (get({get({This, geographicMapInterface}), '$class'})):getAllBinaryTiledLayer(get({This, geographicMapInterface})),
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        case ((get({TerrainTiledLayer, '$class'})):getHeight(TerrainTiledLayer) > (get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo)) of
            true ->
            throw({'$return', ((get({TerrainTiledLayer, '$class'})):getHeight(TerrainTiledLayer) - (get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo))});
            false ->
            throw({'$return', (((get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo) - (get({TerrainTiledLayer, '$class'})):getHeight(TerrainTiledLayer)) + (get({TerrainTiledLayer, '$class'})):getCellHeight(TerrainTiledLayer))})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getSpecialWidth(This) ->
        try
        TerrainTiledLayer = (get({get({This, geographicMapInterface}), '$class'})):getAllBinaryTiledLayer(get({This, geographicMapInterface})),
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        case ((get({TerrainTiledLayer, '$class'})):getWidth(TerrainTiledLayer) > (get({DisplayInfo, '$class'})):getLastWidth(DisplayInfo)) of
            true ->
            throw({'$return', ((get({TerrainTiledLayer, '$class'})):getWidth(TerrainTiledLayer) - (get({DisplayInfo, '$class'})):getLastWidth(DisplayInfo))});
            false ->
            throw({'$return', (((get({DisplayInfo, '$class'})):getLastWidth(DisplayInfo) - (get({TerrainTiledLayer, '$class'})):getWidth(TerrainTiledLayer)) + (get({TerrainTiledLayer, '$class'})):getCellWidth(TerrainTiledLayer))})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

keepOnMapMaxY(This, NewY) when is_integer(NewY) ->
        try
        Y = (fun(Target_N70148) -> (get({Target_N70148, '$class'})):getYP(Target_N70148) end)((get({get({This, geographicMapInterface}), '$class'})):getAllBinaryTiledLayer(get({This, geographicMapInterface}))),
        case (Y > (get({This, maxBottom}) + get({This, border}))) of
            true ->
            throw({'$return', false});
            false ->
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

keepOnMapMinY(This, NewY) when is_integer(NewY) ->
        try
        Y = (fun(Target_N70318) -> (get({Target_N70318, '$class'})):getYP(Target_N70318) end)((get({get({This, geographicMapInterface}), '$class'})):getAllBinaryTiledLayer(get({This, geographicMapInterface}))),
        case (Y < (-get({This, border}))) of
            true ->
            throw({'$return', false});
            false ->
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

keepOnMapMaxX(This, NewX) when is_integer(NewX) ->
        try
        X = (fun(Target_N70477) -> (get({Target_N70477, '$class'})):getXP(Target_N70477) end)((get({get({This, geographicMapInterface}), '$class'})):getAllBinaryTiledLayer(get({This, geographicMapInterface}))),
        case (X < ((-get({This, maxRight})) - get({This, border}))) of
            true ->
            throw({'$return', false});
            false ->
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

keepOnMapMinX(This, NewX) when is_integer(NewX) ->
        try
        X = (fun(Target_N70652) -> (get({Target_N70652, '$class'})):getXP(Target_N70652) end)((get({get({This, geographicMapInterface}), '$class'})):getAllBinaryTiledLayer(get({This, geographicMapInterface}))),
        case (X > get({This, border})) of
            true ->
            throw({'$return', false});
            false ->
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

