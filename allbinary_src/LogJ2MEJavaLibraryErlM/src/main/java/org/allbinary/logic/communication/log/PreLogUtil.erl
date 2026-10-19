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
% import org.allbinary.string.CommonStrings

-module('PreLogUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'LOG_SUCCESS'}, "org.allbinary: "),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

put(SpecialMessage, AnyType, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        'PreLogUtil':putOE(SpecialMessage, AnyType, FunctionName, get({'NullUtil':getInstance(), 'NULL_OBJECT'})).

putOE(SpecialMessage, AnyType, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        put({local, className}, get({'CommonStrings':getInstance(), 'EMPTY'})),
        case (atom_to_list(get({AnyType, '$class'})) =/= undefined) of
            true ->
            put({local, className}, allbinary_java:to_string(atom_to_list(get({AnyType, '$class'}))));
            false -> ok
        end,
        Message = (fun(Target_N66091) -> (get({Target_N66091, '$class'})):get(Target_N66091, get({local, className}), FunctionName, SpecialMessage, Exception) end)('LogFormatUtil':getInstance()),
        io:format("~ts", [allbinary_java:to_string(get({'PreLogUtil', 'LOG_SUCCESS'}))]),
        io:format("~ts~n", [allbinary_java:to_string(Message)]).

putS(SpecialMessage, ClassName, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        'PreLogUtil':putSE(SpecialMessage, ClassName, FunctionName, get({'NullUtil':getInstance(), 'NULL_OBJECT'})).

putSE(SpecialMessage, ClassName, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        Message = (fun(Target_N66560) -> (get({Target_N66560, '$class'})):get(Target_N66560, ClassName, FunctionName, SpecialMessage, Exception) end)('LogFormatUtil':getInstance()),
        io:format("~ts", [allbinary_java:to_string(get({'PreLogUtil', 'LOG_SUCCESS'}))]),
        io:format("~ts~n", [allbinary_java:to_string(Message)]).

getClassName(AnyType) ->
        atom_to_list(get({AnyType, '$class'})).

