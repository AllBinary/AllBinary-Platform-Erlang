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
% package org.allbinary.game.displayable.canvas
% import javax.microedition.lcdui.CommandListener
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.paint.ColorFillBasePaintable
% import org.allbinary.game.paint.ColorFillPaintableFactory
% import org.allbinary.graphics.paint.Paintable

-module('BasicPaintablesCanvas').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GameCommandCanvas', Function, Arguments).

init_fields(This) ->
    put({This, paintableArray}, undefined),
    put({This, colorFillPaintable}, undefined),
    ok.


new(CmdListener, Name, AllBinaryGameLayerManager, PaintableArray) when (is_list(Name) orelse Name =:= undefined), (is_tuple(PaintableArray) orelse PaintableArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CmdListener, Name, AllBinaryGameLayerManager, PaintableArray),
    This.

'$init'(This, CmdListener, Name, AllBinaryGameLayerManager, PaintableArray) when (is_list(Name) orelse Name =:= undefined), (is_tuple(PaintableArray) orelse PaintableArray =:= undefined) ->
        'GameCommandCanvas':'$init'(This, CmdListener, Name, (get({AllBinaryGameLayerManager, '$class'})):getBackgroundBasicColor(AllBinaryGameLayerManager), (get({AllBinaryGameLayerManager, '$class'})):getForegroundBasicColor(AllBinaryGameLayerManager)),
        init_fields(This),
        put({This, paintableArray}, PaintableArray),
        put({This, colorFillPaintable}, (fun(Target_N65952) -> (get({Target_N65952, '$class'})):getInstance(Target_N65952, (get({AllBinaryGameLayerManager, '$class'})):getBackgroundBasicColor(AllBinaryGameLayerManager), false) end)('ColorFillPaintableFactory':getInstance())).

paint(This, Graphics) ->
        (get({get({This, colorFillPaintable}), '$class'})):paint(get({This, colorFillPaintable}), Graphics),
        (get({Graphics, '$class'})):setColor(Graphics, get({This, foregroundColor})),
        lists:foreach(fun(Index) ->
            (fun(Target_N66217) -> (get({Target_N66217, '$class'})):paint(Target_N66217, Graphics) end)(array:get(Index, get({This, paintableArray})))
        end, lists:seq((array:size(get({This, paintableArray})) - 1), 0, -1)),
        'GameCommandCanvas':paint(This, Graphics).

