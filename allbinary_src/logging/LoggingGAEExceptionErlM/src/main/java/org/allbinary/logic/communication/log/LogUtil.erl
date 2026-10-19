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
% import java.util.logging.Level
% import org.allbinary.logic.string.StringMaker
% import java.util.logging.Logger
% import org.allbinary.string.CommonStrings

-module('LogUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LogUtil':new()),
    ok.

init_fields(This) ->
    put({This, logger}, 'Logger':getLogger((get({'LogUtil', '$class'})):getName('LogUtil'))),
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

init(This) ->
        'PreLogUtil':put("Loggin Initialized", This, "init()").

putL(This, Log) ->
        Exception = (get({Log, '$class'})):getThrowable(Log),
        try
            case (Exception =/= undefined) of
                true ->
                SpecialMessage = (get({Log, '$class'})):getSpecialMessage(Log),
                AnyType = (get({Log, '$class'})):getObject(Log),
                FunctionName = (get({Log, '$class'})):getFunctionName(Log),
                put({local, className}, get({'CommonStrings':getInstance(), 'EMPTY'})),
                Clazz = get({AnyType, '$class'}),
                case ((get({Clazz, '$class'})):getName(Clazz) =/= undefined) of
                    true ->
                    put({local, className}, (get({Clazz, '$class'})):getName(Clazz));
                    false -> ok
                end,
                Message = (get({get({This, logFormatUtil}), '$class'})):get(get({This, logFormatUtil}), get({local, className}), FunctionName, SpecialMessage, Exception),
                (get({get({This, logger}), '$class'})):log(get({This, logger}), get({'Level', 'INFO'}), Message);
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            ok
        end.

put(This, SpecialMessage, AnyType, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        try
            put({local, className}, get({'CommonStrings':getInstance(), 'EMPTY'})),
            Clazz = get({AnyType, '$class'}),
            case ((get({Clazz, '$class'})):getName(Clazz) =/= undefined) of
                true ->
                put({local, className}, (get({Clazz, '$class'})):getName(Clazz));
                false -> ok
            end,
            Message = (get({get({This, logFormatUtil}), '$class'})):getS(get({This, logFormatUtil}), get({local, className}), FunctionName, SpecialMessage),
            case (Exception =/= undefined) of
                true ->
                (get({get({This, logger}), '$class'})):log(get({This, logger}), get({'Level', 'SEVERE'}), Message, Exception);
                false ->
                (get({get({This, logger}), '$class'})):log(get({This, logger}), get({'Level', 'INFO'}), Message)
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            ok
        end.

