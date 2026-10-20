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
% import javax.microedition.lcdui.Canvas
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Image
% import javax.microedition.lcdui.NullCanvas
% import javax.microedition.lcdui.NullImage
% import org.allbinary.graphics.Anchor
% import org.allbinary.graphics.displayable.MyCanvas
% import org.allbinary.graphics.paint.ProcessPaintable
% import org.allbinary.util.CircularIndexUtil

-module('BufferedGameCanvasPaintHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ProcessPaintable', Function, Arguments).

static_init() ->
    put({?MODULE, 'MAX_IMAGES'}, 4),
    ok.

init_fields(This) ->
    put({This, gameCanvas}, get({'NullCanvas', 'NULL_CANVAS'})),
    put({This, offScreenImage}, array:new(get({'BufferedGameCanvasPaintHelper', 'MAX_IMAGES'}), {default, undefined})),
    put({This, previousImage}, get({'NullImage', 'NULL_IMAGE'})),
    put({This, circularIndexUtil}, 'CircularIndexUtil':createInstance(get({'BufferedGameCanvasPaintHelper', 'MAX_IMAGES'}))),
    put({This, drawCircularIndexUtil}, 'CircularIndexUtil':createInstanceAt((get({'BufferedGameCanvasPaintHelper', 'MAX_IMAGES'}) - 1), get({'BufferedGameCanvasPaintHelper', 'MAX_IMAGES'}))),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    ok.


new(GameCanvas) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GameCanvas),
    This.

'$init'(This, GameCanvas) ->
    'ProcessPaintable':'$init'(This),
    init_fields(This),
        erlang:error({'Exception', "No Longer Used"}).

process(This) ->
        MyCanvas = (get({This, gameCanvas})),
        (get({MyCanvas, '$class'})):draw(MyCanvas, (fun(Target_N66370) -> (get({Target_N66370, '$class'})):getGraphics(Target_N66370) end)(array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, offScreenImage})))),
        (get({get({This, circularIndexUtil}), '$class'})):next(get({This, circularIndexUtil})),
        (get({get({This, drawCircularIndexUtil}), '$class'})):next(get({This, drawCircularIndexUtil})).

paint(This, Graphics) ->
        put({This, previousImage}, array:get((get({get({This, drawCircularIndexUtil}), '$class'})):getIndex(get({This, drawCircularIndexUtil})), get({This, offScreenImage}))),
        (get({Graphics, '$class'})):drawImage(Graphics, get({This, previousImage}), 0, 0, get({This, anchor})).

