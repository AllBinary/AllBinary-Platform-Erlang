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
% package org.allbinary.animation.caption
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.Animation
% import org.allbinary.graphics.color.BasicColor

-module('CaptionAnimationHelperBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Animation', Function, Arguments).

static_init() ->
    put({?MODULE, 'INSTANCE'}, 'CaptionAnimationHelperBase':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'Animation':'$init'(This),
    init_fields(This).


isShowing(This) ->
        false.

tick(This) ->
        ok.

update(This, Message, BasicColor) when (is_list(Message) orelse Message =:= undefined) ->
        ok.

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        ok.

