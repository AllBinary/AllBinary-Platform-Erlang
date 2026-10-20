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

-module('OpenGLVUtilBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


glTexEnvix(This, Gl, Target, Pname, Param) when is_integer(Target), is_integer(Pname), is_integer(Param) ->
        ok.

glTexParameterix(This, Gl, Target, Pname, Param) when is_integer(Target), is_integer(Pname), is_integer(Param) ->
        ok.

glGenerateMipmap(This, Gl, TextureId, Target, GenerateMipMap) when is_integer(TextureId), is_integer(Target), is_boolean(GenerateMipMap) ->
        ok.

