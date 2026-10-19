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
% package org.allbinary.platform.graphics
% import javax.microedition.lcdui.Image
% import javax.microedition.lcdui.NullImage
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory

-module('PlatformBitmapBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NULL_PLATFORM_BITMAP_BASE'}, 'PlatformBitmapBase':new()),
    ok.

init_fields(This) ->
    put({This, alpha}, 255),
    put({This, basicColor}, get({'BasicColorFactory':getInstance(), 'NULL_COLOR'})),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getWidth(This) ->
        0.

getHeight(This) ->
        0.

getImage(This) ->
        get({'NullImage', 'NULL_IMAGE'}).

