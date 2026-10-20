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
% import jsinterop.annotations.JsType
% import org.allbinary.string.CommonStrings
% import playn.core.PlayN
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsConstructor

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
        try
        case (Log =:= undefined) of
            true ->
            throw({'$return', ok});
            false -> ok
        end,
        SpecialMessage = (get({Log, '$class'})):getSpecialMessage(Log),
        AnyType = (get({Log, '$class'})):getObject(Log),
        FunctionName = (get({Log, '$class'})):getFunctionName(Log),
        Exception = (get({Log, '$class'})):getThrowable(Log),
        (get({This, '$class'})):put(This, SpecialMessage, AnyType, FunctionName, Exception)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

putF(This, SpecialMessage, AnyType, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        put({local, className}, 'PreLogUtil':getClassName(AnyType)),
        case (get({local, className}) =:= undefined) of
            true ->
            put({local, className}, get({'CommonStrings':getInstance(), 'EMPTY'}));
            false -> ok
        end,
        Message = (get({get({This, logFormatUtil}), '$class'})):getS(get({This, logFormatUtil}), get({local, className}), FunctionName, SpecialMessage),
        PlayN = 'PlayN':getInstance(),
        (fun(Target_N66555) -> (get({Target_N66555, '$class'})):debug(Target_N66555, lists:concat([get({This, 'LOG_SUCCESS'}), Message])) end)((get({PlayN, '$class'})):log(PlayN)).

putFS(This, SpecialMessage, ClassName, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        Message = (get({get({This, logFormatUtil}), '$class'})):getS(get({This, logFormatUtil}), ClassName, FunctionName, SpecialMessage),
        PlayN = 'PlayN':getInstance(),
        (fun(Target_N66863) -> (get({Target_N66863, '$class'})):debug(Target_N66863, lists:concat([get({This, 'LOG_SUCCESS'}), Message])) end)((get({PlayN, '$class'})):log(PlayN)).

put(This, SpecialMessage, AnyType, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        put({local, className}, 'PreLogUtil':getClassName(AnyType)),
        case (get({local, className}) =:= undefined) of
            true ->
            put({local, className}, get({'CommonStrings':getInstance(), 'EMPTY'}));
            false -> ok
        end,
        Message = (get({get({This, logFormatUtil}), '$class'})):get(get({This, logFormatUtil}), get({local, className}), FunctionName, SpecialMessage, Exception),
        PlayN = 'PlayN':getInstance(),
        case (Exception =/= undefined) of
            true ->
            (fun(Target_N67387) -> (get({Target_N67387, '$class'})):error(Target_N67387, lists:concat([get({This, 'LOG_SUCCESS'}), Message]), Exception) end)((get({PlayN, '$class'})):log(PlayN));
            false ->
            (fun(Target_N67321) -> (get({Target_N67321, '$class'})):debug(Target_N67321, lists:concat([get({This, 'LOG_SUCCESS'}), Message])) end)((get({PlayN, '$class'})):log(PlayN))
        end.

