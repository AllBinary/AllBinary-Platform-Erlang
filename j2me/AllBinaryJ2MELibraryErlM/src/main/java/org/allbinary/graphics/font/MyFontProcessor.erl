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
% package org.allbinary.graphics.font
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics

-module('MyFontProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'MyFontProcessor':new()),
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


defaultCharWidth(Font) ->
        (get({Font, '$class'})):charWidth(Font, $C).

defaultStringWidth(Font, Size) when is_integer(Size) ->
        ('MyFontProcessor':defaultCharWidth(Font) * Size).

getInstance() ->
        get({'MyFontProcessor', instance}).

process(This, Graphics) ->
        ok.

