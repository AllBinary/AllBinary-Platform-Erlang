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
% package org.allbinary.image.opengles
% import javax.microedition.khronos.opengles.GL10

-module('OpenGLESImageTranslate').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OpenGLESImageTranslate':new()),
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
        get({'OpenGLESImageTranslate', instance}).

translate(This, Gl, OpenGLESImage, X, Y) when is_number(X), is_number(Y) ->
        (get({get({OpenGLESImage, imageProcessor}), '$class'})):translate(get({OpenGLESImage, imageProcessor}), Gl, X, Y).

translate2(This, Gl, OpenGLESImage) ->
        ok.

