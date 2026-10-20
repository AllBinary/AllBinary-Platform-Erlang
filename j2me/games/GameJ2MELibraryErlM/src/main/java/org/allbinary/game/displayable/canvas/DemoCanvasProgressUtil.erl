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
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
% import org.allbinary.graphics.paint.PaintableComposite
% import org.allbinary.graphics.paint.PaintableInterface

-module('DemoCanvasProgressUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


showProgress(DemoCanvas) ->
        'DemoCanvasProgressUtil':showProgressOptionallyInTheBackground(DemoCanvas, false).

showProgressOptionallyInTheBackground(DemoCanvas, Background) when is_boolean(Background) ->
        ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
        (get({ProgressCanvas, '$class'})):startBackground(ProgressCanvas, Background),
        PaintableArray = array:new(2, {default, undefined}),
        array:set(0, ProgressCanvas, PaintableArray),
        array:set(1, (get({DemoCanvas, '$class'})):getDefaultPaintableInterface(DemoCanvas), PaintableArray),
        (get({DemoCanvas, '$class'})):setDefaultPaintableInterface(DemoCanvas, 'PaintableComposite':new(PaintableArray)),
        (get({DemoCanvas, '$class'})):setPaintableInterface(DemoCanvas, (get({DemoCanvas, '$class'})):getDefaultPaintableInterface(DemoCanvas)).

