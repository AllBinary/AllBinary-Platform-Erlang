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
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList

-module('ShaderManager').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ShaderManager':new((-1), (-1))),
    ok.

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, 'LOAD_SHADER'}, "loadShader"),
    put({This, '__VERSION__'}, "__VERSION__"),
    put({This, 'GL_VERTEX_SHADER'}, 0),
    put({This, 'GL_FRAGMENT_SHADER'}, 0),
    ok.


getInstance() ->
        get({'ShaderManager', instance}).

new(GL_VERTEX_SHADER, GL_FRAGMENT_SHADER) when is_integer(GL_VERTEX_SHADER), is_integer(GL_FRAGMENT_SHADER) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GL_VERTEX_SHADER, GL_FRAGMENT_SHADER),
    This.

'$init'(This, GL_VERTEX_SHADER, GL_FRAGMENT_SHADER) when is_integer(GL_VERTEX_SHADER), is_integer(GL_FRAGMENT_SHADER) ->
    init_fields(This),
        put({This, 'GL_VERTEX_SHADER'}, GL_VERTEX_SHADER),
        put({This, 'GL_FRAGMENT_SHADER'}, GL_FRAGMENT_SHADER).

load(This, Gl, Resource, ShaderAsStringArray, ShaderType) when (is_list(Resource) orelse Resource =:= undefined), (is_tuple(ShaderAsStringArray) orelse ShaderAsStringArray =:= undefined), is_integer(ShaderType) ->
        (-1).

loadShader(This, Gl, Resource, StringList, ShaderType) when (is_list(Resource) orelse Resource =:= undefined), is_integer(ShaderType) ->
        (-1).

