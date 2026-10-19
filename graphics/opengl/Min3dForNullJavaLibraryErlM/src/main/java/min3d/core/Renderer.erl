% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package min3d.core
% import javax.microedition.khronos.egl.EGLConfig
% import javax.microedition.khronos.opengles.GL10

-module('Renderer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


onSurfaceCreated(This, Gl, Config) ->
    erlang:error({abstract_method, onSurfaceCreated}).

onSurfaceChanged(This, Gl, Width, Height) when is_integer(Width), is_integer(Height) ->
    erlang:error({abstract_method, onSurfaceChanged}).

onDrawFrame(This, Gl) ->
    erlang:error({abstract_method, onDrawFrame}).

