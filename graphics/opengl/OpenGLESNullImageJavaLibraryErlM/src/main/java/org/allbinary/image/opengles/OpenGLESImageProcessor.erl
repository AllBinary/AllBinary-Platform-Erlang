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

-module('OpenGLESImageProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OpenGLESImageProcessor':new()),
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
        get({'OpenGLESImageProcessor', instance}).

translate(This, Gl, TranslateX, TranslateY) when is_number(TranslateX), is_number(TranslateY) ->
        ok.

rotate(This, Gl, Angle) when is_number(Angle) ->
        ok.

scale(This, Gl, ScaleX, ScaleY) when is_number(ScaleX), is_number(ScaleY) ->
        ok.

colorMask(This, Gl, Red, Green, Blue, Alpha) when is_number(Red), is_number(Green), is_number(Blue), is_number(Alpha) ->
        ok.

