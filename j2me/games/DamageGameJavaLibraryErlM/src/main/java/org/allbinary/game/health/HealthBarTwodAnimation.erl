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
% package org.allbinary.game.health
% import javax.microedition.lcdui.Graphics
% import org.allbinary.layer.AllBinaryLayer

-module('HealthBarTwodAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HealthBarAnimation', Function, Arguments).

init_fields(This) ->
    ok.


new(LayerInterface, Location) when is_integer(Location) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, LayerInterface, Location),
    This.

init(This, LayerInterface, Location) when is_integer(Location) ->
        'HealthBarAnimation':init(This, LayerInterface, Location).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        Ax = (fun(Target_N65774) -> (get({Target_N65774, '$class'})):getX(Target_N65774) end)((get({get({This, allbinaryLayer}), '$class'})):getViewPosition(get({This, allbinaryLayer}))),
        (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP3(get({This, basicSetColorUtil}), Graphics, get({This, basicColor}), get({This, colorP})),
        (get({Graphics, '$class'})):fillRect(Graphics, Ax, ((get({This, '$class'})):getY(This) - 1), get({This, x2}), get({This, thickness})).

