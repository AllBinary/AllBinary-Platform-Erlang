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
% package org.allbinary.game.configuration.event
% import org.allbinary.game.configuration.feature.Feature
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.GameFeatureUtil
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('BaseChangedGameFeatureListener').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements GameFeatureListenerInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, gameFeatureUtil}, 'GameFeatureUtil':getInstance()),
    put({This, list}, 'BasicArrayListD':new()),
    put({This, changed}, true),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'CommonStrings':getInstance(), 'NOT_IMPLEMENTED'}), This).

onGameFeatureChange(This, GameFeatureEvent) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66264) -> (get({Target_N66264, '$class'})):toString(Target_N66264) end)((fun(Target_N66271) -> (get({Target_N66271, '$class'})):append(Target_N66271, (get({GameFeatureEvent, '$class'})):getWhatChanged(GameFeatureEvent)) end)((fun(Target_N66278) -> (get({Target_N66278, '$class'})):append(Target_N66278, get({get({This, gameFeatureUtil}), 'GAME_FEATURE_CHANGED'})) end)('StringMaker':new()))), This, get({get({This, gameFeatureUtil}), 'ON_GAME_FEATURE_CHANGE'})),
        (get({get({This, list}), '$class'})):add(get({This, list}), (get({GameFeatureEvent, '$class'})):getGameOption(GameFeatureEvent)),
        (get({This, '$class'})):setChanged(This, true).

add(This, GameFeature) ->
        (get({get({This, list}), '$class'})):add(get({This, list}), GameFeature).

remove(This, GameFeature) ->
        (get({get({This, list}), '$class'})):remove(get({This, list}), GameFeature).

setChanged(This, Initialized) when is_boolean(Initialized) ->
        put({This, changed}, Initialized),
        case (not (get({This, '$class'})):isChanged(This)) of
            true ->
            (get({get({This, list}), '$class'})):clear(get({This, list}));
            false -> ok
        end.

isChangedFeature(This, GameFeature) ->
        IsChanged = (get({get({This, list}), '$class'})):contains(get({This, list}), GameFeature),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "GameFeature: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66944) -> (get({Target_N66944, '$class'})):toString(Target_N66944, GameFeature) end)('StringUtil':getInstance())),
        (get({StringBuffer, '$class'})):append(StringBuffer, " isFeature: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (fun(Target_N67029) -> (get({Target_N67029, '$class'})):isFeature(Target_N67029, GameFeature) end)('Features':getInstance())),
        (get({StringBuffer, '$class'})):append(StringBuffer, " isChanged: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, IsChanged),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "isChanged"),
        IsChanged.

isChanged(This) ->
        get({This, changed}).

