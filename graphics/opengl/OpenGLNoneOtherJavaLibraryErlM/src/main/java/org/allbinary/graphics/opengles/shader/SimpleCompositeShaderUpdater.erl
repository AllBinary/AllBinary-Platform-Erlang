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

-module('SimpleCompositeShaderUpdater').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CompositeShaderUpdater', Function, Arguments).

init_fields(This) ->
    ok.


new(UniformBlockArray, UniformArray, AttributeArray, AttributeHandleArray) when (is_tuple(UniformBlockArray) orelse UniformBlockArray =:= undefined), (is_tuple(UniformArray) orelse UniformArray =:= undefined), (is_tuple(AttributeArray) orelse AttributeArray =:= undefined), (is_tuple(AttributeHandleArray) orelse AttributeHandleArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, UniformBlockArray, UniformArray, AttributeArray, AttributeHandleArray),
    This.

'$init'(This, UniformBlockArray, UniformArray, AttributeArray, AttributeHandleArray) when (is_tuple(UniformBlockArray) orelse UniformBlockArray =:= undefined), (is_tuple(UniformArray) orelse UniformArray =:= undefined), (is_tuple(AttributeArray) orelse AttributeArray =:= undefined), (is_tuple(AttributeHandleArray) orelse AttributeHandleArray =:= undefined) ->
        'CompositeShaderUpdater':'$init'(This, UniformBlockArray, UniformArray, AttributeArray, AttributeHandleArray).

