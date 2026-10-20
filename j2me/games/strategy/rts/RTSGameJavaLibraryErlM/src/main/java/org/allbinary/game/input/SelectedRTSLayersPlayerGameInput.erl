% 
% AllBinary Open License Version 1 
% Copyright (c) 2003 AllBinary 
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
% import org.allbinary.game.layer.RTSGameStrings
% import org.allbinary.game.layer.RTSLayer
% import org.allbinary.game.layer.RTSLayerInfoPaintable
% import org.allbinary.game.layer.RTSPlayerLayerInterface
% import org.allbinary.game.layer.capital.Capital
% import org.allbinary.media.audio.DowngradeSound
% import org.allbinary.media.audio.UpgradeSound
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.util.BasicArrayListUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.InputFeatureFactory
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.hud.event.GameNotificationEvent
% import org.allbinary.game.layer.hud.event.GameNotificationEventHandler
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.util.visitor.Visitor
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.media.audio.ErrorSound
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface

-module('SelectedRTSLayersPlayerGameInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PlayerGameInput', Function, Arguments).

init_fields(This) ->
    put({This, inputProcessorArray}, array:new(get({'InputFactory':getInstance(), 'MAX'}), {default, undefined})),
    put({This, list}, undefined),
    put({This, isSingleKeyProcessing}, ((fun(Target_N66597) -> (get({Target_N66597, '$class'})):isFeature(Target_N66597, get({'InputFeatureFactory':getInstance(), 'SINGLE_KEY_REPEAT_PRESS'})) end)('Features':getInstance()) orelse (fun(Target_N66648) -> (get({Target_N66648, '$class'})):isFeature(Target_N66648, get({'InputFeatureFactory':getInstance(), 'SINGLE_KEY_PRESS'})) end)('Features':getInstance()))),
    put({This, selectedRTSLayersList}, 'BasicArrayListD':new()),
    put({This, preSelectedRTSLayersList}, 'BasicArrayListD':new()),
    put({This, paintSelectedRTSLayersList}, (fun(Target_N66810) -> (get({Target_N66810, '$class'})):getImmutableInstance(Target_N66810) end)('BasicArrayListUtil':getInstance())),
    put({This, rtsPlayerLayerInterface}, undefined),
    put({This, selectRTSLayerVisitorInterface}, undefined),
    put({This, upgradeGameNotificationEvent}, undefined),
    put({This, noMoneyGameNotificationEvent}, undefined),
    put({This, downgradeGameNotificationEvent}, undefined),
    ok.


new(TowerInfoPaintable, RtsPlayerLayerInterface, List, PlayerInputId, SelectRTSLayerVisitorFactoryInterface) when is_integer(PlayerInputId) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TowerInfoPaintable, RtsPlayerLayerInterface, List, PlayerInputId, SelectRTSLayerVisitorFactoryInterface),
    This.

'$init'(This, TowerInfoPaintable, RtsPlayerLayerInterface, List, PlayerInputId, SelectRTSLayerVisitorFactoryInterface) when is_integer(PlayerInputId) ->
        'PlayerGameInput':'$init'(This, List, 'BasicArrayListD':new(), PlayerInputId),
        init_fields(This),
        (get({This, '$class'})):initInputProcessors(This),
        put({This, rtsPlayerLayerInterface}, RtsPlayerLayerInterface),
        put({This, list}, List),
        put({This, selectRTSLayerVisitorInterface}, (get({SelectRTSLayerVisitorFactoryInterface, '$class'})):create(SelectRTSLayerVisitorFactoryInterface, This)),
        SmallIntegerSingletonFactory = 'SmallIntegerSingletonFactory':getInstance(),
        BasicColorFactory = 'BasicColorFactory':getInstance(),
        put({This, upgradeGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'UPGRADE'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), get({BasicColorFactory, 'PINK'}), get({'BooleanFactory':getInstance(), 'FALSE'}))),
        put({This, noMoneyGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'NO_MONEY'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), get({BasicColorFactory, 'PINK'}), get({'BooleanFactory':getInstance(), 'FALSE'}))),
        put({This, downgradeGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'DOWNGRADE'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), get({BasicColorFactory, 'PINK'}), get({'BooleanFactory':getInstance(), 'FALSE'}))).

