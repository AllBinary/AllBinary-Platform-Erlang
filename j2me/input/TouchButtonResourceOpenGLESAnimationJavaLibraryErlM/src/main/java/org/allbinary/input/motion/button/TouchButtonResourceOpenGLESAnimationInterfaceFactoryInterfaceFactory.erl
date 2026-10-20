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
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.graphics.opengles.OpenGLFeatureFactory
% import org.allbinary.image.opengles.OpenGLImageCacheFactory

-module('TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory', Function, Arguments).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory':'$init'(This, "OpenGL TouchButton Animations").

% throws Exception
init(This, Level) when is_integer(Level) ->
        'TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory':initImageCache(This, 'OpenGLImageCacheFactory':getInstance(), Level).

isFeature(This) ->
        try
        case (fun(Target_N65844) -> (get({Target_N65844, '$class'})):isDefault(Target_N65844, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'})) end)('Features':getInstance()) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

