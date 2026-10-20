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
% package org.allbinary.game.paint
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.color.ColorCompositeInterface
% import org.allbinary.graphics.paint.Paintable

-module('ColorFillBasePaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ColorCompositeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Paintable', Function, Arguments).

init_fields(This) ->
    put({This, basicColor}, get({'BasicColorFactory':getInstance(), 'WHITE'})),
    put({This, colorP}, 0),
    ok.


new(BasicColor) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, BasicColor),
    This.

'$init'(This, BasicColor) ->
    'Paintable':'$init'(This),
    init_fields(This),
        (get({This, '$class'})):setBasicColorP(This, BasicColor).

setBasicColorP(This, BasicColor) ->
        put({This, basicColor}, BasicColor),
        (get({This, '$class'})):setColor(This, (fun(Target_N65949) -> (get({Target_N65949, '$class'})):intValue(Target_N65949) end)((get({This, '$class'})):getBasicColorP(This))).

getBasicColorP(This) ->
        get({This, basicColor}).

getColor(This) ->
        get({This, colorP}).

setColor(This, Color) when is_integer(Color) ->
        put({This, colorP}, Color).

paint(This, Graphics) ->
        ok.

