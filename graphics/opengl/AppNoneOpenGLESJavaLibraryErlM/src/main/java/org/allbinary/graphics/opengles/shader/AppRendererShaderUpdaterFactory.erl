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

-module('AppRendererShaderUpdaterFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ShaderUpdater', Function, Arguments).

static_init() ->
    put({?MODULE, instanceC}, 'AppRendererShaderUpdaterFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'NULL_SHADER_COMPOSITE_ARRAY'}, array:new(0, {default, undefined})),
    put({This, shaderCompositeArray}, get({This, 'NULL_SHADER_COMPOSITE_ARRAY'})),
    put({This, shaderOpenGLProcessorArray}, array:new(0, {default, undefined})),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'ShaderUpdater':'$init'(This),
    init_fields(This).


getInstance() ->
        get({'AppRendererShaderUpdaterFactory', instanceC}).

getTestShaders(This) ->
        get({This, shaderOpenGLProcessorArray}).

setShaderComposite(This, Object3d) ->
        ok.

