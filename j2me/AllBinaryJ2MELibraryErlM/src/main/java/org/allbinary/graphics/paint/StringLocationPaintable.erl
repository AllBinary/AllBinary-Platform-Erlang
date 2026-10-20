%
% AllBinary Open License Version 1
% Copyright (c) 2011 AllBinary
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
% package org.allbinary.graphics.paint
% import javax.microedition.lcdui.Graphics

-module('StringLocationPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('LocationPaintable', Function, Arguments).

init_fields(This) ->
    put({This, value}, undefined),
    ok.


new(Value) when (is_list(Value) orelse Value =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Value),
    This.

'$init'(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    'LocationPaintable':'$init'(This),
    init_fields(This),
        put({This, value}, Value).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({Graphics, '$class'})):drawString(Graphics, get({This, value}), X, Y, 0).

