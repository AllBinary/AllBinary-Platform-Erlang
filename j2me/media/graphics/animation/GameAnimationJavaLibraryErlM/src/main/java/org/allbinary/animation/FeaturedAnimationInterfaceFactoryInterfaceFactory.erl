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
% package org.allbinary.animation
% import org.allbinary.animation.resource.FeatureResourceAnimationInterfaceFactoryInterface
% import org.allbinary.game.configuration.GameConfigurationCentral
% import org.allbinary.game.resource.FeaturedResourceFactory
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.RectangleFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonSeps
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('FeaturedAnimationInterfaceFactoryInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('FeaturedResourceFactory', Function, Arguments).

static_init() ->
    put({?MODULE, 'INSTANCE'}, 'FeaturedAnimationInterfaceFactoryInterfaceFactory':new()),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'FeaturedResourceFactory':'$init'(This),
    init_fields(This),
        ok.

getInstance() ->
        get({'FeaturedAnimationInterfaceFactoryInterfaceFactory', 'INSTANCE'}).

% throws Exception
getRectangle(This, Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
        (get({This, '$class'})):getRectangleXY(This, Resource, 0, 0).

% throws Exception
getRectangleXY(This, Resource, X, Y) when (is_list(Resource) orelse Resource =:= undefined), is_integer(X), is_integer(Y) ->
        try
        PointFactory = 'PointFactory':getInstance(),
        List = (get({This, '$class'})):getList(This),
        Scale = (fun(Target_N66227) -> (get({Target_N66227, '$class'})):intValue(Target_N66227) end)((fun(Target_N66234) -> (get({Target_N66234, '$class'})):getValue(Target_N66234) end)(get({'GameConfigurationCentral':getInstance(), 'SCALE'}))),
        Size = (fun(Target_N66297) -> (get({Target_N66297, '$class'})):size(Target_N66297) end)((get({This, '$class'})):getList(This)),
        lists:foreach(fun(Index) ->
            FeatureInterface = array:get(Index, get({List, objectArray})),
            case (get({FeatureInterface, '$class'})):isFeature(FeatureInterface) of
                true ->
                Rectangle = (get({FeatureInterface, '$class'})):getRectangle(FeatureInterface, Resource),
                case (Rectangle =/= get({'RectangleFactory', 'SINGLETON'})) of
                    true ->
                    throw({'$return', 'Rectangle':new((get({PointFactory, '$class'})):createXY(PointFactory, X, Y), (((((get({Rectangle, '$class'})):getWidth(Rectangle) * Scale)) bsr 1)), (((((get({Rectangle, '$class'})):getHeight(Rectangle) * Scale)) bsr 1)))});
                    false -> ok
                end;
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        erlang:error({'Exception', (fun(Target_N66766) -> (get({Target_N66766, '$class'})):toString(Target_N66766) end)((fun(Target_N66773) -> (get({Target_N66773, '$class'})):append(Target_N66773, Resource) end)((fun(Target_N66780) -> (get({Target_N66780, '$class'})):append(Target_N66780, "No rectangle available for current feature selection or Resource: ") end)('StringMaker':new())))})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getProcedural(This, Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
        (get({This, '$class'})):getBasicAnimationInterfaceFactoryInstance(This, Resource).

% throws Exception
get(This, Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
        (get({This, '$class'})):getBasicAnimationInterfaceFactoryInstance(This, Resource).

% throws Exception
getBasicAnimationInterfaceFactoryInstance(This, Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
        try
        List = (get({This, '$class'})):getList(This),
        ResourceTypeAvailableList = 'BasicArrayListD':new(),
        Size = (fun(Target_N67235) -> (get({Target_N67235, '$class'})):size(Target_N67235) end)((get({This, '$class'})):getList(This)),
        put({local, featureInterface}, undefined),
        put({local, animationInterfaceFactoryInterface}, undefined),
        lists:foreach(fun(Index) ->
            put({local, featureInterface}, array:get(Index, get({List, objectArray}))),
            case (get({get({local, featureInterface}), '$class'})):isFeature(get({local, featureInterface})) of
                true ->
                (get({ResourceTypeAvailableList, '$class'})):add(ResourceTypeAvailableList, get({local, featureInterface})),
                put({local, animationInterfaceFactoryInterface}, (get({get({local, featureInterface}), '$class'})):getBasicAnimationInterfaceFactoryInstance(get({local, featureInterface}), Resource)),
                case (get({local, animationInterfaceFactoryInterface}) =/= get({'NullAnimationFactory', 'NULL_NOT_FOR_USE_ANIMATION_FACTORY'})) of
                    true ->
                    throw({'$return', get({local, animationInterfaceFactoryInterface})});
                    false -> ok
                end;
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        case ((get({ResourceTypeAvailableList, '$class'})):size(ResourceTypeAvailableList) > 0) of
            true ->
            NO_ANIMATION_AVAILABLE_FROM = "No animation available from: ",
            FOR_FACTORIES = " factories: ",
            FOR_RESOURCE = " for Resource: ",
            HAS_KEY = " has: ",
            RESOURCES_LABEL = " resources ",
            put({local, stringBuffer}, 'StringMaker':new()),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), NO_ANIMATION_AVAILABLE_FROM),
            (get({get({local, stringBuffer}), '$class'})):appendint(get({local, stringBuffer}), (get({ResourceTypeAvailableList, '$class'})):size(ResourceTypeAvailableList)),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({'CommonSeps':getInstance(), 'FORWARD_SLASH'})),
            (get({get({local, stringBuffer}), '$class'})):appendint(get({local, stringBuffer}), Size),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), FOR_FACTORIES),
            Size2 = (get({ResourceTypeAvailableList, '$class'})):size(ResourceTypeAvailableList),
            lists:foreach(fun(Index) ->
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (fun(Target_N68593) -> (get({Target_N68593, '$class'})):toString(Target_N68593) end)((get({ResourceTypeAvailableList, '$class'})):get(ResourceTypeAvailableList, Index))),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({'CommonSeps':getInstance(), 'COMMA_SEP'}))
            end, lists:seq(0, Size2 - 1)),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), FOR_RESOURCE),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), Resource),
            lists:foreach(fun(Index) ->
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({'CommonSeps':getInstance(), 'NEW_LINE'})),
                put({local, featureInterface}, array:get(Index, get({List, objectArray}))),
                case (get({get({local, featureInterface}), '$class'})):isFeature(get({local, featureInterface})) of
                    true ->
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (fun(Target_N68962) -> (get({Target_N68962, '$class'})):toString(Target_N68962, get({local, featureInterface})) end)('StringUtil':getInstance())),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), HAS_KEY),
                    (get({get({local, stringBuffer}), '$class'})):appendint(get({local, stringBuffer}), (fun(Target_N69051) -> (get({Target_N69051, '$class'})):size(Target_N69051) end)((get({get({local, featureInterface}), '$class'})):getHashtable(get({local, featureInterface})))),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), RESOURCES_LABEL);
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            erlang:error({'Exception', (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer}))});
            false ->
            put({local, stringBuffer}, 'StringMaker':new()),
            lists:foreach(fun(Index) ->
                put({local, featureInterface}, array:get(Index, get({List, objectArray}))),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({get({local, featureInterface}), '$class'})):toString(get({local, featureInterface}))),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({'CommonSeps':getInstance(), 'SPACE'}))
            end, lists:seq(0, Size - 1)),
            Result = (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})),
            (get({get({local, stringBuffer}), '$class'})):delete(get({local, stringBuffer}), 0, (get({get({local, stringBuffer}), '$class'})):length(get({local, stringBuffer}))),
            erlang:error({'Exception', (fun(Target_N68010) -> (get({Target_N68010, '$class'})):toString(Target_N68010) end)((fun(Target_N68017) -> (get({Target_N68017, '$class'})):append(Target_N68017, Result) end)((fun(Target_N68024) -> (get({Target_N68024, '$class'})):append(Target_N68024, " Resource Factories Available: ") end)((fun(Target_N68031) -> (get({Target_N68031, '$class'})):append(Target_N68031, Resource) end)((get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "No feature resource type available for Resource: ")))))})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

