% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.allbinary.graphics.opengles.shader
% import org.allbinary.graphics.opengles.NullOpenGLProcessorFactory
% import org.allbinary.graphics.opengles.OpenGLProcessor

-module('PlatformShaderComposite').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ShaderComposite', Function, Arguments).

init_fields(This) ->
    ok.


new(RequiresOpenGLVersion, ShaderArray, CompositeShaderUpdater, ShaderInitializer, ModelViewProjection, ColorOpenGLProcessor, VertexOpenGLProcessor) when (is_list(RequiresOpenGLVersion) orelse RequiresOpenGLVersion =:= undefined), (is_tuple(ShaderArray) orelse ShaderArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, RequiresOpenGLVersion, ShaderArray, CompositeShaderUpdater, ShaderInitializer, ModelViewProjection, ColorOpenGLProcessor, VertexOpenGLProcessor),
    This.

'$init'(This, RequiresOpenGLVersion, ShaderArray, CompositeShaderUpdater, ShaderInitializer, ModelViewProjection, ColorOpenGLProcessor, VertexOpenGLProcessor) when (is_list(RequiresOpenGLVersion) orelse RequiresOpenGLVersion =:= undefined), (is_tuple(ShaderArray) orelse ShaderArray =:= undefined) ->
        'ShaderComposite':'$init'(This, RequiresOpenGLVersion, ShaderArray, CompositeShaderUpdater, ShaderInitializer, ModelViewProjection, ColorOpenGLProcessor, VertexOpenGLProcessor, 'NullOpenGLProcessorFactory':getInstance()).

