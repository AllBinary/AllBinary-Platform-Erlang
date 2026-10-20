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
% package org.allbinary.graphics.j2me
% import org.allbinary.logic.communication.log.GuiLog
% import org.allbinary.logic.communication.log.LogUtil

-module('GraphicsException').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Exception', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, guiLog}, 'GuiLog':getInstance()),
    ok.


new(Msg, ClassName, Method) when (is_list(Msg) orelse Msg =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined), (is_list(Method) orelse Method =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Msg, ClassName, Method),
    This;
new(Msg, Obj, Method) when (is_list(Msg) orelse Msg =:= undefined), (is_list(Method) orelse Method =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Msg, Obj, Method),
    This.

'$init'(This, Msg, ClassName, Method) when (is_list(Msg) orelse Msg =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined), (is_list(Method) orelse Method =:= undefined) ->
        'Exception':'$init'(This, Msg),
        init_fields(This),
        try
            (get({get({This, guiLog}), '$class'})):showDialog(get({This, guiLog}), Msg),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), Msg, ClassName, Method, This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            ok
        end;
'$init'(This, Msg, Obj, Method) when (is_list(Msg) orelse Msg =:= undefined), (is_list(Method) orelse Method =:= undefined) ->
        'Exception':'$init'(This, Msg),
        init_fields(This),
        try
            (get({get({This, guiLog}), '$class'})):showDialog(get({This, guiLog}), Msg),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), Msg, Obj, Method, This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            ok
        end.


