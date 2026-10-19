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
% import org.allbinary.logic.java.exception.ExceptionUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps
% import org.allbinary.time.TimeStampUtil

-module('LogFormatUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LogFormatUtil':new()),
    ok.

init_fields(This) ->
    put({This, timeStampUtil}, 'TimeStampUtil':getInstance()),
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    put({This, 'NONE'}, "None"),
    put({This, 'LOG_ERROR'}, "\nLog-Error: "),
    put({This, 'EMPTY'}, "Empty"),
    put({This, 'STACK_TRACE'}, "\nStack Trace: "),
    put({This, 'TIME'}, "Time: "),
    put({This, 'CLASS_NAME'}, get({get({This, commonSeps}), 'SPACE'})),
    put({This, 'FUNCTION_CALL'}, get({'CommonLabels':getInstance(), 'COLON_SEP'})),
    put({This, 'SPECIAL_MESSAGE'}, "> "),
    put({This, stringUtil}, 'StringUtil':getInstance()),
    put({This, exceptionUtil}, 'ExceptionUtil':getInstance()),
    put({This, nullUtil}, 'NullUtil':getInstance()),
    ok.


getInstance() ->
        get({'LogFormatUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

get(This, ClassName, FunctionName, SpecialMessage, Exception) when (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined), (is_list(SpecialMessage) orelse SpecialMessage =:= undefined) ->
        StringBuffer = (get({This, '$class'})):getF(This, ClassName, FunctionName),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getO(This, Exception)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'SPECIAL_MESSAGE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, SpecialMessage),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

getS(This, ClassName, FunctionName, SpecialMessage) when (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined), (is_list(SpecialMessage) orelse SpecialMessage =:= undefined) ->
        StringBuffer = (get({This, '$class'})):getF(This, ClassName, FunctionName),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'SPECIAL_MESSAGE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, SpecialMessage),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

getF(This, ClassName, FunctionName) when (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        put({local, functionName}, FunctionName),
        case (get({local, functionName}) =:= undefined) of
            true ->
            put({local, functionName}, get({This, 'NONE'}));
            false -> ok
        end,
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'TIME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, timeStampUtil}), '$class'})):getAsString(get({This, timeStampUtil}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'CLASS_NAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, ClassName),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'FUNCTION_CALL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({local, functionName})),
        StringBuffer.

getO(This, Exception) ->
        try
        case (Exception =/= get({get({This, nullUtil}), 'NULL_OBJECT'})) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'LOG_ERROR'})),
            ExceptionAsString = (get({Exception, '$class'})):toString(Exception),
            case (ExceptionAsString =/= undefined) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, ExceptionAsString);
                false ->
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'EMPTY'}))
            end,
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'STACK_TRACE'})),
            case (Exception =/= get({get({This, nullUtil}), 'NULL_OBJECT'})) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, exceptionUtil}), '$class'})):getStackTrace(get({This, exceptionUtil}), Exception));
                false ->
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, stringUtil}), 'NULL_STRING'}))
            end,
            throw({'$return', (get({StringBuffer, '$class'})):toString(StringBuffer)});
            false ->
            throw({'$return', get({'StringUtil':getInstance(), 'EMPTY_STRING'})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

