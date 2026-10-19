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
% import org.allbinary.logic.TsUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('LogUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LogUtil':new()),
    put({?MODULE, 'LOG_SUCCESS'}, "org.allbinary: "),
    ok.

init_fields(This) ->
    put({This, logFormatUtil}, 'LogFormatUtil':getInstance()),
    ok.


getInstance() ->
        get({'LogUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
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
            put({local, className}, allbinary_java:to_string((fun(Target_N66303) -> (get({Target_N66303, '$class'})):toString(Target_N66303) end)((fun(Target_N66310) -> (get({Target_N66310, '$class'})):append(Target_N66310, integer_to_list((fun(Target_N66418) -> (get({Target_N66418, '$class'})):hashCode(Target_N66418, AnyType) end)('TsUtil':getInstance()), 16)) end)((fun(Target_N66317) -> (get({Target_N66317, '$class'})):append(Target_N66317, get({'CommonSeps':getInstance(), 'COLON'})) end)((fun(Target_N66324) -> (get({Target_N66324, '$class'})):append(Target_N66324, atom_to_list(get({AnyType, '$class'}))) end)('StringMaker':new()))))));
            false -> ok
        end,
        Message = (get({get({This, logFormatUtil}), '$class'})):getS(get({This, logFormatUtil}), get({local, className}), FunctionName, SpecialMessage),
        io:format("~ts", [allbinary_java:to_string(get({'LogUtil', 'LOG_SUCCESS'}))]),
        io:format("~ts~n", [allbinary_java:to_string(Message)]).

putFS(This, SpecialMessage, ClassName, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        put({local, className}, ClassName),
        put({local, className}, allbinary_java:to_string((fun(Target_N66763) -> (get({Target_N66763, '$class'})):toString(Target_N66763) end)((fun(Target_N66770) -> (get({Target_N66770, '$class'})):append(Target_N66770, integer_to_list((fun(Target_N66862) -> (get({Target_N66862, '$class'})):hashCode(Target_N66862, get({This, anyType})) end)('TsUtil':getInstance()), 16)) end)((fun(Target_N66777) -> (get({Target_N66777, '$class'})):append(Target_N66777, get({'CommonSeps':getInstance(), 'COLON'})) end)((fun(Target_N66784) -> (get({Target_N66784, '$class'})):append(Target_N66784, get({local, className})) end)('StringMaker':new())))))),
        Message = (get({get({This, logFormatUtil}), '$class'})):getS(get({This, logFormatUtil}), get({local, className}), FunctionName, SpecialMessage),
        io:format("~ts", [allbinary_java:to_string(get({'LogUtil', 'LOG_SUCCESS'}))]),
        io:format("~ts~n", [allbinary_java:to_string(Message)]).

put(This, SpecialMessage, AnyType, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        put({local, className}, get({'CommonStrings':getInstance(), 'EMPTY'})),
        case (atom_to_list(get({AnyType, '$class'})) =/= undefined) of
            true ->
            put({local, className}, allbinary_java:to_string((fun(Target_N67330) -> (get({Target_N67330, '$class'})):toString(Target_N67330) end)((fun(Target_N67337) -> (get({Target_N67337, '$class'})):append(Target_N67337, integer_to_list((fun(Target_N67445) -> (get({Target_N67445, '$class'})):hashCode(Target_N67445, AnyType) end)('TsUtil':getInstance()), 16)) end)((fun(Target_N67344) -> (get({Target_N67344, '$class'})):append(Target_N67344, get({'CommonSeps':getInstance(), 'COLON'})) end)((fun(Target_N67351) -> (get({Target_N67351, '$class'})):append(Target_N67351, atom_to_list(get({AnyType, '$class'}))) end)('StringMaker':new()))))));
            false -> ok
        end,
        Message = (get({get({This, logFormatUtil}), '$class'})):get(get({This, logFormatUtil}), get({local, className}), FunctionName, SpecialMessage, Exception),
        io:format("~ts", [allbinary_java:to_string(get({'LogUtil', 'LOG_SUCCESS'}))]),
        io:format("~ts~n", [allbinary_java:to_string(Message)]).

