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
% import org.allbinary.game.layer.RTSGameStrings
% import org.allbinary.game.layer.RTSInterface
% import org.allbinary.game.layer.RTSPlayerLayerInterface
% import org.allbinary.game.layer.TechnologyRTSInterfaceImageItem
% import org.allbinary.game.layer.capital.Capital
% import org.allbinary.game.rts.technology.event.TechEventHandler
% import org.allbinary.graphics.form.item.ABCustomItem
% import org.allbinary.media.audio.BuildingSound
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.game.identification.Group
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.hud.event.GameNotificationEvent
% import org.allbinary.game.layer.hud.event.GameNotificationEventHandler
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.media.audio.ErrorSound
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface

-module('TechRTSFormInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RTSFormInput', Function, Arguments).

init_fields(This) ->
    put({This, 'EVENT'}, 'AllBinaryEventObject':new(This)),
    put({This, noMoneyGameNotificationEvent}, undefined),
    ok.


new(GroupInterface) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GroupInterface),
    This.

'$init'(This, GroupInterface) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined) ->
        'RTSFormInput':'$init'(This, GroupInterface),
        init_fields(This),
        BasicColorFactory = 'BasicColorFactory':getInstance(),
        put({This, noMoneyGameNotificationEvent}, 'GameNotificationEvent':new(This, get({'RTSGameStrings':getInstance(), 'NO_MONEY'}), (fun(Target_N66576) -> (get({Target_N66576, '$class'})):getAt(Target_N66576, 2) end)('SmallIntegerSingletonFactory':getInstance()), get({BasicColorFactory, 'WHITE'}), get({'BooleanFactory':getInstance(), 'FALSE'}))).

% throws Exception
setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager) ->
        'RTSFormInput':setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager),
        GeographicMapCompositeInterface = AllBinaryGameLayerManager,
        GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
        (get({get({This, noMoneyGameNotificationEvent}), '$class'})):setBasicColorP(get({This, noMoneyGameNotificationEvent}), (get({GeographicMapInterface, '$class'})):getForegroundBasicColor(GeographicMapInterface)).

% throws Exception
processGameSpecific(This, AssociatedRtsLayer, RtsPlayerLayerInterface, LayerManager, Item, ItemIndex) when is_integer(ItemIndex) ->
        'RTSFormInput':process(This, LayerManager),
        CommonStrings = 'CommonStrings':getInstance(),
        StringMaker = 'StringMaker':new(),
        TechnologyRTSInterfaceImageItem = Item,
        RtsInterface = (get({TechnologyRTSInterfaceImageItem, '$class'})):getRtsInterface(TechnologyRTSInterfaceImageItem),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67208) -> (get({Target_N67208, '$class'})):toString(Target_N67208) end)((fun(Target_N67215) -> (get({Target_N67215, '$class'})):appendboolean(Target_N67215, (get({RtsInterface, '$class'})):isUpgradeable(RtsInterface)) end)((get({StringMaker, '$class'})):append(StringMaker, "isUpgradeable: "))), This, get({CommonStrings, 'PROCESS'})),
        case (get({RtsInterface, '$class'})):isUpgradeable(RtsInterface) of
            true ->
            Cost = (get({RtsInterface, '$class'})):getUpgradeCost(RtsInterface),
            Capital = (get({RtsPlayerLayerInterface, '$class'})):getCapital(RtsPlayerLayerInterface),
            (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67474) -> (get({Target_N67474, '$class'})):toString(Target_N67474) end)((fun(Target_N67481) -> (get({Target_N67481, '$class'})):appendint(Target_N67481, trunc((get({Capital, '$class'})):getTotalMoney(Capital))) end)((fun(Target_N67488) -> (get({Target_N67488, '$class'})):append(Target_N67488, "<=") end)((get({StringMaker, '$class'})):appendint(StringMaker, Cost)))), This, get({CommonStrings, 'PROCESS'})),
            case (Cost =< (get({Capital, '$class'})):getTotalMoney(Capital)) of
                true ->
                (get({RtsPlayerLayerInterface, '$class'})):add(RtsPlayerLayerInterface, 'BuildingSound':getInstance()),
                (get({Capital, '$class'})):removeMoney(Capital, Cost),
                (get({RtsInterface, '$class'})):upgrade(RtsInterface),
                (get({TechnologyRTSInterfaceImageItem, '$class'})):update(TechnologyRTSInterfaceImageItem),
                (fun(Target_N67843) -> (get({Target_N67843, '$class'})):fireEvent(Target_N67843, get({This, 'EVENT'})) end)('TechEventHandler':getInstance());
                false ->
                (get({RtsPlayerLayerInterface, '$class'})):add(RtsPlayerLayerInterface, 'ErrorSound':getInstance()),
                case (not (get({RtsPlayerLayerInterface, '$class'})):implmentsArtificialIntelligenceCompositeInterface(RtsPlayerLayerInterface)) of
                    true ->
                    (fun(Target_N67681) -> (get({Target_N67681, '$class'})):fireEvent(Target_N67681, get({This, noMoneyGameNotificationEvent})) end)('GameNotificationEventHandler':getInstance());
                    false -> ok
                end
            end;
            false -> ok
        end.

