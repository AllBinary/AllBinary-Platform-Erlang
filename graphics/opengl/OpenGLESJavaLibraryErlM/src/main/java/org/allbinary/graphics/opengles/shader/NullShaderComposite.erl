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
% import org.allbinary.graphics.opengles.NullOpenGLProcessorFactory
% import org.allbinary.graphics.opengles.OpenGLCapabilities
% import org.allbinary.graphics.opengles.OpenGLProcessor

-module('NullShaderComposite').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ShaderComposite', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'NullShaderComposite':new(get({'OpenGLCapabilities':getInstance(), 'VERSION_2_0'}), array:from_list(['Shader':new(), 'Shader':new()]), 'CompositeShaderUpdater':getInstance(), 'ShaderInitializer':getInstance(), 'ModelViewProjection':getInstance(), 'NullOpenGLProcessorFactory':getInstance(), 'NullOpenGLProcessorFactory':getInstance(), 'NullOpenGLProcessorFactory':getInstance()) % Java anonymous class body: implement it as a module
%         ok % init
),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'NullShaderComposite', instance}).

new(RequiresOpenGLVersion, ShaderArray, CompositeShaderUpdater, ShaderInitializer, ModelViewProjection, ColorOpenGLProcessor, VertexOpenGLProcessor, DisableProgramShaderOpenGLProcessor) when (is_list(RequiresOpenGLVersion) orelse RequiresOpenGLVersion =:= undefined), (is_tuple(ShaderArray) orelse ShaderArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, RequiresOpenGLVersion, ShaderArray, CompositeShaderUpdater, ShaderInitializer, ModelViewProjection, ColorOpenGLProcessor, VertexOpenGLProcessor, DisableProgramShaderOpenGLProcessor),
    This.

init(This, RequiresOpenGLVersion, ShaderArray, CompositeShaderUpdater, ShaderInitializer, ModelViewProjection, ColorOpenGLProcessor, VertexOpenGLProcessor, DisableProgramShaderOpenGLProcessor) when (is_list(RequiresOpenGLVersion) orelse RequiresOpenGLVersion =:= undefined), (is_tuple(ShaderArray) orelse ShaderArray =:= undefined) ->
        'ShaderComposite':init(This, RequiresOpenGLVersion, ShaderArray, CompositeShaderUpdater, ShaderInitializer, ModelViewProjection, ColorOpenGLProcessor, VertexOpenGLProcessor, DisableProgramShaderOpenGLProcessor),
        put({This, useProgramShaderOpenGLProcessor}, 'NullOpenGLProcessorFactory':getInstance()).

