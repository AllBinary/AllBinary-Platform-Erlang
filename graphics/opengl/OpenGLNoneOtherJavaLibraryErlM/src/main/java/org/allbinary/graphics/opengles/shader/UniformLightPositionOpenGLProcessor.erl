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

-module('UniformLightPositionOpenGLProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('OpenGLObject3dProcessor', Function, Arguments).

init_fields(This) ->
    ok.


new(ShaderComposite, HandleIndex) when is_integer(HandleIndex) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ShaderComposite, HandleIndex),
    This.

'$init'(This, ShaderComposite, HandleIndex) when is_integer(HandleIndex) ->
    'OpenGLObject3dProcessor':'$init'(This),
    init_fields(This),
        ok.

process(This, Gl, Unused) ->
        ok.

