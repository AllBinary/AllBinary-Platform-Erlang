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

-module('LogUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LogUtil':new()),
    ok.

init_fields(This) ->
    put({This, logFormatUtil}, 'LogFormatUtil':getInstance()),
    put({This, 'LABEL'}, "org.allbinary"),
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
        case (Log =/= undefined) of
            true ->
            (get({This, '$class'})):put(This, SpecialMessage, AnyType, FunctionName, Exception);
            false -> ok
        end.

putF(This, SpecialMessage, AnyType, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        ok.

putFS(This, SpecialMessage, ClassName, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        ok.

put(This, SpecialMessage, AnyType, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        put({local, className}, get({This, 'LABEL'})),
        put({local, className}, atom_to_list(get({AnyType, '$class'}))),
        Message = (get({get({This, logFormatUtil}), '$class'})):get(get({This, logFormatUtil}), get({local, className}), FunctionName, SpecialMessage, Exception),
        (get({get({get({'android', util}), 'Log'}), '$class'})):i(get({get({'android', util}), 'Log'}), get({This, 'LABEL'}), lists:concat([get({This, 'LOG_SUCCESS'}), Message])).

