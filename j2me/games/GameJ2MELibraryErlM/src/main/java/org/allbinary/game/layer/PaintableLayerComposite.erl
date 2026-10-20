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
% package org.allbinary.game.layer
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.graphics.paint.PaintableInterface
% import org.allbinary.layer.Layer

-module('PaintableLayerComposite').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Paintable', Function, Arguments).

init_fields(This) ->
    put({This, paintableArray}, undefined),
    ok.


new(PaintableArray) when (is_tuple(PaintableArray) orelse PaintableArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PaintableArray),
    This.

'$init'(This, PaintableArray) when (is_tuple(PaintableArray) orelse PaintableArray =:= undefined) ->
    'Paintable':'$init'(This),
    init_fields(This),
        put({This, paintableArray}, PaintableArray).

paint(This, Graphics) ->
        put({local, index}, array:size(get({This, paintableArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N65844) -> (get({Target_N65844, '$class'})):paint(Target_N65844, Graphics) end)(array:get(get({local, index}), get({This, paintableArray}))),
            Loop();
        false -> ok end end)().

paintThreed(This, Graphics) ->
        put({local, paintableInterface}, undefined),
        put({local, index}, array:size(get({This, paintableArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, paintableInterface}, array:get(get({local, index}), get({This, paintableArray}))),
            (get({get({local, paintableInterface}), '$class'})):paintThreed(get({local, paintableInterface}), Graphics),
            Loop();
        false -> ok end end)().

