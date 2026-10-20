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
        try
        case (Log =:= get({'LogFactory', 'LOG'})) of
            true ->
            throw({'$return', ok});
            false -> ok
        end,
        Exception = (get({Log, '$class'})):getThrowable(Log),
        case (Exception =:= undefined) of
            true ->
            throw({'$return', ok});
            false -> ok
        end,
        SpecialMessage = (get({Log, '$class'})):getSpecialMessage(Log),
        AnyType = (get({Log, '$class'})):getObject(Log),
        FunctionName = (get({Log, '$class'})):getFunctionName(Log),
        (get({This, '$class'})):put(This, SpecialMessage, AnyType, FunctionName, Exception)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

putF(This, SpecialMessage, ClassName, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        ok;
putF(This, SpecialMessage, AnyType, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        ok.


put(This, SpecialMessage, AnyType, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        put({local, className}, get({'CommonStrings':getInstance(), 'EMPTY'})),
        case (atom_to_list(get({AnyType, '$class'})) =/= undefined) of
            true ->
            put({local, className}, allbinary_java:to_string(atom_to_list(get({AnyType, '$class'}))));
            false -> ok
        end,
        Message = (get({get({This, logFormatUtil}), '$class'})):get(get({This, logFormatUtil}), get({local, className}), FunctionName, SpecialMessage, Exception),
        io:format("~ts", [allbinary_java:to_string(get({This, 'LOG_SUCCESS'}))]),
        io:format("~ts~n", [allbinary_java:to_string(Message)]).

