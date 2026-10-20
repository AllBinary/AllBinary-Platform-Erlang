% 
% AllBinary Open License Version 1 
% Copyright (c) 2026 AllBinary 
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
% package org.allbinary.animation

-module('ShapeTypeFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ShapeTypeFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'KEY_LINE'}, "line"),
    put({This, 'KEY_CIRCLE'}, "circle"),
    put({This, 'KEY_RECTANGLE'}, "rectangle"),
    put({This, 'KEY_RECT'}, "rect"),
    put({This, 'LINE'}, 'ShapeType':new(get({This, 'KEY_LINE'}))),
    put({This, 'CIRCLE'}, 'ShapeType':new(get({This, 'KEY_CIRCLE'}))),
    put({This, 'RECTANGLE'}, 'ShapeType':new(get({This, 'KEY_RECTANGLE'}))),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'ShapeTypeFactory', instance}).

