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
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListUtil

-module('Shader').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, shaderName}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, shaderStringList}, (fun(Target_N65741) -> (get({Target_N65741, '$class'})):getImmutableInstance(Target_N65741) end)('BasicArrayListUtil':getInstance())),
    put({This, shaderAsString}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, shaderHandle}, 0),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


