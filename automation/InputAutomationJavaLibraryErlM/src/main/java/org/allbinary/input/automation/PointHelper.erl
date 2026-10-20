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
% package org.allbinary.input.automation
% import java.awt

-module('PointHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, two}, 2.0),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getCenterPoint(Rectangle) ->
        X = ((get({Rectangle, '$class'})):getX(Rectangle) + ((get({Rectangle, '$class'})):getWidth(Rectangle) / get({'PointHelper', two}))),
        Y = ((get({Rectangle, '$class'})):getY(Rectangle) + ((get({Rectangle, '$class'})):getHeight(Rectangle) / get({'PointHelper', two}))),
        'PointFactory':getInstance(trunc(X), trunc(Y)).

