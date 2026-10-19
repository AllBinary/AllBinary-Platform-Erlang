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
% package org.allbinary.image.opengles
% import javax.microedition.khronos.opengles.GL10

-module('OpenGLESImageDraw').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OpenGLESImageDraw':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'OpenGLESImageDraw', instance}).

drawRegion(This, Gl, ViewHeight, X_src, Y_src, Width, Height, X, Y, Z) when is_integer(ViewHeight), is_number(X_src), is_number(Y_src), is_number(Width), is_number(Height), is_integer(X), is_integer(Y), is_integer(Z) ->
        ok.

draw(This, Gl, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        ok.

