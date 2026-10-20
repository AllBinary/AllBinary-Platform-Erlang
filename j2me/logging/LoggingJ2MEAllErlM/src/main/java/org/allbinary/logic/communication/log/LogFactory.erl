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
% package org.allbinary.logic.communication.log
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.string.StringUtil

-module('LogFactory').
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


getInstanceD() ->
        StringUtil = 'StringUtil':getInstance(),
        NullUtil = 'NullUtil':getInstance(),
        'Log':new(get({StringUtil, 'EMPTY_STRING'}), get({NullUtil, 'NULL_OBJECT'}), get({StringUtil, 'EMPTY_STRING'}), get({NullUtil, 'NULL_OBJECT'})).

getInstanceNoF(SpecialMessage, AnyType, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined) ->
        'Log':new(SpecialMessage, AnyType, get({'StringUtil':getInstance(), 'EMPTY_STRING'}), Exception).

getInstance(SpecialMessage, AnyType, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        'Log':new(SpecialMessage, AnyType, FunctionName, Exception).

getInstanceF(SpecialMessage, AnyType, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        NullUtil = 'NullUtil':getInstance(),
        'Log':new(SpecialMessage, AnyType, FunctionName, get({NullUtil, 'NULL_OBJECT'})).

