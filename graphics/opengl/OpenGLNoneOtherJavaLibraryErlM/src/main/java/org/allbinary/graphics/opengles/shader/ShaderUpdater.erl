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
% import javax.microedition.khronos.egl.EGLConfig
% import javax.microedition.khronos.opengles.GL10
% import org.allbinary.graphics.opengles.renderer.RendererStrings
% import org.allbinary.string.CommonStrings

-module('ShaderUpdater').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ShaderUpdater':new()),
    ok.

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, rendererStrings}, 'RendererStrings':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'ShaderUpdater', instance}).

onSurfaceCreated(This, Gl, EglConfig) ->
        ok.

