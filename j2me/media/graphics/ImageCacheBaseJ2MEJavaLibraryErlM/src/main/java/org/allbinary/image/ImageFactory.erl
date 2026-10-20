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
% package org.allbinary.image
% import java.io.InputStream
% import javax.microedition.lcdui.Image

-module('ImageFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageFactory':new()),
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
        get({'ImageFactory', instance}).

% throws Exception
createImageUrl(This, Url) when (is_list(Url) orelse Url =:= undefined) ->
        'Image':createImage(Url).

% throws Exception
createImage(This, Caller, Width, Height) when (is_list(Caller) orelse Caller =:= undefined), is_integer(Width), is_integer(Height) ->
        'Image':createImage(Width, Height).

% throws Exception
createImageFromInputStream(This, Key, InputStream) ->
        Image = 'Image':createImage(InputStream),
        Image.

% throws Exception
createImageFromInputStream(This, InputStream) ->
        'Image':createImage(InputStream).

