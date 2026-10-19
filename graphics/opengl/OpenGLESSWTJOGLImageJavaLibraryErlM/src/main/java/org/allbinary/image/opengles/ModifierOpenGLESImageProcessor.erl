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

-module('ModifierOpenGLESImageProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('OpenGLESImageProcessor', Function, Arguments).

static_init() ->
    put({?MODULE, instanceC}, 'ModifierOpenGLESImageProcessor':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'OpenGLESImageProcessor':init(This),
    init_fields(This).


getInstance() ->
        get({'ModifierOpenGLESImageProcessor', instanceC}).

colorMask(This, Gl, Red, Green, Blue, Alpha) when is_number(Red), is_number(Green), is_number(Blue), is_number(Alpha) ->
        (get({Gl, '$class'})):glColor4f(Gl, Red, Green, Blue, Alpha).

