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
% package org.allbinary.game.layer
% import org.allbinary.game.GameInfo
% import org.allbinary.game.input.NullPlayerGameInputComposite
% import org.allbinary.game.input.PlayerGameInputCompositeInterface
% import org.allbinary.graphics.ItemColorFactory
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.layer.LayerProcessor
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.util.BasicArrayList

-module('AllBinaryGameLayerManager').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryLayerManager', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_ALLBINARY_LAYER_MANAGER'}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    put({?MODULE, 'ID'}, (fun(Target_N66205) -> (get({Target_N66205, '$class'})):getAt(Target_N66205, 22) end)('SmallIntegerSingletonFactory':getInstance())),
    ok.

init_fields(This) ->
    put({This, backgroundBasicColor}, undefined),
    put({This, foregroundBasicColor}, undefined),
    put({This, gameInfo}, undefined),
    put({This, playerGameInputCompositeInterface}, get({'NullPlayerGameInputComposite', 'NULL_PLAYER_GAME_INPUT_COMPOSITE'})),
    ok.


getNullInstance() ->
        case (get({'AllBinaryGameLayerManager', 'NULL_ALLBINARY_LAYER_MANAGER'}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'AllBinaryGameLayerManager', 'NULL_ALLBINARY_LAYER_MANAGER'}, 'AllBinaryGameLayerManager':new(get({'BasicColorFactory':getInstance(), 'BLACK'}), get({'BasicColorFactory':getInstance(), 'WHITE'}), get({'GameInfo', 'NONE'})));
            false -> ok
        end,
        get({'AllBinaryGameLayerManager', 'NULL_ALLBINARY_LAYER_MANAGER'}).

new(BackgroundBasicColor, ForegroundBasicColor, GameInfo) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, BackgroundBasicColor, ForegroundBasicColor, GameInfo),
    This.

init(This, BackgroundBasicColor, ForegroundBasicColor, GameInfo) ->
    'AllBinaryLayerManager':init(This),
    init_fields(This),
        put({This, backgroundBasicColor}, BackgroundBasicColor),
        put({This, foregroundBasicColor}, ForegroundBasicColor),
        ItemColorFactory = 'ItemColorFactory':getInstance(),
        put({ItemColorFactory, 'INVERT_PAINT'}, (get({get({This, backgroundBasicColor}), '$class'})):intValue(get({This, backgroundBasicColor}))),
        put({ItemColorFactory, 'PAINT'}, (get({get({This, foregroundBasicColor}), '$class'})):intValue(get({This, foregroundBasicColor}))),
        put({This, gameInfo}, GameInfo).

getLayerManager(This) ->
        This.

init(This) ->
        ok.

getBackgroundBasicColor(This) ->
        get({This, backgroundBasicColor}).

setBackgroundBasicColor(This, BackgroundBasicColor) ->
        put({This, backgroundBasicColor}, BackgroundBasicColor),
        put({'ItemColorFactory':getInstance(), 'INVERT_PAINT'}, (get({get({This, backgroundBasicColor}), '$class'})):intValue(get({This, backgroundBasicColor}))).

getForegroundBasicColor(This) ->
        get({This, foregroundBasicColor}).

setForegroundBasicColor(This, ForegroundBasicColor) ->
        put({This, foregroundBasicColor}, ForegroundBasicColor),
        put({'ItemColorFactory':getInstance(), 'PAINT'}, (get({get({This, foregroundBasicColor}), '$class'})):intValue(get({This, foregroundBasicColor}))).

getGameInfo(This) ->
        get({This, gameInfo}).

setGameInfo(This, GameInfo) ->
        put({This, gameInfo}, GameInfo).

setLayerProcessorList(This, List) ->
        LayerProcessorInterfaceArray = array:new((get({List, '$class'})):size(List), {default, undefined}),
        Size = array:size(LayerProcessorInterfaceArray),
        lists:foreach(fun(Index) ->
            array:set(Index, array:get(Index, get({List, objectArray})), LayerProcessorInterfaceArray)
        end, lists:seq(0, Size - 1)),
        (get({This, '$class'})):setLayerProcessorArray(This, LayerProcessorInterfaceArray).

setPlayerGameInputCompositeInterface(This, PlayerGameInputCompositeInterface) ->
        put({This, playerGameInputCompositeInterface}, PlayerGameInputCompositeInterface).

getPlayerGameInputCompositeInterface(This) ->
        get({This, playerGameInputCompositeInterface}).

