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
% package org.allbinary.view
% import org.allbinary.graphics.GPoint

-module('ViewPositionBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GPoint', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_VIEW_POSITION'}, 'ViewPositionBase':new(0, 0, 0)),
    ok.

init_fields(This) ->
    ok.


new(X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, X, Y, Z),
    This.

'$init'(This, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        'GPoint':'$init'(This, X, Y, Z).

getX2(This) ->
        (get({This, '$class'})):getX(This).

getY2(This) ->
        (get({This, '$class'})):getY(This).

getZ2(This) ->
        (get({This, '$class'})):getZ(This).

setAllbinaryLayer(This, AllbinaryLayer) ->
        ok.

