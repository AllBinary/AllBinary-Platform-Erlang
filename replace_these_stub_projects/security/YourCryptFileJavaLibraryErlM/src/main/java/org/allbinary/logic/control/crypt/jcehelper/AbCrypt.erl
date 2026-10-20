% 
% AllBinary Open License Version 1 
% Copyright (c) 2002 AllBinary 
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
% package org.allbinary.logic.control.crypt.jcehelper

-module('AbCrypt').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new(Algorithm, Key) when (is_list(Algorithm) orelse Algorithm =:= undefined), (is_list(Key) orelse Key =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Algorithm, Key),
    This.

'$init'(This, Algorithm, Key) when (is_list(Algorithm) orelse Algorithm =:= undefined), (is_list(Key) orelse Key =:= undefined) ->
    init_fields(This),
        ok.

encrypt(This, Array) when (is_tuple(Array) orelse Array =:= undefined) ->
        undefined.

decrypt(This, Array) when (is_tuple(Array) orelse Array =:= undefined) ->
        undefined.

mutilate(This, Array) when (is_tuple(Array) orelse Array =:= undefined) ->
        undefined.

