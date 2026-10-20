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
% import java.io.IOException
% import org.apache.xmlrpc.XmlRpcException
% import org.allbinary.string.CommonSeps
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.canvas.SpecialMessageUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.ABHashtable

-module('LogUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LogUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'MESSAGE'}, "message"),
    put({This, isFirstException}, true),
    put({This, timeDelayHelper}, 'TimeDelayHelper':new(200000)),
    put({This, abeClientInformation}, undefined),
    put({This, stringBuffer}, 'StringMaker':new()),
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

putF(This, SpecialMessage, ClassName, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        ok;
putF(This, SpecialMessage, AnyType, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        ok.


put(This, SpecialMessage, AnyType, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        try
        case (Exception =/= undefined) of
            true ->
            case ((get({atom_to_list(get({Exception, '$class'})), '$class'})):compareTo(atom_to_list(get({Exception, '$class'})), (get({'XmlRpcException', '$class'})):getName('XmlRpcException')) =:= 0) of
                true ->
                throw({'$return', ok});
                false -> ok
            end,
            case ((get({atom_to_list(get({Exception, '$class'})), '$class'})):compareTo(atom_to_list(get({Exception, '$class'})), (get({'IOException', '$class'})):getName('IOException')) =:= 0) of
                true ->
                throw({'$return', ok});
                false -> ok
            end,
            case (get({This, isFirstException}) orelse (get({get({This, timeDelayHelper}), '$class'})):isTimeTNT(get({This, timeDelayHelper}))) of
                true ->
                put({local, className}, get({'CommonStrings':getInstance(), 'EMPTY'})),
                put({This, isFirstException}, false),
                case ((AnyType =/= undefined) andalso (atom_to_list(get({AnyType, '$class'})) =/= undefined)) of
                    true ->
                    put({local, className}, allbinary_java:to_string(atom_to_list(get({AnyType, '$class'}))));
                    false -> ok
                end,
                Message = (fun(Target_N67136) -> (get({Target_N67136, '$class'})):get(Target_N67136, get({local, className}), FunctionName, SpecialMessage, Exception) end)('LogFormatUtil':getInstance()),
                try
                    io:format("~ts~n", [allbinary_java:to_string("Eeeek")]),
                    case (get({This, abeClientInformation}) =:= undefined) of
                        true ->
                        erlang:error({'RuntimeException'});
                        false -> ok
                    end,
                    Hashtable = (get({get({This, abeClientInformation}), '$class'})):toHashtable(get({This, abeClientInformation})),
                    (get({get({This, stringBuffer}), '$class'})):delete(get({This, stringBuffer}), 0, (get({get({This, stringBuffer}), '$class'})):length(get({This, stringBuffer}))),
                    (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), Message),
                    (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({'CommonSeps':getInstance(), 'SPACE'})),
                    (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), (fun(Target_N67532) -> (get({Target_N67532, '$class'})):get(Target_N67532) end)('SpecialMessageUtil':getInstance())),
                    (get({Hashtable, '$class'})):put(Hashtable, get({This, 'MESSAGE'}), (get({get({This, stringBuffer}), '$class'})):toString(get({This, stringBuffer}))),
                    (fun(Target_N67615) -> (get({Target_N67615, '$class'})):get(Target_N67615, Hashtable) end)('XmlRpcRemoteLogClient':new(get({This, abeClientInformation})))
                catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                    io:format("~ts~n", [allbinary_java:to_string("Exception")]),
                    io:format("~p~n", [E])
                end;
                false -> ok
            end;
            false -> ok
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

