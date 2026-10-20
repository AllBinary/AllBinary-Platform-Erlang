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
% import org.allbinary.TsUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('LogUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LogUtil':new()),
    ok.

init_fields(This) ->
    put({This, logFormatUtil}, 'LogFormatUtil':getInstance()),
    put({This, 'LOG_SUCCESS'}, "org.allbinary: "),
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
        put({local, className}, get({'CommonStrings':getInstance(), 'EMPTY'})),
        case (atom_to_list(get({AnyType, '$class'})) =/= undefined) of
            true ->
            put({local, className}, allbinary_java:to_string((fun(Target_N66298) -> (get({Target_N66298, '$class'})):toString(Target_N66298) end)((fun(Target_N66305) -> (get({Target_N66305, '$class'})):append(Target_N66305, integer_to_list((fun(Target_N66413) -> (get({Target_N66413, '$class'})):hashCode(Target_N66413, AnyType) end)('TsUtil':getInstance()), 16)) end)((fun(Target_N66312) -> (get({Target_N66312, '$class'})):append(Target_N66312, get({'CommonSeps':getInstance(), 'COLON'})) end)((fun(Target_N66319) -> (get({Target_N66319, '$class'})):append(Target_N66319, atom_to_list(get({AnyType, '$class'}))) end)('StringMaker':new()))))));
            false -> ok
        end,
        Message = (get({get({This, logFormatUtil}), '$class'})):getS(get({This, logFormatUtil}), get({local, className}), FunctionName, SpecialMessage),
        io:format("~ts", [allbinary_java:to_string(get({This, 'LOG_SUCCESS'}))]),
        io:format("~ts~n", [allbinary_java:to_string(Message)]).

putFS(This, SpecialMessage, ClassName, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        Message = (get({get({This, logFormatUtil}), '$class'})):getS(get({This, logFormatUtil}), ClassName, FunctionName, SpecialMessage),
        io:format("~ts", [allbinary_java:to_string(get({This, 'LOG_SUCCESS'}))]),
        io:format("~ts~n", [allbinary_java:to_string(Message)]).

put(This, SpecialMessage, AnyType, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        put({local, className}, get({'CommonStrings':getInstance(), 'EMPTY'})),
        case (atom_to_list(get({AnyType, '$class'})) =/= undefined) of
            true ->
            HashCodeValue = (fun(Target_N67137) -> (get({Target_N67137, '$class'})):hashCode(Target_N67137, AnyType) end)('TsUtil':getInstance()),
            HexString = integer_to_list(HashCodeValue, 16),
            put({local, className}, allbinary_java:to_string((fun(Target_N67273) -> (get({Target_N67273, '$class'})):toString(Target_N67273) end)((fun(Target_N67280) -> (get({Target_N67280, '$class'})):append(Target_N67280, HexString) end)((fun(Target_N67287) -> (get({Target_N67287, '$class'})):append(Target_N67287, get({'CommonSeps':getInstance(), 'COLON'})) end)((fun(Target_N67294) -> (get({Target_N67294, '$class'})):append(Target_N67294, atom_to_list(get({AnyType, '$class'}))) end)('StringMaker':new()))))));
            false -> ok
        end,
        Message = (get({get({This, logFormatUtil}), '$class'})):get(get({This, logFormatUtil}), get({local, className}), FunctionName, SpecialMessage, Exception),
        io:format("~ts", [allbinary_java:to_string(get({This, 'LOG_SUCCESS'}))]),
        io:format("~ts~n", [allbinary_java:to_string(Message)]).

