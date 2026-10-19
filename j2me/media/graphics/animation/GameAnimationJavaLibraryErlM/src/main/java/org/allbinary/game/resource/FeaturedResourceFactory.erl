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
% package org.allbinary.game.resource
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.GameFeatureControlledInterface
% import org.allbinary.game.configuration.feature.GraphicsFeatureFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('FeaturedResourceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, list}, 'BasicArrayListD':new()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, 'ANIMATION_FEATURES'}, "Animation Features: Vector: "),
    put({This, 'IMAGE_LABEL'}, " Image: "),
    put({This, 'IMAGE_GRAPHICS_ARRAY'}, "Image Array: "),
    put({This, 'IMAGE_GRAPHICS_ROTATION'}, "Image Rotate: "),
    put({This, 'SPRITE_QUARTER'}, " Sprite Quarter: "),
    put({This, 'SPRITE_FULL'}, " Sprite Full: "),
    put({This, 'IS_LOADING_LEVEL_LABEL'}, " isLoadingLevel "),
    put({This, 'IS_FEATURE'}, " isFeature: "),
    put({This, 'GAME_FEATURE_CONTROLLED'}, "GameFeatureControlledInterface: "),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
init(This, Level) when is_integer(Level) ->
        Size = (get({get({This, list}), '$class'})):size(get({This, list})),
        lists:foreach(fun(Index) ->
            FeatureInterface = array:get(Index, get({get({This, list}), objectArray})),
            IsLoadingLevel = (get({FeatureInterface, '$class'})):isLoadingLevel(FeatureInterface, Level),
            IsFeature = (get({FeatureInterface, '$class'})):isFeature(FeatureInterface),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66658) -> (get({Target_N66658, '$class'})):toString(Target_N66658) end)((fun(Target_N66665) -> (get({Target_N66665, '$class'})):appendboolean(Target_N66665, IsFeature) end)((fun(Target_N66672) -> (get({Target_N66672, '$class'})):append(Target_N66672, get({This, 'IS_FEATURE'})) end)((fun(Target_N66679) -> (get({Target_N66679, '$class'})):appendboolean(Target_N66679, IsLoadingLevel) end)((fun(Target_N66686) -> (get({Target_N66686, '$class'})):append(Target_N66686, get({'CommonSeps':getInstance(), 'COLON_SEP'})) end)((fun(Target_N66693) -> (get({Target_N66693, '$class'})):append(Target_N66693, (fun(Target_N66785) -> (get({Target_N66785, '$class'})):getLevelString(Target_N66785, Level) end)('ResourceLoadingLevelFactory':getInstance())) end)((fun(Target_N66700) -> (get({Target_N66700, '$class'})):append(Target_N66700, get({This, 'IS_LOADING_LEVEL_LABEL'})) end)((fun(Target_N66707) -> (get({Target_N66707, '$class'})):append(Target_N66707, (get({FeatureInterface, '$class'})):toString(FeatureInterface)) end)((fun(Target_N66714) -> (get({Target_N66714, '$class'})):append(Target_N66714, get({This, 'GAME_FEATURE_CONTROLLED'})) end)('StringMaker':new()))))))))), This, get({get({This, commonStrings}), 'INIT'})),
            case (IsLoadingLevel andalso IsFeature) of
                true ->
                (get({FeatureInterface, '$class'})):init(FeatureInterface, Level);
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        Features = 'Features':getInstance(),
        GraphicsFeatureFactory = 'GraphicsFeatureFactory':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'ANIMATION_FEATURES'})),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({Features, '$class'})):isFeature(Features, get({GraphicsFeatureFactory, 'VECTOR_GRAPHICS'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'IMAGE_LABEL'})),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({Features, '$class'})):isFeature(Features, get({GraphicsFeatureFactory, 'IMAGE_GRAPHICS'}))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, commonStrings}), 'INIT'})),
        case (get({Features, '$class'})):isFeature(Features, get({GraphicsFeatureFactory, 'IMAGE_GRAPHICS'})) of
            true ->
            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'IMAGE_GRAPHICS_ARRAY'})),
            (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({Features, '$class'})):isFeature(Features, get({GraphicsFeatureFactory, 'IMAGE_TO_ARRAY_GRAPHICS'}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'IMAGE_GRAPHICS_ROTATION'})),
            (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({Features, '$class'})):isFeature(Features, get({GraphicsFeatureFactory, 'IMAGE_TO_ARRAY_GRAPHICS'}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'SPRITE_QUARTER'})),
            (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({Features, '$class'})):isFeature(Features, get({GraphicsFeatureFactory, 'SPRITE_QUARTER_ROTATION_GRAPHICS'}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'SPRITE_FULL'})),
            (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({Features, '$class'})):isFeature(Features, get({GraphicsFeatureFactory, 'SPRITE_FULL_GRAPHICS'}))),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, commonStrings}), 'INIT'}));
            false -> ok
        end.

clear(This) ->
        (get({get({This, list}), '$class'})):clear(get({This, list})).

add(This, FeatureInterface) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68065) -> (get({Target_N68065, '$class'})):toString(Target_N68065) end)((fun(Target_N68072) -> (get({Target_N68072, '$class'})):append(Target_N68072, (fun(Target_N68128) -> (get({Target_N68128, '$class'})):toString(Target_N68128, FeatureInterface) end)('StringUtil':getInstance())) end)((fun(Target_N68079) -> (get({Target_N68079, '$class'})):append(Target_N68079, get({'CommonLabels':getInstance(), 'START_LABEL'})) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'ADD'})),
        (get({get({This, list}), '$class'})):add(get({This, list}), FeatureInterface).

getList(This) ->
        get({This, list}).

