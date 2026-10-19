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
% import org.allbinary.logic.communication.log.LogFormatUtil

-module('Log').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logFormatUtil}, 'LogFormatUtil':getInstance()),
    put({This, specialMessage}, undefined),
    put({This, anyType}, undefined),
    put({This, functionName}, undefined),
    put({This, exception}, undefined),
    ok.


new(SpecialMessage, AnyType, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, SpecialMessage, AnyType, FunctionName, Exception),
    This.

init(This, SpecialMessage, AnyType, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
    init_fields(This),
        put({This, specialMessage}, SpecialMessage),
        put({This, anyType}, AnyType),
        put({This, functionName}, FunctionName),
        put({This, exception}, Exception).

getSpecialMessage(This) ->
        get({This, specialMessage}).

getObject(This) ->
        get({This, anyType}).

getFunctionName(This) ->
        get({This, functionName}).

getThrowable(This) ->
        get({This, exception}).

toString(This) ->
        put({local, className}, get({'CommonStrings':getInstance(), 'EMPTY'})),
        Clazz = get({get({This, anyType}), '$class'}),
        case ((get({Clazz, '$class'})):getName(Clazz) =/= undefined) of
            true ->
            put({local, className}, (get({Clazz, '$class'})):getName(Clazz));
            false -> ok
        end,
        (get({get({This, logFormatUtil}), '$class'})):get(get({This, logFormatUtil}), get({local, className}), get({This, functionName}), get({This, specialMessage}), get({This, exception})).

