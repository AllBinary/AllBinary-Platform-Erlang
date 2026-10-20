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
% package org.allbinary.input.motion.button
% import org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.resource.ResourceLoadingLevelFactory
% import org.allbinary.graphics.opengles.OpenGLFeatureFactory
% import org.allbinary.image.ImageCache
% import org.allbinary.image.ImageCacheFactory
% import org.allbinary.logic.StdUtil

-module('TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseResourceAnimationInterfaceFactoryInterfaceFactory', Function, Arguments).

init_fields(This) ->
    ok.


createFactory() ->
        'TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory':new("TouchButton Animations").

new(Name) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name),
    This.

'$init'(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        'BaseResourceAnimationInterfaceFactoryInterfaceFactory':'$init'(This, Name, (fun(Target_N65878) -> (get({Target_N65878, '$class'})):createHashtable(Target_N65878) end)('StdUtil':getInstance()), (fun(Target_N65902) -> (get({Target_N65902, '$class'})):createHashtable(Target_N65902) end)('StdUtil':getInstance()), (fun(Target_N65926) -> (get({Target_N65926, '$class'})):createHashtable(Target_N65926) end)('StdUtil':getInstance())).

% throws Exception
init(This, Level) when is_integer(Level) ->
        (get({This, '$class'})):initImageCache(This, 'ImageCacheFactory':getInstance(), Level).

% throws Exception
initImageCache(This, ImageCache, Level) when is_integer(Level) ->
        try
        case (get({This, '$class'})):isInitialized(This) of
            true ->
            throw({'$return', ok});
            false -> ok
        end,
        'BaseResourceAnimationInterfaceFactoryInterfaceFactory':init(This, Level)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isLoadingLevel(This, Level) when is_integer(Level) ->
        try
        ResourceLoadingLevelFactory = 'ResourceLoadingLevelFactory':getInstance(),
        case (Level =:= (get({get({ResourceLoadingLevelFactory, 'LOAD_TOUCH'}), '$class'})):getLevel(get({ResourceLoadingLevelFactory, 'LOAD_TOUCH'}))) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', 'BaseResourceAnimationInterfaceFactoryInterfaceFactory':isLoadingLevel(This, Level)})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isFeature(This) ->
        try
        case (not (fun(Target_N66422) -> (get({Target_N66422, '$class'})):isDefault(Target_N66422, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'})) end)('Features':getInstance())) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

