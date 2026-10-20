% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.allbinary.util
% import jsinterop.annotations.JsType
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.string.StringMaker
% import jsinterop.annotations.JsConstructor

-module('BasicArrayListS').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicArrayList', Function, Arguments).

init_fields(This) ->
    ok.


new(Size) when is_integer(Size) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Size),
    This.

'$init'(This, Size) when is_integer(Size) ->
        'BasicArrayList':'$init'(This, get({'NullUtil':getInstance(), 'NULL_OBJECT_ARRAY'})),
        case (Size < 0) of
            true ->
            erlang:error({'IllegalArgumentException', (fun(Target_N65769) -> (get({Target_N65769, '$class'})):toString(Target_N65769) end)((fun(Target_N65776) -> (get({Target_N65776, '$class'})):appendint(Target_N65776, Size) end)((fun(Target_N65783) -> (get({Target_N65783, '$class'})):append(Target_N65783, "Init Size Exception: ") end)('StringMaker':new())))});
            false -> ok
        end,
        put({This, objectArray}, array:new(Size, {default, undefined})).

