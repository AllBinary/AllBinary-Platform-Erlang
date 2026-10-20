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
% package org.allbinary.game.layer
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.GPoint
% import org.allbinary.layer.Layer

-module('LinePathRelativeAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('LinePathAnimation', Function, Arguments).

static_init() ->
    put({?MODULE, instanceC}, 'LinePathRelativeAnimation':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'LinePathAnimation':'$init'(This),
    init_fields(This).


getInstance() ->
        get({'LinePathRelativeAnimation', instanceC}).

paint(This, Graphics, Point, NextPoint, TiledLayer) ->
        (get({Graphics, '$class'})):drawLine(Graphics, ((get({NextPoint, '$class'})):getX(NextPoint) - (get({TiledLayer, '$class'})):getXP(TiledLayer)), ((get({NextPoint, '$class'})):getY(NextPoint) - (get({TiledLayer, '$class'})):getYP(TiledLayer)), ((get({Point, '$class'})):getX(Point) - (get({TiledLayer, '$class'})):getXP(TiledLayer)), ((get({Point, '$class'})):getY(Point) - (get({TiledLayer, '$class'})):getYP(TiledLayer))).

