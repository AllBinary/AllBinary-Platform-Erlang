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
% import org.allbinary.logic.communication.log.LogFormatUtil

-module('PreLogUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'LABEL'}, "org.allbinary"),
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
        put({local, className}, get({'PreLogUtil', 'LABEL'})),
        ActualClassName = atom_to_list(get({AnyType, '$class'})),
        case (ActualClassName =/= undefined) of
            true ->
            put({local, className}, ActualClassName);
            false -> ok
        end,
        Message = (fun(Target_N66067) -> (get({Target_N66067, '$class'})):get(Target_N66067, get({local, className}), FunctionName, SpecialMessage, Exception) end)('LogFormatUtil':getInstance()),
        (get({get({get({'android', util}), 'Log'}), '$class'})):i(get({get({'android', util}), 'Log'}), get({'PreLogUtil', 'LABEL'}), Message).

putS(SpecialMessage, ClassName, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        'PreLogUtil':putSE(SpecialMessage, ClassName, FunctionName, get({'NullUtil':getInstance(), 'NULL_OBJECT'})).

putSE(SpecialMessage, ClassName, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        Message = (fun(Target_N66538) -> (get({Target_N66538, '$class'})):get(Target_N66538, ClassName, FunctionName, SpecialMessage, Exception) end)('LogFormatUtil':getInstance()),
        (get({get({get({'android', util}), 'Log'}), '$class'})):i(get({get({'android', util}), 'Log'}), ClassName, Message).

