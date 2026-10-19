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
% package org.allbinary.animation.resource
% import org.allbinary.animation.BasicAnimationInterfaceFactoryInterface
% import org.allbinary.animation.NullAnimationFactory
% import org.allbinary.game.resource.ResourceLoadingLevelFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.RectangleFactory
% import org.allbinary.image.ImageCache
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.ABHashtable

-module('BaseResourceAnimationInterfaceFactoryInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements FeatureResourceAnimationInterfaceFactoryInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, hashtable}, undefined),
    put({This, rectangleHashtable}, undefined),
    put({This, rectangleArrayOfArraysHashtable}, undefined),
    put({This, name}, undefined),
    put({This, initialized}, false),
    ok.


new(Name, Hashtable, RectangleHashtable, RectangleArrayHashtable) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, Hashtable, RectangleHashtable, RectangleArrayHashtable),
    This.

init(This, Name, Hashtable, RectangleHashtable, RectangleArrayHashtable) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        put({This, hashtable}, Hashtable),
        put({This, rectangleHashtable}, RectangleHashtable),
        put({This, rectangleArrayOfArraysHashtable}, RectangleArrayHashtable),
        put({This, name}, Name).

getName(This) ->
        get({This, name}).

% throws Exception
init(This, Level) when is_integer(Level) ->
        CommonStrings = 'CommonStrings':getInstance(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66624) -> (get({Target_N66624, '$class'})):toString(Target_N66624) end)((fun(Target_N66631) -> (get({Target_N66631, '$class'})):append(Target_N66631, (get({get({This, hashtable}), '$class'})):toString(get({This, hashtable}))) end)((fun(Target_N66638) -> (get({Target_N66638, '$class'})):append(Target_N66638, "Available List of Animations: ") end)('StringMaker':new()))), This, get({CommonStrings, 'INIT'})),
        (get({This, '$class'})):setInitialized(This, true).

% throws Exception
initImageCache(This, ImageCache, Level) when is_integer(Level) ->
        ok.

% throws Exception
add(This, Resource, AnimationInterfaceFactoryInterface) when (is_list(Resource) orelse Resource =:= undefined) ->
        case (get({get({This, hashtable}), '$class'})):containsKey(get({This, hashtable}), Resource) of
            true ->
            erlang:error({'Exception', (fun(Target_N66948) -> (get({Target_N66948, '$class'})):toString(Target_N66948) end)((fun(Target_N66955) -> (get({Target_N66955, '$class'})):append(Target_N66955, Resource) end)((fun(Target_N66962) -> (get({Target_N66962, '$class'})):append(Target_N66962, "Resource Already Created: ") end)('StringMaker':new())))});
            false -> ok
        end,
        (get({get({This, hashtable}), '$class'})):put(get({This, hashtable}), Resource, AnimationInterfaceFactoryInterface).

% throws Exception
getBasicAnimationInterfaceFactoryInstance(This, Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
        try
        BasicAnimationInterfaceFactoryInterfaceCanBeNull = (get({get({This, hashtable}), '$class'})):get(get({This, hashtable}), Resource),
        case (BasicAnimationInterfaceFactoryInterfaceCanBeNull =:= undefined) of
            true ->
            throw({'$return', get({'NullAnimationFactory', 'NULL_NOT_FOR_USE_ANIMATION_FACTORY'})});
            false -> ok
        end,
        BasicAnimationInterfaceFactoryInterfaceCanBeNull
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getRectangle(This, Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
        try
        RectangleCanBeNull = (get({get({This, rectangleHashtable}), '$class'})):get(get({This, rectangleHashtable}), Resource),
        case (RectangleCanBeNull =:= undefined) of
            true ->
            throw({'$return', get({'RectangleFactory', 'SINGLETON'})});
            false -> ok
        end,
        RectangleCanBeNull
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
addRectangle(This, Resource, Rectangle) when (is_list(Resource) orelse Resource =:= undefined) ->
        (get({get({This, rectangleHashtable}), '$class'})):put(get({This, rectangleHashtable}), Resource, Rectangle).

% throws Exception
getRectangleArrayOfArrays(This, Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
        (get({get({This, rectangleArrayOfArraysHashtable}), '$class'})):get(get({This, rectangleArrayOfArraysHashtable}), Resource).

% throws Exception
addRectangleArrayOfArrays(This, Resource, RectangleArrayOfArrays) when (is_list(Resource) orelse Resource =:= undefined), (is_tuple(RectangleArrayOfArrays) orelse RectangleArrayOfArrays =:= undefined) ->
        (get({get({This, rectangleArrayOfArraysHashtable}), '$class'})):put(get({This, rectangleArrayOfArraysHashtable}), Resource, RectangleArrayOfArrays).

isFeature(This) ->
        false.

isLoadingLevel(This, Level) when is_integer(Level) ->
        try
        ResourceLoadingLevelFactory = 'ResourceLoadingLevelFactory':getInstance(),
        case (Level =:= (get({get({ResourceLoadingLevelFactory, 'LOAD_ALL'}), '$class'})):getLevel(get({ResourceLoadingLevelFactory, 'LOAD_ALL'}))) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toString(This) ->
        (fun(Target_N68215) -> (get({Target_N68215, '$class'})):toString(Target_N68215) end)((fun(Target_N68222) -> (get({Target_N68222, '$class'})):append(Target_N68222, get({This, name})) end)((fun(Target_N68229) -> (get({Target_N68229, '$class'})):append(Target_N68229, get({'CommonSeps':getInstance(), 'SPACE'})) end)((fun(Target_N68236) -> (get({Target_N68236, '$class'})):append(Target_N68236, get({'CommonSeps':getInstance(), 'SEMICOLON'})) end)((fun(Target_N68243) -> (get({Target_N68243, '$class'})):append(Target_N68243, atom_to_list(get({This, '$class'}))) end)('StringMaker':new()))))).

getHashtable(This) ->
        get({This, hashtable}).

getRectangleHashtable(This) ->
        get({This, rectangleHashtable}).

getRectangleArrayOfArraysHashtable(This) ->
        get({This, rectangleArrayOfArraysHashtable}).

setInitialized(This, Initialized) when is_boolean(Initialized) ->
        put({This, initialized}, Initialized).

isInitialized(This) ->
        get({This, initialized}).

