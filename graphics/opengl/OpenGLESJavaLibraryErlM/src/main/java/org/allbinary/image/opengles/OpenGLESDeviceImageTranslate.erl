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

-module('OpenGLESDeviceImageTranslate').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('OpenGLESImageTranslate', Function, Arguments).

init_fields(This) ->
    put({This, translateX}, 0.0),
    put({This, translateY}, 0.0),
    put({This, translateX2}, 0.0),
    put({This, translateY2}, 0.0),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'OpenGLESImageTranslate':init(This),
    init_fields(This).


translate(This, Gl, OpenGLESImage, X, Y) when is_number(X), is_number(Y) ->
        (get({get({OpenGLESImage, imageProcessor}), '$class'})):translate(get({OpenGLESImage, imageProcessor}), Gl, (get({This, translateX}) + ((get({get({OpenGLESImage, openGLESImageProperties}), scaleX}) * X))), (get({This, translateY}) + ((get({get({OpenGLESImage, openGLESImageProperties}), scaleY}) * Y)))).

translate2(This, Gl, OpenGLESImage) ->
        (get({get({OpenGLESImage, imageProcessor}), '$class'})):translate(get({OpenGLESImage, imageProcessor}), Gl, get({This, translateX2}), get({This, translateY2})).

