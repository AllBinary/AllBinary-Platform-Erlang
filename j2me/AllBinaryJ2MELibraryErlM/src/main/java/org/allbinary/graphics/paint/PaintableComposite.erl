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
% package org.allbinary.graphics.paint
% import javax.microedition.lcdui.Graphics

-module('PaintableComposite').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Paintable', Function, Arguments).

init_fields(This) ->
    put({This, paintableArray}, undefined),
    ok.


new(PaintableArray) when (is_tuple(PaintableArray) orelse PaintableArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PaintableArray),
    This.

init(This, PaintableArray) when (is_tuple(PaintableArray) orelse PaintableArray =:= undefined) ->
    'Paintable':init(This),
    init_fields(This),
        put({This, paintableArray}, PaintableArray).

paint(This, Graphics) ->
        lists:foreach(fun(Index) ->
            (fun(Target_N65759) -> (get({Target_N65759, '$class'})):paint(Target_N65759, Graphics) end)(array:get(Index, get({This, paintableArray})))
        end, lists:seq((array:size(get({This, paintableArray})) - 1), 0, -1)).

paintThreed(This, Graphics) ->
        lists:foreach(fun(Index) ->
            (fun(Target_N65962) -> (get({Target_N65962, '$class'})):paintThreed(Target_N65962, Graphics) end)(array:get(Index, get({This, paintableArray})))
        end, lists:seq((array:size(get({This, paintableArray})) - 1), 0, -1)).

