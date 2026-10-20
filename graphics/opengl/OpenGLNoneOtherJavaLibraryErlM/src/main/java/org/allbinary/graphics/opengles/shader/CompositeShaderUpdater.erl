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
    put({?MODULE, instanceC}, 'CompositeShaderUpdater':new((fun(Target_N65829) -> (get({Target_N65829, '$class'})):getArrayInstance(Target_N65829) end)('StringUtil':getInstance()), (fun(Target_N65853) -> (get({Target_N65853, '$class'})):getArrayInstance(Target_N65853) end)('StringUtil':getInstance()), (fun(Target_N65877) -> (get({Target_N65877, '$class'})):getArrayInstance(Target_N65877) end)('StringUtil':getInstance()), get({'NullUtil':getInstance(), 'NULL_INT_ARRAY'}))),
    ok.

init_fields(This) ->
    put({This, commonSeps}, 'CommonSeps':getInstance()),
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
        ok.

onSurfaceCreated(This, Gl, EglConfig, ProgramHandle) when is_integer(ProgramHandle) ->
        ok.

onSurfaceDestroyed(This, Gl) ->
        ok.

