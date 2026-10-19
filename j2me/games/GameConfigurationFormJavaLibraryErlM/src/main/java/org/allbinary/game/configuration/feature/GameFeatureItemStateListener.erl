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
% package org.allbinary.game.configuration.feature
% import javax.microedition.lcdui.ChoiceGroup
% import javax.microedition.lcdui.Item
% import javax.microedition.lcdui.ItemStateListener
% import org.allbinary.game.configuration.GameConfigurationGauge
% import org.allbinary.game.configuration.GameConfigurationUtil
% import org.allbinary.game.configuration.GameOptionsForm
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('GameFeatureItemStateListener').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements ItemStateListener

static_init() ->
    put({?MODULE, toggleList}, 'BasicArrayListD':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, gameOptionsForm}, undefined),
    ok.


new(GameOptionsForm) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GameOptionsForm),
    This.

init(This, GameOptionsForm) ->
    init_fields(This),
        put({This, gameOptionsForm}, GameOptionsForm),
        GameFeatureFactory = 'GameFeatureFactory':getInstance(),
        'GameFeatureItemStateListener':add(get({GameFeatureFactory, 'ARTIFICIAL_INTELLEGENCE_PROCESSOR'})),
        'GameFeatureItemStateListener':add(get({GameFeatureFactory, 'COLLIDABLE_INTERFACE_LAYER_PROCESSOR'})),
        'GameFeatureItemStateListener':add(get({GameFeatureFactory, 'DAMAGE_FLOATERS'})),
        'GameFeatureItemStateListener':add(get({GameFeatureFactory, 'DROPPED_ITEMS'})),
        'GameFeatureItemStateListener':add(get({GameFeatureFactory, 'GAME_INPUT_LAYER_PROCESSOR'})),
        'GameFeatureItemStateListener':add(get({GameFeatureFactory, 'HEALTH_BARS'})),
        'GameFeatureItemStateListener':add(get({GameFeatureFactory, 'SOUND'})),
        'GameFeatureItemStateListener':add(get({GameFeatureFactory, 'TICKABLE_LAYER_PROCESSOR'})).

add(GameFeature) ->
        case (not (get({get({'GameFeatureItemStateListener', toggleList}), '$class'})):contains(get({'GameFeatureItemStateListener', toggleList}), GameFeature)) of
            true ->
            (get({get({'GameFeatureItemStateListener', toggleList}), '$class'})):add(get({'GameFeatureItemStateListener', toggleList}), GameFeature);
            false -> ok
        end.

itemStateChanged(This, Item) ->
        try
            ItemLabel = (get({Item, '$class'})):getLabel(Item),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66713) -> (get({Target_N66713, '$class'})):toString(Target_N66713) end)((fun(Target_N66720) -> (get({Target_N66720, '$class'})):append(Target_N66720, ItemLabel) end)((fun(Target_N66727) -> (get({Target_N66727, '$class'})):append(Target_N66727, get({'CommonLabels':getInstance(), 'ITEM_LABEL'})) end)('StringMaker':new()))), This, "itemStateChanged"),
            case allbinary_java:instance_of(Item, 'GameConfigurationGauge') of
                true ->
                (fun(Target_N67033) -> (get({Target_N67033, '$class'})):change(Target_N67033, get({This, gameOptionsForm}), Item) end)('GameConfigurationUtil':getInstance());
                false ->
                case allbinary_java:instance_of(Item, 'ChoiceGroup') of
                true ->
                GameFeatureUtil = 'GameFeatureUtil':getInstance(),
                case (get({GameFeatureUtil, '$class'})):isExclusive(GameFeatureUtil, ItemLabel) of
                    true ->
                    (get({GameFeatureUtil, '$class'})):updateExclusiveForChoiceGroup(GameFeatureUtil, Item);
                    false ->
                    (get({GameFeatureUtil, '$class'})):updateMultiple(GameFeatureUtil, Item)
                end;
                false -> ok
            end
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "itemStateChanged", E)
        end.

