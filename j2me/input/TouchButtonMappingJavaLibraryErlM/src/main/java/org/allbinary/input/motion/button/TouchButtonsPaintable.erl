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
% package org.allbinary.input.motion.button
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorSetUtil
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.util.BasicArrayList

-module('TouchButtonsPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Paintable', Function, Arguments).

init_fields(This) ->
    put({This, foregroundBasicColor}, undefined),
    put({This, foregroundColor}, 0),
    put({This, basicSetColorUtil}, 'BasicColorSetUtil':getInstance()),
    put({This, touchButtonFactory}, 'TouchButtonFactory':getInstance()),
    ok.


new(BasicColor) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, BasicColor),
    This.

'$init'(This, BasicColor) ->
    'Paintable':'$init'(This),
    init_fields(This),
        put({This, foregroundBasicColor}, BasicColor),
        put({This, foregroundColor}, (get({BasicColor, '$class'})):intValue(BasicColor)).

paint(This, Graphics) ->
        List = (get({get({This, touchButtonFactory}), '$class'})):getList(get({This, touchButtonFactory})),
        (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP3(get({This, basicSetColorUtil}), Graphics, get({This, foregroundBasicColor}), get({This, foregroundColor})),
        put({local, touchButton}, undefined),
        put({local, index}, (get({List, '$class'})):size(List)),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, touchButton}, array:get(get({local, index}), get({List, objectArray}))),
            (get({get({local, touchButton}), '$class'})):paint(get({local, touchButton}), Graphics),
            Loop();
        false -> ok end end)(),
        put({local, index}, (get({List, '$class'})):size(List)),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, touchButton}, array:get(get({local, index}), get({List, objectArray}))),
            (get({get({local, touchButton}), '$class'})):paintHint(get({local, touchButton}), Graphics),
            Loop();
        false -> ok end end)().

