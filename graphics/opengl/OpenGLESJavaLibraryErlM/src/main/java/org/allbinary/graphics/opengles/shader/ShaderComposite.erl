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
% import javax.microedition.khronos.opengles.GL10
% import org.allbinary.graphics.opengles.OpenGLProcessor
% import org.allbinary.graphics.opengles.NullOpenGLProcessorFactory

-module('ShaderComposite').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, disableProgramShaderOpenGLProcessor}, undefined),
    put({This, requiresOpenGLVersion}, undefined),
    put({This, shaderArray}, undefined),
    put({This, shaderInitializer}, undefined),
    put({This, compositeShaderUpdater}, undefined),
    put({This, modelViewProjection}, undefined),
    put({This, colorOpenGLProcessor}, undefined),
    put({This, vertexOpenGLProcessor}, undefined),
    put({This, useProgramShaderOpenGLProcessor}, 'NullOpenGLProcessorFactory':getInstance()),
    put({This, shaderMatrixOpenGLProcessor}, 'NullOpenGLProcessorFactory':getInstance()),
    put({This, colorEnableVertexAttribArrayOpenGLProcessor}, 'NullOpenGLProcessorFactory':getInstance()),
    put({This, normalEnableVertexAttribArrayOpenGLProcessor}, 'NullOpenGLProcessorFactory':getInstance()),
    put({This, vertexEnableVertexAttribArrayOpenGLProcessor}, 'NullOpenGLProcessorFactory':getInstance()),
    put({This, textureEnableVertexAttribArrayOpenGLProcessor}, 'NullOpenGLProcessorFactory':getInstance()),
    put({This, colorDisableVertexAttribArrayOpenGLProcessor}, 'NullOpenGLProcessorFactory':getInstance()),
    put({This, normalDisableVertexAttribArrayOpenGLProcessor}, 'NullOpenGLProcessorFactory':getInstance()),
    put({This, vertexDisableVertexAttribArrayOpenGLProcessor}, 'NullOpenGLProcessorFactory':getInstance()),
    put({This, textureDisableVertexAttribArrayOpenGLProcessor}, 'NullOpenGLProcessorFactory':getInstance()),
    put({This, uniformLightPositionOpenGLProcessor}, 'NullOpenGLTextureProcessor':getInstance()),
    put({This, uniformLightColorOpenGLProcessor}, 'NullOpenGLTextureProcessor':getInstance()),
    put({This, uniformCameraPositionOpenGLProcessor}, 'NullOpenGLTextureProcessor':getInstance()),
    put({This, uniformTextureUnitOpenGLProcessor}, 'NullOpenGLTextureProcessor':getInstance()),
    put({This, programHandle}, 0),
    ok.


new(RequiresOpenGLVersion, ShaderArray, CompositeShaderUpdater, ShaderInitializer, ModelViewProjection, ColorOpenGLProcessor, VertexOpenGLProcessor, DisableProgramShaderOpenGLProcessor) when (is_list(RequiresOpenGLVersion) orelse RequiresOpenGLVersion =:= undefined), (is_tuple(ShaderArray) orelse ShaderArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, RequiresOpenGLVersion, ShaderArray, CompositeShaderUpdater, ShaderInitializer, ModelViewProjection, ColorOpenGLProcessor, VertexOpenGLProcessor, DisableProgramShaderOpenGLProcessor),
    This.

init(This, RequiresOpenGLVersion, ShaderArray, CompositeShaderUpdater, ShaderInitializer, ModelViewProjection, ColorOpenGLProcessor, VertexOpenGLProcessor, DisableProgramShaderOpenGLProcessor) when (is_list(RequiresOpenGLVersion) orelse RequiresOpenGLVersion =:= undefined), (is_tuple(ShaderArray) orelse ShaderArray =:= undefined) ->
    init_fields(This),
        put({This, requiresOpenGLVersion}, RequiresOpenGLVersion),
        put({This, shaderArray}, ShaderArray),
        put({This, shaderInitializer}, ShaderInitializer),
        put({This, compositeShaderUpdater}, CompositeShaderUpdater),
        put({This, modelViewProjection}, ModelViewProjection),
        put({This, colorOpenGLProcessor}, ColorOpenGLProcessor),
        put({This, vertexOpenGLProcessor}, VertexOpenGLProcessor),
        put({This, disableProgramShaderOpenGLProcessor}, DisableProgramShaderOpenGLProcessor).

init(This, Gl) ->
        put({This, programHandle}, (get({get({This, shaderInitializer}), '$class'})):init(get({This, shaderInitializer}), Gl, get({This, shaderArray}), get({get({This, compositeShaderUpdater}), attributeArray}))).

