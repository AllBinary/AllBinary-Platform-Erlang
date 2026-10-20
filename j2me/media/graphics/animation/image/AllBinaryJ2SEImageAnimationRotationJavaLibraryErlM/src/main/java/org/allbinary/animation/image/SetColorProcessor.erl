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
% package org.allbinary.animation.image
% import javax.microedition.lcdui.Image
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.media.image.ImageModifierUtil

-module('SetColorProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ModifierBaseProcessor', Function, Arguments).

static_init() ->
    put({?MODULE, instanceC}, 'SetColorProcessor':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'ModifierBaseProcessor':'$init'(This),
    init_fields(This).


getInstance() ->
        get({'SetColorProcessor', instanceC}).

updateColor(This, ImageModifierUtil, OriginalImage, ImageToShow, Index, BasicColor) when is_integer(Index) ->
        (get({ImageModifierUtil, '$class'})):setColor(ImageModifierUtil, OriginalImage, ImageToShow, Index, BasicColor).

