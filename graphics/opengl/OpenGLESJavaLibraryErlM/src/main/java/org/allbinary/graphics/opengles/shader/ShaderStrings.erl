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

-module('ShaderStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ShaderStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'NO_PROGRAM_HANDLE'}, "No program handle"),
    put({This, 'UNIFORM_BLOCK_HANDLE'}, "Uniform Block Handle: "),
    put({This, 'UNIFORM_HANDLE'}, "Uniform Handle: "),
    put({This, 'UNIFORM_ATTRIBUTE_HANDLE'}, "Uniform Attribute Handle: "),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'ShaderStrings', instance}).

