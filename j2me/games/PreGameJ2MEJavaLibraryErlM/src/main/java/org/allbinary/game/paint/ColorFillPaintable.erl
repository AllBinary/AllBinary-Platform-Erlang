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
% import org.allbinary.graphics.displayable.DisplayInfoSingleton

-module('ColorFillPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ColorFillBasePaintable', Function, Arguments).

init_fields(This) ->
    put({This, displayInfoSingleton}, 'DisplayInfoSingleton':getInstance()),
    ok.


new(BasicColor) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, BasicColor),
    This.

'$init'(This, BasicColor) ->
        'ColorFillBasePaintable':'$init'(This, BasicColor),
        init_fields(This).

paint(This, Graphics) ->
        (get({Graphics, '$class'})):setColor(Graphics, get({This, colorP})),
        (get({Graphics, '$class'})):fillRect(Graphics, 0, 0, (get({get({This, displayInfoSingleton}), '$class'})):getLastWidth(get({This, displayInfoSingleton})), (get({get({This, displayInfoSingleton}), '$class'})):getLastHeight(get({This, displayInfoSingleton}))).