% throws Exception
setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager) ->
        GeographicMapCompositeInterface = AllBinaryGameLayerManager,
        GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
        (get({get({This, upgradeGameNotificationEvent}), '$class'})):setBasicColorP(get({This, upgradeGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)),
        (get({get({This, noMoneyGameNotificationEvent}), '$class'})):setBasicColorP(get({This, noMoneyGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)),
        (get({get({This, downgradeGameNotificationEvent}), '$class'})):setBasicColorP(get({This, downgradeGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)).

isSelected(This, RtsLayer) ->
        try
        case (get({get({This, selectedRTSLayersList}), '$class'})):contains(get({This, selectedRTSLayersList}), RtsLayer) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
upgrade(This) ->
        put({local, anyChanged}, false),
        lists:foreach(fun(Index) ->
            RtsLayer = (get({get({This, selectedRTSLayersList}), '$class'})):get(get({This, selectedRTSLayersList}), Index),
            case (get({RtsLayer, '$class'})):isUpgradeable(RtsLayer) of
                true ->
                Capital = (get({get({This, rtsPlayerLayerInterface}), '$class'})):getCapital(get({This, rtsPlayerLayerInterface})),
                UpgradeCost = (get({RtsLayer, '$class'})):getUpgradeCost(RtsLayer),
                case (UpgradeCost =< (get({Capital, '$class'})):getTotalMoney(Capital)) of
                    true ->
                    put({local, anyChanged}, true),
                    (get({get({This, rtsPlayerLayerInterface}), '$class'})):add(get({This, rtsPlayerLayerInterface}), 'UpgradeSound':getInstance()),
                    (get({RtsLayer, '$class'})):upgrade(RtsLayer),
                    (get({Capital, '$class'})):removeMoney(Capital, UpgradeCost),
                    case (not (get({get({This, rtsPlayerLayerInterface}), '$class'})):implmentsArtificialIntelligenceCompositeInterface(get({This, rtsPlayerLayerInterface}))) of
                        true ->
                        (fun(Target_N68693) -> (get({Target_N68693, '$class'})):fireEvent(Target_N68693, get({This, upgradeGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
                        false -> ok
                    end;
                    false ->
                    (get({get({This, rtsPlayerLayerInterface}), '$class'})):add(get({This, rtsPlayerLayerInterface}), 'ErrorSound':getInstance()),
                    case (not (get({get({This, rtsPlayerLayerInterface}), '$class'})):implmentsArtificialIntelligenceCompositeInterface(get({This, rtsPlayerLayerInterface}))) of
                        true ->
                        (fun(Target_N68491) -> (get({Target_N68491, '$class'})):fireEvent(Target_N68491, get({This, noMoneyGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
                        false -> ok
                    end
                end;
                false -> ok
            end
        end, lists:seq(((get({get({This, selectedRTSLayersList}), '$class'})):size(get({This, selectedRTSLayersList})) - 1), 0, -1)),
        case get({local, anyChanged}) of
            true ->
            RtsPlayerGameInput = ((get({get({This, rtsPlayerLayerInterface}), '$class'})):getPlayerGameInput(get({This, rtsPlayerLayerInterface}))),
            (get({RtsPlayerGameInput, '$class'})):updatePaintable(RtsPlayerGameInput);
            false -> ok
        end.

% throws Exception
downgrade(This) ->
        put({local, anyChanged}, false),
        put({local, index}, (get({get({This, selectedRTSLayersList}), '$class'})):size(get({This, selectedRTSLayersList}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            RtsLayer = (get({get({This, selectedRTSLayersList}), '$class'})):get(get({This, selectedRTSLayersList}), get({local, index})),
            case (get({RtsLayer, '$class'})):isDowngradeable(RtsLayer) of
                true ->
                put({local, anyChanged}, true),
                (get({get({This, rtsPlayerLayerInterface}), '$class'})):add(get({This, rtsPlayerLayerInterface}), 'DowngradeSound':getInstance()),
                DowngradeCost = (get({RtsLayer, '$class'})):getDowngradeCost(RtsLayer),
                (get({RtsLayer, '$class'})):downgrade(RtsLayer),
                Capital = (get({get({This, rtsPlayerLayerInterface}), '$class'})):getCapital(get({This, rtsPlayerLayerInterface})),
                (get({Capital, '$class'})):addMoney(Capital, DowngradeCost),
                case (not (get({get({This, rtsPlayerLayerInterface}), '$class'})):implmentsArtificialIntelligenceCompositeInterface(get({This, rtsPlayerLayerInterface}))) of
                    true ->
                    (fun(Target_N69341) -> (get({Target_N69341, '$class'})):fireEvent(Target_N69341, get({This, downgradeGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
                    false -> ok
                end;
                false -> ok
            end,
            Loop();
        false -> ok end end)(),
        case get({local, anyChanged}) of
            true ->
            RtsPlayerGameInput = ((get({get({This, rtsPlayerLayerInterface}), '$class'})):getPlayerGameInput(get({This, rtsPlayerLayerInterface}))),
            (get({RtsPlayerGameInput, '$class'})):updatePaintable(RtsPlayerGameInput);
            false -> ok
        end.

initInputProcessors(This) ->
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'KEY_NUM1'}), 'SelectedRTSLayersPlayerUpgradeGameInputProcessor':new(This), get({This, inputProcessorArray}))),
        put({This, inputProcessorArray}, array:set(get({'Canvas', 'KEY_NUM3'}), 'SelectedRTSLayersPlayerDowngradeGameInputProcessor':new(This), get({This, inputProcessorArray}))),
        'GameInputProcessorUtil':init(get({This, inputProcessorArray})).

% throws Exception
processInputKey(This, Key) when is_integer(Key) ->
        case (get({This, selectedRTSLayersList}) =/= undefined) of
            true ->
            (fun(Target_N69809) -> (get({Target_N69809, '$class'})):processEvent(Target_N69809, 'AllBinaryGameLayerManager':getNullInstance(), get({'GameKeyEvent', 'NONE'})) end)(array:get(Key, get({This, inputProcessorArray})));
            false -> ok
        end.

% throws Exception
processInput(This, LayerManager) ->
        try
            Size = (get({get({This, list}), '$class'})):size(get({This, list})),
            put({local, key}, 0),
            lists:foreach(fun(Index) ->
                GameKeyEvent = (get({get({This, list}), '$class'})):get(get({This, list}), Index),
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

getSelectedBasicArrayList(This) ->
        get({This, selectedRTSLayersList}).

addSelectedRTSLayer(This, SelectedLayer) ->
        put({This, paintSelectedRTSLayersList}, (fun(Target_N70501) -> (get({Target_N70501, '$class'})):getImmutableInstance(Target_N70501) end)('BasicArrayListUtil':getInstance())),
        case (SelectedLayer =:= 'CollidableDestroyableDamageableLayer':getNullInstance()) of
            true ->
            (get({This, '$class'})):deselectAll(This),
            (get({get({This, selectedRTSLayersList}), '$class'})):clear(get({This, selectedRTSLayersList}));
            false ->
            case (not (get({get({This, selectedRTSLayersList}), '$class'})):contains(get({This, selectedRTSLayersList}), SelectedLayer)) of
                true ->
                (get({get({This, selectedRTSLayersList}), '$class'})):add(get({This, selectedRTSLayersList}), SelectedLayer);
                false -> ok
            end
        end,
        put({This, paintSelectedRTSLayersList}, get({This, selectedRTSLayersList})).

setSelectedRTSLayer(This, SelectedLayer) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Selected Layer: "),
        case (SelectedLayer =/= undefined) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({SelectedLayer, '$class'})):getName(SelectedLayer));
            false -> ok
        end,
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "setSelectedRTSLayer"),
        put({This, paintSelectedRTSLayersList}, (fun(Target_N70978) -> (get({Target_N70978, '$class'})):getImmutableInstance(Target_N70978) end)('BasicArrayListUtil':getInstance())),
        (get({get({This, selectRTSLayerVisitorInterface}), '$class'})):visit(get({This, selectRTSLayerVisitorInterface}), SelectedLayer),
        (get({This, '$class'})):deselectAll(This),
        case ((get({get({This, selectedRTSLayersList}), '$class'})):size(get({This, selectedRTSLayersList})) > 0) of
            true ->
            (fun(Target_N71092) -> (get({Target_N71092, '$class'})):clear(Target_N71092) end)((get({This, '$class'})):getPreSelectedRTSLayersList(This)),
            TempList = (get({This, '$class'})):getPreSelectedRTSLayersList(This),
            put({This, preSelectedRTSLayersList}, get({This, selectedRTSLayersList})),
            put({This, selectedRTSLayersList}, TempList),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N71239) -> (get({Target_N71239, '$class'})):toString(Target_N71239) end)((fun(Target_N71246) -> (get({Target_N71246, '$class'})):append(Target_N71246, (get({get({This, preSelectedRTSLayersList}), '$class'})):toString(get({This, preSelectedRTSLayersList}))) end)((fun(Target_N71253) -> (get({Target_N71253, '$class'})):append(Target_N71253, "Preselected: ") end)('StringMaker':new()))), This, "setSelectedRTSLayer");
            false -> ok
        end,
        case (SelectedLayer =/= 'CollidableDestroyableDamageableLayer':getNullInstance()) of
            true ->
            (get({get({This, selectedRTSLayersList}), '$class'})):add(get({This, selectedRTSLayersList}), SelectedLayer);
            false -> ok
        end,
        put({This, paintSelectedRTSLayersList}, get({This, selectedRTSLayersList})).

getLastSelectedRtsLayer(This) ->
        try
        case (get({This, '$class'})):isAnyRTSLayerSelected(This) of
            true ->
            throw({'$return', (get({get({This, selectedRTSLayersList}), '$class'})):get(get({This, selectedRTSLayersList}), ((get({get({This, selectedRTSLayersList}), '$class'})):size(get({This, selectedRTSLayersList})) - 1))});
            false ->
            throw({'$return', 'CollidableDestroyableDamageableLayer':getNullInstance()})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

selectAllPreselected(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Select all Preselected: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, preSelectedRTSLayersList}), '$class'})):toString(get({This, preSelectedRTSLayersList}))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "selectAllPreselected"),
        lists:foreach(fun(Index) ->
            RtsLayer = (get({get({This, preSelectedRTSLayersList}), '$class'})):get(get({This, preSelectedRTSLayersList}), Index),
            (get({RtsLayer, '$class'})):select(RtsLayer)
        end, lists:seq(((get({get({This, preSelectedRTSLayersList}), '$class'})):size(get({This, preSelectedRTSLayersList})) - 1), 0, -1)).

deselectAllPreselected(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Deselect all Preselected: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, preSelectedRTSLayersList}), '$class'})):toString(get({This, preSelectedRTSLayersList}))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "deselectAllPreselected"),
        lists:foreach(fun(Index) ->
            RtsLayer = (get({get({This, preSelectedRTSLayersList}), '$class'})):get(get({This, preSelectedRTSLayersList}), Index),
            (get({RtsLayer, '$class'})):deselect(RtsLayer)
        end, lists:seq(((get({get({This, preSelectedRTSLayersList}), '$class'})):size(get({This, preSelectedRTSLayersList})) - 1), 0, -1)),
        (get({get({This, preSelectedRTSLayersList}), '$class'})):clear(get({This, preSelectedRTSLayersList})).

deselectAll(This) ->
        lists:foreach(fun(Index) ->
            RtsLayer = (get({get({This, selectedRTSLayersList}), '$class'})):get(get({This, selectedRTSLayersList}), Index),
            (get({RtsLayer, '$class'})):deselect(RtsLayer)
        end, lists:seq(((get({get({This, selectedRTSLayersList}), '$class'})):size(get({This, selectedRTSLayersList})) - 1), 0, -1)).

isAnyRTSLayerSelected(This) ->
        try
        case ((get({get({This, selectedRTSLayersList}), '$class'})):size(get({This, selectedRTSLayersList})) =:= 0) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getPaintSelectedRTSLayersList(This) ->
        get({This, paintSelectedRTSLayersList}).

getPreSelectedRTSLayersList(This) ->
        get({This, preSelectedRTSLayersList}).

