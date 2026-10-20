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
% import org.allbinary.TsUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('LogUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LogUtil':new()),
    ok.

init_fields(This) ->
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    put({This, logFormatUtil}, 'LogFormatUtil':getInstance()),
    put({This, 'LABEL'}, "org.allbinary"),
    ok.


getInstance() ->
        get({'LogUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

putL(This, Log) ->
        SpecialMessage = (get({Log, '$class'})):getSpecialMessage(Log),
        AnyType = (get({Log, '$class'})):getObject(Log),
        FunctionName = (get({Log, '$class'})):getFunctionName(Log),
        Exception = (get({Log, '$class'})):getThrowable(Log),
        (get({This, '$class'})):put(This, SpecialMessage, AnyType, FunctionName, Exception).

putF(This, SpecialMessage, AnyType, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        (get({This, '$class'})):put(This, SpecialMessage, AnyType, FunctionName, get({'NullUtil':getInstance(), 'NULL_OBJECT'})).

putFS(This, SpecialMessage, String, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(String) orelse String =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        (get({This, '$class'})):putS(This, SpecialMessage, String, FunctionName, get({'NullUtil':getInstance(), 'NULL_OBJECT'})).

put(This, SpecialMessage, AnyType, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        put({local, className}, get({This, 'LABEL'})),
        put({local, className}, allbinary_java:to_string((fun(Target_N66666) -> (get({Target_N66666, '$class'})):toString(Target_N66666) end)((fun(Target_N66673) -> (get({Target_N66673, '$class'})):append(Target_N66673, integer_to_list((fun(Target_N66776) -> (get({Target_N66776, '$class'})):hashCode(Target_N66776, AnyType) end)('TsUtil':getInstance()), 16)) end)((fun(Target_N66680) -> (get({Target_N66680, '$class'})):append(Target_N66680, get({get({This, commonSeps}), 'COLON'})) end)((fun(Target_N66687) -> (get({Target_N66687, '$class'})):append(Target_N66687, atom_to_list(get({AnyType, '$class'}))) end)('StringMaker':new())))))),
        Message = (get({get({This, logFormatUtil}), '$class'})):get(get({This, logFormatUtil}), get({local, className}), FunctionName, SpecialMessage, Exception),
        (get({get({get({'android', util}), 'Log'}), '$class'})):i(get({get({'android', util}), 'Log'}), get({This, 'LABEL'}), Message).

putS(This, SpecialMessage, String, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(String) orelse String =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        put({local, className}, get({This, 'LABEL'})),
        put({local, className}, allbinary_java:to_string((fun(Target_N67150) -> (get({Target_N67150, '$class'})):toString(Target_N67150) end)((fun(Target_N67157) -> (get({Target_N67157, '$class'})):append(Target_N67157, integer_to_list((fun(Target_N67244) -> (get({Target_N67244, '$class'})):hashCode(Target_N67244, String) end)('TsUtil':getInstance()), 16)) end)((fun(Target_N67164) -> (get({Target_N67164, '$class'})):append(Target_N67164, get({get({This, commonSeps}), 'COLON'})) end)((fun(Target_N67171) -> (get({Target_N67171, '$class'})):append(Target_N67171, String) end)('StringMaker':new())))))),
        Message = (get({get({This, logFormatUtil}), '$class'})):get(get({This, logFormatUtil}), get({local, className}), FunctionName, SpecialMessage, Exception),
        (get({get({get({'android', util}), 'Log'}), '$class'})):i(get({get({'android', util}), 'Log'}), get({This, 'LABEL'}), Message).

