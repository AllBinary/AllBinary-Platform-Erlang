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
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonSeps

-module('CompositeShaderUpdater').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ShaderUpdater', Function, Arguments).

static_init() ->
    put({?MODULE, instanceC}, 'CompositeShaderUpdater':new((fun(Target_N65879) -> (get({Target_N65879, '$class'})):getArrayInstance(Target_N65879) end)('StringUtil':getInstance()), (fun(Target_N65903) -> (get({Target_N65903, '$class'})):getArrayInstance(Target_N65903) end)('StringUtil':getInstance()), (fun(Target_N65927) -> (get({Target_N65927, '$class'})):getArrayInstance(Target_N65927) end)('StringUtil':getInstance()), get({'NullUtil':getInstance(), 'NULL_INT_ARRAY'}))),
    ok.

init_fields(This) ->
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    put({This, shaderStrings}, 'ShaderStrings':getInstance()),
    put({This, uniformBlockHandleArray}, undefined),
    put({This, uniformBlockArray}, undefined),
    put({This, uniformHandleArray}, undefined),
    put({This, uniformArray}, undefined),
    put({This, attributeHandleArray}, undefined),
    put({This, attributeArray}, undefined),
    ok.


getInstance() ->
        get({'CompositeShaderUpdater', instanceC}).

new(UniformBlockArray, UniformArray, AttributeArray, AttributeHandleArray) when (is_tuple(UniformBlockArray) orelse UniformBlockArray =:= undefined), (is_tuple(UniformArray) orelse UniformArray =:= undefined), (is_tuple(AttributeArray) orelse AttributeArray =:= undefined), (is_tuple(AttributeHandleArray) orelse AttributeHandleArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, UniformBlockArray, UniformArray, AttributeArray, AttributeHandleArray),
    This.

'$init'(This, UniformBlockArray, UniformArray, AttributeArray, AttributeHandleArray) when (is_tuple(UniformBlockArray) orelse UniformBlockArray =:= undefined), (is_tuple(UniformArray) orelse UniformArray =:= undefined), (is_tuple(AttributeArray) orelse AttributeArray =:= undefined), (is_tuple(AttributeHandleArray) orelse AttributeHandleArray =:= undefined) ->
    'ShaderUpdater':'$init'(This),
    init_fields(This),
        put({This, uniformBlockArray}, UniformBlockArray),
        put({This, uniformBlockHandleArray}, array:new(array:size(get({This, uniformBlockArray})), {default, 0})),
        put({This, uniformArray}, UniformArray),
        put({This, uniformHandleArray}, array:new(array:size(get({This, uniformArray})), {default, 0})),
        put({This, attributeArray}, AttributeArray),
        put({This, attributeHandleArray}, AttributeHandleArray).

onSurfaceCreated(This, Gl, EglConfig, ProgramHandle) when is_integer(ProgramHandle) ->
        ok.

onSurfaceDestroyed(This, Gl) ->
        ok.

