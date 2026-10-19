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
% package org.allbinary.graphics.opengles.renderer
% import javax.microedition.khronos.opengles.GL10
% import javax.microedition.lcdui.Image
% import org.allbinary.image.opengles.OpenGLESImage
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('AllBinaryRendererBase3').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, list}, 'BasicArrayListD':new()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


% throws Exception
update(This, Gl) ->
        (fun Loop() -> case ((get({get({This, list}), '$class'})):size(get({This, list})) > 0) of true ->
            OpenGLESImage = (get({get({This, list}), '$class'})):removeAt(get({This, list}), 0),
            case (OpenGLESImage =/= undefined) of
                true ->
                (get({OpenGLESImage, '$class'})):set(OpenGLESImage, Gl);
                false -> ok
            end,
            Loop();
        false -> ok end end)().

add(This, Image) ->
        (get({get({This, list}), '$class'})):add(get({This, list}), Image).

