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
% package org.allbinary.graphics.opengles
% import javax.microedition.khronos.opengles.GL10
% import org.allbinary.graphics.threed.min3d.renderer.processor.ObjectThreedOpenGLProcessor

-module('ColorAttributePointerOpenGLProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ObjectThreedOpenGLProcessor', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'ColorAttributePointerOpenGLProcessor':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'ColorAttributePointerOpenGLProcessor', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'ObjectThreedOpenGLProcessor':init(This),
    init_fields(This),
        ok.

process(This, Gl, AnyType) ->
        erlang:error({'RuntimeException'}).

