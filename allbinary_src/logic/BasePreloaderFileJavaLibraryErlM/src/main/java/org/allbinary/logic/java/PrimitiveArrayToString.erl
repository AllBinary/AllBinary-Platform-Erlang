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
% package org.allbinary.logic.java
% import org.allbinary.logic.string.StringMaker

-module('PrimitiveArrayToString').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


toString(Floats) when (is_tuple(Floats) orelse Floats =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        lists:foreach(fun(Index) ->
            (get({StringBuffer, '$class'})):appendfloat(StringBuffer, array:get(Index, Floats))
        end, lists:seq(0, array:size(Floats) - 1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

