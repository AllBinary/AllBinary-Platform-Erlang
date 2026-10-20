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
% package org.allbinary.graphics.threed
% import javax.microedition.lcdui.Font
% import javax.microedition.midlet.MIDlet

-module('SWTJOGLProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements Runnable

static_init() ->
    put({?MODULE, instance}, 'SWTJOGLProcessor':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'SWTJOGLProcessor', instance}).

init(This, Display, Comp) ->
        ok.

isHolderCreated(This) ->
        true.

setRenderer(This, Renderer) ->
        ok.

isJOGL(This) ->
        false.

createSurface(This) ->
        ok.

onSurfaceCreated(This) ->
        ok.

onSurfaceChangedForEvent(This, Event) ->
        ok.

onSurfaceChanged(This) ->
        ok.

onSurfaceChangedWH(This, Width, Height) when is_integer(Width), is_integer(Height) ->
        ok.

addListener(This) ->
        ok.

addListeners(This, Midlet) ->
        ok.

run(This) ->
        ok.

clear(This) ->
        ok.

setCustom(This, Width, Height, Ratio) when is_integer(Width), is_integer(Height), is_number(Ratio) ->
        ok.

setRatioProcessor(This, RatioProcessor) ->
        ok.

isPortraitRatioProcessor(This) ->
        true.

charWidth(This, Font, Ch) when is_integer(Ch) ->
        erlang:error({'RuntimeException'}).

charsWidth(This, Font, Ch, Offset, Length) when (is_tuple(Ch) orelse Ch =:= undefined), is_integer(Offset), is_integer(Length) ->
        erlang:error({'RuntimeException'}).

stringWidth(This, Font, Str) when (is_list(Str) orelse Str =:= undefined) ->
        erlang:error({'RuntimeException'}).

substringWidth(This, Font, Str, Offset, Len) when (is_list(Str) orelse Str =:= undefined), is_integer(Offset), is_integer(Len) ->
        erlang:error({'RuntimeException'}).

