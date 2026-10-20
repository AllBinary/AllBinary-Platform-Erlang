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

-module('OverScanColorFillPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ColorFillPaintable', Function, Arguments).

init_fields(This) ->
    ok.


new(BasicColor) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, BasicColor),
    This.

'$init'(This, BasicColor) ->
        'ColorFillPaintable':'$init'(This, BasicColor).

paint(This, Graphics) ->
        (get({Graphics, '$class'})):setColor(Graphics, get({This, colorP})),
        (get({Graphics, '$class'})):fillRect(Graphics, (-(get({Graphics, '$class'})):getClipX(Graphics)), (-(get({Graphics, '$class'})):getClipY(Graphics)), ((get({get({This, displayInfoSingleton}), '$class'})):getLastWidth(get({This, displayInfoSingleton})) + (((get({Graphics, '$class'})):getClipX(Graphics) * 2))), ((get({get({This, displayInfoSingleton}), '$class'})):getLastHeight(get({This, displayInfoSingleton})) + (((get({Graphics, '$class'})):getClipY(Graphics) * 2)))).

